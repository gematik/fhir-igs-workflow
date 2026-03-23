### Anforderungen aus der Core Spezifikation

{% include core.op-accept-req-avs.md %}

### Modulspezifische Anforderungen

<b>Hinweis zu Mehrfachverordnung:</b>
Wenn ein AVS eine Teilverordnung abruft, deren Einlösezeitraum noch nicht erreicht ist, dann liefert der E-Rezept-Fachdienst einen Fehler 403. Im OperationOutcome der Fehlermeldung liefert der E-Rezept-Fachdienst das Datum des Beginns der Einlösefrist.

<b>Flowtype 200/209</b>
Für den Flowtype "200" und "209" wird im Response Bundle eine Consent Ressource mit Consent.category.coding.code = CHARGCONS übermittelt, falls der Versicherte eine Einwilligung zum Speichern von Abrechnungsinformationen erteilt hat. Diese Information kann in der Abstimmung mit dem Versicherten genutzt werden, ob die Abrechnungsinformation digital oder als Papierbeleg bereitgestellt wird.

Möchte der Versicherte die Möglichkeit einer Online-Rezepteinlösung nutzen, kann die abgebende LEI die Belieferungs- und ggfs. Zuzahlungsmodalitäten über ihr Warenwirtschaftssystem ("Onlineshop") abwickeln. Hierzu ist ggfs. die Übernahme von Rezeptinformationen zur Befüllung eines Warenkorbs erforderlich. 

<!-- A_21372 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-108" title="PS abgebende LEI: Übernahme Rezeptinformationen in Warenwirtschaftssystem" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS bei der Übernahme von E-Rezept-Informationen in ein Warenwirtschaftssystem die Integrität und Vertraulichkeit  der personenbezogenen und medizinischen Daten sicherstellen und zusätzlich sicherstellen, dass der Umfang der übertragenen Daten nur auf das unmittelbare für die Einlösung erforderliche Maß beschränkt (Datenminimierung) ist und keine Verwendung der Daten über die unmittelbare Rezepteinlösung hinaus erfolgt (Zweckbindung).
</requirement>

#### QES des Verordnungsdatensatzes prüfen

Für die QES-Prüfung wird die PKCS#7-Datei verwendet. Die Verordnungsdaten des E-Rezepts sind innerhalb der PKCS#7-Datei enthalten und müssen für die Weiterverarbeitung extrahiert werden.

<!-- A_19745-01 -->
<requirement conformance="MAY" key="IG-TIFLOW-ERP-109" title="PS abgebende LEI: E-Rezept abrufen - QES prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI KANN im Anwendungsfall "E-Rezept abrufen" die QES des E-Rezepts prüfen. Zum Prüfen der QES des E-Rezepts ist die Operation POST //Konnektorservice mit 
    <ul>
    <li>Header "SOAPAction: \"http://ws.gematik.de/conn/SignatureService/v7.4#VerifyDocument\"" </li>
    <li>PKCS#7-Datei in SignatureObject</li>
    </ul>
    auszuführen.
</requirement>

Für weitere Informationen siehe Operation "Qualifizierte Signatur des E-Rezepts prüfen" aus der API-Schnittstelle [E-Rezept API Dokumentation]. Implementierungshinweise zur Signaturprüfung für Primärsysteme sind in [gemILF_PS#4.4.2] beschrieben. Die Außenschnittstelle des Konnektors ist in [gemSpec_Kon#TIP1-A_5034-x Operation VerifyDocument (nonQES und QES)] beschrieben. 

Als Response liefert der Konnektor einen standardisierten Prüfbericht in einer VerificationReport-Struktur gemäß [OASIS-VR].

Für die weitere Verarbeitung wird das E-Rezept-Bundle aus der PKCS#7-Datei verwendet.
