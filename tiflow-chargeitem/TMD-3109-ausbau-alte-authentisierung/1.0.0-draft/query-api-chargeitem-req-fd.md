# FD-Anforderungen: ChargeItem-Query - TIFlow - Abrechnungsinformationen v1.0.0-draft

TIFlow - Abrechnungsinformationen

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **FD-Anforderungen: ChargeItem-Query**

## FD-Anforderungen: ChargeItem-Query

Diese Seite beschreibt Anforderungen am TI-Flow-Fachdienst zur Nutzung der `ChargeItem`-Query-Endpunkte.

### Allgemeine Regeln

Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource ChargeItem mittels der HTTP-Operationen HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zu Abrechnungsinformationen ausgeführt werden können.

Der TI-Flow-Fachdienst MUSS ein Signatur-Zertifikat einer nonQES-Signatur eine Leistungserbringerinstitution gemäß [gemSpec_PKI#TUC_PKI_018] mit folgenden Parametern auf Gültigkeit prüfen: Tabelle # : TAB_eRPFD_013 Parameter Prüfung Signaturzertifikat SMC-B Parameter Zertifikat Signaturzertifikat aus nonQES PolicyList oid_smc_b_osig intendedKeyUsage nonRepudiation intendedExtendedKeyUsage (leer) OCSP-Graceperiod 12 Stunden Offline-Modus nein Prüfmodus OCSP Der TI-Flow-Fachdienst darf die OCSP-Response für die Abfrage des Zertifikatsstatus für 12 Stunden zwischenspeichern.
### GET /ChargeItem

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und die ChargeItems danach filtern, damit der Versicherte nur Abrechnungsinformationen abruft, bei denen er der Begünstigte ist.

Der TI-Flow-Fachdienst MUSS das Eingrenzen einer Suchanfrage auf /ChargeItem über die URL-Parameter gemäß https://www.hl7.org/fhir/chargeitem.html#search mindestens für die Attribute ChargeItem.enteredDate und ChargeItem.meta.__lastUpdated erlauben, damit Versicherte und Apotheken eine Suche nach neuen Abrechnungsinformationseinträgen durchführen können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem eine Liste von ChargeItem Ressourcen ohne die in supportingInformation referenzierten Datensätze entsprechend der Filterung und Suchkriterien übermitteln.
### GET /ChargeItem/<id>

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Versicherte oder Apotheken in den Rollen
* oid_versicherter
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)

abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation abrufen kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution, die LEI anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.enterer.identifier hinterlegte Telematik-ID der einstellenden LEI prüfen und bei Ungleichheit den Aufruf mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)

abweisen, damit ausschließlich die LEI eine Abrechnungsinformation abrufen kann, welche die Abrechnungsinformation bereitgestellt hat.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkreten über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution, den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCode ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_ACCESSCODE_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /ChargeItem/<id> durch einen Versicherten zusätzlich zum ChargeItem die folgenden Datensätze im JSON-Format in einem Responsebundle zurück liefern und dafür in jedem Aufruf den Verordnungsdatensatz, den PKV-Abgabedatensatz und die Quittung im XML-Format mit der Signaturidentität des TI-Flow-Fachdienstes gemäß RFC5652 im Profil CAdES-BES (Enveloping) signieren und in jede Fachdienstsignatur die letzte OCSP-Antwort der Statusprüfung des Signaturzertifikats C.FD.OSIG einbetten, damit der Versicherte die Daten für die Abrechnung an Kostenträger weiterleiten kann.

Der TI-Flow-Fachdienst DARF beim Aufruf der Operation GET /ChargeItem/<id> durch eine abgebende Leistungserbringerinstitution das in ChargeItem.supportingInformation referenzierte Element ChargeItem.supportingInformation:receiptBundle und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nur den Verordnungsdatensatz und durch sie änderbaren PKV-Abgabedatensatz erhält.
### POST /ChargeItem

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in einer der Rollen
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit eine Abrechnungsinformation nicht durch Unberechtigte eingestellt werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ein URL-Parameter "task=..." übermittelt wurde und bei Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_TASK_REQUIRED
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der im URL-Parameter "task=..." übertragene Task-ID eine Task-Ressource mit dem Status Task.status = completed existiert und bei fehlgeschlagener Prüfung mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 409 - Conflict: error
* HTTP-Code: Code
  * 409 - Conflict: invalid
* HTTP-Code: Details Code
  * 409 - Conflict: TIFLOW_TASK_NOT_FOUND
* HTTP-Code: Details Text
  * 409 - Conflict: -

abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit dem Status „quittiert“ angelegt wird.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das im URL-Parameter "secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_SECRET_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit der Zugriff auf diesen Datensatz nur durch die berechtigten Apotheke in Kenntnis des Secrets erfolgt.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass der zum Task zugehörige Verordnungsdatensatz unter Coverage.type.coding.code den Wert "PKV" enthält und bei fehlgeschlagener Prüfung mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_CHARGEITEM_COVERAGE_NOT_PKV
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit zulässigen Kostenträger angelegt wird.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_CONSENT_REQUIRED
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem die Rezept-ID, welche über den URL-Parameter task übergeben wird, als ChargeItem-ID (ChargeItem.id) verwenden.

Der TI-Flow-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen und
* die Korrektheit der Rezept-ID (GEM_ERP_PR_PrescriptionId) im referenzierten Task als ChargeItem.identifier, 
* die Korrektheit der Versicherten-ID des Versicherten im referenzierten Task (Task.for) gegen ChargeItem.subject.identifier 
* und die Korrektheit der Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in ChargeItem.enterer.identifier
prüfen und bei Nicht-Konformität die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.

Der TI-Flow-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil DAV-PKV-PR-ERP-AbgabedatenBundle prüfen und bei Nicht-Konformität die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_CHARGEITEM_DISPENSE_SIGNATURE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, um ausschließlich authentische Daten zu verwalten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Signaturzertifikats des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig] befunden werden und bei fehlerhafter Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_CHARGEITEM_DISPENSE_CERTIFICATE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, um ausschließlich authentische Daten zu verwalten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Signaturzertifikats des PKV-Abgabedatensatzes prüfen und, wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 512 - OCSP Backend Error: error
* HTTP-Code: Code
  * 512 - OCSP Backend Error: transient
* HTTP-Code: Details Code
  * 512 - OCSP Backend Error: TIFLOW_OCSP_BACKEND_ERROR
* HTTP-Code: Details Text
  * 512 - OCSP Backend Error: -

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das E-Rezept-Bundle vom Profil KBV_PR_ERP_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:prescriptionItem die Referenz hinzufügen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Quittung-Bundle vom Profil GEM_ERP_PR_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:receipt die Referenz hinzufügen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode hinzufügen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Erzeugen eines ChargeItem mittels HTTP-POST-Operation die folgenden Elemente schreiben:
* ChargeItem.enteredDate (aktueller Zeitstempel).

Der TI-Flow-Fachdienst DARF beim Aufruf der HTTP-POST-Operation auf den Endpunkt /ChargeItem das in "ChargeItem.supportingInformation" referenzierte Element "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nicht die Quittung und AccessCode erhält.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /ChargeItem bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.chargeitem.create" und den Versicherten mit der KVNR = ChargeItem.subject initiieren.
### PATCH /ChargeItem/<id>

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /ChargeItem ohne Angabe einer <id> für eine konkrete Ressource die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 405 - Method Not Allowed: error
* HTTP-Code: Code
  * 405 - Method Not Allowed: invalid
* HTTP-Code: Details Code
  * 405 - Method Not Allowed: TIFLOW_CHARGEITEM_ID_REQUIRED
* HTTP-Code: Details Text
  * 405 - Method Not Allowed: -

abbrechen, um das Ändern mehrerer Ressourcen über einen Request zu verhindern.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-PATCH-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)

abbrechen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation ändert.

Der TI-Flow-Fachdienst MUSS die in der HTTP-PATCH-Operation auf die Ressource Chargeltem übertragene Parameters Ressource gegen das FHIR-Profil GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input prüfen und bei Nicht-Konformität die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen.
### PUT /ChargeItem/<id>

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Nutzer in einer der Rollen
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am TI-Flow-Fachdienst aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_CONSENT_REQUIRED
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke), diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.enterer.identifier hinterlegte Telematik-ID prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)

abbrechen, damit ausschließlich die Apotheke, welche die Abrechnungsinformation bereitgestellt hat, diese ändert.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke) den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCodeChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_ACCESSCODE_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil PKV-Abgabedatensatz prüfen und bei Nicht-Konformität die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_CHARGEITEM_DISPENSE_SIGNATURE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, um ausschließlich authentische Daten zu verwalten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI, das Signaturzertifikats des PKV-Abgabedatensatzes prüfen, das Signaturzertifikat anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig] befinden und anderenfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_CHARGEITEM_DISPENSE_CERTIFICATE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Das Signaturzertifikat ist abgelaufen bzw. gesperrt.

abbrechen, um ausschließlich authentische Daten zu verwalten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI, das Signaturzertifikats des PKV-Abgabedatensatzes prüfen und, wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 512 - OCSP Backend Error: error
* HTTP-Code: Code
  * 512 - OCSP Backend Error: transient
* HTTP-Code: Details Code
  * 512 - OCSP Backend Error: TIFLOW_OCSP_BACKEND_ERROR
* HTTP-Code: Details Text
  * 512 - OCSP Backend Error: -

abbrechen.

Der TI-Flow-Fachdienst MUSS die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen, auf die Zulässigkeit der änderbaren Felder prüfen:
* abgebende LEI: darf nur PKV-Abgabedatensatz ändern 
und bei fehlerhafter Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen, damit kein Schadcode und keine fachfremden Daten in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode überschreiben, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst DARF beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI das in "ChargeItem.supportingInformation" referenzierte Element "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nicht die Quittung und AccessCode erhält.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.chargeitem.update" und den Versicherten mit der KVNR = ChargeItem.subject initiieren.
### DELETE /ChargeItem/<id>

Der TI-Flow-Fachdienst MUSS den Aufruf der Operation DELETE /ChargeItem ohne Angabe einer konkreten über <id> adressierte ChargeItem Ressource die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 405 - Method Not Allowed: error
* HTTP-Code: Code
  * 405 - Method Not Allowed: invalid
* HTTP-Code: Details Code
  * 405 - Method Not Allowed: TIFLOW_CHARGEITEM_ID_REQUIRED
* HTTP-Code: Details Text
  * 405 - Method Not Allowed: -

abbrechen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_versicherter
die Operation am TI-Flow-Fachdienst aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit eine Abrechnungsinformation nicht durch Unberechtigte gelöscht werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)

abbrechen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation löscht.

Der TI-Flow-Fachdienst MUSS beim Löschen einer ChargeItem-Ressource auch
* die in ChargeItem.supportingInformation referenzierten Ressourcen des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung,
* alle Communication mit Communication.basedOn = ChargeItem.id
löschen.

