# Erstellen von Dispensierinformationen - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* **Erstellen von Dispensierinformationen**

## Erstellen von Dispensierinformationen

Für die Anwendungsfälle “Dispensierinformationen bereitstellen” und “Quittung abrufen” muss das PS der abgebenden LEI Dispensierinformationen an den TI-Flow-Fachdienst übermitteln. Dieses Kapitel beschreibt, wie ein entsprechendes PS den Datensatz zu den Dispensierinformationen zu befüllen hat. Für die Spezifikation der Ressource MedicationDispense siehe [gemSpec_DM_eRp].

Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 166, 169, 200 oder 209 eine FHIR-Ressource mit dem Profil GEM_ERP_PR_MedicationDispense erstellen.

Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 166, 169, 200 oder 209 Dosierinformationen nach [Medication IG] erzeugen und im E-Rezept-Bundle angeben.

Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit mehreren Teilabgaben und mit Flowtype 160, 166, 169, 200 oder 209 mehrere MedicationDispenses im Parameters Profil angeben.
Die Profilversion bei der Abgabe richtet sich nach dem Abgabedatum der Arzneimittel. Wenn mehrere Arzneimittel zu einer Verordnung abgegeben werden, dann richtet sich die gültige Profilversion nach dem Datum der neuesten Abgabe (s. [gemSpec_DM_eRp#Zeitliche Gültigkeit von FHIR-Ressourcen]). 

Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 166, 169, 200 oder 209, wenn mehrere Teilabgaben oder Stückelungen enthalten sind, eine Profilversion zur Erstellung der Parameters Ressource nutzen, die zum Zeitpunkt des neuesten Abgabedatums (MedicationDispense.whenHandedOver) gültig ist.
Die Befüllung des Medication-Objekts innerhalb der MedicationDispense erfolgt durch die Übernahme wesentlicher Attribute wie PZN, Wirkstoff, Darreichungsform und Dosierinformationen aus dem Verordnungsdatensatz. Falls es zu einer Substitution kommt, können die Daten aus dem Securpharm-Scan, sowie den Arzneimitteldatenbanken als Datengrundlage verwendet werden. Wenn der Secupharm-Code Informationen zu Charge und Haltbarkeitsdatum enthält, müssen diese in den Dispensierdatensatz aufgenommen werden.

Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 166, 169, 200 oder 209 die FHIR-Ressource Medication um Chargeninformation und Verfallsdatum aus dem SecurPharm-Scan [SecurPharm] ergänzen, sofern es sich bei dem abgegebenen Arzneimittel um ein Fertigarzneimittel handelt, das einen Data-Matrix-Code gemäß securPharmSystem besitzt.

Das PS der abgebenden LEI MUSS beim Erstellen einer MedicationDispense eines Fertigarzneimittels für ein E-Rezept des Flowtype 160, 166, 169, 200 oder 209 jede FHIR-Ressource Medication um Wirkstoff, Wirkstärke (inkl. Einheit) und Handelsnamen ergänzen, sofern die Informationen in der verwendeten Arzneimittel-Datenbank vorliegen.

Das PS der abgebenden LEI MUSS beim Erstellen einer MedicationDispense einer Rezeptur für ein E-Rezept des Flowtype 160, 166, 169, 200 oder 209 für jede FHIR-Ressource Medication Wirkstoff und Wirkstärke (inkl. Einheit) strukturiert angeben, wenn diese Information strukturiert im Verordnungsdatensatz vorlag.
Die Dosieranweisung werden in der MedicationDispense als Freitext angegeben. Die Angabe strukturierter Dosieranweisungen ist nicht erlaubt. Ein AVS gibt die Dosieranweisung in der MedicationDispense nur an, wenn der Apotheker diese im Vergleich zur Dosieranweisung in der Verordnung konkretisiert, verbessert oder anpasst.

Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 166, 169, 200 oder 209 die Dosieranweisung angeben, wenn diese sich im Vergleich zu der Dosieranweisung in der Verordnung verändert hat.

Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 166, 169, 200 oder 209 Dosierinformationen nach [Medication IG] erzeugen und im E-Rezept-Bundle angeben.

Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 166, 169, 200 oder 209 die FHIR-Ressource MedicationDispense in .substitution.wasSubstituted um die Angabe ergänzen, ob eine Substitution erfolgte, sofern eine PZN-Verordnung beliefert wird.
Hinweis: Eine Substitution im Sinne der obigen Anforderung liegt immer dann vor, wenn die PZN des abgegebenen Arzneimittels nicht identisch mit der PZN des verordneten Arzneimittels ist. Ausgeschlossen sind Sonder-PZN.

Hinweis: Im Falle einer Nicht-PZN-Verordnung ist das Setzen des Substitutionskennzeichens optional.

