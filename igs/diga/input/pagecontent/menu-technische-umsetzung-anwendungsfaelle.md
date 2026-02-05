Diese Seite beschreibt die technischen Anwendungsfaelle fuer den DiGA-Workflow.
Sie ergaenzt die Basis-Anwendungsfaelle des E-Rezept-Workflows.

## Verwaltung durch Versicherte

### Ermitteln der Telematik-ID des Kostentraegers
Das E-Rezept-FdV ermittelt das IK des Kostentraegers aus dem ACCESS_TOKEN und
sucht im FHIR-VZD die zugehoerige Telematik-ID. Falls dies nicht gelingt, wird
eine Auswahl aus allen Kostentraegern mit IKNR und Telematik-ID angeboten.

### Zuweisen der Verordnung
Der Versicherte weist die Verordnung dem Kostentraeger zu. Dazu wird eine
Communication (GEM_ERP_PR_Communication_DispReq) erstellt. Bei DiGA kann
Communication.payload entfallen (Kardinalitaet 0..1).

## Einloesen durch Kostentraeger

<requirement conformance="SHALL" key="IG-WF-DiGA-2" title="Anwendungsfall Nachrichten durch Abgebenden empfangen (A_18617-01)" version="0">
    <meta lockversion="false"/>
    Der Kostentraeger MUSS Nachrichten zum Zuweisen vom E-Rezept-Fachdienst abrufen
    koennen. In der Nachricht ist der E-Rezept-Token enthalten, der den Abruf der
    Verordnung legitimiert.
</requirement>

<requirement conformance="SHALL" key="IG-WF-DiGA-3" title="Anwendungsfall Nachricht durch Abgebenden uebermitteln (A_19013-01)" version="0">
    <meta lockversion="false"/>
    Der Kostentraeger MUSS eine Antwortnachricht an den Versicherten einstellen
    koennen. Der Versand erfolgt ueber den E-Rezept-Fachdienst an den Absender der
    urspruenglichen Nachricht.
</requirement>

<requirement conformance="SHALL" key="IG-WF-DiGA-4" title="Anwendungsfall E-Rezepte durch Kostentraeger abrufen (AF_NEU)" version="0">
    <meta lockversion="false"/>
    Der Kostentraeger MUSS mit der KVNR die Liste der E-Rezepte fuer den
    Versicherten abrufen koennen. Der E-Rezept-Fachdienst ermittelt E-Rezepte mit
    Workflowtyp 162, Status "offen" und passender IKNR und liefert Task-ID und
    AccessCode fuer den weiteren Abruf.
</requirement>

<requirement conformance="SHALL" key="IG-WF-DiGA-5" title="Anwendungsfall E-Rezept durch Abgebenden abrufen (A_18511-01)" version="0">
    <meta lockversion="false"/>
    Der Kostentraeger MUSS ein E-Rezept mit Rezept-ID und AccessCode abrufen
    koennen. Der E-Rezept-Fachdienst setzt den Status auf "in Abgabe (gesperrt)"
    und liefert ein Geheimnis zur Statusaenderung.
</requirement>

<requirement conformance="SHALL" key="IG-WF-DiGA-6" title="Anwendungsfall E-Rezept durch Abgebenden zurueckgeben (A_18512-01)" version="0">
    <meta lockversion="false"/>
    Der Kostentraeger MUSS ein gesperrtes E-Rezept zurueckgeben koennen, sodass der
    Status wieder "offen" ist und der Zugriff protokolliert wird.
</requirement>

<requirement conformance="SHALL" key="IG-WF-DiGA-7" title="Anwendungsfall Quittung abrufen (A_18514-02)" version="0">
    <meta lockversion="false"/>
    Der Kostentraeger MUSS Abgabeinformationen uebermitteln und eine Quittung
    erhalten koennen. Der E-Rezept-Fachdienst setzt den Status auf "quittiert" und
    stellt die Abgabeinformation bereit.
</requirement>
