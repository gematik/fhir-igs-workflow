Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Task`-Query-Endpunkte.

### Recovery Secret

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-31" title="PS abgebende LEI: Recovery Secret - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Recovery Secret" für das E-Rezept die HTTP-Operation GET /Task/&lt;id&gt;/ mit 
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>Access_Code in URL-Parameter ?ac=</li>
  </ul>
  ausführen.
</requirement>

### Quittung erneut abrufen

Mit diesem Anwendungsfall kann eine abgebende LEI die Quittung erneut abrufen, falls bei der Übermittlung vom E-Rezept-Fachdienst ein Fehler aufgetreten ist.

Der Anwendungsfall kann bei Bedarf wiederholt werden.

<!-- A_19292 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-32" title="PS abgebende LEI: Quittung erneut abrufen - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Quittung erneut abrufen" für das E-Rezept die HTTP-Operation GET /Task/&lt;id&gt;/ mit 
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>Geheimnis in URL-Parameter ?secret=</li>
  </ul>
  ausführen.
</requirement>

<!-- A_19286-01 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Quittung abrufen - E-Rezept auswählen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Quittung abrufen" es dem Nutzer ermöglichen, ein E-Rezept als abgeschlossen auszuwählen.
</requirement>
<!-- A_19287-02 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Quittung abrufen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.4 - Quittung abrufen" aus [gemSysL_eRp] gemäß TAB_ILFERP_006 umsetzen. Tabelle # : TAB_ILFERP_006 – Quittung abrufen Name Quittung abrufen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat das E-Rezept vom E-Rezept-Fachdienst heruntergeladen. Der Nutzer hat ein E-Rezept als abgeschlossen markiert. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Die Quittung des E-Rezepts steht im PS bereit. Standardablauf optional (falls noch nicht vorab übermittelt): Informationen über das abgegebene Medikament erstellen nur für Fertigarzneimittel, die einen Data-Matrix-Code gemäß securPharm-System besitzen: Chargeninfo und Verfallsdatum ergänzen Task-ID und Geheimnis des E-Rezepts bestimmen E-Rezept-Status auf E-Rezept-Fachdienst ändern Quittung aus Response extrahieren optional: Signatur der Quittung prüfen
</requirement>
<!-- A_19288-03 -->
<requirement conformance="SHALL" title="PS abgebende LEI:  Quittung abrufen - Dispensierinformationen erstellen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Quittung abrufen" die Dispensierinformationen nach den Vorgaben aus "Erstellen von Dispensierinformationen" erzeugen, wenn sie übermittelt werden sollen.
</requirement>
<!-- A_19290 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Quittung erneut abrufen - E-Rezept auswählen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept auszuwählen, zu dem die Quittung erneut abgerufen werden soll.
</requirement>
<!-- A_19291 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Quittung erneut abrufen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.8 - Quittung erneut abrufen" aus [gemSysL_eRp] gemäß TAB_ILFERP_007 umsetzen. Tabelle # : TAB_ILFERP_007 – Quittung erneut abrufen Name Quittung erneut abrufen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat bereits mindestens einmal die Quittung abgerufen (Anwendungsfall "Quittung abrufen"). Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Die Quittung zum E-Rezept steht im PS bereit. Standardablauf Task-ID und Geheimnis des E-Rezepts bestimmen Quittung abrufen Quittung aus Response extrahieren
</requirement>
<!-- A_19293 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezept abrufen - E-Rezept-Token auswählen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept-Token auszuwählen, zu dem das E-Rezept vom Fachdienst abgerufen werden soll.
</requirement>
<!-- A_19294 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezept abrufen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.1 - E-Rezept abrufen" aus [gemSysL_eRp] gemäß TAB_ILFERP_005 umsetzen. Tabelle # : TAB_ILFERP_005 – E-Rezept abrufen Name E-Rezept abrufen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat den E-Rezept-Token zum E-Rezept übermittelt bekommen. Der E-Rezept-Token steht im PS bereit. Der Nutzer hat das E-Rezept zum Abruf markiert. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Das E-Rezept steht im PS bereit. Standardablauf Task-ID und AccessCode des E-Rezepts bestimmen Task herunterladen QES prüfen Verordnung extrahieren E-Rezept-Daten speichern
</requirement>
<!-- A_19630-01 -->
<requirement conformance="SHALL" title="PS abgebende LEI: 2D-Code scannen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, einen 2D-Code für das Zuweisen von E-Rezepten oder zum Ändern einer Abrechnungsinformation einzuscannen.
</requirement>
<!-- A_19631-01 -->
<requirement conformance="SHALL" title="PS abgebende LEI: 2D-Code scannen - Token extrahieren">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den oder die Token aus einem eingescannten 2D-Code extrahieren.
</requirement>
<!-- A_19745-01 -->
<requirement conformance="MAY" title="PS abgebende LEI: E-Rezept abrufen - QES prüfen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI KANN im Anwendungsfall "E-Rezept abrufen" die QES des E-Rezepts prüfen. Zum Prüfen der QES des E-Rezepts ist die Operation POST //Konnektorservice mit Header "SOAPAction: \"http://ws.gematik.de/conn/SignatureService/v7.4#VerifyDocument\"" PKCS#7-Datei in SignatureObject auszuführen.
</requirement>
<!-- A_19900 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezept abrufen - E-Rezept-Bundle extrahieren">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept abrufen" die Daten zum E-Rezept-Bundle zur Weiterverarbeitung extrahieren.
</requirement>
<!-- A_19901 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezept abrufen - Daten speichern">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept abrufen" das E-Rezept-Bundle und das Secret im PS speichern.
</requirement>
<!-- A_20088 -->
<requirement conformance="SHOULD" title="PS: Schreiben eines Fehlerprotokolls">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das Primärsystem SOLL alle in der Kommunikation mit den Diensten der TI auftretenden Fehler und Warnungen in ein dediziertes Fehlerprotokoll schreiben und diese Protokollinformationen für Supportmaßnahmen über eine Zeitraum von mindestens 14 Tagen zur Verfügung halten.
</requirement>
<!-- A_20089 -->
<requirement conformance="SHOULD" title="PS: Anzeige von Meldungen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das Primärsystem SOLL alle in der Kommunikation mit den Diensten der TI auftretenden Probleme für den Benutzer verständlich anzeigen und dabei erkennen lassen, ob durch den Anwender oder den verantwortlichen Leistungserbringer Maßnahmen zur Behebung eingeleitet werden müssen.
</requirement>
<!-- A_20152 -->
<requirement conformance="SHALL" title="PS: Verständliche Fehlermeldung">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS MUSS im Falle von Fehlern Fehlermeldungen bereitstellen, die es den Mitarbeitern der Leistungserbringerinstitution ermöglichen, die Ursache des Fehlers zu identifizieren und mögliche Gegenmaßnahmen zu ergreifen.
</requirement>
<!-- A_20884 -->
<requirement conformance="SHOULD" title="PS: Exponential Backoff bei Verbindungsfehlern">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das Primärsystem SOLL bei serverseitigen Fehlermeldungen, die auf eine Überlastung des Zielsystems schließen lassen (z.B. http-status 5xx, 429 - too many requests, etc.), erneute Verbindungsversuche nach dem Prinzips des Exponential Backoffs [ExpBack] durchführen.
</requirement>
<!-- A_21242 -->
<requirement conformance="SHALL" title="PS: Unterstützung Konnektorversion">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das Primärsystem MUSS Konnektoren ab PTV 3 für das E-Rezept unterstützen.
</requirement>
<!-- A_21468 -->
<requirement conformance="SHALL" title="PS: Handbuch-Hinweis Konnektor Default-Gateway für offene Fachdienste">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Der Hersteller des Primärsystems MUSS in seinem Handbuch auf die verschiedenen Installationsszenarien und Konfigurationen des Konnektors in [gemSpec_KON#Anhang K] hinweisen, damit der Konnektor im Rahmen der Installation und Konfiguration des PS für das E-Rezept als Default-Gateway bzw. notwendige Routinginformationen und DNS-Konfigurationen im Gerät festgelegt werden können.
</requirement>
<!-- A_21723 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Übergabe E-Rezept-Token an Apotheke">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, die Einlöseinformationen (Task.id und AccessCode) als E-Rezept-Token über ein sicheres Übermittlungsverfahren zu empfangen.
</requirement>
<!-- A_22078 -->
<requirement conformance="SHALL" title="PS abgebende LEI: 2D-Code scannen - Gescannte Inhalte prüfen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS die gescannten Inhalte vor einer weiteren Verarbeitung validieren, um sich vor Schadsoftware zu schützen.
</requirement>
<!-- A_22435 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - VSD und PNW von eGK lesen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die eGK mittels der Konnektor-Operation ReadVSD mit den Parametern PerformOnlineCheck=true und ReadOnlineReceipt=true auslesen.
</requirement>
<!-- A_22436 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - Abbruch bei Fehler ReadVSD">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Anwendungsfall abbrechen, wenn die Operation ReadVSD mit einem Fehler antwortet oder im Response kein Prüfungsnachweis enthalten ist, um den Anwendungsfall nur fortzuführen, wenn der Operationsaufruf ReadVSD mit der Option "Onlineprüfung durchführen" erfolgreich durchgeführt werden konnte.
</requirement>
<!-- A_22637 -->
<requirement conformance="SHALL" title="PS abgebende LEI: 2D-Code scannen - Mehrfachverordnung - Teilverordnungen nicht speichern">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI DARF die E-Rezept-Token von Teilverordnungen einer Mehrfachverordnung, deren Einlösefrist noch nicht begonnen hat, NICHT automatisch speichern.
</requirement>
<!-- A_23152 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - nicht belieferte E-Rezepte zurückgeben">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Nutzer geeignet unterstützen, heruntergeladene und damit reservierte E-Rezepte, welche nicht beliefert werden, wieder zurückzugeben, um dem Versicherten zu ermöglichen, diese in einer anderen Apotheke einzulösen.
</requirement>
<!-- A_23182 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - Prüfungsnachweis URL-kodieren">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den im Aufruf der Operation ReadVSD erhaltenen Prüfungsnachweis URL-kodieren, um ihn als Parameter im Request an den E-Rezept-Fachdienst zu übermitteln.
</requirement>
<!-- A_23448-01 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (VSDM)">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "E-Rezepte eines Versicherten durch Abgebenden abrufen" gemäß TAB_ILFERP_020 umsetzen. Tabelle # : TAB_ILFERP_020 – E-Rezepte von Versicherten abrufen (VSDM) Name E-Rezepte von Versicherten abrufen (VSDM) Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Der eGK des Versicherten ist im eHealth-Kartenterminal gesteckt. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Es steht eine Liste von Informationen mit Task-ID und zugehörigen AccessCode zu einlösbaren E-Rezepten des Versicherten für die Weiterverarbeitung zu Verfügung. Standardablauf VSD der eGK lesen VSDM Prüfungsnachweis ermitteln Hashwert hcv ermitteln E-Rezepte abrufen
</requirement>
<!-- A_23449-02 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - E-Rezepte abrufen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die HTTP-Operation GET /Task mit ACCESS_TOKEN im Authorization-Header base64- und URL-codierter Prüfungsnachweis in URL-Parameter pnw Versicherten-ID in URL-Parameter kvnr Base64URLSafe-kodierter Hashwert hcv in URL-Parameter hcv ausführen.
</requirement>
<!-- A_23779 -->
<requirement conformance="MAY" title="PS abgebende LEI: 2D-Code scannen - Mehrfachverordnung - Teilverordnungen speichern falls gewünscht">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI KANN die E-Rezept-Token von Teilverordnungen einer Mehrfachverordnung, deren Einlösefrist noch nicht begonnen hat, speichern, wenn der Versicherte es wünscht.
</requirement>
<!-- A_24180 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezept erneut abrufen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "E-Rezept erneut abrufen" gemäß TAB_ILFERP_xxx umsetzen. Tabelle # : TAB_ILFERP_xxx – E-Rezepte abrufen Name E-Rezept erneut abrufen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat zuvor das E-Rezept abgerufen (Anwendungsfall "E-Rezept abrufen"). Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Die Informationen zum zu beliefernden E-Rezept liegen im PS vor Standardablauf Task-ID und AccessCode des E-Rezept bestimmen E-Rezept abrufen
</requirement>
<!-- A_24181 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezept erneut abrufen - E-Rezept abrufen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS abgebende LEI MUSS im Anwendungsfall "E-Rezept erneut abrufen" die HTTP-Operation GET /Task/&lt;id&gt; des E-Rezept-Fachdienstes mit ACCESS_TOKEN im Authorization-Header Task-ID in URL &lt;id&gt; AccessCode in URL Parameter ?ac= ausführen.
</requirement>
<!-- A_25460 -->
<requirement conformance="SHALL" title="PS: Fehlerbehandlung - Retry von Anfragen an E-Rezept-Fachdienst">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der verordnenden oder abgebenden LEI MUSS im Falle von Fehlern bei einer Anfrage am E-Rezept-Fachdienst einen Retry und/oder Client-Failover nur gemäß der Fehlerbehandlung in [E-Rezept API Dokumentation] durchführen.
</requirement>
<!-- A_27354 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - Hashwert hcv erzeugen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Hashwert hcv erzeugen.
</requirement>
<!-- A_27355 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - Hashwert hcv Base64URLSafe kodieren">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Hashwert hcv Base64URLSafe kodieren.
</requirement>
<!-- A_27840 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Quittung abrufen - Abruf der Quittung durchführen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "Quittung abrufen" für Verordnungen, welche abschließend verarbeitet wurden, ausführen, um den Workflow am E-Rezept-Fachdienst abzuschließen.
</requirement>
