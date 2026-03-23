# Anforderungen an den E-Rezept-Fachdienst für die $activate-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $activate**](op-activate.md)
* **Anforderungen an den E-Rezept-Fachdienst für die $activate-Operation**

## Anforderungen an den E-Rezept-Fachdienst für die $activate-Operation

Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks für ein E-Rezept mittels HTTP-POST/$activate-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschließlich verordnende Leistungserbringer in der Rolle
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_praxis_psychotherapeut
* oid_krankenhaus
* oid_institution-vorsorge-reha
die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte eingestellt werden können.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im HTTP-RequestHeader "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode und bei Ungleichheit oder Fehlen des HTTP-Headers die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "draft" ist.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im Aufrufparameter übergebenen FHIR-Operationsparameter des QES-Datensatzes als PKCS#7-Datei einer Enveloping CAdES-Signatur entgegennehmen und verarbeiten und bei Fehlen oder ungültiger ASN.1 Datenstruktur die Weiterverarbeitung im Fachdienst mit dem http-Status-Code 400 beantworten, damit kein Schadcode und keine "fachfremden" Daten in den E-Rezept-Fachdienst hochgeladen werden.

Der E-Rezept-Fachdienst MUSS das QES-Signaturzertifikat C.HP.QES in der Signatur des übergebenen QES-Datensatzes gemäß [gemSpec_PKI#TUC_PKI_030] mit folgenden Parametern auf Gültigkeit prüfen:

* Parameter: Zertifikat
  * Wert: Signaturzertifikat des HBA (eingebettet in Signatur-Objekt des QES-Datensatzes):* C.HP.QES (oid_hba_qes = 1.2.276.0.76.4.72 gemäß gemSpec_OID)
* bzw. für HBA-Vorläuferkarten C.HP.ENC (oid_vk_eaa_enc = 1.3.6.1.4.1.24796.1.10 gemäß gemSpec_OID) Hinweis: die OID dieses Profil wird für Ärzte- und Zahnärzteschaft gleichermaßen genutzt

* Parameter: Referenzzeitpunkt
  * Wert: Zeitpunkt der QES-Erstellung gemäß signingTime im QES-Datensatz
* Parameter: Offline-Modus
  * Wert: nein
* Parameter: OCSP-Response
  * Wert: eingebettet in QES-Datensatz

**Tabelle: **TAB_eRPFD_006 Parameter Prüfung Signaturzertifikat QES des HBA
und darf die OCSP-Response für die Abfrage des Zertifikatsstatus für 12 Stunden zwischenspeichern. Ist keine OCSP-Response eingebettet oder die eingebettete OCSP Response nicht gültig, MUSS der E-Rezept-Fachdienst die gecachte OCSP-Response verwenden oder eine OCSP-Response beim benannten TSP anfragen und die genutzte OCSP-Response nachträglich in den QES-Datensatz einbetten. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig ] befunden werden und der HTTP-Request andernfalls mit dem HTTP-Status-Code 400 abgelehnt werden, damit sichergestellt wird, dass ausschließlich E-Rezepte verwaltet werden, die von einer gültigen, nicht gesperrten Heilberufsidentität eines HBA signiert wurden. Wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, muss der HTTP-Request mit dem HTTP-Status-Code 512 abgelehnt werden.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate
*  die qualifizierte Signatur des QES-Datensatzes gemäß [ETSI_QES] prüfen und bei nicht gültiger qualifizierter Signatur die Operation mit Status 400 abbrechen 
*  bzw. bei gültiger Signatur das innerhalb des PKCS#7-Datensatz enveloping-enthaltene FHIR-Bundle einer umfänglichen FHIR-Validierung gegen die eRezept-Schema-Definition der KBV kbv.ita.erp oder kbv.itv.evdga unterziehen und bei Invalidität die Operation mit Status 400 abbrechen 
*  bzw. bei gültiger Signatur und validem FHIR den Datensatz als PKCS#7-Datei sicher speichern und in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 über eine interne, eindeutige UUID referenzieren, 
damit der nachfolgende Workflow ausschließlich auf Basis medizinisch korrekter und vom Leistungserbringer mittels Signatur freigegebener Daten erfolgt.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate die Angabe zum Mimetype des signierten Dokumentes prüfen und mit dem Fehler 400 abbrechen, wenn dieser ungleich "text/plain; charset=utf-8" ist.

Der E-Rezept-Fachdienst MUSS beim berechtigten Aufruf der Operation POST /Task/<id>/$activate prüfen, dass die PrescriptionID des Tasks mit der PrescriptionID im übergebenen QES-Datensatz übereinstimmt und der Präfix der PrescriptionID gleich dem Flowtype des zu aktivierenden Tasks ist und andernfalls die Operation mit dem http-Fehlercode 400 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, dass Patient.identifier.system gleich "http://fhir.de/sid/gkv/kvid-10" ist und andernfalls die Operation mit dem http-Fehlercode 400 und dem Hinweis im OperationOutcome "Als Identifier für den Patienten muss eine VersichertenID (KVNR) angegeben werden." abbrechen.

Der E-Rezept-Fachdienst MUSS den Aufruf der http-POST-Operation /Task/<id>/$activate mit einem Fehlercode 400 und Hinweis im OperationOutcome auf "Ausstellungsdatum und Signaturzeitpunkt weichen voneinander ab, müssen aber taggleich sein" als ungültig abweisen, wenn das Datum authoredOn zur Gültigkeitsberechnung des E-Rezepts nicht dem Datum in QES.Erstellung im Signaturobjekt entspricht.

Der E-Rezept-Fachdienst MUSS im Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate die KVNR des Patienten dem Identifier http://fhir.de/sid/gkv/kvid-10 der Patient-Ressource im E-Rezept-Bundle entnehmen und diesen als Identifier in Task.for mit system http://fhir.de/sid/gkv/kvid-10 hinzufügen, damit ausschließlich eine gültige, vom Arzt signierte Patientenreferenz im Workflow verwendet wird.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.activate" und den Versicherten mit der KVNR = Task.for initiieren.

Der E-Rezept-Fachdienst MUSS die zulässige Aktivierung eines Tasks mittels /Task/<id>/$activate-Operation im Status Task.status = ready vollziehen und bei erfolgreichem Abschluss der Operation die Ressource Task im HTTP-Body der HTTP-Response zurückgeben, damit die verordnende Leistungserbringerinstitution über den erfolgreichen Abschluss der Operation in Kenntnis gesetzt wird.

Der E-Rezept-Fachdienst MUSS das bei der Operation /Task/<id>/$activate im QES-Datensatz enthaltene Verordnung in ein Bundle gleichen Typs in JSON-Repräsentation beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/<id> zurück liefern.Dies gilt für folgende Bundles: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundlehttps://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle

Der E-Rezept-Fachdienst MUSS für diese Bundles
* einen neuen, eindeutigen Identifier für die Bundle.id als UUID generieren,
* das Bundle entsprechend der Kanonisierungsregeln http://hl7.org/fhir/canonicalization/json#static normalisieren (Bundle.text und Bundle.meta im "root-Element" entfernen),
* mit der Signaturidentität des Fachdienstes ID.FD.OSIG gemäß [FHIR-Sig] signieren und
* das signierte Bundle mit Referenz in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 zurück liefern,
damit der Versicherte einen Nachweis über die Integrität der gespeicherten Daten einsehen kann.
Die Festlegungen in [FHIR-Sig] sind in Teilen unspezifisch, konkrete Beispiele finden sich in der gematik-API-Beschreibung für das E-Rezept auf https://github.com/gematik/api-erp .
 Die Signatur soll als JSON Web Signature [JWS] detached erstellt werden, dementsprechend bleibt das data-Feld der JWS-Struktur leer. Im JWS-Header muss das Zertifikat C.FD.SIG eingebettet werden, mit dessen zugehörigen privaten Signaturschlüssel signiert wurde. Als Wert für targetFormat ist der MimeType application/fhir+json und für sigFormat ist der MimeType application/jose zu verwenden.

#### Verifizieren von Prüfziffern

Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate einen im FHIR Profil KBV_PR_FOR_Coverage gespeicherten Wert für payor.identifier.value gemäß dem im "Gemeinsames Rundschreiben Institutionskennzeichen (IK)" vom 01.06.2020 unter Kapitel 1.2.5 "Prüfziffer" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung den Prozess mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültiges Institutionskennzeichen (IKNR): Das übergebene Institutionskennzeichen im Versicherungsstatus entspricht nicht den Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate die im FHIR Profil KBV_PR_FOR_Coverage gespeicherten Werte für payor.identifier.extension:alternativeID.value[x]:valueIdentifier gemäß dem "Gemeinsames Rundschreiben Institutionskennzeichen (IK)" vom 01.06.2020 unter Kapitel 1.2.5 "Prüfziffer" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültiges Institutionskennzeichen (IKNR): Das übergebene Institutionskennzeichen des Kostenträgers entspricht nicht den Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate einen im FHIR Profil KBV_PR_FOR_Patient gespeicherten Wert für Patient.identifier:versichertenId.value gemäß der Anlage 1 der "Prüfziffernberechnung für die Krankenversichertennummer nach § 290 SGB V" vom 26.02.2019 beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültige Versichertennummer (KVNR): Die übergebene Versichertennummer des Patienten entspricht nicht den Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate einen im FHIR Profil KBV_PR_FOR_Practitioner hinterlegten Wert für identifier:ANR.value bzw. identifier:ZANR.value gemäß der Anlage 6 BMV-Ä der "Technischen Anlage zum Vertrag über den Datenaustausch zwischen dem GKV-Spitzenverband (Spitzenverband Bund der Krankenkassen) und der Kassenärztlichen Bundesvereinigung" unter "Aufbau der lebenslangen Arztnummer – LANR" beschriebenen Prüfalgorithmus unter Beachtung der folgenden zulässigen Ausnahmen validieren, und bei einer fehlerhaften Prüfung auf diese Auffälligkeit gemäß der Konfiguration reagieren.

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

Der E-Rezept-Fachdienst MUSS für die Überprüfung der ANR/ZANR eine Möglichkeit der Konfiguration vorsehen und bei der Durchführung einer Vergleichsoperation je nach Konfiguration bei Auffälligkeit die Operation mit einer Warnung fortführen oder mit einer Fehlermeldung abbrechen.

Der E-Rezept-Fachdienst MUSS für die Überprüfung der ANR/ZANR, wenn bei der Prüfung eine Auffälligkeit auftritt und die Konfiguration Fehler aktiv ist, mit dem Http-Fehlercode 400 abbrechen und die Fehlermeldung "Ungültige Arztnummer (LANR oder ZANR): Die übergebene Arztnummer entspricht nicht den Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS für die Überprüfung der ANR/ZANR, wenn bei der Prüfung eine Auffälligkeit auftritt und die Konfiguration Warning aktiv ist, mit dem Http-Responsecode 252 antworten und den Response für die Auffälligkeit mit einem Http-Header "Warning" mit
* warning-code: 252
* warning-agent: "erp-server"
* warning-text: "Ungültige Arztnummer (LANR oder ZANR): Die übergebene Arztnummer entspricht nicht den Prüfziffer-Validierungsregeln."
erweitern.

Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate den im FHIR Profil KBV_PR_ERP_Medication_PZN gespeicherten Wert für code.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate den im FHIR Profil KBV_PR_ERP_Medication_Compounding gespeicherten Wert für ingredient.item[x]:itemCodeableConcept.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf die Längenprüfung der PZN ("Länge PZN unzulässig (muss 8-stellig sein))" im OperationOutcome) abbrechen, wenn die PZN einer übergebenen PZN-Verordnung in KBV_PR_ERP_Medication_PZN.code.coding.code nicht 8-stellig ist.
### Modulspezifische Anforderungen

Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 162 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht:
* oid_arzt
* oid_zahnarzt
* oid_psychotherapeut
* oid_ps_psychotherapeut
* oid_kuj_psychotherapeut
damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von DiGAs ermächtigt sind.


Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Flowtype 162 mittels $activate prüfen, dass im Bundle eine
*DeviceRequest*-Ressource und in der
*Composition.type.coding.code=e16D*enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der
*OperationOutcome*den Fehlertext "Für diesen Workflowtypen sind nur Verordnungen für Digitale Gesundheitsanwendungen zulässig" ausgeben.


Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate den im FHIR Profil KBV_PR_EVDGA_HealthAppRequest gespeicherten Wert für .code[x]:codeCodeableConcept.coding.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren.

Der E-Rezept-Fachdienst MUSS bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen, sowie die Fehlermeldung "Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln." in Form eines OperationOutcome ausliefern.


Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 162 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, obCoverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.

 

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 162 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob die Extension Coverage.payor.identifier.extension:alternativeID vorhanden ist und in diesem Fall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass dieser Workflow nicht für Verordnungen genutzt wird, die zu Lasten von Unfallkassen oder Berufsgenossenschaften gehen.
Dieser Ausschluss erfolgt temporär. In einer späteren Version können Unfallkassen das Verordnen von DiGAs explizit unterstützen. Die konkreten Festlegungen dazu werden in einem Folgerelease getroffen.

Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 162 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_005 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.59"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Kostenträger"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Digitale Gesundheitsanwendungen"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonate
* Feld in Task: Task.AcceptDate
  * Feldbelegung: <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonate

**Tabelle: **TAB_eRpDM_005 Prozessparameter Flowtype 162

