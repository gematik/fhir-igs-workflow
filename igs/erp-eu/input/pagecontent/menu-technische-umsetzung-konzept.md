Die Unterstützung des Einlösens von E-Rezepten im europäischen Ausland setzt auf die bestehende Infrastruktur der Anwendung E-Rezept auf.

Die Kommunikation mit den abgebenden Leistungserbringern im europäischen Ausland (LE-EU) wird durch den National Contact Point eHealth in Deutschland (NCPeH-Fachdienst (Deutschland), NCPeH-FD) gebündelt. Der NCPeH-FD verbindet die TI mit der eHDSI. Der NCPeH-FD ist ein neues Client System des TI-Flow-Fachdienstes.

Der Versicherte nutzt für die Verwaltung von Einwilligung und Zugriffsberechtigung ein E-Rezept-FdV, welches direkt mit dem TI-Flow-Fachdienst kommuniziert.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 1000px; margin-bottom: 30px;">
        <img src="./uebersicht_architekur_erp_eu.jpeg" alt="Übersicht Architektur" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Übersicht Architektur</figcaption>
</figure>

<br>

### Statusmodell

Für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel in Deutschland wird das folgende Statusmodell umgesetzt.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 600px; margin-bottom: 30px;">
        <img src="./tech-eu-1.png" alt="todo" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Statusübergänge Fachanwendung E-Rezept</figcaption>
</figure>

<br>

Für die im Rahmen des Einlösens im europäischen Ausland vorgegebenen Prozessschritten lässt sich das Statusmodell nicht vollständig anwenden, da kein Prozessschritt vorgesehen ist, ein zur Abgabe vorgesehenes E-Rezept an den Versicherten zurückzugeben, wenn die Abgabe nicht erfolgen kann.

|Anwendungsfall ePrescription/eDispensation|Anwendungsfall E-Rezept|Status vor Operation|Status nach Operation|
|---|---|---|---|
|Identifizierung des Versicherten im Abgabeland|UC Demographische Daten eines Versicherten abrufen|offen (ready)|offen (ready)|
|Auflistung von E-Rezepten des Versicherten|UC Liste der einlösbaren E-Rezepte eines Versicherten abrufen|offen (ready)|offen (ready)|
|Abruf der abzugebenden E-Rezepte als Original|UC Liste ausgewählter E-Rezepte eines Versicherten abrufen|offen (ready)|in Abgabe (gesperrt) (in-progress)|
|Abgabe von Arzneimitteln im Abgabeland|UC Abgabe von E-Rezepten im europäischen Ausland|in Abgabe (gesperrt) (in-progress)|quittiert (completed)|

<div><figcaption><strong>Tabelle: </strong>Statusübergänge EU Mapping</figcaption></div>

Sobald ein E-Rezept durch eine LE-EU mit dem Anwendungsfall "Abruf der abzugebenden E-Rezepten des Versicherten" abgerufen wurde, kann es nicht mehr erneut abgerufen werden oder in einer anderen Apotheke eingelöst werden.

### Zugriffsberechtigung eines Versicherten für das Einlösen von E-Rezepten im europäischen Ausland

Einen Zugriffsberechtigung eines Versicherten für das Einlösen von E-Rezepten im europäischen Ausland beinhaltet die folgenden Informationen:

- KVNR des Versicherten,
- Ländercode des Landes, für welches die Zugriffsberechtigung durch den Versicherten erteilt wurde,
- Zugriffscode,
- gültig bis (1h ab Einstellen), wird durch den TI-Flow-Fachdienst beim Einstellen der Zugriffsberechtigung gesetzt.

<!-- A_27097 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-1" title="Format Zugriffscode" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Produkttypen der Anwendung E-Rezept MÜSSEN, wenn sie einen Zugriffscode für das Einlösen im europäischen Ausland verarbeiten, folgende Formatvorgaben für den Zugriffscode einhalten: String mit Gesamtlänge von 6 Zeichen, erlaubte Zeichen: a-z, A-Z, 0-9.
</requirement>

### Zulässige europäische Länder

Um zu bestimmen, welche europäischen Länder das die Anwendung ePrescription/eDispensation Szenario Land A unterstützen, lädt der TI-Flow-Fachdienst die Liste dieser Länder aus dem FHIR-VZD. Die Liste kann für 96h gecacht werden.

Der Ablauf der Authentisierung und Suche ist in [gemSpec_VZD_FHIR_Directory]#AF_10403 Fachdienst sucht Einträge im FHIR-Directory beschrieben. Der Betreiber des TI-Flow-Fachdienst muss beim FHIR-VZD Anbieter für den Zugriff auf den FHIR-VZD nach [gemSpec_VZD_FHIR_Directory]#Nutzer und Rollen registrieren.

<!-- A_27095 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-2" title="TI-Flow-Fachdienst - Zugriffsberechtigung - Liste zulässiger Länder" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS die Liste aller zulässigen Länder aus dem Verzeichnisdienst ermitteln, indem an den Verzeichnisdienst folgende Abfrage gestellt wird: Abfrage der Ressource "HealthcareService", HealthcareServices, deren Speciality "57833-6" aus https://loinc.org enthalten, HealthcareServices, deren Organisation aktiv sind, HealthcareServices, deren Organisation den OrganizationProfessionOIDType "1.2.276.0.76.4.292" entspricht, Einbeziehen der Organisation in das Rückgabeergebnis.
</requirement>

<!-- A_27096 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-XBORDER-3" title="TI-Flow-Fachdienst - Zugriffsberechtigung - Caching Liste zulässiger Länder" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst DARF NICHT Informationen zur Liste zulässiger Länder verwenden, welche länger als 96h lokal durch den TI-Flow-Fachdienst gecacht wurden.
</requirement>
