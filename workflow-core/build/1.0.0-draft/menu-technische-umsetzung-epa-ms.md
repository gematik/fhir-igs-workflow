# ePA MedicationService - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **ePA MedicationService**

## ePA MedicationService

### Kommunikation mit ePA-Aktensystem

Die Datenübermittlung zwischen E-Rezept-Fachdienst und ePA-Aktensystem erfolgt über HTTPS/TLS gemäß den Vorgaben aus den referenzierten Spezifikationen. Dabei wird das Server-Zertifikat des ePA-Aktensystems geprüft. Zusätzlich wird das VAU-Protokoll verwendet. Für die Authentisierung erstellt der E-Rezept-Fachdienst ein self-signed JWT Bearer-Token, und für Operationsaufrufe wird die clientID für den User-Agent festgelegt.

#### TLS-Verbindung

Zur Absicherung der Datenübermittlung muss der Transport der Nachrichten zwischen E-Rezept-Fachdienst uns ePA-Aktensystem mittels HTTPS erfolgen. Transport Layer Security (TLS) ist gemäß den Vorgaben aus [gemSpec_Krypt] einzusetzen.

Der ePA-Aktensystem unterstützt an den genutzten Schnittstellen mindestens die HTTP Version 1.1 (siehe A_24654 – ePA: http-Version).

Der ePA-Aktensystem nutzt sein C.FD.TLS-S Zertifikat für den TLS-Verbindungsaufbau. Der E-Rezept-Fachdienst prüft beim Verbindungsaufbau das Server-Zertifikat des ePA-Aktensystems entsprechend der Vorgaben von [gemSpec_PKI].

Der E-Rezept-Fachdienst MUSS das Zertifikat des ePA-Aktensystems gemäß den Vorgaben von [gemSpec_PKI] und des TUC_PKI_018 mit den Eingangsdaten gemäß der Tabelle Tab_eRPFD_018 prüfen und im Fehlerfall den Aufbau der HTTPS-Verbindung abbrechen. Tabelle #: Tab_eRPFD_018 – Eingangsdaten für die Prüfung des ePA-Aktensystem Server-Zertifikats

| | |
| :--- | :--- |
| TSL | die entsprechende TSL für Infrastrukturkomponenten |
| Zertifikat | das zu prüfende Zertifikat vom Kommunikationspartner |
| Referenzzeitpunkt | aktuelle Systemzeit |
| Prüfmodus | OCSP |
| PolicyList | oid_fd_tls_s |
| Vorgesehene KeyUsage | digitalSignature |
| Vorgesehene ExtendedKeyUsage | id-kp-serverAuth |
| GracePeriod | der Wert muss konfigurierbar sein |
| Offline-Modus | nein |
| Timeout | Default-Wert (siehe [gemSpec_PKI]) |
| TOLERATE_OCSP_FAILURE | Default-Wert (siehe [gemSpec_PKI]) |

**Tabelle: **Eingangsdaten für die Prüfung des ePA-Aktensystem Server-Zertifikats

Der TUC gibt neben dem Status der Zertifikatsprüfung auch die im Zertifikat enthaltene Rolle (Admission) zurück. Diese muss geprüft werden.

Der E-Rezept-Fachdienst MUSS prüfen, dass die im Zertifikat enthaltene Rolle (Admission) gleich oid_epa_dvw ist und im Fehlerfall den Aufbau der HTTPS-Verbindung abbrechen.
#### VAU-Protokoll

Zusätzlich zu der Transportverschlüsselung mittels TLS werden die zu übermittelten Daten mit dem VAU-Protokoll gesichert. Es gelten die Vorgaben aus [gemSpec_Krypt]#7 VAU-Protokoll für ePA für alle.

**Abbildung: **Transport durch die TI
Für die Authentisierung erstellt der E-Rezept-Fachdienst einen self-signed Bearer-Token. Für die Signatur wird das AUT-Zertifikat der E-Rezept-VAU verwendet. Siehe [gemSpec_Krypt]#7.4 Authentisierung des E-Rezept-FD als ePA-Client und [gemSpec_Aktensystem_ePAfueralle]#3.16.3 Anforderungen an den Authorization Service für die Authentisierung des E-Rezept-Fachdienstes.

Der E-Rezept-Fachdienst MUSS für die Authentisierung gegenüber dem ePA-Aktensystem ein JWT Baerer-Token gemäß A_25165-* erstellen.

Der E-Rezept-Fachdienst MUSS für die Authentisierung gegenüber dem ePA-Aktensystem das C.FD.AUT Zertifikat mit professionOID oid_erp-vau und der der Telematik-ID 9-E-Rezept-Fachdienst verwenden.

Der E-Rezept-Fachdienst MUSS bei allen Operationsaufrufen am Information Service, Authorization Service oder Medication Service die clientID "ERP-FD" verwenden, um den zu übermittelnden UserAgent zu erzeugen.
### ePA-Aktensysteme ermitteln

Der E-Rezept-Fachdienst MUSS zur Lokalisierung der ePA-Aktensysteme die durch die im DNS für die übergreifende ePA-Domäne epa4all.de eingestellten Informationen aufrufen.
Für die Bezeichnung der Ressourcen Records siehe “A_24592-* Anbieter ePA-Aktensystem - Registrierung an übergreifender ePA-Domäne”. Die Informationen zu jedem ePA-Aktensystem enthalten den Endpunkt für den Authorization Service [I_Authorization_Service], Medication Service [I_Medication_Service] und Information Service [I_Information_Service].

Der E-Rezept-Fachdienst DARF NICHT Lokalisierungsinformationen zu ePA-Aktensystemen verwenden, welche länger als 24h lokal durch den E-Rezept-Fachdienst gecacht wurden.
### ePA-Aktensystem für KVNR ermitteln

Der E-Rezept-Fachdienst MUSS für das Ermitteln des ePA-Aktensystem bei dem das Aktenkonto zu einer KVNR verwaltet wird, einmal den Endpunkt .../ehr/{insurantid}/consentdecisions des [I_Information_Service] jedes ePA-Aktensystem aufrufen und das Ermitteln abbrechen, wenn die Response den Statuscode 404 erhält.

Der E-Rezept-Fachdienst DARF NICHT Informationen zur Zuordnung von KVNR und ePA-Aktensystem verwenden, welche länger als 180 Tage gecacht wurden.

Der E-Rezept-Fachdienst MUSS gecachte Informationen zur Zuordnung von KVNR und ePA-Aktensystem invalidieren, wenn bei der Übermittlung die Response den Statuscode 404 erhält.

Der E-Rezept-Fachdienst MUSS die Aufrufe zum Ermitteln des ePA-Aktensystem für mindestens eine Minute unterbrechen, wenn ein Operationsaufruf im Information Service mit einem Statuscode 500 scheitert, und anschließend für weitere Aufrufe einen exponentiellen Backoff-Mechanismus anwenden, der die Wartezeit zwischen den Versuchen sukzessive verdoppelt, um die Belastung des Zielsystems zu minimieren.

Der E-Rezept-Fachdienst MUSS den Aufruf zum Ermitteln des ePA-Aktensystem als fehlerhaft kennzeichnen und eine detaillierte Fehlermeldung für interne Analysezwecke protokollieren, wenn der Information Service der ePA auf einen Operationsaufruf mit einem Statuscode 400 (malformed Request) reagiert.
### Übermittlung an den Medication Service

Der E-Rezept-Fachdienst MUSS sicherstellen, dass ausschließlich Daten zu Tasks mit dem Flowtype 160, 166, 169, 200 oder 209 für den ePA Medication Service bereitstellt werden.

Der E-Rezept-Fachdienst MUSS das Übermitteln der Daten an den ePA Medication Service asynchron zur Bereitstellung der Daten durch die Clientsysteme umsetzen, damit für das bereitstellende Primärsystem der verordnenden oder abgebenden Leistungserbringerinstitution oder E-Rezept-FdV keine verlängerte Verarbeitungsdauer der auslösenden Operation auftritt.
#### Mappingregeln

Der E-Rezept-Fachdienst MUSS beim Bereitstellen der Daten für ePA Medication Service die durch Clientsysteme des E-Rezept-Fachdienst bereitgestellten Ressourcen (E-Rezept FHIR Ressource) in Ressourcen des ePA Medication Service (ePA Medication Service FHIR Ressourcen) gemäß der Tabelle Tab_eRPFD_019 unter Beachtung der Ausnahmeregelungen überführen.

* Ausgangsprofil der E-Rezept FHIR Ressourcen: KBV_PR_ERP_Medication_PZN https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN
  * Zielprofil der ePA Medication Service FHIR Ressourcen: Medication resource for the ePA Medication Service https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
  * Ausnahmeregelungen des Mappings: Keine Übernahme von "extension:Kategorie"-Elementen
* Ausgangsprofil der E-Rezept FHIR Ressourcen: KBV_PR_ERP_Medication_Ingredient https://simplifier.net/erezept/kbvprerpmedicationingredient
  * Zielprofil der ePA Medication Service FHIR Ressourcen: Medication resource for the ePA Medication Service https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
  * Ausnahmeregelungen des Mappings: 
* Ausgangsprofil der E-Rezept FHIR Ressourcen: KBV_PR_ERP_Medication_Compounding https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding
  * Zielprofil der ePA Medication Service FHIR Ressourcen: Medication resource for the ePA Medication Service https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
  * Ausnahmeregelungen des Mappings: Keine Übernahme von "extension:Kategorie"-Elementen
* Ausgangsprofil der E-Rezept FHIR Ressourcen: KBV_PR_ERP_Medication_FreeText https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText
  * Zielprofil der ePA Medication Service FHIR Ressourcen: Medication resource for the ePA Medication Service https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
  * Ausnahmeregelungen des Mappings: 
* Ausgangsprofil der E-Rezept FHIR Ressourcen: KBV_PR_ERP_Prescription https://simplifier.net/erezept/kbvprerpprescription
  * Zielprofil der ePA Medication Service FHIR Ressourcen: MedicationRequest resource for the ePA Medication Service https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request
  * Ausnahmeregelungen des Mappings: Setzen des Pattern "filler-order" für .inten Keine Übernahme von "insurance"-Elemente Keine Übernahme von "requester.reference"-Elemente Keine Übernahme von "subject.reference"-Elemente Keine Übernahme von "extension:Notdienstgebuehr"-Elemente Keine Übernahme von "extension:Zuzahlungsstatus"-Elemente Keine Übernahme von "dosageInstruction.extension:Dosierungskennzeichen"-Elemente Keine Übernahme von "MedicationRequest.extension:Unfallinformationen"-Elementen
* Ausgangsprofil der E-Rezept FHIR Ressourcen: KBV_PR_FOR_Practitioner https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner
  * Zielprofil der ePA Medication Service FHIR Ressourcen: Practitioner in gematik Directory https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory
  * Ausnahmeregelungen des Mappings: Überschreiben/Setzen der "identifier:Telematik-ID" des Arztes aus dem Signaturzertifikat der QES
* Ausgangsprofil der E-Rezept FHIR Ressourcen: KBV_PR_FOR_Organization https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization
  * Zielprofil der ePA Medication Service FHIR Ressourcen: Organization in gematik Directory https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory
  * Ausnahmeregelungen des Mappings: Überschreiben/Setzen des "identifier:TelematikID" mit der idNummer aus dem ACCESS_TOKEN des verwendeten Operationsaufrufes
* Ausgangsprofil der E-Rezept FHIR Ressourcen: GEM_ERP_PR_MedicationDispense https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense
  * Zielprofil der ePA Medication Service FHIR Ressourcen: EPA MedicationDispense https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-dispense
  * Ausnahmeregelungen des Mappings: 
* Ausgangsprofil der E-Rezept FHIR Ressourcen: GEM_ERP_PR_Medication https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication
  * Zielprofil der ePA Medication Service FHIR Ressourcen: Medication resource for the ePA Medication Service https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
  * Ausnahmeregelungen des Mappings: 

**Tabelle: **Übersicht Mapping und Ausnahmeregelungen des Mappings

Der E-Rezept-Fachdienst MUSS beim Bereitstellen der MedicationDispense für den ePA Medication Service eine Ressource des Profils https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory erstellen und Organization.identifier:TelematikID mit idNummer sowie Organization.name mit organizationName aus dem ACCESS_TOKEN belegen.

Der E-Rezept-Fachdienst MUSS beim Bereitstellen der Daten für den ePA Medication Service sicherstellen, dass Datenwerte der E-Rezept FHIR Ressource übernommen werden, sofern das entsprechende Element in dem Ausgangs- und Zielprofilen vorhanden ist.

Der E-Rezept-Fachdienst MUSS beim Bereitstellen der Daten für den ePA Medication Service sicherstellen, dass alle Extensions aus den E-Rezept FHIR-Ressourcen in die ePA Medication Service FHIR-Ressource übernommen werden, es sei denn, eine Ausnahmeregelung ist in der Tab_eRPFD_019 festgelegt.
**Hinweis: Falls in GEM_ERP_PR_MedicationDispense eine Extension MedicationDispense.medication[x].extension:dataAbsentReason vorhanden ist, wird diese in die EPA MedicationDispense übernommen. Der E-Rezept-Fachdienst loggt die Verwendung dieser Extension in den Betriebsdaten.**

#### Lokalisierung

Der E-Rezept-Fachdienst benötigt für das Übermitteln von Informationen zu Verordnungsdaten und Dispensierinformationen die Information, bei welchen ePA-Aktensystem das Aktenkonto des Versicherten verwaltet wird. Siehe Kapitel 6.10.3 ePA-Aktensystem für KVNR ermitteln.

**Abbildung: **Nichtauffinden des Aktenkontos in allen ePA-Aktensystemen

Der E-Rezept-Fachdienst MUSS alle Übermittlungsaufträge für eine KVNR abbrechen, wenn bei dem Versuch, ein Aktenkonto für diese KVNR zu finden, die Information Services aller ePA-Aktensysteme eine Response mit dem Statuscode 404 zurückgeben.
#### Widerspruchsprüfung

Vor jedem Übermitteln prüft der E-Rezept-Fachdienst, ob der Versicherte in das Einstellen von Verordnungsdaten und Dispensierinformationen durch den E-Rezept-Fachdienst eingewilligt hat.

Der E-Rezept-Fachdienst MUSS vor jedem Übermitteln von Informationen zu Verordnungsdaten oder Dispensierinformationen an den ePA Medication Service den Endpunkt /information/api/v1/ehr/consentdecisions des Information Service aufrufen, prüfen, ob für die Funktion "erp-submission" der Wert "permit" vorliegt und die Übermittlung final abbrechen, wenn die Prüfung fehlschlägt.
#### Verschlüsseln

Der E-Rezept-Fachdienst muss den Inhalt jedes Operationsaufrufes am Medication Service gemäß [gemSpec_Krypt]#A_24628-* VAU-Protokoll: VAU-Client: Request erzeugen/verschlüsseln verschlüsseln.

#### Übermitteln

Der E-Rezept-Fachdienst MUSS zur Bereitstellung von Verordnungsdaten an den ePA Medication Service die Operation [base]/$provide-prescription-erp des Medication Service aufrufen.

Der E-Rezept-Fachdienst MUSS, um die Löschinformation für Verordnungsdaten an den ePA Medication Service zu übermitteln, die Operation [base]/$cancel-prescription-erp des Medication Service aufrufen.

Der E-Rezept-Fachdienst MUSS zur Bereitstellung von Dispensierinformationen an den ePA Medication Service die Operation [base]/$provide-dispensation-erp des Medication Service mit rxDispensation.status gemäß dem bereitgestellten Status aufrufen.

Der E-Rezept-Fachdienst MUSS, um die Löschinformation für Dispensierinformationen an den ePA Medication Service zu übermitteln, die Operation [base]/$cancel-dispensation-erp des Medication Service aufrufen.

Der E-Rezept-Fachdienst KANN für die Übermittlung von Verordnungsdaten und Dispensierinformationen an den ePA Medication Service mehrere Instanzen von MedicationRequest oder mehrere Instanzen von MedicationDispense einer KVNR in einem einzigen Operationsaufruf bündeln.
#### Entschlüsseln

Der E-Rezept-Fachdienst muss den Response eines Operationsaufrufes am Medication Service gemäß der [gemSpec_Krypt]#A_24633-* VAU-Protokoll: VAU-Client: Response entschlüsseln/auswerten entschlüsseln.

### Aktenumzug

Wenn ein Versicherter die Krankenkasse wechselt, dann wird sein Aktenkonto umgezogen. Für den Zeitraum des Umzuges ist das Aktenkonto für das Einstellen neuer Daten gesperrt. Der Information Service und der Medication Service antworten mit dem Http-Errorcode 409. Der E-Rezept-Fachdienst wiederholt die Übermittlung zu einem späteren Zeitpunkt.

Es wird unterschieden zwischen den Szenarien, dass ein Aktenkonto innerhalb eines ePA-Aktensystems oder zwischen zwei ePA-Aktensystemen umziehen kann.

**Abbildung: **Aktenkonto Umzug innerhalb eines ePA-Aktensystems

**Abbildung: **Aktenkonto Umzug zu einem anderen ePA-Aktensystem

Der E-Rezept-Fachdienst MUSS alle Übermittlungsaufträge für eine KVNR für 24 Stunden pausieren, wenn das Aktenkonto aufgrund eines Umzugs nicht erreichbar ist und der Medication Service oder der Information Service eine Response mit dem Statuscode 409 zurückgibt, und nach dieser Pause einen erneuten Übermittlungsversuch starten.
### Fehlerbehandlung

**Abbildung: **ePA-Aktensystem nicht verfügbar

Der E-Rezept-Fachdienst MUSS die Datenübermittlung an ein Aktenkonto für mindestens eine Minute unterbrechen, wenn ein Aufruf im Medication Service mit dem Statuscode 500 scheitert, anschließend den Endpunkt zum Auffinden des Aktenkonto für diese KVNR bei allen weiteren Information Services abrufen, die Anfrage am gefundenen Medication Service wiederholen und bei anhaltenden Problemen einen exponentiellen Backoff-Mechanismus anwenden, der die Wartezeit zwischen den Versuchen sukzessive verdoppelt, um die Systembelastung zu minimieren.

Der E-Rezept-Fachdienst MUSS bei einem Statuscode 400 in der Response des Medication Service, der auf operationelle Probleme wie Entschlüsselungsprobleme hindeutet, den Übermittlungsversuch abbrechen, einen neuen VAU-Kanal aufbauen und anschließend einen neuen Übermittlungsversuch starten.

Der E-Rezept-Fachdienst MUSS, wenn er eine verschlüsselte Antwort des Medication Service nicht entschlüsseln kann und Unklarheit über den Erfolg der Übermittlung besteht, den Übermittlungsversuch abbrechen, einen neuen VAU-Kanal aufbauen und einen neuen Übermittlungsversuch starten.

Der E-Rezept-Fachdienst MUSS den Übermittlungsversuch abbrechen, wenn kein VAU-Kanal zum Medication Service aufgebaut werden kann, weil dieser nicht verfügbar ist, und nach Wiederverfügbarkeit einen neuen Übermittlungsversuch starten.

