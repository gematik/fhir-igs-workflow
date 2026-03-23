Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$close`.

<!-- A_27840 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-295" title="PS abgebende LEI: Quittung abrufen - Abschluss des Workflows durchführen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS den Anwendungsfall "Quittung abrufen" für Verordnungen, welche abschließend verarbeitet wurden, ausführen, um den Workflow am E-Rezept-Fachdienst abzuschließen.
</requirement>

Die Erstellung der MedicationDispense erfolgt Flowtype-spezifisch.


<!-- A_19289-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-296" title="PS abgebende LEI: Quittung abrufen - Statusrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "Quittung abrufen" für das abgegebene E-Rezept die HTTP-Operation POST /Task/&#60;id&#62;/$close mit
    <ul> 
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Task-ID in URL &#60;id&#62;</li>
        <li>Geheimnis in URL-Parameter ?secret=</li>
        <li>optional, falls nicht zuvor mit Anwendungsfall "Dispensierinformation bereitstellen" übermittelt: MedicationDispense bzw. Bundle Ressource</li>
    </ul>
    ausführen.
</requirement>

Im Response liefert der Fachdienst die Quittung

#### Quittungssignatur prüfen

Der E-Rezept-Fachdienst prüft regelmäßig den Status seines Signaturzertifikats, die mandatorische Signaturprüfung der Quittung obliegt dem Quittungsempfänger, kann aber vom AVS vor der Weitergabe in die Abrechnungsprozesse ebenfalls geprüft werden.

Die Quittung wird als PKCS#7-Datei erstellt. Die quittierten Daten sind innerhalb der PKCS#7-Datei enthalten.

<!-- A_20766 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-297" title="PS abgebende LEI:  Quittung abrufen - Quittungssignatur prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI KANN im Anwendungsfall "Quittung abrufen" zum Prüfen der Quittung des E-Rezepts die Operation POST //Konnektorservice mit
    <ul> 
        <li>Header "SOAPAction: \"http://ws.gematik.de/conn/SignatureService/v7.4#VerifyDocument\""</li>
        <li>PKCS#7-Datei in SignatureObject</li>
    </ul>
    ausführen.
</requirement>

Implementierungshinweise zur Signaturprüfung für Primärsysteme sind in [gemILF_PS#4.4.2] beschrieben. Die Außenschnittstelle des Konnektors ist in [gemSpec_Kon#TIP1-A_5034-x Operation VerifyDocument (nonQES und QES)] beschrieben. 

Als Response liefert der Konnektor einen standardisierten Prüfbericht in einer VerificationReport-Struktur gemäß [OASIS-VR].

#### Stapelverarbeitung

Eine Apotheke schließt nach Belieferung eines E-Rezepts den Vorgang mittels $close-Aufruf entsprechend vertraglicher Vorgaben bis zum Ende des folgenden Werktags ab. Der Abschluss des Vorgangs mittels $close-Operation kann einzeln oder auch als Stapelverarbeitung durchgeführt werden. Bei einer Stapelverarbeitung ruft das AVS hintereinander die $close-Operation für jedes E-Rezept auf. Um Lastspitzen am E-Rezept-Fachdienst zu vermeiden, gelten folgende Anforderungen für die Stapelverarbeitung.

<!-- A_25219 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-298" title="PS abgebende LEI:  Quittung abrufen - Stapelverarbeitung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI KANN im Anwendungsfall "Quittung abrufen" mehrere Vorgänge im Stapel verarbeiten.
</requirement>

Falls ein AVS diese Aufrufe im Stapel verarbeitet, soll der Startzeitpunkt für die Aufrufe der $close-Operation am E-Rezept-Fachdienst zufällig verteilt sein, um die betriebliche Stabilität des E-Rezept-Fachdienstes zu gewährleisten.

<!-- A_25220 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-299" title="PS abgebende LEI:  Quittung abrufen - Stapelverarbeitung - Startzeitpunkt" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS bei Stapelverarbeitung im Anwendungsfall "Quittung abrufen" den Startzeitpunkt zufällig in einem Zeitraum mehreren Stunden setzen.
</requirement>

<!-- A_25221 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-300" title="PS abgebende LEI:  Quittung abrufen - Stapelverarbeitung - Wartezeit zwischen Aufrufen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS bei Stapelverarbeitung im Anwendungsfall "Quittung abrufen" nach 40 Aufrufen jeweils 1000ms warten, bevor die Stapelverarbeitung fortgeführt wird.
</requirement>

Hinweis: Die [E-Rezept API Dokumentation] enthält im Abschnitt "E-Rezept-Abgabe vollziehen" einen Beispielalgorithmus, um den Startzeitpunkt der $close-Stapelverarbeitung zufällig zwischen 18:00 und 22:00 zu setzen.