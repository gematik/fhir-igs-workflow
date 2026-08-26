Diese Seite beschreibt Anforderungen an ein AVS zur Nutzung der `Communication`-Query-Endpunkte für "Bereitstellung von Abrechnungsinformationen für PKV-Versicherte".

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### Nachricht versenden

<!--A_28539-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-A32" title="PS abgebende LEI: Nachricht versenden - Apotheke  - Abrechnungsinformation - Communication Ressource erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das PS der abgebenden LEI (Apotheke) MUSS im Anwendungsfall "Nachricht an Versicherten versenden" bezüglich dem Änderungswunsch einer Abrechnungsinformation eine Communication Ressource mit dem Profil GEM_ERPCHRG_PR_Communication_ChargChangeReply erstellen.
</requirement>