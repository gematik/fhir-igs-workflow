Diese Seite beschreibt Anforderungen ein AVS zur Nutzung der `Communication`-Query-Endpunkte für "Bereitstellung von Abrechnungsinformationen für PKV-Versicherte".

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-avs.md %}

### Modulspezifische Anforderungen

#### Nachricht versenden

<!--A_28539-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-32" title="PS abgebende LEI: Nachricht versenden - Apotheke  - Abrechnungsinformation - Communication Ressource erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI (Apotheke) MUSS im Anwendungsfall "Nachricht an Versicherten versenden" bezüglich dem Änderungswunsch einer Abrechnungsinformation eine Communication Ressource mit dem Profil GEM_ERPCHRG_PR_Communication_ChargChangeReply erstellen.
</requirement>