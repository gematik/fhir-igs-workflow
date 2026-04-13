# FD-Anforderungen: Task-Query - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Task**](query-api-task.md)
* **FD-Anforderungen: Task-Query**

## FD-Anforderungen: Task-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Task-Endpunkt.

Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Task mittels der HTTP-Operationen PUT, HEAD und DELETE sowie POST ohne die Angabe einer gültigen FHIR-Operation unterbinden, damit keine unzulässigen Operationen auf den Rezeptdaten ausgeführt werden können.
Der Zugriff mittels POST und Angabe einer gültigen FHIR-Operation ist unter [Operations](./menu-schnittstellen-operation-api.md) beschrieben.

#### GET /Task (Liste)

Der Zugriff mittels der HTTP-Operation GET für die Einsichtnahme in Verordnungen steht ausschließlich dem Versicherten bzw. einer abgebenden Institution mit Nachweis eines Behandlungskontextes zur Verfügung. Die GET-Operation ohne Referenz einer FHIR-Operation führt zu keiner Statusänderung.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task sicherstellen, dass ausschließlich Versicherte und Leistungserbringer in der Rolle
* oid_versicherter
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task die dem Versicherten zugeordneten Task-Ressourcen anhand der KVNR des Versicherten aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in Task.for die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen E-Rezepte einsehen können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task durch einen Versicherten die gültige Ergebnisliste der Task-Ressourcen ohne die referenzierten, signierten E-Rezept-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine Übersicht aller Tasks erhält.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI, den im HTTP-Header X-PoPP-Token übermittelten Token extrahieren, prüfen und bei Fehlen oder fehlerhafter Prüfung mit dem Fehler 403 abbrechen, damit die Autorisierung zum Zugriff auf die Daten nur erfolgt, wenn ein Anwesenheitsnachweis erfolgreich durchgeführt wurde.
Die Anforderungen zum Prüfen des PoPP-Token sind im Kapitel “HTTP-Operation GET - Prüfung PoPP-Token” beschrieben.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI prüfen, dass die Differenz zwischen Zeitstempel iat im Token und dem aktuellen Zeitpunkt nicht größer als 30 Minuten (konfigurierbar) ist und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen.
Eine mögliche Änderung der Konfiguration für den Zeitraum der Gültigkeit des PoPP-Token erfolgt ausschließlich nach Anpassung von A_23399-* im Rahmen des Änderungsmanagement für Spezifikationen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI mit der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
, die Tasks nach
* Task.status = "ready",
* Task.for = KVNR aus dem PoPP-Token (patientId),
* Task.ExpiryDate nicht vor dem aktuellen Datum liegt
* und Task.extension:flowType = 160 oder 166
filtern und in einem Bundle der gefundenen Tasks (ohne den signierte Anhang QES) zurückgeben, damit eine abgebende LEI alle zu einem Versicherten gehörenden einlösbaren E-Rezepte mit dem Status "offen" abrufen kann.
Diese Operation führt nicht zu einer Statusänderung bei den zurück gelieferten Task Ressourcen.

##### HTTP-Operation GET - Prüfung PoPP-TokenWenn der TI-Flow-Fachdienst in einem Aufruf einen PoPP-Token empfängt muss geprüft werden, dass der Token vom PoPP-Service ausgestellt wurde. Hierzu wird die Signatur des PoPP-Tokens geprüft.

Der TI-Flow-Fachdienst setzt gemäß [gemSpec_PoPP_Service] in der Rolle PoPP-Verifier folgende Prüfschritte via TI-PKI um (siehe [gemSpec_PoPP_Service#5.1.2 PoPP-Token Prüfung], A_27015):

* Prüfschritt: Beziehen der URL für den PoPP-Service
  * Anforderung: A_27358
  * Beschreibung: Die URL des PoPP-Service wird per Konfiguration im TI-Flow-Fachdienst hinterlegt. Deshalb kann auf die Abfrage der URL des PoPP-Service beim Federation Master verzichtet werden.
* Prüfschritt: Beziehen der Schlüssel für die PoPP-Token Signaturprüfung
  * Anforderung: A_26449
  * Beschreibung: Der PoPP-Service veröffentlicht sein EntityStament nach OpenID-Connect Standard. Dort ist die URL hinterlegt, an dem das JWK-Set abgerufen werden kann.
* Prüfschritt: Prüfung Signatur des JWK-Set
  * Anforderung: A_26534
  * Beschreibung: Der TI-Flow-Fachdienst bezieht aus dem Entity Statement des PoPP-Service den öffentlichen Schlüssel zur Prüfung der Signatur des JWK-Set und prüft dieses anschließend.
* Prüfschritt: Prüfung Signaturzertifikat des JWK via TI-PKI
  * Anforderung: A_27016
  * Beschreibung: Der TI-Flow-Fachdienst prüft die Echtheit des Signaturzertifikats aller JWK's im JWKS via TUC-PKI 18. Dies ist die Grundlage für den Vertrauensanker zur Signaturprüfung von PoPP-Token.
* Prüfschritt: Durchführung der Signaturprüfung von PoPP-Token
  * Anforderung: A_26450
  * Beschreibung: Der TI-Flow-Fachdienst führt die Signaturprüfung der PoPP-Token mit validen Signaturzertifikaten durch.
* Prüfschritt: Inhaltliche Prüfung des PoPP Tokens
  * Anforderung: A_26452
  * Beschreibung: Der TI-Flow-Fachdienst validiert, ob der PoPP-Token inhaltlich valide ist.Prüfungen von Claims für den TI-Flow-Fachdienst sind im Kapitel "Ressource Task - HTTP-Operation GET - Prüfung PoPP-Token" beschrieben.

**Tabelle: **TAB_eRPFD_030 Prüfschritte PoPP-Token

Anstelle zur nicht zugewiesenen Anforderung  A_27358 - Beziehen der URL für den PoPP-Service

Der TI-Flow-Fachdienst MUSS einen Konfigurationsparameter PoPP_Service_Domain für die Domain des PoPP-Service verwalten.
Ergänzung der stündlichen Abfrage des JWKS zu A_26449 - Beziehen der Schlüssel für die PoPP-Token Signaturprüfung :

Der TI-Flow-Fachdienst MUSS stündlich die JWK-Set des PoPP-Service [RFC7517] über dem im Entity Statement metadata.oauth_resource.signed_jwks_uri angegeben URL abrufen und die öffentlichen Schlüssel zur Verifikation der PoPP-Token verwenden.
Der TI-Flow-Fachdienst prüft zur Umsetzung von A_27016-* das Signaturzertifikat des PoPP-Service wie folgt:

Der TI-Flow-Fachdienst MUSS das Signatur-Zertifikat des PoPP-Service für die Signatur des PoPP-Token gemäß [gemSpec_PKI#TUC_PKI_018] mit folgenden Parametern auf Gültigkeit prüfen:

* Parameter: Zertifikat
  * : Signaturzertifikat des PoPP-Service
* Parameter: PolicyList
  * : oid_zd_sig
* Parameter: intendedKeyUsage
  * : nonRepudiation
* Parameter: intendedExtendedKeyUsage
  * : (leer)
* Parameter: OCSP-Graceperiod
  * : 60 Minuten
* Parameter: Offline-Modus
  * : nein
* Parameter: Prüfmodus
  * : OCSP

**Tabelle: **TAB_eRPFD_031 Parameter Prüfung Signaturzertifikat PoPP-Service
Das Signaturzertifikat muss gemäß dem TUC als befunden werden und im Fehlerfall das Signaturzertifikat nicht zur Signaturprüfung der PoPP-Token verwenden, damit sichergestellt wird dass, ausschließlich PoPP-Token von einem vertrauenswürdigen PoPP-Service akzeptiert werden.
Der TUC gibt neben dem Status der Zertifikatsprüfung auch die im Zertifikat enthaltene Rolle (Admission) zurück. Der TI-Flow-Fachdienst prüft zur Umsetzung von A_27016-* die Rolle. wie folgt:

Der TI-Flow-Fachdienst MUSS prüfen, dass die im Zertifikat enthaltene Rolle (Admission) gleich oid_popp-token ist und im Fehlerfall das Signaturzertifikat nicht zur Signaturprüfung der PoPP-Token verwenden.
Der TI-Flow-Fachdienst prüft zur Umsetzung von A_26452-* die Telematik-ID aus dem PoPP-Token wie folgt:

Der TI-Flow-Fachdienst MUSS bei der Prüfung des PoPP-Token prüfen, dass die Telematik-ID actor_id aus dem Token mit der Telematik-ID der Leistungserbringerinstitution (idNumber) im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests übereinstimmt und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen.
#### GET /Task/ (Einzelne Verordnung)

Der Zugriff mittels der HTTP-Operation GET für die Einsichtnahme in eine spezifische Verordnung steht ausschließlich dem Versicherten bzw. einer abgebenden Institution mit Wissen um das Secret zur Verfügung. Die GET-Operation ohne Referenz einer FHIR-Operation führt zu keiner Statusänderung.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen konkreten über <id> adressierten /Task/<id> (ohne die Referenz einer FHIR-Operation) sicherstellen, dass ausschließlich Clientsysteme in einer der Rollen
* oid_versicherter
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
* oid_kostentraeger
die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/<id> durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in Task.for.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte den Task abrufen kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/<id> durch einen Versicherten die einzelne Task-Ressource um das referenzierte, serverseitig signierte E-Rezept-Bundle aus Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 als search.include im Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in den Task und den signierten Verordnungsdatensatz für eigene Dokumentationszwecke erhält.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /Task und GET /Task/<id> durch einen Versicherten oid_versicherter ein optional vorhandenes Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret aus dem zurückgegebenen Task entfernen, sodass Versicherte nicht in Kenntnis des Secrets gelangen, welches die Prozesshoheit der abgebenden Institution darstellt.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/<id> ausschließlich solchen Clients die AccessCode Information (Task.identifier mit system="https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" ) in den Task-Ressourcen zurückgeben, welche anhand der mitgeteilten, gültigen Produktidentifikation als hierfür zulässige Clients erkannt werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende Institution die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden Institution mit der Telematik-ID aus dem ACCESS_TOKEN vergleichen und bei Ungleichheit die Operation mit dem HTTP-Fehlercode 412 abbrechen, damit der Zugriff auf diesen Datensatz nur durch Berechtigte erfolgt.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende Institution den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCode erfolgen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende Institution den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "in-progress" und ungleich "completed" ist, damit der Datensatz nur abgerufen werden, kann, wenn sich die Verordnung in Belieferung befindet oder der Workflow abgeschlossen ist.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende Institution den Task mit dem Geheimnis Task.identifier:Secret sowie im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurückgeben.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?secret=..." durch eine abgebende Institution den Task, sofern er den Status "completed" hat, um das referenzierte, serverseitig signierte Quittungs-Bundle aus Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 als search.include im Ergebnis-Bundle ergänzen und die Ergebnismenge Task + Quittungs-Bundle an den Abgebenden zurückgeben, damit ein Abgebender, der ein konkretes E-Rezept beliefert hat, bei Bedarf genau dieses belieferte E-Rezept inkl. der Quittung erneut abrufen kann.
#### PATCH /Task

Der Zugriff mittels der HTTP-Operation PATCH steht ausschließlich dem Versicherten zur Verfügung. Die PATCH-Operation führt zu keiner Statusänderung des Tasks.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /Task ohne Angabe einer <id> für eine konkrete Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Markieren mehrerer Ressourcen über einen Request zu verhindern.

Der TI-Flow-Fachdienst MUSS bei Aufruf der HTTP-PATCH-Operation auf den Endpunkt /Task/<id> sicherstellen, dass ausschließlich Versicherte in der Rolle:
* oid_versicherter
die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte markiert werden können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /Task/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in Task.for.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte als Berechtigter einen Task ändert.
### Modulspezifische Anforderungen

