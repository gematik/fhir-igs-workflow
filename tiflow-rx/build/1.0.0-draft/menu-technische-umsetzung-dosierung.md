# Validierung von Dosierungsinformationen - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* **Validierung von Dosierungsinformationen**

## Validierung von Dosierungsinformationen

Der [Medication IG DE] der HL7 DE definiert als ersten Anwendungsfall für die deutschlandweite Nutzung von Profilen für den Arzneimittelbereich die Angabe strukturierter Dosierinformationen.

In diesem IG wurden Festlegungen getroffen wie diese Dosierungen anzugeben und im dgMP-Kontext zu validieren sind. Neben der FHIR-Struktur, die durch die Profildefinitionen vorgegeben ist, muss der E-Rezept-Fachdienst auch außerhalb der FHIR-Validierung die textuelle Repräsentation der Dosierung prüfen.

Client Systeme, die Dosierinformationen an den E-Rezept-Fachdienst übertragen, können diese strukturiert oder als Freitext angeben. Für diese Fälle muss in einer dafür vorgesehenen Extension eine textuelle Repräsentation der Dosierung generiert werden, die dann vom E-Rezept-Fachdienst nach den Vorgaben des Algorithmus, der im [dgMP-DosageTextgenerierung-Skript] definiert ist, geprüft wird.

### Umsetzung für Clients

Client Systeme, die strukturierte Dosierinformationen schreiben, müssen neben dieser eine textuelle Repräsentation erzeugen und in der Instanz angeben. Fehlende Angaben der textuellen Repräsentation, sowie dessen Metadaten, werden vom E-RezeptFachdienst als invalide abgewiesen.

Client Systeme, die strukturierte Dosierinformationen lesen, müssen in der Lage sein, mindestens die textuelle Repräsentation, die in jedem Fall im E-Rezept-Kontext vorhanden ist, anzuzeigen. Darüber hinaus können lesende Clients auch Logik auf den Dosierinformationen aufbauen und dem Nutzer darauf aufbauende Funktionalitäten bereitstellen (bspw. Erinnerungen zur Einnahme von Medikamenten).

Im Verordnungsdatensatz und der Dispensierinformation für ein Arzneimittel können Angaben zur Dosierung gemacht werden. Im dgMP Kontext gibt es hierfür einen übergreifenden FHIR-Implementation Guide [Medication IG] der HL7 Deutschland, die entsprechende Vorgaben dazu macht.

Hierzu muss u.a. für jede Angabe der Dosierung eine gerenderte textuelle Darstellung nach [dgMP-DosageTextgenerierungSkript] erzeugt und im Datensatz angegeben werden.

### Umsetzung für den E-Rezept-Fachdienst

Der E-Rezept-Fachdienst muss eingehende Instanzen zunächst FHIR-validieren und nachfolgend überprüfen, ob die textuelle Repräsentation der Dosierung dem Output des Algorithmus, der im [dgMP-DosageTextgenerierung-Skript] definiert ist, entspricht. Falls der Client keinen korrekten String übermittelt hat, wird die Instanz mit entsprechendem Fehler abgewiesen.

Der E-Rezept-Fachdienst prüft dies bei

* Einstellen der Verordnung ([$activate](./op-activate.md))
* vorläufiger Abgabe von Arzneimitteln ([$dispense](./op-dispense.md))
* und Abgabe von Arzneimitteln ([$close](./op-close.md)), falls eine MedicationDispense angegeben ist

Im Fehlerfall gibt der E-Rezept-Fachdienst eine entsprechende Fehlermeldung an den Client zurück und überträgt auch die erwartete textuelle Repräsentation der Dosierung. Eine Auflistung an Beispielen ist hier zu finden: [Medication IG - Beispiele](https://ig.fhir.de/igs/medication/1.0.3/dosierung-beispiele.html).

### Validierung von strukturierten Dosierungen

In FHIR-Ressourcen ist es möglich, strukturierte Dosierinformationen anzugeben. Diese Angaben sind im komplexen FHIRDatentyp “Dosage” definiert. Beispielsweise bieten die FHIR-Ressourcen MedicationRequest und MedicationDispense die Möglichkeit, diese Angaben unter dosagelnstruction zu vermerken. Der [Medication IG] der HL7 Deutschland legt für den dgMP fest, dass diese strukturierten Dosierinformationen zusätzlich als textuelle Repräsentation von erzeugenden Systemen bereitgestellt und von entgegennehmenden zentralen Diensten validiert werden müssen.

Der E-Rezept-Fachdienst ist daher verpflichtet, über die strukturelle FHIR-Validierung hinaus sicherzustellen, dass die textuelle Repräsentation mit den strukturierten Dosierinformationen übereinstimmt.

Zu diesem Zweck stellt HL7 Deutschland das [dgMPDosageTextgenerierung-Skript] zur Verfügung. Dieses Skript implementiert einen Algorithmus, der die FHIR-Ressourcen MedicationRequest, -Dispense und -Statement mit Dosierinformationen in einen String umwandelt. Der E-Rezept-Fachdienst muss in der Lage sein, zu überprüfen, ob die angegebene textuelle Repräsentation dem Output des im Referenzskript implementierten Algorithmus entspricht.

Das Referenzskript enthält eine Versionsnummer und eine Information zur Sprache, die in FHIR-Ressourcen unter `extension: generatedDosageInstructionsMeta`

* `.extension:language`
* `.extension: algorithmVersion`

angegeben sind.

Diese Werte werden bei der Validierung berücksichtigt, sodass nur Repräsentationen entsprechend einer gültigen Version und Sprache im E-Rezept-Fachdienst eingestellt werden können.

Die Validierung von Dosierungen gilt jeweils für freitextliche Dosierinformationen (`.dosagelnstruction.text`), sowie für strukturierte Dosierinformationen (`.dosagelnstruction.timing` und `.dosagelnstruction.doseAndRate`). Eine unstrukturierte Freitextangabe der Dosierung ist weiterhin möglich. Hierzu ist unter `extension[renderedDosagelnstruction]` der identische Text, wie in `.dosagelnstruction.text` anzugeben.

