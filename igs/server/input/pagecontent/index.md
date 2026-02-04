# eFlow Server – Übersicht und Einstieg

Dieses Implementation Guide (IG) beschreibt den **eFlow Server** als Gesamtsystem und dient als **Einstiegspunkt** für alle beteiligten Spezifikationen.  
Der eFlow Server wird vollständig durch einen Hersteller implementiert, stellt jedoch mehrere fachliche Module bereit, die von unterschiedlichen Client-Gruppen genutzt werden.

Dieser IG:
- beschreibt die **Gesamtkonformität des Servers** (CapabilityStatement),
- ordnet die einzelnen fachlichen Module ein,
- definiert, **wie die weiteren IGs zu lesen und zu kombinieren sind**.


## Zielgruppe

Dieses Dokument richtet sich an:
- Hersteller des eFlow Servers,
- Hersteller von Primärsystemen (z. B. Apotheken-, Praxis- oder Abrechnungssysteme),
- Fach- und Technikverantwortliche innerhalb der gematik.


## Struktur der Spezifikationen

Die eFlow-Spezifikation ist modular aufgebaut:

1. **eFlow Core**  
   → fachlich modulübergreifende Regeln (z. B. Sicherheit, Audit, Basisoperationen)

2. **Fachmodule**  
   → jeweils für einen konkreten Anwendungsfall (z. B. E-Rezept, DiGA, Patientenrechnung)

3. **eFlow Server (dieser IG)**  
   → beschreibt den **vollständigen Server** als Aggregation aller Module

Der Server implementiert **immer alle Module vollständig**,  
Clients implementieren in der Regel **nur die für sie relevanten Module**.


## Übersicht der Implementation Guides

| IG | Zweck | Zielgruppe |
| --- | --- | --- |
| [**eFlow Core**](https://gemspec.gematik.de/ig/fhir/eflow-core/latest) | Modulübergreifende Regeln (Audit, Sicherheit, Basisoperationen) | Alle Implementierer |
| [**eFlow Rx**](https://gemspec.gematik.de/ig/fhir/eflow-rx/latest) | Workflow E-Rezept | PVS, AVS, FdV |
| [**eFlow DiGA**](https://gemspec.gematik.de/ig/fhir/eflow-diga/latest) | Workflow Digitale Gesundheitsanwendungen | PVS, KTR, FdV |
| [**eFlow PatRech**](https://gemspec.gematik.de/ig/fhir/eflow-patrech/latest) | Workflow Patientenrechnung | AVS, FdV |
| [**eFlow EU**](https://gemspec.gematik.de/ig/fhir/eflow-eu/latest) | EU-Übertragung / Austausch | FdV, NCPeH |
| [**eFlow Transfer**](https://gemspec.gematik.de/ig/fhir/eflow-transfer/latest) | Übertragungs- und Übergabefunktionen | BfArM |


## Wie sind die IGs zu lesen?

### Für Server-Hersteller

1. **Zuerst dieser IG (eFlow Server)** lesen:
   - Gesamtumfang
   - unterstützte Ressourcen
   - Operationen
   - CapabilityStatement

2. Danach:
   - **eFlow Core** vollständig
   - alle Fachmodule vollständig


### Für Client-Hersteller (Beispiel: EU-Client)

1. Dieser IG:
   - Abschnitt „Modulzuordnung“
2. **eFlow Core**
3. **eFlow EU**

Andere Module (z. B. Rx oder DiGA) sind für diesen Client nicht relevant.

## Operationen im Gesamtsystem

Einige Operationen sind **modulübergreifend definiert** und werden von mehreren Modulen genutzt.

Beispiel:

| Operation | Definiert in | Modulspezifische Einschränkungen |
-----|
| `$activate` | eFlow Core | Rx, DiGA, T-Rezept |

Die genaue fachliche Ausprägung ist in den jeweiligen Modul-IGs beschrieben.


## CapabilityStatement

Der vollständige Funktionsumfang des Servers ist im folgenden CapabilityStatement beschrieben:

➡️ **Full Server CapabilityStatement:**  
`/CapabilityStatement/eflow-server`

Dieses CapabilityStatement:
- aggregiert alle Module,
- stellt den **verbindlichen Vertragsumfang** für den Server dar,
- ist maßgeblich für Herstellerkonformität.


## Abgrenzung zu fachlichen gematik-Spezifikationen

Dieser IG beschreibt:
- die **technische FHIR-Schnittstelle** des eFlow Servers,
- nicht jedoch:
  - gesetzliche Grundlagen,
  - fachliche Prozessbeschreibungen außerhalb der IT-Schnittstelle.

Fachliche Vorgaben ergeben sich aus:
- gemSpec-Dokumenten,
- fachlichen Richtlinien,
- gesetzlichen Grundlagen (z. B. SGB V).


## Navigationshilfe

| Was suche ich? | Wo finde ich es? |
-|
| Authentifizierung, Audit, Fehlercodes | eFlow Core |
| Wie funktioniert E-Rezept? | eFlow Rx |
| Welche Endpunkte bietet der Server insgesamt? | eFlow Server (CapabilityStatement) |
| Welche Profile gelten für EU-Übertragung? | eFlow EU |
| Wie funktioniert `$activate`? | Core + jeweiliges Modul |


## Zusammenfassung

Dieser IG definiert:
- den **Gesamtrahmen des eFlow Servers**,
- die **Beziehung zwischen den Modulen**,
- den **verbindlichen technischen Vertrag** für Hersteller.

Die fachliche Detailbeschreibung erfolgt in den jeweiligen Modul-IGs.