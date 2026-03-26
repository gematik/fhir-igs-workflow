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

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und die ChargeItems danach filtern, damit der Versicherte nur Abrechnungsinformationen abruft, bei denen er der Begünstigte ist.

Der TI-Flow-Fachdienst MUSS das Eingrenzen einer Suchanfrage auf /ChargeItem über die URL-Parameter gemäß https://www.hl7.org/fhir/chargeitem.html#search mindestens für die Attribute ChargeItem.enteredDate und ChargeItem.meta.__lastUpdated erlauben, damit Versicherte und Apotheken eine Suche nach neuen Abrechnungsinformationseinträgen durchführen können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem eine Liste von ChargeItem Ressourcen ohne die in supportingInformation referenzierten Datensätze entsprechend der Filterung und Suchkriterien übermitteln.
### GET /ChargeItem/<id>

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Versicherte oder Apotheken in den Rollen
* oid_versicherter
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation abrufen kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution, die LEI anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.enterer.identifier hinterlegte Telematik-ID der einstellenden LEI prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die LEI eine Abrechnungsinformation abrufen kann, welche die Abrechnungsinformation bereitgestellt hat.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkreten über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution, den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCode ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /ChargeItem/<id> durch einen Versicherten zusätzlich zum ChargeItem die folgenden Datensätze im JSON-Format in einem Responsebundle zurück liefern und dafür in jedem Aufruf den Verordnungsdatensatz, den PKV-Abgabedatensatz und die Quittung im XML-Format mit der Signaturidentität des TI-Flow-Fachdienstes gemäß RFC5652 im Profil CAdES-BES (Enveloping) signieren und in jede Fachdienstsignatur die letzte OCSP-Antwort der Statusprüfung des Signaturzertifikats C.FD.OSIG einbetten, damit der Versicherte die Daten für die Abrechnung an Kostenträger weiterleiten kann.

Der TI-Flow-Fachdienst DARF beim Aufruf der Operation GET /ChargeItem/<id> durch eine abgebende Leistungserbringerinstitution das in ChargeItem.supportingInformation referenzierte Element ChargeItem.supportingInformation:receiptBundle und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nur den Verordnungsdatensatz und durch sie änderbaren PKV-Abgabedatensatz erhält.
### POST /ChargeItem

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in einer der Rollen
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte eingestellt werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ein URL-Parameter "task=..." übermittelt wurde und bei Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 400 abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der im URL-Parameter "task=..." übertragene Task-ID eine Task-Ressource mit dem Status Task.status = completed existiert und bei fehlgeschlagener Prüfung mit dem HTTP-Fehlercode 409 abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit dem Status „quittiert“ angelegt wird.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das im URL-Parameter "secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch die berechtigten Apotheke in Kenntnis des Secrets erfolgt.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass der zum Task zugehörige Verordnungsdatensatz unter Coverage.type.coding.code den Wert "PKV" enthält und bei fehlgeschlagener Prüfung mit dem HTTP-Fehlercode 400 abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit zulässigen Kostenträger angelegt wird.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem die Rezept-ID, welche über den URL-Parameter task übergeben wird, als ChargeItem-ID (ChargeItem.id) verwenden.

Der TI-Flow-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen und die Korrektheit der Rezept-ID (GEM_ERP_PR_PrescriptionId) im referenzierten Task als ChargeItem.identifier, die Korrektheit der Versicherten-ID des Versicherten im referenzierten Task (Task.for) gegen ChargeItem.subject.identifier sowie die Korrektheit der Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in ChargeItem.enterer.identifier prüfen und bei Nicht-Konformität das Anlegen der Ressource im TI-Flow-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.

Der TI-Flow-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil DAV-PKV-PR-ERP-AbgabedatenBundle prüfen und bei Nicht-Konformität das Anlegen der Ressource im TI-Flow-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 abbrechen, um ausschließlich authentische Daten zu verwalten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Signaturzertifikats des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig] befunden werden und der Aufruf anderenfalls mit Status 400 abgebrochen werden, um ausschließlich authentische Daten zu verwalten.

Wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, muss der HTTP-Request mit dem HTTP-Status-Code 512 abgelehnt werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das E-Rezept-Bundle vom Profil KBV_PR_ERP_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:prescriptionItem die Referenz hinzufügen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Quittung-Bundle vom Profil GEM_ERP_PR_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:receipt die Referenz hinzufügen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode hinzufügen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Erzeugen eines ChargeItem mittels HTTP-POST-Operation die folgenden Elemente schreiben:
* ChargeItem.enteredDate (aktueller Zeitstempel).

Der TI-Flow-Fachdienst DARF beim Aufruf der HTTP-POST-Operation auf den Endpunkt /ChargeItem das in "ChargeItem.supportingInformation" referenzierte Element "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nicht die Quittung und AccessCode erhält.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /ChargeItem bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.chargeitem.create" und den Versicherten mit der KVNR = ChargeItem.subject initiieren.
### PATCH /ChargeItem/<id>

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /ChargeItem ohne Angabe einer <id> für eine konkrete Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Ändern mehrerer Ressourcen über einen Request zu verhindern.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-PATCH-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation ändert.

Der TI-Flow-Fachdienst MUSS die in der HTTP-PATCH-Operation auf die Ressource Chargeltem übertragene Parameters Ressource gegen das FHIR-Profil GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input prüfen und bei Nicht-Konformität das Verarbeiten der Ressource im TI-Flow-Fachdienst mit dem http-Status-Code 400 ablehnen.
### PUT /ChargeItem/<id>

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in einer der Rollen
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke), diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.enterer.identifier hinterlegte Telematik-ID prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die Apotheke, welche die Abrechnungsinformation bereitgestellt hat, diese ändert.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke) den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCodeChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil PKV-Abgabedatensatz prüfen und bei Nicht-Konformität das Anlegen der Ressource im TI-Flow-Fachdienst mit dem http-Status-Code 400 und einem Hinweis auf die FHIR-Invalidität in OperationOutcome ablehnen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 und einem Hinweis auf die ungültige Signatur in OperationOutcome abbrechen, um ausschließlich authentische Daten zu verwalten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI, das Signaturzertifikats des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig] befunden werden und der Aufruf anderenfalls mit Status 400 und einem Hinweis auf das abgelaufene/gesperrte Signaturzertifikat in OperationOutcome abgebrochen werden, um ausschließlich authentische Daten zu verwalten. Wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, muss der HTTP-Request mit dem HTTP-Status-Code 512 abgelehnt werden.

Der TI-Flow-Fachdienst MUSS die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen, auf die Zulässigkeit der änderbaren Felder prüfen:
* abgebende LEI: darf nur PKV-Abgabedatensatz ändern 
und bei fehlerhafter Prüfung die Operation mit dem http-Status-Code 400 und einem Hinweis auf unzulässige Änderung gesperrter Attribute in OperationOutcome abbrechen, damit kein Schadcode und keine fachfremden Daten in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode überschreiben, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst DARF beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI das in "ChargeItem.supportingInformation" referenzierte Element "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nicht die Quittung und AccessCode erhält.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.chargeitem.update" und den Versicherten mit der KVNR = ChargeItem.subject initiieren.
### DELETE /ChargeItem/<id>

Der TI-Flow-Fachdienst MUSS den Aufruf der Operation DELETE /ChargeItem ohne Angabe einer konkreten über <id> adressierte ChargeItem Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_versicherter
die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte gelöscht werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation löscht.

Der TI-Flow-Fachdienst MUSS beim Löschen einer ChargeItem-Ressource auch
* die in ChargeItem.supportingInformation referenzierten Ressourcen des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung,
* alle Communication mit Communication.basedOn = ChargeItem.id
löschen.

