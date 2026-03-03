Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.
TODO: Prüfverfahren

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-fdv.md %}

### Modulspezifische Anforderungen

<!--A_24563-->
<requirement conformance="MAY" key="IG-ERP-CHRG-44295E1K" title="E-Rezept-FdV: optional: Abrechnungsinformation-Token übermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformations-Token einer Apotheke übermitteln" umsetzen.
</requirement>

<!--A_22735-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-68690VHC" title="E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - E-Rezept auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, ein E-Rezept auszuwählen, um den zugehörigen Abrechnungsinformation-Token der Apotheke, welche den PKV-Abgabedatensatz bereitgestellt hat, mittels einer Nachricht zu übermitteln und die Apotheke somit für das Ändern des PKV-Abgabedatensatzes zu berechtigen.
</requirement>

<!--A_22736-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-25821XFL" title="E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Apotheke auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, die Apotheke auszuwählen, welche die Abrechnungsinformation bereitgestellt hat.
</requirement>

Die Korrektur des PKV-Abgabedatensatzes wird durch die Apotheke durchgeführt, welche die ursprünglichen Abrechnungsinformation erstellt hat. Daher ist keine freie Apothekenwahl für den Nutzer notwendig. Es ist ausreichend, die Apotheke aus den vorliegenden Abrechnungsinformationen zu ermitteln und dem Nutzer als Adressat der Nachricht anzuzeigen.

<!--A_22737-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-34906LR4" title="E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - freie Textnachricht" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, eine freie Textnachricht zu erfassen, welche der Nachricht an die Apotheke hinzugefügt wird.
</requirement>

Hinweis: Die Textnachricht ist optional.

Innerhalb der Textnachricht sind keine Internet-Links und keine Non-Printable-Characters zulässig.

<!--A_22738-01-->
TODO: Do A_22738-01?
<requirement conformance="SHALL" key="IG-ERP-CHRG-00913HM8" title="E-Rezept-FdV: Abrechnungsinformation-Token übermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      text
</requirement>

<!--A_22739-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-71358V1H" title="E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Nachricht erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
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
<requirement conformance="SHALL" key="IG-ERP-CHRG-69716H2W" title="E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Nachricht auf E-Rezept-Fachdienst einstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" zum Einstellen der Nachricht die HTTP-Operation POST /Communication  mit
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Communication Ressource in HTTP-Request-Body</li>
      </ul>
      ausführen.
</requirement>