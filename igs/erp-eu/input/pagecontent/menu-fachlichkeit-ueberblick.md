## Fachlichkeit – Überblick

### Zielsetzung

Die Beschreibung des Funktionsumfangs als Feature erleichtert das Verständnis und die 
Nachvollziehbarkeit der Lösung, ausgehend von der Darstellung der Nutzersicht auf Epic-Ebene, 
über das technische Konzept bis zur Spezifikation der technischen Details. Mit den hier aufgestellten 
Anforderungen sollen Hersteller in der Lage sein, den zusätzlichen Funktionsumfang ihrer 
verantworteten Komponente bzw. Produkttyp bewerten und umsetzen zu können.

### Zielgruppe

Das Dokument richtet sich an den Hersteller und Anbieter des Produkttyps E-Rezept-Fachdienst 
sowie Hersteller von Clientsystemen für den Zugriff auf den E-Rezept-Fachdienst.

### Abgrenzungen

Die Festlegungen zum E-Rezept der bisher spezifizierten Workflows für apothekenpflichtige Arzneimittel 
sind nicht Gegenstand dieses Dokuments. Auch sollen die Ausführungen dieses Dokuments nicht im Widerspruch 
zu den bisherigen Festlegungen verstanden werden.

Folgende Aspekte sind nicht Gegenstand dieses Feature Dokuments:

* Anbindung der Telematikinfrastruktur (TI) an die eHealth Digital Service Infrastructure (eHDSI),
* Mapping der Informationen zwischen dem für die Verordnung in Deutschland und der Übermittlung im Rahmen des Einlösens im europäischen Ausland genutzten Datenmodell,
* Abrechnung von im europäischen Ausland eingelösten E-Rezepten.

### Methodik

Eine User Story ist eine in Alltagssprache formulierte Software-Anforderung. Sie ist bewusst kurzgehalten und umfasst in der Regel nicht mehr als zwei Sätze. User Stories werden im Rahmen der agilen Softwareentwicklung zusammen mit Akzeptanztests zur Spezifikation von Anforderungen eingesetzt. [Wikipedia: User Story]

Aus diesem Grund kann in den User Stories eine abweichende Terminologie genutzt werden, welche für den Leser nachvollziehbar (bspw. Patient = Versicherter) ist.

#### Anforderungen / Anwendungsfälle

Anforderungen und Anwendungsfälle als Ausdruck normativer Festlegungen werden durch eine eindeutige ID sowie die dem [RFC2119] entsprechenden, in Großbuchstaben geschriebenen deutschen Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN gekennzeichnet.

Anforderungen und Anwendungsfälle werden im Dokument wie folgt dargestellt:
<ID> - <Titel der Anforderung / Titel des Anwendungsfalles>
Text / Beschreibung
[<=]

Dabei umfasst die Anforderung/der Anwendungsfall sämtliche zwischen ID und Textmarke [<=] angeführten Inhalte.

### Epic und User Story
Das fachliche Konzept zum Einlösen von E-Rezepten im europäischen Ausland wurde im Rahmen von "Feature ePrescription/eDispensation Land A" [gemF_ePres-eDisp] abgestimmt.

### Einordnung in die Telematikinfrastruktur
Die Unterstützung des Einlösens von E-Rezepten im europäischen Ausland setzt auf die bestehende Infrastruktur der Anwendung E-Rezept auf.

Die Kommunikation mit den abgebenden Leistungserbringern im europäischen Ausland (LE-EU) wird durch den National Contact Point eHealth in Deutschland (NCPeH-Fachdienst (Deutschland), NCPeH-FD) gebündelt. Der NCPeH-FD verbindet die TI mit der eHDSI. Der NCPeH-FD ist ein neues Client System des E-Rezept-Fachdienstes.

Der Versicherte nutzt für die Verwaltung von Einwilligung und Zugriffsberechtigung ein E-Rezept-FdV, welches direkt mit dem E-Rezept-Fachdienst kommuniziert.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 600px; margin-bottom: 30px;">
        <img src="./uebersicht_architekur_erp_eu.jpeg" alt="Übersicht Architektur" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Übersicht Architektur</figcaption>
</figure>

### Fachliches Konzept

#### Einlösbare Rezepte

Das Feature erweitert den Workflow, damit Versicherte E‑Rezepte für die Einlösung
im europäischen Ausland bereitstellen können.

Einlösbar sind nur E‑Rezepte mit Workflow 160 oder 200, PZN‑Verordnung und gültigem
Gültigkeitszeitraum im Status "offen". Betäubungsmittel, Rezepturen sowie
nicht-industriell hergestellte Arzneimittel sind ausgeschlossen.

#### Autorisierung

* Autorisierung des LE‑EU für den Zugriff auf die Anwendung E‑Rezept.
* Autorisierung des LE‑EU für den Zugriff auf Daten eines Versicherten.

Die Autorisierung durch den Versicherten erfolgt über einen länderspezifischen
Zugriffscode. Der Zugriffscode ist 6‑stellig, alphanumerisch und wird im E‑Rezept‑
FdV erzeugt, registriert und zeitlich befristet angezeigt.