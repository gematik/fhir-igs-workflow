# Wegweiser und Lesepfade

## Zweck

Dieser IG ist der Einstiegspunkt in die eFlow-IG-Landschaft. Er erklaert, wie die Module zusammenhaengen, und zeigt, wo welche Details beschrieben sind.

## Zielgruppen

- Hersteller des eFlow Servers
- Hersteller von Primaersystemen (z. B. Apotheken-, Praxis- oder Abrechnungssysteme)
- Fach- und Technikverantwortliche innerhalb der gematik

## Struktur der Spezifikationen

Die eFlow-Spezifikation ist modular aufgebaut:

1. **eFlow Core**
   - Moduluebergreifende Regeln (Sicherheit, Audit, Basisoperationen)
2. **Fachmodule**
   - Jeweils ein konkreter Anwendungsfall (z. B. E-Rezept, DiGA, Patientenrechnung)
3. **eFlow Server (dieser IG)**
   - Gesamter Server als Aggregation aller Module

Der Server implementiert **immer alle Module vollstaendig**. Clients implementieren in der Regel **nur die fuer sie relevanten Module**.

## Uebersicht der Implementation Guides

| IG | Zweck | Zielgruppe |
| --- | --- | --- |
| [**eFlow Core**](https://gemspec.gematik.de/ig/fhir/eflow-core/latest) | Moduluebergreifende Regeln (Audit, Sicherheit, Basisoperationen) | Alle Implementierer |
| [**eFlow Rx**](https://gemspec.gematik.de/ig/fhir/eflow-rx/latest) | Workflow E-Rezept | PVS, AVS, FdV |
| [**eFlow DiGA**](https://gemspec.gematik.de/ig/fhir/eflow-diga/latest) | Workflow Digitale Gesundheitsanwendungen | PVS, KTR, FdV |
| [**eFlow PatRech**](https://gemspec.gematik.de/ig/fhir/eflow-patrech/latest) | Workflow Patientenrechnung | AVS, FdV |
| [**eFlow EU**](https://gemspec.gematik.de/ig/fhir/eflow-eu/latest) | EU-Uebertragung / Austausch | FdV, NCPeH |
| [**eFlow Transfer**](https://gemspec.gematik.de/ig/fhir/eflow-transfer/latest) | Uebertragungs- und Uebergabefunktionen | BfArM |

## Wie sind die IGs zu lesen?

### Fuer Server-Hersteller

1. **Zuerst dieser IG (eFlow Server)** lesen:
   - Gesamtumfang
   - unterstuetzte Ressourcen
   - Operationen
   - CapabilityStatement
2. Danach:
   - **eFlow Core** vollstaendig
   - alle Fachmodule vollstaendig

### Fuer Client-Hersteller (Beispiel: EU-Client)

1. Dieser IG: Abschnitt zur Modulzuordnung
2. **eFlow Core**
3. **eFlow EU**

Andere Module (z. B. Rx oder DiGA) sind fuer diesen Client nicht relevant.

## Operationen im Gesamtsystem

Einige Operationen sind **moduluebergreifend definiert** und werden von mehreren Modulen genutzt.

Beispiel:

| Operation | Definiert in | Modulspezifische Einschraenkungen |
| --- | --- | --- |
| `$activate` | eFlow Core | Rx, DiGA, T-Rezept |

Die genaue fachliche Auspraegung ist in den jeweiligen Modul-IGs beschrieben.

## CapabilityStatement

Der vollstaendige Funktionsumfang des Servers ist im folgenden CapabilityStatement beschrieben:

**Full Server CapabilityStatement:**
`/CapabilityStatement/eflow-server`

Dieses CapabilityStatement:
- aggregiert alle Module,
- stellt den **verbindlichen Vertragsumfang** fuer den Server dar,
- ist massgeblich fuer Herstellerkonformitaet.

## Abgrenzung zu fachlichen gematik-Spezifikationen

Dieser IG beschreibt:
- die **technische FHIR-Schnittstelle** des eFlow Servers,
- nicht jedoch gesetzliche Grundlagen oder fachliche Prozessbeschreibungen ausserhalb der IT-Schnittstelle.

Fachliche Vorgaben ergeben sich aus gemSpec-Dokumenten, fachlichen Richtlinien und gesetzlichen Grundlagen (z. B. SGB V).

## Navigationshilfe

| Was suche ich? | Wo finde ich es? |
| --- | --- |
| Authentifizierung, Audit, Fehlercodes | eFlow Core |
| Wie funktioniert E-Rezept? | eFlow Rx |
| Welche Endpunkte bietet der Server insgesamt? | eFlow Server (CapabilityStatement) |
| Welche Profile gelten fuer EU-Uebertragung? | eFlow EU |
| Wie funktioniert `$activate`? | Core + jeweiliges Modul |
