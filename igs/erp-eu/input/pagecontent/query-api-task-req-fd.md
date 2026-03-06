### Anforderungen aus der Core Spezifikation

{% include core.query-api-task-req-fd.md %}

### Modulspezifische Anforderungen


#### PATCH /Task

<!-- A_27551 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-17" title="E-Rezept-Fachdienst -Task markieren -Versicherter - FHIR-Validierung Parameters" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten auf die Ressource übertragene Parameters Ressource gegen das FHIR-Profil GEM_ERPEU_PR_PAR_PATCH_Task_Input prüfen und bei Nicht-Konformität den Aufruf mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst akzeptiert werden.
</requirement>

<!-- A_28500 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-18" title="E-Rezept-Fachdienst -Task markieren -Versicherter - nur einlösbare E-Rezepte" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten prüfen, ob der adressierte Task in Task.extension:eu-isRedeemableByProperties.valueBoolean = true gesetzt ist und anderfalls mit dem HTTP-Fehlercode "409 - Conflict" und einer entsprechenden Fehlermeldung im OperationOutcome die Operation abbrechen.
</requirement>

<!-- A_27552 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-18" title="E-Rezept-Fachdienst -Task markieren -Versicherter - Änderung Markierung Task Ressource" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten, den im Parameter `eu-isRedeemableByPatientAuthorization` enthaltenen boolschen Wert in `Task.extension:eu-isRedeemableByPatientAuthorization.valueBoolean` setzen.
</requirement>
