# E-Rezept-FdV Anforderungen: ChargeItem - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* [**ChargeItem: Abrechnungsinformationen des E-Rezepts für PKV-Versicherte**](menu-technische-umsetzung-chargeitem.md)
* **E-Rezept-FdV Anforderungen: ChargeItem**

## E-Rezept-FdV Anforderungen: ChargeItem

## Abrechnungsinformation-Token als 2D-Code anzeigen

Mit diesem Anwendungsfall kann der Nutzer den AccessCode zum Ändern als 2D-Code auf dem Bildschirm seines E-Rezept-FdVs anzeigen lassen, um es direkt in der Apotheke vorzuzeigen und die Apotheke damit zu berechtigen, die Abrechnungsinformation vom E-Rezept-Fachdienst abzurufen und den PKV-Abgabedatensatz einmalig zu ändern.

Das E-Rezept-FdV KANN den Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" es dem Nutzer ermöglichen, ein E-Rezept für die Anzeige des 2D-Code der Abrechnungsinformation auszuwählen, um einer Apotheke das Einscannen zu ermöglichen und sie somit für das Ändern des PKV-Abgabedatensatzes zu berechtigen.

Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" für das ausgewählte E-Rezept den Abrechnungsinformation-Token erstellen.
Für die Beschreibung der Struktur des Abrechnungsinformation-Token siehe [gemSpec_DM_eRp].

Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" mit dem erstellten Abrechnungsinformation-Token einen 2D-Code erstellen und auf dem Display des Endgerätes anzeigen.
## Abrechnungsinformation exportieren

Mit diesem Anwendungsfall kann der Versicherte die Abrechnungsinformation aus dem E-Rezept-FdV exportieren, um es zur Abrechnung einzureichen oder zu archivieren.

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation exportieren" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation exportieren" auf Basis der vom E-Rezept-Fachdienst zu einer Prescription-ID heruntergeladenen ChargeItem, Verordnungsdatensatz, PKV-Abgabedatensatz und Quittung Ressourcen
* einen Ausdruck erstellen,
* für den Ausdruck ein PDF gemäß PDF/A-3-Standard (ISO 19005-3) erstellen,
* in das Dokument den signierten Verordnungsdatensatz (<Prescription-ID>_verordnung.p7s), den signierten PKV-Abgabedatensatz (<Prescription-ID>_abgabedaten.p7s) und den signierten Quittung Datensatz (<Prescription-ID>_quittung.p7s) gemäß PDF/A-3 einbetten.

Für die Visualisierung der Abrechnungsinformation für PKV-Versicherte ist die zwischen DAV und PKV-Verband vereinbarte Technische Anlage zu den PKV-Abgabedaten und dem dortigen Kapitel 6 Ausdruck für den Privatversicherten sowie dem Unterkapitel 6.2 Spezifikation des Ausdrucks für den Versicherten [Empfehlung](http://www.abda.de/themen/e-health/datenauschtausch-pkv) zu beachten. Zur Umsetzungsunterstützung siehe auch [hier](https://github.com/DAV-ABDA/eRezept-Beispiele/tree/main/PKV).

Das E-Rezept-FdV MUSS es dem Nutzer im Anwendungsfall "Abrechnungsinformation exportieren" ermöglichen, das erstellte PDF mit anderen Apps zu teilen, um den Versicherten die Möglichkeit zu geben, seine Abrechnungsinformation an Krankenversicherungen oder andere Institutionen zur Abrechnung zu übermitteln.
Das schließt das Versenden per E-Mail oder die Ablage im Dateisystem ein.

