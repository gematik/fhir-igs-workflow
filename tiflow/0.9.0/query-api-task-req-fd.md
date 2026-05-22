# Server-Anforderungen: Task-Query - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **Server-Anforderungen: Task-Query**

## Server-Anforderungen: Task-Query

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Task-Endpunkt.

Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Task mittels der HTTP-Operationen PUT, HEAD und DELETE sowie POST ohne die Angabe einer gültigen FHIR-Operation unterbinden, damit keine unzulässigen Operationen auf den Rezeptdaten ausgeführt werden können.
Der Zugriff mittels POST und Angabe einer gültigen FHIR-Operation ist unter [Operations](./menu-schnittstellen-operation-api.md) beschrieben.

### GET /Task (Liste)

Der Zugriff mittels der HTTP-Operation GET steht ausschließlich für die Einsichtnahme in E-Rezepte durch den Versicherten bzw. einen Vertreter mit Wissen um den AccessCode bzw. einer abgebenden Institution mit Wissen um das Secret zur Verfügung. Die GET-Operation ohne Referenz einer FHIR-Operation führt zu keiner Statusänderung.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task sicherstellen, dass ausschließlich Versicherte und Leistungserbringer in der Rolle
* oid_versicherter
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task die dem Versicherten zugeordneten Task-Ressourcen anhand der KVNR des Versicherten aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in Task.for die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen E-Rezepte einsehen können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task durch einen Versicherten die gültige Ergebnisliste der Task-Ressourcen ohne die referenzierten, signierten E-Rezept-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine Übersicht aller Tasks erhält.

Der E-Rezept-Fachdienst MUSS einen Konfigurationsparameter RATELIMIT_MAX1d_ERROR_UC4_12 verwalten.
Der Defaultwert für RATELIMIT_MAX1d_ERROR_UC4_12 ist 100.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit dem URL-Parameter pnw="..." durch eine abgebende LEI die Telematik-ID des Aufrufers im ACCESS_TOKEN im HTTP-Requestheader "Authorization" feststellen und den Aufruf in einer Statistik zur Prüfung des Ratelimits erfassen, wenn der Aufruf mit einem Fehler 456 oder 458 abgebrochen wird. Der E-Rezept-Fachdienst MUSS die Statistik zur Prüfung des Ratelimits alle 24h zurück auf 0 setzen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit dem URL-Parameter pnw="..." durch eine abgebende LEI prüfen, ob mit dem Aufruf die Anzahl RATELIMIT_MAX1d_ERROR_UC4_12 überschritten ist und in diesem Fall den Aufruf mit dem Fehler 423 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI,den im Parameter pnw übermittelten Prüfungsnachweis extrahieren, die Version der Prüfziffer bestimmen, den Prüfungsnachweis prüfen und bei Fehlen oder fehlerhafter Prüfung mit dem Fehler 403 abbrechen, damit nur Clients die Operation aufrufen können, welche einen Anwesenheitsnachweis erfolgreich durchgeführt haben.
Die Version der Prüfziffer wird aus der Struktur der Prüfziffer abgeleitet.

In der Version 1 beginnt die Prüfziffer mit einem Großbuchstaben. Die Prüfung des Prüfungsnachweises für Prüfziffer Version 1 ist in Kapitel “HTTP-Operation GET - Prüfung VSDM Prüfungsnachweis (Version 1)” beschrieben.

In der Version 2 ist das erste Byte der Prüfziffer > 128. Die Prüfung des Prüfungsnachweises für Prüfziffer Version 2 ist in Kapitel “HTTP-Operation GET - Prüfung VSDM Prüfungsnachweis (Version 2)” beschrieben.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI prüfen, ob die in der Prüfziffer übermittelte KVNR identisch ist mit dem Wert im URL-Parameter kvnr="..." und bei Ungleichheit mit dem Fehler 456 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI prüfen, falls im Operationsaufruf der URL-Parameter hcv übermittelt wurde, den im URL-Parameter übermittelten Wert transformieren, miteinander vergleichen und bei Ungleichheit mit dem Fehler 458 abbrechen.
Die Kodierung und das Format den in der Prüfziffer übermittelten Wert für hcv ist in A_27278-* beschrieben. Das Clientsystem übermittelt hcvBase64URLSafe-kodiert.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit dem URL-Parameter pnw="..." durch eine abgebende LEI, falls im VSDM Prüfungsnachweis eine Prüfziffer enthalten ist, prüfen, dass die Differenz zwischen Zeitstempel aus der Prüfziffer des Prüfungsnachweises und dem aktuellen Zeitpunkt nicht größer als 30 Minuten (konfigurierbar) ist und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen. Im Fehlerfall ist die Meldung "Anwesenheitsnachweis konnte nicht erfolgreich durchgeführt werden (Zeitliche Gültigkeit des Anwesenheitsnachweis überschritten)." im OperationOutcome zu übermitteln.
Eine mögliche Änderung der Konfiguration für den Zeitraum der Gültigkeit des Prüfungsnachweises erfolgt ausschließlich nach Anpassung von A_23451-* im Rahmen des Änderungsmanagement für Spezifikationen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls im VSDM Prüfungsnachweis eine Prüfziffer enthalten ist, die Tasks nach
* Task.status= "ready"
* Task.for = KVNRfür die KVNR aus der Prüfziffer des Prüfungsnachweises
* Task.ExpiryDatenicht vor dem aktuellen Datum liegt
* und Task.extension:flowType = 160 oder 166
filtern und in einem Bundle der gefundenen Tasks (ohne den signierte Anhang QES) zurückgeben, damit eine Apotheke alle zu einem Versicherten gehörenden E-Rezepte mit dem Status "ready" abrufen kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls im VSDM Prüfungsnachweis keine Prüfziffer enthalten ist, prüfen, ob das Ergebnis im Prüfungsnachweis gleich 3 ist und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI prüfen, ob ein URL-Parameter kvnr="..." übermittelt wurde und bei fehlerhafter Prüfung mit dem Fehler 455 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI prüfen, falls enforce_hcv_check = TRUE, ob ein URL-Parameter hcv="..." übermittelt wurde und bei fehlerhafter Prüfung mit dem Fehler 457 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls das Ergebnis im VSDM Prüfungsnachweis gleich 3 ist und URL-Parameter kvnr="..." übermittelt wurde, die IKNR des neuesten E-Rezeptes (wenn vorhanden) zum Fachdienst VSDM mappen, damit der E-Rezept-Fachdienst feststellen kann, welcher Status AcceptPN3VSDMxx zu prüfen ist.
Die IKNR ist im Verordnungsdatensatz unter Coverage.payor.identifier.value zu finden.

Der E-Rezept-Fachdienst kann eine Mapping zwischen den IKNR und dem zugehörigen Fachdiensten VSDM erstellen und hierfür das im DNS hinterlegte Mapping zwischen IKNR und den Endpunkten der Fachdienste VSDM nutzen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls das Ergebnis im VSDM Prüfungsnachweis gleich 3 ist, URL-Parameter kvnr="..." übermittelt wurde und keine E-Rezeptes für den Versicherten im E-Rezept-Fachdienst gespeichert sind, eine leere Liste mit dem Status 202 zurückgeben.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls im VSDM Prüfungsnachweis keine Prüfziffer enthalten, das Ergebnis im Prüfungsnachweis gleich 3 und der passende Status AcceptPN3VSDMxx = false ist mit dem Fehler 454 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls der passende Status AcceptPN3VSDMxx = true, das Ergebnis im VSDM Prüfungsnachweis gleich 3 ist und URL-Parameter kvnr="..." übermittelt wurde, die Tasks nach 
* Task.status = "ready", 
* Task.for = KVNR aus dem URL-Parameter,
* Task.ExpiryDate nicht vor dem aktuellen Datum liegt
* und Task.extension:flowType = 160 oder 166
filtern und in einem Bundle der gefundenen Tasks (ohne den signierte Anhang QES) zurückgeben, damit eine Apotheke alle zu einem Versicherten gehörenden E-Rezepte mit dem Status "ready" abrufen kann. Der E-Rezept-Fachdienst MUSS für den Response den Returncode 202 verwenden.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI, den im HTTP-Header X-PoPP-Token übermittelten Token extrahieren, prüfen und bei Fehlen oder fehlerhafter Prüfung mit dem Fehler 403 abbrechen, damit die Autorisierung zum Zugriff auf die Daten nur erfolgt, wenn ein Anwesenheitsnachweis erfolgreich durchgeführt wurde.
Die Anforderungen zum Prüfen des PoPP-Token sind im Kapitel “HTTP-Operation GET - Prüfung PoPP-Token” beschrieben.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI prüfen, dass die Differenz zwischen Zeitstempel iat im Token und dem aktuellen Zeitpunkt nicht größer als 30 Minuten (konfigurierbar) ist und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen.
Eine mögliche Änderung der Konfiguration für den Zeitraum der Gültigkeit des PoPP-Token erfolgt ausschließlich nach Anpassung von A_23399-* im Rahmen des Änderungsmanagement für Spezifikationen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI mit der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
, die Tasks nach
* Task.status = "ready",
* Task.for = KVNR aus dem PoPP-Token (patientId),
* Task.ExpiryDate nicht vor dem aktuellen Datum liegt
* und Task.extension:flowType = 160 oder 166
filtern und in einem Bundle der gefundenen Tasks (ohne den signierte Anhang QES) zurückgeben, damit eine abgebende LEI alle zu einem Versicherten gehörenden einlösbaren E-Rezepte mit dem Status "offen" abrufen kann.
Diese Operation führt nicht zu einer Statusänderung bei den zurück gelieferten Task Ressourcen.

#### Prüfung VSDM Prüfungsnachweis

Der VSDM Prüfungsnachweis wird URL-codiert übertragen.

Das Informationsmodel des VSDM Prüfungsnachweises ist in [gemSysL_VSDM] beschrieben.

Die Struktur der VSDM Prüfziffer ist in A_23453-* (siehe Änderungseintrag C_11321) beschrieben.

* Nr: 1
  * Feld: 10-stelliger unveränderlicher Teil der KVNR
  * Format: alphanummerisch
  * Länge: 10
* Nr: 2
  * Feld: aktueller Unix Timestamp
  * Format: alphanummerisch
  * Länge: 10
* Nr: 3
  * Feld: Grund des UpdatesU – Update Flag Service (UFS) AnfrageV – Versichertenstammdaten (VSD) UpdateC – Kartenmanagement (CMS) Update
  * Format: alphanummerisch
  * Länge: 1
* Nr: 4
  * Feld: Kennung des Betreibers Fachdienste VSDM gemäß Liste der gematik
  * Format: alphanummerisch
  * Länge: 1
* Nr: 5
  * Feld: Version des Hash-Schlüssels
  * Format: alphanummerisch
  * Länge: 1
* Nr: 6
  * Feld: HMAC: ersten 24 Byte der Ausgabe der SHA-256 Hashfunktion mit dem betreiberspezifischen Schlüssel für die konkatinierten Felder 1-5
  * Format: binär
  * Länge: 24

**Tabelle: **Struktur VSDM Prüfziffer

Der E-Rezept-Fachdienst MUSS die Prüfung des VSDM Prüfungsnachweises wie folgt umsetzen:
1. die Prüfziffer aus dem Prüfungsnachweis extrahieren
1. Falls eine Prüfziffer im Prüfungsnachweis enthalten ist:
1. HMAC-Schlüssel auf Basis Kennung des Betreibers (Feld 4) und Version des Hash-Schlüssels (Feld 5) ermitteln
1. HMAC über Felder 1-5 der übermittelten Prüfziffer berechnen
1. Berechneten HMAC mit dem in der Prüfziffer übermittelten HMAC auf Gleichheit prüfen

Der Vergleich für die Ermittlung des HMAC-Schlüssel (2.a.) erfolgt case-sensitive.

Der E-Rezept-Fachdienst verwaltet HMAC-Schlüssel, welche durch die Betreiber der Fachdienste VSDM bereitgestellt werden. Ein HMAC-Schlüssel wird durch die Kennung des Betreibers des Fachdienstes VSDM und der Version des Schlüssels identifiziert.

Der E-Rezept-Fachdienst MUSS, falls im VSDM Prüfungsnachweis eine Prüfziffer enthalten ist, für den HMAC der Prüfziffer die führenden 23 Byte der Prüfziffer (Felder 1-5) mittels SHA-256 Hashfunktion berechnen und für den nachfolgenden Vergleich die ersten 24 Byte verwenden.

Der E-Rezept-Fachdienst MUSS im Fehlerfall die Meldung "Anwesenheitsnachweis konnte nicht erfolgreich durchgeführt werden (Fehler bei Prüfung der HMAC-Sicherung)." im OperationOutcome zu übermitteln.
Die Ausgabelänge der SHA-256 Hashfunktion ist 32 Byte lang. Für die Prüfziffer werden die ersten 24 Byte verwendet. Die restlichen Bytes werden verworfen.

#### Prüfung VSDM Prüfungsnachweis (Version 2)

Der VSDM Prüfungsnachweis wird URL-codiert übertragen.

Das Informationsmodel des VSDM Prüfungsnachweises ist in [gemSysL_VSDM] beschrieben.

Die Struktur der VSDM Prüfziffer Version 2 ist in [gemSpec_Krypt#A_27278-* VSDM-FD: Struktur einer Prüfziffer der Version 2] beschrieben.

Der E-Rezept-Fachdienst MUSS eine Prüfziffer Version 2 gemäß [gemSpec_Krypt#A_27279-*] entschlüsseln und prüfen.
Hinweis: Der Abgleich der erfolgreich entschlüsselten KVNR mit der vom Client gesendeten KVNR erfolgt in A_27287-*. Der Abgleich des erfolgreich entschlüsselten Hashwert hcv mit der vom Client übermittelten hcv erfolgt in A_27347-*.

#### HTTP-Operation GET - Prüfung PoPP-Token Wenn der E-Rezept-Fachdienst in einem Aufruf einen PoPP-Token empfängt muss geprüft werden, dass der Token vom PoPP-Service ausgestellt wurde. Hierzu wird die Signatur des PoPP-Tokens geprüft.

Der E-Rezept-Fachdienst setzt gemäß [gemSpec_PoPP_Service] in der Rolle PoPP-Verifier folgende Prüfschritte via TI-PKI um (siehe [gemSpec_PoPP_Service#5.1.2 PoPP-Token Prüfung], A_27015):

* Prüfschritt: Beziehen der URL für den PoPP-Service
  * Anforderung: A_27358
  * Beschreibung: Die URL des PoPP-Service wird per Konfiguration im E-Rezept-Fachdienst hinterlegt. Deshalb kann auf die Abfrage der URL des PoPP-Service beim Federation Master verzichtet werden.
* Prüfschritt: Beziehen der Schlüssel für die PoPP-Token Signaturprüfung
  * Anforderung: A_26449
  * Beschreibung: Der PoPP-Service veröffentlicht sein EntityStament nach OpenID-Connect Standard. Dort ist die URL hinterlegt, an dem das JWK-Set abgerufen werden kann.
* Prüfschritt: Prüfung Signatur des JWK-Set
  * Anforderung: A_26534
  * Beschreibung: Der E-Rezept-Fachdienst bezieht aus dem Entity Statement des PoPP-Service den öffentlichen Schlüssel zur Prüfung der Signatur des JWK-Set und prüft dieses anschließend.
* Prüfschritt: Prüfung Signaturzertifikat des JWK via TI-PKI
  * Anforderung: A_27016
  * Beschreibung: Der E-Rezept-Fachdienst prüft die Echtheit des Signaturzertifikats aller JWK's im JWKS via TUC-PKI 18. Dies ist die Grundlage für den Vertrauensanker zur Signaturprüfung von PoPP-Token.
* Prüfschritt: Durchführung der Signaturprüfung von PoPP-Token
  * Anforderung: A_26450
  * Beschreibung: Der E-Rezept-Fachdienst führt die Signaturprüfung der PoPP-Token mit validen Signaturzertifikaten durch.
* Prüfschritt: Inhaltliche Prüfung des PoPP Tokens
  * Anforderung: A_26452
  * Beschreibung: Der E-Rezept-Fachdienst validiert, ob der PoPP-Token inhaltlich valide ist.Prüfungen von Claims für den E-Rezept-Fachdienst sind im Kapitel "Ressource Task - HTTP-Operation GET - Prüfung PoPP-Token" beschrieben.

**Tabelle: **TAB_eRPFD_030 Prüfschritte PoPP-Token

Anstelle zur nicht zugewiesenen Anforderung  A_27358 - Beziehen der URL für den PoPP-Service

Der E-Rezept-Fachdienst MUSS einen Konfigurationsparameter PoPP_Service_Domain für die Domain des PoPP-Service verwalten.
Ergänzung der stündlichen Abfrage des JWKS zu A_26449 - Beziehen der Schlüssel für die PoPP-Token Signaturprüfung :

Der E-Rezept-Fachdienst MUSS stündlich die JWK-Set des PoPP-Service [RFC7517] über dem im Entity Statement metadata.oauth_resource.signed_jwks_uri angegeben URL abrufen und die öffentlichen Schlüssel zur Verifikation der PoPP-Token verwenden.
Der E-Rezept-Fachdienst prüft zur Umsetzung von A_27016-* das Signaturzertifikat des PoPP-Service wie folgt:

Der E-Rezept-Fachdienst MUSS das Signatur-Zertifikat des PoPP-Service für die Signatur des PoPP-Token gemäß [gemSpec_PKI#TUC_PKI_018] mit folgenden Parametern auf Gültigkeit prüfen:

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
Der TUC gibt neben dem Status der Zertifikatsprüfung auch die im Zertifikat enthaltene Rolle (Admission) zurück. Der E-Rezept-Fachdienst prüft zur Umsetzung von A_27016-* die Rolle. wie folgt:

Der E-Rezept-Fachdienst MUSS prüfen, dass die im Zertifikat enthaltene Rolle (Admission) gleich oid_popp-token ist und im Fehlerfall das Signaturzertifikat nicht zur Signaturprüfung der PoPP-Token verwenden.
Der E-Rezept-Fachdienst prüft zur Umsetzung von A_26452-* die Telematik-ID aus dem PoPP-Token wie folgt:

Der E-Rezept-Fachdienst MUSS bei der Prüfung des PoPP-Token prüfen, dass die Telematik-ID actor_id aus dem Token mit der Telematik-ID der Leistungserbringerinstitution (idNumber) im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests übereinstimmt und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen.
### GET /Task/ (Einzelne Verordnung)

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen konkreten über <id> adressierten /Task/<id> (ohne die Referenz einer FHIR-Operation) sicherstellen, dass ausschließlich Clientsysteme in einer der Rollen
* oid_versicherter
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
* oid_kostentraeger
die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/<id> durch einen Versicherten bei Ungleichheit der KVNR des Aufrufenden (KVNR des ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests UNGLEICH KVNR in Task.for ) prüfen, ob der im HTTP-Request-Header "X-AccessCode" oder URL-Parameter "?ac=..." übergebene AccessCode gleich dem AccessCode in Task.identifier ist, damit auch Vertreter in Kenntnis des AccessCodes ein einzelnes E-Rezept einsehen können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/<id> durch einen Versicherten die einzelne Task-Ressource um das referenzierte, serverseitig signierte E-Rezept-Bundle aus Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 als search.include im Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in den Task und den signierten Verordnungsdatensatz für eigene Dokumentationszwecke erhält.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /Task und GET /Task/<id> durch einen Versicherten oid_versicherter ein optional vorhandenes Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret aus dem zurückgegebenen Task entfernen, sodass Versicherte nicht in Kenntnis des Secrets gelangen, welches die Prozesshoheit des Apothekers darstellt.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/<id> ausschließlich solchen Clients die AccessCode Information (Task.identifier mit system="https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" ) in den Task-Ressourcen zurückgeben, welche anhand der mitgeteilten, gültigen Produktidentifikation als hierfür zulässige Clients erkannt werden.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende Institution die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden Institution mit der Telematik-ID aus dem ACCESS_TOKEN vergleichen und bei Ungleichheit die Operation mit dem HTTP-Fehlercode 412 abbrechen, damit der Zugriff auf diesen Datensatz nur durch Berechtigte erfolgt.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende Institution den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCode erfolgen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende Institution den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "in-progress" und ungleich "completed" ist, damit der Datensatz nur abgerufen werden, kann, wenn sich die Verordnung in Belieferung befindet oder der Workflow abgeschlossen ist.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende Institution den Task mit dem Geheimnis Task.identifier:Secret sowie im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurückgeben.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?secret=..." durch eine abgebende Institution den Task, sofern er den Status "completed" hat, um das referenzierte, serverseitig signierte Quittungs-Bundle aus Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 als search.include im Ergebnis-Bundle ergänzen und die Ergebnismenge Task + Quittungs-Bundle an den Abgebenden zurückgeben, damit ein Abgebender, der ein konkretes E-Rezept beliefert hat, bei Bedarf genau dieses belieferte E-Rezept inkl. der Quittung erneut abrufen kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /Task/<id> durch einen Versicherten mit der Rolle oid_versicherter, sofern die KVNR des Aufrufenden ungleich der KVNR in Task.for ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.vertreter" und den Versicherten mit der KVNR = Task.for initiieren.
### PATCH /Task

Der Zugriff mittels der HTTP-Operation PATCH steht ausschließlich dem Versicherten zur Verfügung. Die PATCH-Operation führt zu keiner Statusänderung des Tasks.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /Task ohne Angabe einer <id> für eine konkrete Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Markieren mehrerer Ressourcen über einen Request zu verhindern.

Der E-Rezept-Fachdienst MUSS bei Aufruf der HTTP-PATCH-Operation auf den Endpunkt /Task/<id> sicherstellen, dass ausschließlich Versicherte in der Rolle:
* oid_versicherter
, die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte markiert werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /Task/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in Task.for.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte als Berechtigter einen Task ändert.

