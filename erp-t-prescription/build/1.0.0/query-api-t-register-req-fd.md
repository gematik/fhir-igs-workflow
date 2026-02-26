# Server-Anforderungen zur Übertragung an die T-Register Schnittstelle - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Query API**](menu-schnittstellen-query-api.md)
* **Server-Anforderungen zur Übertragung an die T-Register Schnittstelle**

## Server-Anforderungen zur Übertragung an die T-Register Schnittstelle

Zur Übertragung von Daten vom E-Rezept-Fachdienst an die T-Register Schnittstellen des BfArM Webdienst gelten die folgenden Anforderungen:

### Authentifizierung für die Dienste des BfArM

Der E-Rezept-Fachdienst nutzt den OAuth 2.0 Client Credentials Flow nach [OAuth 2.0 RFC 6749, section 4.4](https://tools.ietf.org/html/rfc6749#section-4.4) zur Authentifizierung an den Diensten des BfArM.

Über einen organisatorischen Prozess müssen Client Credentials beim BfArM angefragt werden, welche zur Authentifizierung des E-Rezept-Fachdienst ggü. dem BfArM Webdienst genutzt werden.

Der Anbieter des E-Rezept-Fachdienst MUSS sich über einen organisatorischen Prozess Client Credentials für den Zugriff auf den BfArM Webdienst beim BfArM registrieren.
Die technische Authentifizierung erfolgt dann über den `/token` Endpunkt, der durch Angabe der Client Credentials dann einen AccessToken ausstellt. Mit diesem AccessToken ist der E-Rezept-Fachdienst berechtigt Daten am BfArM Webdienst einzustellen.

**Abbildung: **Authentifizierung BfArM Webdienst

Der E-Rezept-Fachdienst MUSS vor dem Zugriff auf den BfArM Webdienst prüfen, ob der zuletzt bezogene AccessToken noch gültig ist und im Falle der Ungültigkeit einen neuen AccessToken über den /ords/rezepte/oauth/token Endpunkt am BfArM Webdienst beziehen.

Der E-Rezept-Fachdienst MUSS zum Beziehen eines AccessTokens den Endpunkt /ords/rezepte/oauth/token am BfArM Webdienst mit folgenden Parametern aufrufen: HTTP-Methode POST HTTP-Header Content-Type: application/x-www-form-urlencoded Authorization: Basic <base64(client_id:client_secret)> HTTP-Body Form-Parameter: grant_type=client_credential um einen AccessToken für den Zugriff auf den BfArM Webdienst zu beziehen.

Der E-Rezept-Fachdienst MUSS für den Zugriff auf den BfArM Webdienst einen AccessToken für die Authentifizierung im HTTP-Header wie folgt angeben: Authorization: Bearer <AccessToken vom Token Endpunkt>, um auf die Endpunkte des BfArM Webdienstes zugreifen zu können.
### Lokalisierung

Der E-Rezept-Fachdienst MUSS einen Konfigurationsparameter BfArM_Domain für die Domain des BfArM Webdienstes verwalten.
Der Defaultwert für den Parameter ist `https://webapps-public.bfarm.de`.

Der E-Rezept-Fachdienst MUSS zur Lokalisierung des BfArM Webdienstes die im DNS für BfArM_Domain eingestellten Informationen aufrufen.
### Bereitstellung digitaler Durchschlag

Nach Abschluss eines Workflows 166 durch Aufrufen der $close Operation erstellt der E-Rezept-Fachdienst den digitalen Durchschlag für den Vorgang des E-T-Rezeptes. Die fachlichen Informationen hierzu sind im Dokument [gemF_eRp_T-Rezept] dokumentiert.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass ausschließlich Daten zu Tasks mit dem Flowtype 166 für den Webdienst des BfArM bereitgestellt werden.

Der E-Rezept-Fachdienst MUSS das Übermitteln der Daten an den BfArM Webdienst asynchron zur Bereitstellung der Daten durch die Clientsysteme umsetzen, damit für das bereitstellende Primärsystem der abgebenden Leistungserbringerinstitution keine verlängerte Verarbeitungsdauer der auslösenden Operation auftritt.
Der digitale Durchschlag zum T-Rezept ist ein Artefakt, welches Informationen zum Vorgang eines E-T-Rezeptes bündelt und gesammelt an das BfArM übermittelt.

Als Datengrundlage für diesen Durchschlag dient der Verordnungsdatensatz samt QES, der Dispensierdatensatz, der Task der Verordnung und Daten der Apotheke aus dem FHIR-VZD. Als Kriterium für die Suche nach Apothekendaten im FHIR-VZD wird die Telematik-ID der Apotheke genutzt.

Der E-Rezept-Fachdienst MUSS für das Bereitstellen eines digitalen Durchschlags für ein E-T-Rezept die Daten der abgebenden Apotheke aus dem Verzeichnisdienst ermitteln, indem an den Verzeichnisdienst folgende Abfrage gestellt wird: Abfrage der Ressource "HealthcareService", HealthcareServices, deren Organisation aktiv sind, HealthcareServices, deren origin tag = ldap ist, HealthcareServices, deren Organisation als Identifier die Telematik-ID trägt, die im Dispensierdatensatz angegeben wurde, Einbeziehen der Organisation in das Rückgabeergebnis, Einbeziehen der Location in das Rückgabeergebnis
**Beispiel Aufruf**

```
<fhir-vzd-url>
/HealthcareService
?organization.active=true
&_tag=ldap
&organization.identifier=https://gematik.de/fhir/sid/telematik-id7C%<telematik-id>
&_include=HealthcareService:organization
&_include=HealthcareService:location

```

Als Antwort erhält der E-Rezept-Fachdienst mit dieser Anfrage genau drei Ressourcen: Organization, HealthcareService und Location, welche die benötigten Daten zur Apotheke für den digitalen Durchschlag enthalten. Alle Daten sind optional im FHIR-VZD eingetragen, d.h. wenn die Daten nicht vorhanden sind, müssen diese nicht im digitalen Durchschlag enthalten sein.

Anschließend erstellt der E-Rezept-Fachdienst den digitalen Durchschlag für den BfArM Webdienst. Dieser basiert auf einem definierten FHIR-Profil.

Für den Austausch der Daten zwischen E-Rezept-Fachdienst und dem BfArM Webdienst existiert ein FHIR Implementation Guide (IG), der Beschreibungen, OpenAPI Definition, Profile und Mappings enthält.

Der E-Rezept-Fachdienst MUSS beim Bereitstellen eines digitalen Durchschlag für ein T-Rezept an den BfArM Webdienst die folgenden Daten aus dem Vorgang zum E-T-Rezept nach Profil ERP_TPrescription_CarbonCopy erzeugen.

Der E-Rezept-Fachdienst MUSS den Anwendungsfall "Übertragen des digitalen Durchschlags" gemäß Tabelle TAB_eRPFD_029 ausführen.

* Name: Auslöser
  * Übertragen des digitalen Durchschlags: Abschluss eines E-Rezept Workflows mit Flowtype 166 via Aufruf der $close-Operation
* Name: Akteur
  * Übertragen des digitalen Durchschlags: E-Rezept-Fachdienst
* Name: Vorbedingung
  * Übertragen des digitalen Durchschlags: * Dem E-Rezept-Fachdienst liegen Client Credentials des BfArM zur Authentifizierung vor
* Verordnungsdaten, Dispensierinformationen und Informationen aus dem FHIR-VZD liegen vor
* Ein gültiger AccessToken für den Zugriff auf den BfArM Webdienst liegt vor

* Name: Nachbedingung
  * Übertragen des digitalen Durchschlags: Am BfArM Webdienst wurde der digitale Durchschlag E-T-Rezept erfolgreich übertragen.
* Name: Standardablauf
  * Übertragen des digitalen Durchschlags: 1. Prüfen, ob ein gültiger AccessToken vorliegt.
1. Falls nicht: Client Credentials an den Token-Endpunkt übertragen.
1. AccessToken speichern.
1. Erzeugen des digitalen Durchschlags E-T-Rezept.
1. Auftrag zur Übertragung des digitalen Durchschlags E-T-Rezept in einer Warteschlange einstellen.
1. Aufruf des Endpunktes`/ords/rezepte/t-rezept/v1`.
1. Nach erfolgreicher Übertragung: Löschen des Auftrags aus der Warteschlange.


**Tabelle: **title

Der E-Rezept-Fachdienst MUSS für das Übertragen eines digitalen Durchschlags den BfArM Webdienst RESTful wie folgt aufrufen:

* HTTP-Parameter: Methode
  * Wert: POST
* HTTP-Parameter: Endpunkt
  * Wert: /ords/rezepte/t-rezept/v1
* HTTP-Parameter: Header
  * Wert: * Authorization: Bearer <AccessToken>
* Content-Type: application/fhir+json
* X-Request-ID: <random-uuid>

* HTTP-Parameter: Body
  * Wert: <digitaler Durchschlag E-T-Rezept>

### Fehlerbehandlung

Bei der Suche nach Apothekendaten basierend auf der Telematik-lD besteht die Möglichkeit, dass im FHIR-VZD kein Eintrag gefunden wird Falls zu der zu übermittelnden Apotheke (Identifikation durch die Telematik-lD) kein entsprechender Eintrag im FHIR-VZD gefunden werden kann, setzt der E-Rezept-Fachdienst folgendes um:

1. Die betroffene Telematik-ID wird unverändert in den digitalen Durchschlag aus den Dispensierinformationen übernommen.
1. Der Wert für organizationName wird aus dem ACCESS_TOKEN der Anfrage als Name der Apotheke im digitalen Durchschlag gesetzt. Sollte der organizationName aus ACCESS_TOKEN nicht gesetzt sein (NULL), dann wird “unbekannt” als Name der Apotheke im digitalen Durchschlag gesetzt.
1. Der Datensatz wird an den BfArM-Webdienst übertragen.
1. Sollte der übermittelte Datensatz durch das BfArM untersucht werden müssen, erfolgt eine bilaterale Abstimmung zwischen gematik und BfArM zur Klärung des Sachverhalts.

Dieses Vorgehen stellt sicher, dass die Übertragung an das T-Register nicht aufgrund eines fehlenden FHIR-VZD-Eintrags blockiert wird und gleichzeitig die Nachvollziehbarkeit über die Telematik-ID gewährleistet bleibt.

Der E-Rezept-Fachdienst MUSS die Datenübermittlung an den BfArM Webdienst für mindestens eine Minute unterbrechen, wenn ein Aufruf mit dem Statuscode 500 oder 429 scheitert. Bei anhaltenden Problemen MUSS der E-Rezept-Fachdienst einen exponentiellen Backoff-Mechanismus anwenden, der die Wartezeit zwischen den Versuchen sukzessive verdoppelt, um die Systembelastung zu minimieren.

Der E-Rezept-Fachdienst MUSS den Aufruf am BfArM Webdienst als fehlerhaft kennzeichnen und eine detaillierte Fehlermeldung für interne Analysezwecke protokollieren, wenn der BfArM Webdienst auf einen Operationsaufruf mit einem Statuscode 400 (Bad Request) oder 422 (Unprocessable Entity) reagiert.

