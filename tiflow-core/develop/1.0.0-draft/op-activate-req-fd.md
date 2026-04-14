# Server-Anforderungen $activate - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $activate (Task aktivieren)**](op-activate.md)
* **Server-Anforderungen $activate**

## Server-Anforderungen $activate

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$activate`.

Der TI-Flow-Fachdienst MUSS beim Aktivieren eines Tasks für ein E-Rezept mittels HTTP-POST/$activate-Operation auf den in der URL referenzierten /Task/<id> die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Leistungserbringerinstitutionen in der Rolle
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_praxis_psychotherapeut
* oid_krankenhaus
* oid_institution-vorsorge-reha
die Operation am Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit E-Rezepte nicht durch Unberechtigte eingestellt werden können.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im HTTP-RequestHeader "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des AccessCodes die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_ACCESSCODE_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im referenzierten Task gespeicherten Status Task.status prüfen und, wenn Task.status ungleich "draft" ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 412 - Precondition Failed: error
* HTTP-Code: Code
  * 412 - Precondition Failed: invalid
* HTTP-Code: Details Code
  * 412 - Precondition Failed: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 412 - Precondition Failed: Task has invalid status.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im Aufrufparameter übergebenen FHIR-Operationsparameter des QES-Datensatzes als PKCS#7-Datei einer Enveloping CAdES-Signatur entgegennehmen und verarbeiten und bei Fehlen oder ungültiger ASN.1 Datenstruktur die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile validation failed.

abbrechen, damit kein Schadcode und keine "fachfremden" Daten in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS das QES-Signaturzertifikat C.HP.QES in der Signatur des übergebenen QES-Datensatzes gemäß [gemSpec_PKI#TUC_PKI_030] mit folgenden Parametern auf Gültigkeit prüfen:

* Parameter: Zertifikat
  * Wert: Signaturzertifikat des HBA (eingebettet in Signatur-Objekt des QES-Datensatzes):* C.HP.QES (oid_hba_qes = 1.2.276.0.76.4.72 gemäß gemSpec_OID)

* Parameter: Referenzzeitpunkt
  * Wert: Zeitpunkt der QES-Erstellung gemäß signingTime im QES-Datensatz
* Parameter: Offline-Modus
  * Wert: nein
* Parameter: OCSP-Response
  * Wert: eingebettet in QES-Datensatz

**Tabelle: **TAB_eRPFD_006 Parameter Prüfung Signaturzertifikat QES des HBA

Der TI-Flow-Fachdienst MUSS, wenn keine OCSP-Response eingebettet oder die eingebettete OCSP Response nicht gültig ist, eine gecachte OCSP-Response verwenden, wenn die gecachte OCSP-Response nach den Signaturzeitpunkt erstellt wurde, oder eine OCSP-Response beim zugehörigen TSP anfragen.

Der TI-Flow-Fachdienst MUSS das Signaturzertifikat prüfen, für [mathematisch gültig UND zeitlich gültig UND online gültig ] befinden und andernfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_CERTIFICATE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, damit sichergestellt wird, dass ausschließlich Verordnungen verwaltet werden, die von einer gültigen, nicht gesperrten Heilberufsidentität eines HBA signiert wurden.

Der TI-Flow-Fachdienst MUSS, wenn im Rahmen der Prüfung der Gültigkeit eines QES-Signuturzertifikates C.HP.QES die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 512 - OCSP Backend Error: error
* HTTP-Code: Code
  * 512 - OCSP Backend Error: invalid
* HTTP-Code: Details Code
  * 512 - OCSP Backend Error: TIFLOW_OCSP_BACKEND_ERROR
* HTTP-Code: Details Text
  * 512 - OCSP Backend Error: OCSP Backend Error

abgelehnt werden.

Der TI-Flow-Fachdienst MUSS, wenn im Rahmen der Prüfung der Gültigkeit eines QES-Signuturzertifikates C.HP.QES keine OCSP-Response eingebettet oder die eingebettete OCSP Response nicht gültig ist, die die Prüfung genutzte OCSP-Response in den QES-Datensatz einbetten.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate die qualifizierte Signatur des QES-Datensatzes gemäß [ETSI_QES] prüfen und bei nicht gültiger qualifizierter Signatur die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_SIGNATURE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, damit der nachfolgende Workflow ausschließlich auf Basis vom Leistungserbringer mittels Signatur freigegebener Daten erfolgt.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate das innerhalb des PKCS#7-Datensatz enveloping-enthaltene FHIR-Bundle einer FHIR-Validierung gegen die eRezept-Schema-Definition der KBV kbv.ita.erp oder kbv.itv.evdga unterziehen und bei Invalidität die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den Datensatz als PKCS#7-Datei speichern und in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 über eine interne, eindeutige UUID referenzieren, damit der nachfolgende Workflow auf Basis vom Leistungserbringer mittels Signatur freigegebener Daten erfolgt.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate die Angabe zum Mimetype des signierten Dokumentes prüfen und, wenn dieser ungleich "text/plain; charset=utf-8" ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_SIGNATURE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, dass die PrescriptionID des Tasks mit der PrescriptionID im übergebenen QES-Datensatz übereinstimmt und andernfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_FLOWTYPE_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, dass der Präfix der PrescriptionID gleich dem Flowtype des zu aktivierenden Tasks ist und andernfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_FLOWTYPE_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, dass Patient.identifier.system gleich "http://fhir.de/sid/gkv/kvid-10" ist und andernfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_KVNR_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Als Identifier für den Patienten muss eine VersichertenID (KVNR) angegeben werden.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate, wenn das Datum authoredOn zur Gültigkeitsberechnung der Verordnung nicht dem Datum in QES.Erstellung im Signaturobjekt entspricht, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: Ausstellungsdatum und Signaturzeitpunkt weichen voneinander ab, müssen aber taggleich sein

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate die KVNR des Patienten dem Identifier http://fhir.de/sid/gkv/kvid-10 der Patient-Ressource im E-Rezept-Bundle entnehmen und diesen als Identifier in Task.for mit system http://fhir.de/sid/gkv/kvid-10 hinzufügen, damit ausschließlich eine gültige, vom Arzt signierte Patientenreferenz im Workflow verwendet wird.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.activate" und den Versicherten mit der KVNR = Task.for initiieren.

Der TI-Flow-Fachdienst MUSS die zulässige Aktivierung eines Tasks mittels /Task/<id>/$activate-Operation im Status Task.status = ready vollziehen und bei erfolgreichem Abschluss der Operation die Ressource Task im HTTP-Body der HTTP-Response zurückgeben, damit die verordnende Leistungserbringerinstitution über den erfolgreichen Abschluss der Operation in Kenntnis gesetzt wird.

Der TI-Flow-Fachdienst MUSS das bei der Operation /Task/<id>/$activate im QES-Datensatz enthaltene Verordnung in ein Bundle gleichen Typs in JSON-Repräsentation beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/<id> zurück liefern. Dies gilt für folgende Bundles: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundlehttps://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle

Der TI-Flow-Fachdienst MUSS für diese Bundles
* einen neuen, eindeutigen Identifier für die Bundle.id als UUID generieren,
* das Bundle entsprechend der Kanonisierungsregeln http://hl7.org/fhir/canonicalization/json#static normalisieren (Bundle.text und Bundle.meta im "root-Element" entfernen),
* mit der Signaturidentität des Fachdienstes ID.FD.OSIG gemäß [FHIR-Sig] signieren und
* das signierte Bundle mit Referenz in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 zurück liefern,
damit der Versicherte einen Nachweis über die Integrität der gespeicherten Daten einsehen kann.
Die Festlegungen in [FHIR-Sig] sind in Teilen unspezifisch, konkrete Beispiele finden sich in der gematik-API-Beschreibung für das E-Rezept auf https://github.com/gematik/api-erp .
 Die Signatur soll als JSON Web Signature [JWS] detached erstellt werden, dementsprechend bleibt das data-Feld der JWS-Struktur leer. Im JWS-Header muss das Zertifikat C.FD.SIG eingebettet werden, mit dessen zugehörigen privaten Signaturschlüssel signiert wurde. Als Wert für targetFormat ist der MimeType application/fhir+json und für sigFormat ist der MimeType application/jose zu verwenden.

### Verifizieren von Prüfziffern

Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate einen im FHIR Profil KBV_PR_FOR_Coverage gespeicherten Wert für payor.identifier.value gemäß dem im "Gemeinsames Rundschreiben Institutionskennzeichen (IK)" vom 01.06.2020 unter Kapitel 1.2.5 "Prüfziffer" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_IKNR_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültiges Institutionskennzeichen (IKNR): Das übergebene Institutionskennzeichen im Versicherungsstatus entspricht nicht den Prüfziffer-Validierungsregeln.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate die im FHIR Profil KBV_PR_FOR_Coverage gespeicherten Werte für payor.identifier.extension:alternativeID.value[x]:valueIdentifier gemäß dem "Gemeinsames Rundschreiben Institutionskennzeichen (IK)" vom 01.06.2020 unter Kapitel 1.2.5 "Prüfziffer" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_IKNR_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültiges Institutionskennzeichen (IKNR): Das übergebene Institutionskennzeichen des Kostenträgers entspricht nicht den Prüfziffer-Validierungsregeln.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate einen im FHIR Profil KBV_PR_FOR_Patient gespeicherten Wert für Patient.identifier:versichertenId.value gemäß der Anlage 1 der "Prüfziffernberechnung für die Krankenversichertennummer nach § 290 SGB V" vom 26.02.2019 beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_KVNR_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültige Versichertennummer (KVNR): Die übergebene Versichertennummer des Patienten entspricht nicht den Prüfziffer-Validierungsregeln.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate einen im FHIR Profil KBV_PR_FOR_Practitioner hinterlegten Wert für identifier:ANR.value bzw. identifier:ZANR.value gemäß der Anlage 6 BMV-Ä der "Technischen Anlage zum Vertrag über den Datenaustausch zwischen dem GKV-Spitzenverband (Spitzenverband Bund der Krankenkassen) und der Kassenärztlichen Bundesvereinigung" unter "Aufbau der lebenslangen Arztnummer – LANR" beschriebenen Prüfalgorithmus unter Beachtung der folgenden zulässigen Ausnahmen validieren, und bei einer fehlerhaften Prüfung auf diese Auffälligkeit gemäß der Konfiguration reagieren.

* ANR/ZANR: 555555 plus Ordnungsnummer für die Reihenfolge in der Anzeige an die ASV-Verzeichnisstelle (KH-Zähler) plus Fachgruppencode
  * Ursache: Verordnungen im Rahmen der Versorgung nach § 116b Abs. 1 SGB

**Tabelle: **TAB_eRPFD_016 Zulässige Ausnahmen in Form von Pseudoarztnummern

Hinweis: Folgende weitere Pseudoarztnummern werden genutzt. Sie sind Prüfziffernkonform:

* ANR/ZANR: 4444444 plus Fachgruppencode
  * Ursache: Pseudoarztnummer im Rahmen des Reha-Entlassmanagements
* ANR/ZANR: 999999900
  * Ursache: Ambulanzen in Krankenhäusern gemäß §§ 115b, 116, 116a, 117, 118, 118a, 119, 119c und 140a SGB V - insbesondere Hochschulambulanzen sowie psychiatrische und psychosomatische Institutsambulanzen; Privatärzte ohne LANR, Ärzte in Weiterbildung, Leistungserbringung im Rahmen der gesetzlichen Unfallversicherung - insbesondere gemäß § 33 und 34 SGB VII
* ANR/ZANR: 000000000
  * Ursache: Ausnahme der Verordnungen im Rahmen der Versorgung nach § 116b Abs. 1 SGB V
* ANR/ZANR: 999999991
  * Ursache: Zahnärzte z.B. in zahnärztlichen Hochschulambulanzen
* ANR/ZANR: 333333300
  * Ursache: Verordnungen von Arznei, Heil- und Hilfsmitteln im Rahmen der spezialisierten ambulanten Palliativversorgung (SAPV)

**Tabelle: **TAB_eRPFD_017 Zulässige Ausnahmen in Form von Pseudoarztnummern (Prüfzifferkonform)

Hinweis: Im Rahmen der ambulanten spezialfachärztlichen Versorgung (ASV) nach § 116b SGB V wird gemäß der ASV-Vereinbarung von Krankenhausärzten die sog. Fachgruppennummer statt der LANR verwendet. Die Fachgruppennummer wird ein einem separaten Element hinterlegt. In diesem Fall muss keine ANR angegeben werden.

Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR eine Möglichkeit der Konfiguration vorsehen und bei der Durchführung einer Vergleichsoperation je nach Konfiguration bei Auffälligkeit die Operation mit einer Warnung fortführen oder mit einer Fehlermeldung abbrechen.

Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR, wenn bei der Prüfung eine Auffälligkeit auftritt und die Konfiguration Fehler aktiv ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_LANR_ZANR_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültige Arztnummer (LANR oder ZANR): Die übergebene Arztnummer entspricht nicht den Prüfziffer-Validierungsregeln.

abbrechen.

Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR, wenn bei der Prüfung eine Auffälligkeit auftritt und die Konfiguration Warning aktiv ist, mit dem Http-Responsecode 252 antworten und den Response für die Auffälligkeit mit einem Http-Header "Warning" mit
* warning-code: 252
* warning-agent: "erp-server"
* warning-text: "Ungültige Arztnummer (LANR oder ZANR): Die übergebene Arztnummer entspricht nicht den Prüfziffer-Validierungsregeln."
erweitern.

Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate den im FHIR Profil KBV_PR_ERP_Medication_PZN gespeicherten Wert für code.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_PZN_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate den im FHIR Profil KBV_PR_ERP_Medication_Compounding gespeicherten Wert für ingredient.item[x]:itemCodeableConcept.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_PZN_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate, wenn die PZN einer übergebenen PZN-Verordnung in KBV_PR_ERP_Medication_PZN.code.coding.code nicht 8-stellig ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_PZN_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Länge PZN unzulässig (muss 8-stellig sein)

abbrechen.

