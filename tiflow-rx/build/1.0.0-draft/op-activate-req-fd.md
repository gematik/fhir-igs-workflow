# FD-Anforderungen $activate - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $activate (Task aktivieren)**](op-activate.md)
* **FD-Anforderungen $activate**

## FD-Anforderungen $activate

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks für ein E-Rezept mittels HTTP-POST/$activate-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschließlich verordnende Leistungserbringer in der Rolle
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_praxis_psychotherapeut
* oid_krankenhaus
* oid_institution-vorsorge-reha
die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte eingestellt werden können.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im HTTP-RequestHeader "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode und den Status des Tasks auf Task.status = draft prüfen und bei Ungleichheit oder Fehlen des HTTP-Headers die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

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

Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 160, 169, 200 oder 209 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht:
* oid_arzt
* oid_zahnarzt
damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von Medikamenten ermächtigt sind.

Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 166 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von T-Rezepten ermächtigt sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtypen 160, 169, 200 oder 209 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 00 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur Arzneimittelverordnungen zulässig" ausgeben.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtyp 166 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 02 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur T-Rezept Verordnungen zulässig" ausgeben.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 160, 166, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate die Validierung von strukturierten Dosierungen anwenden.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 160 oder 169 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob Coverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf den Ausschluss von Betäubungsmittel ("BTM nicht zulässig" im OperationOutcome) abbrechen, wenn der übergebene QES-Datensatz als Betäubungsmittel-Verordnung (Bundle.Medication.extension:KBV_EX_ERP_Medication_Category:code gleich "01") gekennzeichnet ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks den Wert für Task.extension:eu-isRedeemableByProperties auf "true" setzen, wenn:
* Task.extension:flowType = 160 oder 200 und
* MedicationRequests.medication vom Typ KBV_PR_ERP_Medication_PZN.
Andernfalls ist der Wert der Extension auf "false" zu setzen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /Task/<id>/$activate auf einen Task des Flowtype Task.extension:flowType = 160, 166, 169, 200 oder 209 bei erfolgreichem Abschluss der Operation, die Daten des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.
### Prozessparamter

Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 160 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_004 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Apothekenpflichtige Arzneimittel"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.AcceptDate = >Datum der QES.Erstellung im Signaturobjekt> + 28 Kalendertagesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.AcceptDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage

**Tabelle: **TAB_eRpDM_004 Prozessparameter Flowtype 160

Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 166 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_006 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Arzneimittel nach § 3a AMVV"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 6 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 6 Kalendertage

**Tabelle: **TAB_eRpDM_006 Prozessparameter Flowtype 166

Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 169 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_007 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Workflow-Steuerung durch Leistungserbringer"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.AcceptDate = >Datum der QES.Erstellung im Signaturobjekt> + 28 Kalendertagesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.AcceptDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage

**Tabelle: **TAB_eRpDM_007 Prozessparameter Flowtype 169

Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 200 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_008 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Apothekenpflichtige Arzneimittel (PKV)"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.AcceptDate = >Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.AcceptDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage

**Tabelle: **TAB_eRpDM_008 Prozessparameter Flowtype 200

Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 209 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_009 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Workflow-Steuerung durch Leistungserbringer (PKV)"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.AcceptDate = >Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.AcceptDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage

**Tabelle: **TAB_eRpDM_007 Prozessparameter Flowtype 209

Der E-Rezept-Fachdienst MUSS nach der Feststellung der Prozessparametern die folgenden Parameter mit abweichenden Werten belegen:
* Task.AcceptDate = <Datum der QES.ErstellungBundle.signature.when> + 2 Werktage (Montag bis Samstag, ausgenommen bundeseinheitliche Feiertage) (Abweichende Regelungen durch denGemeinsamen Bundesausschuss (G-BA) sind zu beachten.)
wenn das in der http-POST-Operation /Task/<id>/$activate übergebene, gültig signierte E-Rezept-Bundle in der Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition den code="04" oder "14" des Code-Systems https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_STATUSKENNZEICHEN ("Entlassmanagement-Kennzeichen") enthält und die übrigen Prozessparameter unverändert übernehmen, damit der Prozess für das E-Rezept mit den abweichenden Festlegungen für das Entlassrezept gemäß Arzneimittelrichtlinie [AM-RL] umgesetzt wird.
### Prüfung von Mehrfachverordnungen

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Flowtype ungleich 160, 169, 200 oder 209 ist, weil Mehrfachverordnungen nur für die Verordnungen von apothekenpflichtigen Arzneimittel (kein BtM, kein T-Rezept) zulässig sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator oder Denominator größer als 4 ist, weil eine Mehrfachverordnungen aus maximal 4 Teilverordnungen bestehen darf.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator kleiner als 1 ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Denominator kleiner als 2 ist, weil eine Mehrfachverordnungen aus mindestens 2 Teilverordnungen bestehen muss.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator größer als der Denominator ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung nicht als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false) gekennzeichnet ist, aber eine Extension Nummerierung oder Zeitraum enthält, weil normale Verordnungen keine MVO-Angaben enthalten dürfen.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Entlassrezept ( code="04" oder "14" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, weil für Entlassrezepte keine Mehrfachverordnungen zulässig sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Ersatzverordnung ( code="10" oder "11" oder "17" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, weil für Ersatzverordnungen keine Mehrfachverordnungen zulässig sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) nicht angegeben ist, weil die Information des Beginns der Einlösefrist notwendig ist, um den Gültigkeitszeitraum zu ermitteln.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und das Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) vor dem Ausstellungsdatum (MedicationRequest.authoredOn) liegt.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet, ein Endedatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end) angegeben ist und das Endedatum vor dem Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) liegt.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der dazugehörige value (MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value) nicht dem Schema aus [KBV_ITA_VGEX_Technische_Anlage_ERP] entspricht.

