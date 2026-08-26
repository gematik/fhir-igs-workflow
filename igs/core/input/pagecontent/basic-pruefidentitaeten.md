### Prüfkarte eGK

Zur Unterstützung der Aufgaben eines Dienstleisters vor Ort (DVO) stellt die gematik eine Prüfkarte eGK (PK eGK) bereit, welche mit den Daten zu einer fiktiven Versicherten-Identität personalisiert ist und in der Produktivumgebung genutzt werden kann. Für die Personalisierung genutzte Daten siehe [gemSysL_PK_eGK] Kapitel Personalisierte Versichertenstammdaten. Insbesondere beinhalten diese eine ungültige Versicherten-ID (siehe [gemSysL_PK_eGK] Kapitel Ungültigen Versichertennummer (KVNR)).

Da es keine Test-/Prüf-HBAs für die Produktivumgebung der TI gibt, ersteht beim Erstellen einer Verordnung für eine PK eGK eine echte Verordnung, für die keine Leistung erbracht werden darf.

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A467" title="CS: Verordnungen für fiktive Versicherte erkennen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_verordnend" description="PS-Schnittstelle für TI-Flow/verordnendes System">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_TI-Flow_KTR" description="CS-Schnittstelle für TI-Flow/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS eine die Versicherten-ID in einer Verordnung prüfen und Verordnungen für einen fiktiven Versicherten erkennen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A468" title="CS: Hinweis auf Verordnung für fiktiven Versicherten" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_verordnend" description="PS-Schnittstelle für TI-Flow/verordnendes System">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_TI-Flow_KTR" description="CS-Schnittstelle für TI-Flow/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS den Nutzer sehr deutlich darauf hinweisen, wenn eine Verordnung für einen fiktiven Versicherten vorliegt, weil für die Verordnung keine Leistung erbracht werden darf.
</requirement>