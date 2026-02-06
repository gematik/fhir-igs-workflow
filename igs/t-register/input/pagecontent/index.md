## Implementation Guide: Übertragung digitaler Durchschlag T-Rezept

Dieser Implementation Guide (IG) beschreibt Profile und deren Verwendung in Anwendungsfällen zum Datenaustausch zwischen der gematik und dem Bundesinstitut für Arzneimittel und Medizinprodukte (BfArM) im Kontext E-T-Rezept.

In diesem IG wird der Anwendungsfall "[Übertragung digitaler Durchschlag T-Rezept](./trezept.html)", sowie die dazugehörigen Profile und Mappingdaten beschrieben.

### Wie dieser IG zu lesen ist

Die Übersichtsseite des Anwendungsfalls (s.o.) beschreibt die fachlichen Anforderungen und gibt eine allgemeine Beschreibung dessen, was erreicht werden soll. Die Profilseiten enthalten jeweils eine Beschreibung der Profile und deren Verwendung.

Dieser IG stellt ebenfalls Mappingdaten zur Verfügung, die entwicklungsunterstützend genutzt werden können, um digitale Durchschläge für das T-Rezept zu erstellen. Weiterführende Beschreibung hierzu findet sich unter [Mapping für den digitalen Durchschlag](./trezept.html#mapping-des-digitalen-durchschlags-e-t-rezept).

Bezüglich des Datenmodells ist der [digitiale Durchschlag T-Rezept](./StructureDefinition-erp-tprescription-carbon-copy.html) die übergreifende Ressource, die alle relevanten Profile referenziert. Dieses Artefakt wird vom E-Rezept-Fachdienst an das BfArM T-Register übertragen. Weitere Informationen hierzu sind unter [Datenmodell digitaler Durchschlag E-T-Rezept](./datamodel.html) zu finden.

Auf [E-Rezept API Dokumentation zum Datenaustausch mit dem BfArM](https://github.com/gematik/api-erp/blob/master/docs/erp_bfarm.adoc) ist die API Dokumentation des Endpunktes des BfArM T-Registers und eine dazugehörige OpenAPI zu finden.

### Paketdatei

Die folgende Paketdatei enthält eine NPM-Paketdatei, wie sie von vielen FHIR Tools verarbeitet werden kann. Sie enthält u.a. alle Profile, Erweiterungen und eine Liste der Seiten und URLs, die in dieser Version des Implementation Guide definiert werden.

- [Package (komprimierter Ordner)](package.tgz){::download="true"}

### Herunterladbare Kopie des Implementation Guide

Eine Version dieses Implementation Guide, die auch lokal betrachtet werden kann, ist als Download im ZIP-Format verfügbar:

- [Herunterladbare Kopie (komprimierter Ordner)](full-ig.zip)

### Beispiele

Alle nicht-normativen Beispiele in diesem Implementation Guide sind ebenfalls zum Herunterladen verfügbar:

- [XML (komprimierter Ordner)](examples.xml.zip)
- [JSON (komprimierter Ordner)](examples.json.zip)

### Konsolidierte CSV- und Excel-Datei-Darstellungen der Profile

Alle Profildaten dieses Implementation Guide können in einer einzigen nicht-normativen CSV- oder Excel-Datei heruntergeladen werden. Dies kann bspw. für Tester und Analysten hilfreich sein, um Elementeigenschaften in einer einzigen Tabelle über Profile hinweg überprüfen zu können:

- [CSV (komprimierter Ordner)](csvs.zip)
- [Excel (komprimierter Ordner)](excels.zip)

{% comment %}
Eine Excel-Tabelle, die alle Beobachtungsprofile vergleicht:

- [Excel](observations-summary.xlsx)
{% endcomment %}

### Schematron-Dateien

Auch Schematron-Dateien sind zum Herunterladen verfügbar:

- [Schematron (komprimierter Ordner)](schematrons.zip)

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Weitere Referenzen und Dokumente

- [Feature Dokument zum T-Rezept der gematik](https://gemspec.gematik.de/docs/gemF/gemF_eRp_T-Rezept/latest/)
- [Spezifikation des E-Rezept-Fachdienst](https://gemspec.gematik.de/docs/gemSpec/gemSpec_FD_eRp/latest/)

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an [erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de) oder nutzen Sie das [GitHub-Repository](https://github.com/gematik/spec-erp-t-prescription/issues).

### Rechtliche Hinweise

Dieser IG wird von der [gematik GmbH](https://www.gematik.de/) erstellt und verwaltet.

Copyright ©2025+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von Health Level Seven International, eingetragen beim United States Patent and Trademark Office.
