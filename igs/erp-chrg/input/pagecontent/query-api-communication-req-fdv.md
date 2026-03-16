Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-fdv.md %}

### Modulspezifische Anforderungen

#### Nachricht versenden

##### Abrechnungsinformation-Token übermitteln

Mit dem Anwendungsfall kann die Apotheke , welche den PKV-Abgabedatensatz bereitgestellt hat, für das Ändern des PKV-Abgabedatensatzes berechtigt werden. Die Berechtigung erfolgt mit der Übermittlung des zugehörigen Abrechnungsinformation-Token 

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformations-Token einer Apotheke übermitteln" umsetzen.

Die Korrektur des PKV-Abgabedatensatzes wird durch die Apotheke durchgeführt, welche die ursprünglichen Abrechnungsinformation erstellt hat. Daher ist keine freie Apothekenwahl für den Nutzer notwendig. Es ist ausreichend, die Apotheke aus den vorliegenden Abrechnungsinformationen zu ermitteln und dem Nutzer als Adressat der Nachricht anzuzeigen.

Eine Textnachricht ist optional. 
Innerhalb der Textnachricht sind keine Internet-Links und keine Non-Printable-Characters zulässig.

<!--A_22739-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-5" title="E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Nachricht erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq mit 
    <ul>
        <li>Telematik-ID der ausgewählten abgebenden LEI in recipient</li>
        <li>Textnachricht in payload contentString</li>
        <li>E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/ChargeItem/&#60;id&#62;?ac=..."</li>
    </ul> 
    erstellen.
</requirement>

<!--A_22740-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-6" title="E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Nachricht auf E-Rezept-Fachdienst einstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" zum Einstellen der Nachricht die HTTP-Operation POST /Communication  mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Communication Ressource in HTTP-Request-Body</li>
    </ul>
    ausführen.
</requirement>