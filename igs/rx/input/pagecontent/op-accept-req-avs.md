### Anforderungen aus der Core Spezifikation

{% include core.op-accept-req-avs.md %}

### Modulspezifische Anforderungen

<b>Hinweis zu Mehrfachverordnung:</b>
Wenn ein AVS eine Teilverordnung abruft, deren Einlösezeitraum noch nicht erreicht ist, dann liefert der E-Rezept-Fachdienst einen Fehler 403. Im OperationOutcome der Fehlermeldung liefert der E-Rezept-Fachdienst das Datum des Beginns der Einlösefrist.

<b>Flowtype 200/209</b>
Für den Flowtype "200" und "209" wird im Response Bundle eine Consent Ressource mit Consent.category.coding.code = CHARGCONS übermittelt, falls der Versicherte eine Einwilligung zum Speichern von Abrechnungsinformationen erteilt hat. Diese Information kann in der Abstimmung mit dem Versicherten genutzt werden, ob die Abrechnungsinformation digital oder als Papierbeleg bereitgestellt wird.

Möchte der Versicherte die Möglichkeit einer Online-Rezepteinlösung nutzen, kann die abgebende LEI die Belieferungs- und ggfs. Zuzahlungsmodalitäten über ihr Warenwirtschaftssystem ("Onlineshop") abwickeln. Hierzu ist ggfs. die Übernahme von Rezeptinformationen zur Befüllung eines Warenkorbs erforderlich. 

<!-- A_21372 -->
<requirement conformance="SHALL" key="" title="PS abgebende LEI: Übernahme Rezeptinformationen in Warenwirtschaftssystem" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS bei der Übernahme von E-Rezept-Informationen in ein Warenwirtschaftssystem die Integrität und Vertraulichkeit  der personenbezogenen und medizinischen Daten sicherstellen und zusätzlich sicherstellen, dass der Umfang der übertragenen Daten nur auf das unmittelbare für die Einlösung erforderliche Maß beschränkt (Datenminimierung) ist und keine Verwendung der Daten über die unmittelbare Rezepteinlösung hinaus erfolgt (Zweckbindung).
</requirement>