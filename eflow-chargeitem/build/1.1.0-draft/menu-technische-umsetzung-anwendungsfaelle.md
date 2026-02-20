# Technische Anwendungsfälle - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

Diese Seite beschreibt die technischen Anwendungsfälle des Szenarios „E‑Rezepte für PKV‑Versicherte“. Im Fokus steht, was im E‑Rezept‑Fachdienst und in den beteiligten Clients (FdV/AdV, Primärsysteme, AVS) passiert, wenn die fachlichen Anwendungsfälle ausgeführt werden.

## Bereitstellen der Abrechnungsinformation durch die abgebende LEI (AF_10082)

Die abgebende LEI stellt die Abrechnungsinformation zu einem E‑Rezept im E‑Rezept‑Fachdienst bereit. Technisch wird dafür ein ChargeItem mit eingebettetem PKV‑Abgabedatensatz angelegt, ergänzt um Verordnungsdatensatz und Quittung aus dem Workflow.

* Das AVS erstellt den PKV‑Abgabedatensatz (QES‑signiert bei Änderungen, andernfalls fortgeschritten signiert).
* Das AVS sendet den ChargeItem‑Datensatz an den E‑Rezept‑Fachdienst.
* Der E‑Rezept‑Fachdienst validiert den ChargeItem, prüft Einwilligung (Consent) und Signaturen.
* Der E‑Rezept‑Fachdienst erzeugt einen AccessCode und speichert die Abrechnungsinformation.

**Schnittstelle:** *[query-api-chargeitem](./query-api-chargeitem.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Abrechnungsinformation durch Abgebenden bereitstellen

## Abrufen der Abrechnungsinformation durch die abgebende LEI (AF_10081)

Für Korrekturen kann die abgebende LEI eine zuvor bereitgestellte Abrechnungsinformation abrufen. Voraussetzung ist die Prescription‑ID und der AccessCode.

* Das AVS ruft die Abrechnungsinformation im E‑Rezept‑Fachdienst ab.
* Der E‑Rezept‑Fachdienst prüft die Rolle, die Prescription‑ID und den AccessCode.
* Der E‑Rezept‑Fachdienst liefert das ChargeItem inkl. PKV‑Abgabedatensatz zurück.

**Schnittstelle:** *[query-api-chargeitem](./query-api-chargeitem.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Abrechnungsinformation durch Abgebenden abrufen


## Ändern des PKV‑Abgabedatensatzes durch die abgebende LEI (AF_10083)

Wenn eine Korrektur erforderlich ist, kann die abgebende LEI den PKV‑Abgabedatensatz überschreiben. Ältere Versionen werden nicht gespeichert.

* Der Versicherte berechtigt die abgebende LEI über den AccessCode.
* Das AVS sendet den geänderten PKV‑Abgabedatensatz an den E‑Rezept‑Fachdienst.
* Der E‑Rezept‑Fachdienst validiert den Datensatz, überschreibt die gespeicherten Daten und erzeugt einen neuen AccessCode.

**Schnittstelle:** *[query-api-chargeitem](./query-api-chargeitem.md)*

**Sequenzdiagramm:**

**Abbildung: **SD PKV-Abgabedatensatz durch Abgebenden ändern

## Einwilligung zum Speichern erteilen (AF_10084)

Der Versicherte erteilt die Einwilligung zum Speichern der Abrechnungsinformationen im E‑Rezept‑Fachdienst.

* Das FdV/AdV zeigt den Einwilligungstext an und holt die Bestätigung ein.
* Das FdV/AdV erstellt eine Consent‑Ressource (CHARGCONS) und speichert sie im E‑Rezept‑Fachdienst.

**Schnittstelle:** *[query-api-consent](./query-api-consent.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Einwilligung zum Speichern der Abrechnungsinformationen durch Versicherten erteilen

## Einwilligung widerrufen (AF_10085)

Der Versicherte kann die Einwilligung jederzeit widerrufen. Mit dem Widerruf werden alle gespeicherten Abrechnungsinformationen gelöscht.

* Das FdV/AdV lässt den Widerruf bestätigen und übermittelt die Löschanforderung.
* Der E‑Rezept‑Fachdienst löscht die Consent‑Ressource und alle zugehörigen Abrechnungsinformationen.

**Schnittstelle:** *[query-api-consent](./query-api-consent.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Einwilligung zum Speichern der Abrechnungsinformationen durch Versicherten widerrufen

## Einwilligung einsehen (AF_10086)

Der Versicherte kann prüfen, ob eine Einwilligung vorliegt.

* Das FdV/AdV ruft die Consent‑Information im E‑Rezept‑Fachdienst ab.
* Der E‑Rezept‑Fachdienst liefert die Consent‑Ressource zurück; das FdV/AdV zeigt den Status an.

**Schnittstelle:** *[query-api-consent](./query-api-consent.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Einwilligung zum Speichern der Abrechnungsinformationen durch Versicherten einsehen

## Abrechnungsinformation abrufen (AF_10087)

Der Versicherte ruft eine Liste und die Details seiner Abrechnungsinformationen im FdV/AdV ab.

* Das FdV/AdV ruft die Liste der ChargeItems ab.
* Für den Detailabruf fordert das FdV/AdV die Datensätze zu einer Prescription‑ID an.
* Der E‑Rezept‑Fachdienst signiert die Datensätze beim Abruf mit seinem Signaturzertifikat (C.FD.OSIG) und liefert sie zurück.
* Die Abrechnungsinformationen stehen zur Anzeige und für Export/Weitergabe bereit.

**Schnittstelle:** *[query-api-chargeitem](./query-api-chargeitem.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Abrechnungsinformation durch den Versicherten abrufen

## Abrechnungsinformation weitergeben (AF_10088)

Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel‑App weiter (z. B. PKV‑App, Beihilfe) oder exportiert sie als PDF/A.

* Das FdV/AdV erstellt ein PDF/A mit den relevanten Datensätzen.
* Das FdV/AdV übergibt das Dokument an die Ziel‑App oder ermöglicht Download/Versand.

**Schnittstelle:** *[query-api-chargeitem](./query-api-chargeitem.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Abrechnungsinformation durch den Versicherten weitergeben

## Abrechnungsinformation markieren

Der Versicherte kann Abrechnungsinformationen im FdV/AdV markieren (z. B. für Abrechnung, Beihilfe, Finanzamt). Die Markierungen werden im E‑Rezept‑Fachdienst gespeichert.

* Das FdV/AdV setzt die Markierung und speichert sie am ChargeItem.

**Schnittstelle:** *[query-api-chargeitem](./query-api-chargeitem.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Abrechnungsinformation durch den Versicherten markieren

## Abrechnungsinformation löschen

Der Versicherte kann eine Abrechnungsinformation aktiv löschen. Die Löschung ist unwiederbringlich.

* Das FdV/AdV sendet die Löschanforderung für das ChargeItem.
* Der E‑Rezept‑Fachdienst löscht die Abrechnungsinformation und protokolliert den Vorgang.

**Schnittstelle:** *[query-api-chargeitem](./query-api-chargeitem.md)*

**Sequenzdiagramm:**

**Abbildung: **SD Abrechnungsinformation durch den Versicherten löschen

## Berechtigen der Apotheke zum Ändern des PKV‑Abgabedatensatzes

Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen.

* Das FdV/AdV erzeugt einen Abrechnungsinformation‑Token.
* Der Versicherte übermittelt den Token per Nachricht (Communication) oder zeigt einen 2D‑Code.
* Das AVS nutzt den AccessCode für Abruf/Änderung der Abrechnungsinformation.

**Schnittstelle:** *[query-api-communication](./query-api-communication.md)*

**Sequenzdiagramm (Platzhalter):** 

