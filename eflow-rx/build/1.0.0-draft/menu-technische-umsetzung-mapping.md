# Vorgaben zum Mapping von FHIR-Instanzen - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Vorgaben zum Mapping von FHIR-Instanzen**

## Vorgaben zum Mapping von FHIR-Instanzen

Aufgabe des E-Rezept-Fachdienst ist es Verordnungs- und Dispensierungsdaten von Arzneimitteln an die ePA zu übermitteln.

Der E-Rezept-Fachdienst muss daher in der Lage sein, die von den verordnenden Systemen (z.B. Praxis- oder Krankenhausinformationssysteme) gelieferten Daten in die von der ePA geforderten Formate zu überführen und an den ePA Medication Service zu übertragen.

**Abbildung: **Mapping des E-Rezept-Fachdienstes


Dabei führt der E-Rezept-Fachdienst keine Interpretation oder Anreicherung von medizinischen Daten durch und führt daher rein technische Mappings aus. Die Mappings werden einer Anwendung der gematik definiert und in diesem Projekt als StructureMaps angegeben und mit Transformationsregeln ergänzt.

## Regeln für das Mapping von FHIR-Instanzen

FHIR bietet die Möglichkeit Angaben zu Mappings zwischen verschiedenen Ressourcenstrukturen mittels [StructureMap](https://www.hl7.org/fhir/structuremap.html) zu definieren. Dieses Projekt nutzt StructureMaps, um die Mappings der Verordnungs- und Dispensierdaten zu beschreiben und damit Tabellen zu erstellen, die angeben, wie die einzelnen Elemente der Quellstruktur in die Zielstruktur überführt werden.

Zusätzlich zu den StructureMaps, die Regeln zum Mapping definieren, gibt es Transformationsregeln, die zusätzliche programmatische Vorgaben zum Mapping treffen. Auf den Detailseiten zu Verordnungs- bzw. Dispensierdaten ist unten jeweils eine Übersicht der verwendeten Transformationsregeln zu finden, die alle Profile der jeweiligen Übertragung betreffen. Auf den Seiten der einzelnen Ressourcen sind die gleichen Transformationsregeln zusätzlich im Kontext der jeweiligen Ressource aufgeführt.

## Übertragen von Verordnungsdaten an den ePA Medication Service

Der E-Rezept-Fachdienst empfängt die Verordnungsdaten durch Aufruf der [$activate-Operation](./op-activate.md) durch ein verordnendes System. Die empfangenen Daten entsprechen den Profilen und Vorgaben des E-Rezepts.

Die Verordnungsdaten werden vom E-Rezept-Fachdienst an den ePA Medication Service via ([ePA Operation API: Verordnung einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/1.3.0/op-provide-prescription-erp.html)).

Für technische Details zum Mapping von Verordnungsdaten und den dazugehörigen Transformationsregeln siehe: [Mapping von Verordnungsdaten](./mapping-prescription.md).

## Übertragen von Dispensierinformationen an den ePA Medication Service

Der E-Rezept-Fachdienst empfängt die Dispensierinformationen durch Abschluss eines Workflows mittels der [$dispense-Operation](./op-dispense.md) und/oder [$close-Operation](./op-close.md) durch ein abgebendes System. Die empfangenen Daten entsprechen den Profilen und Vorgaben der Dispensierinformationen. Die Übertragung der Dispensierinformationen an den ePA Medication Service via ([ePA Operation API: Dispensierinformationen einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/1.3.0/op-provide-dispensation-erp.html)) erfolgt erst nach Abschluss des Workflows indem die $close-Operation aufgerufen wird.

Für technische Details zum Mapping von Dispensierinformationen und den dazugehörigen Transformationsregeln siehe: [Mapping von Dispensierinformationen](./mapping-dispensation.md).

## Beispiele

Die folgenden Seiten beschreiben beispielhaft das Mapping von verschiedenen KBV_PR_ERP_Bundle Instanzen in die EPAOpProvidePrescriptionERPInputParameters Struktur:

* [Beispiel des Mappings einer PZN Verordnung](./comparison-Bundle-input-example-1.md)
* [Beispiel des Mappings einer Wirkstoffverordnung](./comparison-Bundle-input-example-2.md)
* [Beispiel des Mappings einer Freitextverordnung](./comparison-Bundle-input-example-3.md)
* [Beispiel des Mappings einer Rezepturverordnung](./comparison-Bundle-input-example-5.md)
* [Beispiel des Mappings mit absoluter Referenzierung](./comparison-Bundle-input-example-4.md)

