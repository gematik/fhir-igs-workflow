# Datenschutz und Sicherheit - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Datenschutz und Sicherheit**

## Datenschutz und Sicherheit

PKV-Versicherte erhalten Abrechnungsinformationen, die sie bei ihrer privaten Krankenversicherung zur Kostenerstattung einreichen. Der PKV-Abgabedatensatz wird nur gespeichert, wenn eine einmalige Einwilligung des Versicherten vorliegt. Die Abrechnungsinformationen werden bis zu 10 Jahre gespeichert und können anschließend durch den Versicherten abgerufen, weitergeleitet oder ausgedruckt werden.

Um zu vermeiden, dass der Anbieter des E-Rezept-Fachdienstes ein Profil über alle PKV-Versicherten mit Einwilligung erhält, wird die Information über die Einwilligung in der VAU verarbeitet und verschlüsselt gespeichert. Die Nichtabstreitbarkeit der Einwilligung ist technisch sicherzustellen.

TODO: Sollen wir die Hinweise mit aufnehmen?

Die Fachanwendung E-Rezept MUSS sicherstellen, dass eine Einwilligung in die Verarbeitung von Abrechnungsinformationen nur für PKV-Versicherte möglich ist.
Für den E-Rezept-Fachdienst heißt dies:

Die Fachanwendung E-Rezept MUSS sicherstellen, dass eine Verarbeitung von Abrechnungsinformationen nur für PKV-Versicherte erfolgt, die hierfür eingewilligt haben.

Der E-Rezept-Fachdienst DARF NICHT Abrechnungsinformationen verarbeiten, wenn keine Einwilligung des PKV-Versicherten erfolgt ist.

Die Fachanwendung E-Rezept MUSS sicherstellen, dass die technische Umsetzung der Einwilligung im E-Rezept-FdV und des Vermerkens dieser im E-Rezept-Fachdienst so zuverlässig ist, dass der Vermerk im E-Rezept-Fachdienst als nicht abstreitbar angesehen werden kann.

Der E-Rezept-Fachdienst MUSS Abrechnungsinformationen zu einem E-Rezept nach zehn Jahren löschen.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass abgebende Leistungserbringer die Information über die Möglichkeit des Speicherns der Abrechnungsinformationen im E-Rezept-Fachdienst nur im Kontext eines konkreten E-Rezepts erhalten.

Der E-Rezept-Fachdienst MUSS die Abrechnungsinformationen während der Verarbeitung (inkl. Transport und Speichern) vor unberechtigter Einsichtnahme oder Manipulation schützen.

Der E-Rezept-Fachdienst MUSS die Einwilligung in das Speichern der Abrechnungsinformationen und deren Widerruf – inkl. Zeitpunkt der Aktion – für den Versicherten protokollieren.

