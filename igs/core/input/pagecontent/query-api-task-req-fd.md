Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Task-Endpunkt.

<!-- A_19030 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-79" title="TI-Flow-Fachdienst - unzulässige Operationen Task" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Task mittels der HTTP-Operationen PUT, HEAD und DELETE sowie POST ohne die Angabe einer gültigen FHIR-Operation unterbinden und mit mit dem folgenden Fehler:
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>405 - Method Not Allowed</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>SVC_METHOD_NOT_ALLOWED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
  abbrechen, damit keine unzulässigen Operationen auf den Rezeptdaten ausgeführt werden können.
</requirement>

Der Zugriff mittels POST und Angabe einer gültigen FHIR-Operation ist unter [Operations](./menu-schnittstellen-operation-api.html) beschrieben.

### GET /Task (Liste)

Der Zugriff mittels der HTTP-Operation GET für die Einsichtnahme in Verordnungen steht ausschließlich dem Versicherten bzw. einer abgebenden Institution mit Nachweis eines Behandlungskontextes zur Verfügung. Die GET-Operation ohne Referenz einer FHIR-Operation führt zu keiner Statusänderung.

<!-- A_21558-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-80" title="TI-Flow-Fachdienst - Liste Task abrufen - Rollenprüfung" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task sicherstellen, dass ausschließlich Versicherte und Leistungserbringer in der Rolle
    <ul>
        <li>oid_versicherter</li>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li> 
    </ul>
    die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_AUTH_ROLE_NOT_ALLOWED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<!-- A_19115-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-81" title="TI-Flow-Fachdienst - Liste Task abrufen - Versicherter- Filter auf KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task die dem Versicherten zugeordneten Task-Ressourcen anhand der KVNR des Versicherten aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in Task.for die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen E-Rezepte einsehen können.
</requirement>

<!-- A_19129-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-82" title="TI-Flow-Fachdienst - Liste Task abrufen - Versicherter - Rückgabe Tasks im Bundle" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task durch einen Versicherten die gültige Ergebnisliste der Task-Ressourcen ohne die referenzierten, signierten E-Rezept-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine Übersicht aller Tasks erhält.
</requirement>

<!-- eGK in der Apotheke -->

<!-- A_27444 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-83" title="TI-Flow-Fachdienst - Rezepte lesen - Konfigurationsparameter RateLimit" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS einen Konfigurationsparameter RATELIMIT_MAX1d_ERROR_UC4_12 verwalten.
</requirement>

Der Defaultwert für RATELIMIT_MAX1d_ERROR_UC4_12 ist 100.

<!-- A_27445 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-84" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - Ratelimit pro Telematik-ID pro Tag" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit dem URL-Parameter pnw="..." durch eine abgebende LEI die Telematik-ID des Aufrufers im ACCESS_TOKEN im HTTP-Requestheader "Authorization" feststellen und den Aufruf in einer Statistik zur Prüfung des Ratelimits erfassen, wenn der Aufruf mit einem Fehler 456 oder 458 abgebrochen wird. Der TI-Flow-Fachdienst MUSS die Statistik zur Prüfung des Ratelimits alle 24h zurück auf 0 setzen.
</requirement>

<!-- A_27446 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-85" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - Ratelimit pro Telematik-ID prüfen" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit dem URL-Parameter pnw="..." durch eine abgebende LEI prüfen, ob mit dem Aufruf die Anzahl RATELIMIT_MAX1d_ERROR_UC4_12 überschritten ist und in diesem Fall den Aufruf mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>423 - Locked</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>SVC_TELEMATIKID_TEMPORARILY_BLOCKED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>The specified Telematik-ID is temporarily blocked</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_23450-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-86" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - Prüfung Prüfungsnachweis" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI,den im Parameter pnw übermittelten Prüfungsnachweis extrahieren, die Version der Prüfziffer bestimmen, den Prüfungsnachweis prüfen und bei Fehlen oder fehlerhafter Prüfung mit dem Fehler 403 abbrechen, damit nur Clients die Operation aufrufen können, welche einen Anwesenheitsnachweis erfolgreich durchgeführt haben.
</requirement>

Die Version der Prüfziffer wird aus der Struktur der Prüfziffer abgeleitet.

In der Version 1 beginnt die Prüfziffer mit einem Großbuchstaben. Die Prüfung des Prüfungsnachweises für Prüfziffer Version 1 ist in Kapitel "HTTP-Operation GET - Prüfung VSDM Prüfungsnachweis (Version 1)" beschrieben.

In der Version 2 ist das erste Byte der Prüfziffer > 128. Die Prüfung des Prüfungsnachweises für Prüfziffer Version 2 ist in Kapitel "HTTP-Operation GET - Prüfung VSDM Prüfungsnachweis (Version 2)" beschrieben.

<!-- A_27287 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-87" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - Vergleich KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI prüfen, ob die in der Prüfziffer übermittelte KVNR identisch ist mit dem Wert im URL-Parameter kvnr="..." und bei Ungleichheit mit dem Fehler 456 abbrechen.
</requirement>

<!-- A_27347 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-88" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - Vergleich hcv" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI prüfen, falls im Operationsaufruf der URL-Parameter hcv übermittelt wurde, den im URL-Parameter übermittelten Wert transformieren, miteinander vergleichen und bei Ungleichheit mit dem Fehler 458 abbrechen.
</requirement>

Die Kodierung und das Format den in der Prüfziffer übermittelten Wert für hcv ist in A_27278-* beschrieben. Das Clientsystem übermittelt hcvBase64URLSafe-kodiert.

<!-- A_23451-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-89" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - Zeitraum Akzeptanz Prüfungsnachweis" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit dem URL-Parameter pnw="..." durch eine abgebende LEI, falls im VSDM Prüfungsnachweis eine Prüfziffer enthalten ist, prüfen, dass die Differenz zwischen Zeitstempel aus der Prüfziffer des Prüfungsnachweises und dem aktuellen Zeitpunkt nicht größer als 30 Minuten (konfigurierbar) ist und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen. Im Fehlerfall ist die Meldung "Anwesenheitsnachweis konnte nicht erfolgreich durchgeführt werden (Zeitliche Gültigkeit des Anwesenheitsnachweis überschritten)." im OperationOutcome zu übermitteln.
</requirement>

Eine mögliche Änderung der Konfiguration für den Zeitraum der Gültigkeit des Prüfungsnachweises erfolgt ausschließlich nach Anpassung von A_23451-* im Rahmen des Änderungsmanagement für Spezifikationen.

<!-- A_23452-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-90" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - Filter Status, KVNR und Workflowtype" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls im VSDM Prüfungsnachweis eine Prüfziffer enthalten ist, die Tasks nach
    <ul>
    <li>Task.status= "ready"</li>
    <li>Task.for = KVNRfür die KVNR aus der Prüfziffer des Prüfungsnachweises</li>
    <li>Task.ExpiryDatenicht vor dem aktuellen Datum liegt</li>
    <li>und Task.extension:flowType = 160 oder 166</li>
    </ul>
    filtern und in einem Bundle der gefundenen Tasks (ohne den signierte Anhang QES) zurückgeben, damit eine Apotheke alle zu einem Versicherten gehörenden E-Rezepte mit dem Status "ready" abrufen kann.
</requirement>

<!-- A_25206 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-91" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls im VSDM Prüfungsnachweis keine Prüfziffer enthalten ist, prüfen, ob das Ergebnis im Prüfungsnachweis gleich 3 ist und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen.
</requirement>

<!-- A_25208-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-92" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - URL kvnr" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI prüfen, ob ein URL-Parameter kvnr="..." übermittelt wurde und bei fehlerhafter Prüfung mit dem Fehler 455 abbrechen.
</requirement>

<!-- A_27346 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-93" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - URL hcv" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI prüfen, falls enforce_hcv_check = TRUE, ob ein URL-Parameter hcv="..." übermittelt wurde und bei fehlerhafter Prüfung mit dem Fehler 457 abbrechen.
</requirement>

<!-- A_25994 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-94" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 - Mappen von IKNR zu VSDM" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls das Ergebnis im VSDM Prüfungsnachweis gleich 3 ist und URL-Parameter kvnr="..." übermittelt wurde, die IKNR des neuesten E-Rezeptes (wenn vorhanden) zum Fachdienst VSDM mappen, damit der TI-Flow-Fachdienst feststellen kann, welcher Status AcceptPN3VSDMxx zu prüfen ist.
</requirement>

Die IKNR ist im Verordnungsdatensatz unter Coverage.payor.identifier.value zu finden.

Der TI-Flow-Fachdienst kann eine Mapping zwischen den IKNR und dem zugehörigen Fachdiensten VSDM erstellen und hierfür das im DNS hinterlegte Mapping zwischen IKNR und den Endpunkten der Fachdienste VSDM nutzen.

<!-- A_25995 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-95" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 - keine E-Rezepte" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls das Ergebnis im VSDM Prüfungsnachweis gleich 3 ist, URL-Parameter kvnr="..." übermittelt wurde und keine E-Rezeptes für den Versicherten im TI-Flow-Fachdienst gespeichert sind, eine leere Liste mit dem Status 202 zurückgeben.
</requirement>

<!-- A_25207 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-96" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 - AcceptPN3 false" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls im VSDM Prüfungsnachweis keine Prüfziffer enthalten, das Ergebnis im Prüfungsnachweis gleich 3 und der passende Status AcceptPN3VSDMxx = false ist mit dem Fehler 454 abbrechen.
</requirement>

<!-- A_25209-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-97" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 - AcceptPN3 true - Filter Status, KVNR und Workflowtype" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit den URL-Parameter pnw="..." durch eine abgebende LEI, falls der passende Status AcceptPN3VSDMxx = true, das Ergebnis im VSDM Prüfungsnachweis gleich 3 ist und URL-Parameter kvnr="..." übermittelt wurde, die Tasks nach 
    <ul>
        <li>Task.status = "ready", </li>
        <li>Task.for = KVNR aus dem URL-Parameter,</li>
        <li>Task.ExpiryDate nicht vor dem aktuellen Datum liegt</li>
        <li>und Task.extension:flowType = 160 oder 166</li>
    </ul>
    filtern und in einem Bundle der gefundenen Tasks (ohne den signierte Anhang QES) zurückgeben, damit eine Apotheke alle zu einem Versicherten gehörenden E-Rezepte mit dem Status "ready" abrufen kann. Der TI-Flow-Fachdienst MUSS für den Response den Returncode 202 verwenden.
</requirement>

<!-- A_22432-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-98" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - Prüfung PoPP-Token" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI, den im HTTP-Header X-PoPP-Token übermittelten Token extrahieren, prüfen und bei Fehlen oder fehlerhafter Prüfung mit dem Fehler 403 abbrechen, damit die Autorisierung zum Zugriff auf die Daten nur erfolgt, wenn ein Anwesenheitsnachweis erfolgreich durchgeführt wurde.
</requirement>

Die Anforderungen zum Prüfen des PoPP-Token sind im Kapitel "HTTP-Operation GET - Prüfung PoPP-Token" beschrieben.

<!-- A_23399-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-99" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - PoPP - Zeitraum Akzeptanz PoPP-Token" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI prüfen, dass die Differenz zwischen Zeitstempel iat im Token und dem aktuellen Zeitpunkt nicht größer als 30 Minuten (konfigurierbar) ist und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen.
</requirement>

Eine mögliche Änderung der Konfiguration für den Zeitraum der Gültigkeit des PoPP-Token erfolgt ausschließlich nach Anpassung von A_23399-* im Rahmen des Änderungsmanagement für Spezifikationen.

<!-- A_22431-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-100" title="TI-Flow-Fachdienst - Rezepte lesen - Apotheke - PoPP - PoPP - Filter KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task mit HTTP-Header X-PoPP-Token durch eine abgebende LEI mit der Rolle 
    <ul>
    <li>oid_oeffentliche_apotheke</li>
    <li>oid_krankenhausapotheke</li>
    </ul>
    , die Tasks nach  
    <ul>
    <li>Task.status = "ready",</li>
    <li>Task.for = KVNR aus dem PoPP-Token (patientId),</li>
    <li>Task.ExpiryDate nicht vor dem aktuellen Datum liegt</li>
    <li>und Task.extension:flowType = 160 oder 166</li>
    </ul>
    filtern und in einem Bundle der gefundenen Tasks (ohne den signierte Anhang QES) zurückgeben, damit eine abgebende LEI alle zu einem Versicherten gehörenden einlösbaren E-Rezepte mit dem Status "offen" abrufen kann.
</requirement>

Diese Operation führt nicht zu einer Statusänderung bei den zurück gelieferten Task Ressourcen.

####  Prüfung VSDM Prüfungsnachweis

Der VSDM Prüfungsnachweis wird URL-codiert übertragen.

Das Informationsmodel des VSDM Prüfungsnachweises ist in [gemSysL_VSDM] beschrieben.

Die Struktur der VSDM Prüfziffer ist in A_23453-* (siehe Änderungseintrag C_11321) beschrieben.

<table>
    <tr>
        <th>Nr</th>
        <th>Feld</th>
        <th>Format</th>
        <th>Länge</th>
    </tr>
    <tr>
        <td>1</td>
        <td>10-stelliger unveränderlicher Teil der KVNR</td>
        <td>alphanummerisch</td>
        <td>10</td>
    </tr>
    <tr>
        <td>2</td>
        <td>aktueller Unix Timestamp</td>
        <td>alphanummerisch</td>
        <td>10</td>
    </tr>
    <tr>
        <td>3</td>
        <td>
        Grund des Updates<br>
        U – Update Flag Service (UFS) Anfrage<br>
        V – Versichertenstammdaten (VSD) Update<br>
        C – Kartenmanagement (CMS) Update<br>
        </td>
        <td>alphanummerisch</td>
        <td>1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>Kennung des Betreibers Fachdienste VSDM gemäß Liste der gematik</td>
        <td>alphanummerisch</td>
        <td>1</td>
    </tr>
    <tr>
        <td>5</td>
        <td>Version des Hash-Schlüssels</td>
        <td>alphanummerisch</td>
        <td>1</td>
    </tr>
    <tr>
        <td>6</td>
        <td>
        HMAC: ersten 24 Byte der Ausgabe der SHA-256 Hashfunktion mit dem betreiberspezifischen Schlüssel für die konkatinierten Felder 1-5
        </td>
        <td>binär</td>
        <td>24</td>
    </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>Struktur VSDM Prüfziffer</figcaption></div>

<!-- A_23454 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-101" title="TI-Flow-Fachdienst - Prüfung Prüfziffer" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS die Prüfung des VSDM Prüfungsnachweises wie folgt umsetzen: 
    <ol type ="1">
        <li>die Prüfziffer aus dem Prüfungsnachweis extrahieren</li>
        <li>Falls eine Prüfziffer im Prüfungsnachweis enthalten ist:
        <ol type="a">
            <li>HMAC-Schlüssel auf Basis Kennung des Betreibers (Feld 4) und Version des Hash-Schlüssels (Feld 5) ermitteln</li>
            <li>HMAC über Felder 1-5 der übermittelten Prüfziffer berechnen</li>
            <li>Berechneten HMAC mit dem in der Prüfziffer übermittelten HMAC auf Gleichheit prüfen</li>
        </ol>
        </li>
    </ol>
</requirement>

Der Vergleich für die Ermittlung des HMAC-Schlüssel (2.a.) erfolgt case-sensitive.

Der TI-Flow-Fachdienst verwaltet HMAC-Schlüssel, welche durch die Betreiber der Fachdienste VSDM bereitgestellt werden. Ein HMAC-Schlüssel wird durch die Kennung des Betreibers des Fachdienstes VSDM und der Version des Schlüssels identifiziert.

<!-- A_23456-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-102" title="TI-Flow-Fachdienst - Prüfung Prüfziffer - Berechnung HMAC der Prüfziffer" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS, falls im VSDM Prüfungsnachweis eine Prüfziffer enthalten ist, für den HMAC der Prüfziffer die führenden 23 Byte der Prüfziffer (Felder 1-5) mittels SHA-256 Hashfunktion berechnen und für den nachfolgenden Vergleich die ersten 24 Byte verwenden.<br>
    Der TI-Flow-Fachdienst MUSS im Fehlerfall die Meldung "Anwesenheitsnachweis konnte nicht erfolgreich durchgeführt werden (Fehler bei Prüfung der HMAC-Sicherung)." im OperationOutcome zu übermitteln.
</requirement>

Die Ausgabelänge der SHA-256 Hashfunktion ist 32 Byte lang. Für die Prüfziffer werden die ersten 24 Byte verwendet. Die restlichen Bytes werden verworfen.

#### Prüfung VSDM Prüfungsnachweis (Version 2)

Der VSDM Prüfungsnachweis wird URL-codiert übertragen.

Das Informationsmodel des VSDM Prüfungsnachweises ist in [gemSysL_VSDM] beschrieben.

Die Struktur der VSDM Prüfziffer Version 2 ist in [gemSpec_Krypt#A_27278-* VSDM-FD: Struktur einer Prüfziffer der Version 2] beschrieben.

<!-- A_27301 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-103" title="TI-Flow-Fachdienst - Prüfung und Entschlüsselung Prüfziffer Version 2" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS eine Prüfziffer Version 2 gemäß [gemSpec_Krypt#A_27279-*] entschlüsseln und prüfen.
</requirement>

Hinweis: Der Abgleich der erfolgreich entschlüsselten KVNR mit der vom Client gesendeten KVNR erfolgt in A_27287-&#42;. Der Abgleich des erfolgreich entschlüsselten Hashwert hcv mit der vom Client übermittelten hcv erfolgt in A_27347-&#42;.

#### HTTP-Operation GET - Prüfung PoPP-Token
Wenn der TI-Flow-Fachdienst in einem Aufruf einen PoPP-Token empfängt muss geprüft werden, dass der Token vom PoPP-Service ausgestellt wurde. Hierzu wird die Signatur des PoPP-Tokens geprüft.

Der TI-Flow-Fachdienst setzt gemäß [gemSpec_PoPP_Service] in der Rolle PoPP-Verifier folgende Prüfschritte via TI-PKI um (siehe [gemSpec_PoPP_Service#5.1.2 PoPP-Token Prüfung], A_27015):

<table>
<tr>
<th>Prüfschritt</th>
<th>Anforderung</th>
<th>Beschreibung</th>
</tr>
<tr>
<td>Beziehen der URL für den PoPP-Service</td>
<td>A_27358</td>
<td>Die URL des PoPP-Service wird per Konfiguration im TI-Flow-Fachdienst hinterlegt. Deshalb kann auf die Abfrage der URL des PoPP-Service beim Federation Master verzichtet werden.</td>
</tr>
<tr>
<td>Beziehen der Schlüssel für die PoPP-Token Signaturprüfung</td>
<td>A_26449</td>
<td>Der PoPP-Service veröffentlicht sein EntityStament nach OpenID-Connect Standard. Dort ist die URL hinterlegt, an dem das JWK-Set abgerufen werden kann.</td>
</tr>
<tr>
<td>Prüfung Signatur des JWK-Set</td>
<td>A_26534</td>
<td>Der TI-Flow-Fachdienst bezieht aus dem Entity Statement des PoPP-Service den öffentlichen Schlüssel zur Prüfung der Signatur des JWK-Set und prüft dieses anschließend.</td>
</tr>
<tr>
<td>Prüfung Signaturzertifikat des JWK via TI-PKI</td>
<td>A_27016</td>
<td>Der TI-Flow-Fachdienst prüft die Echtheit des Signaturzertifikats aller JWK's im JWKS via TUC-PKI 18. Dies ist die Grundlage für den Vertrauensanker zur Signaturprüfung von PoPP-Token.</td>
</tr>
<tr>
<td>Durchführung der Signaturprüfung von PoPP-Token</td>
<td>A_26450</td>
<td>Der TI-Flow-Fachdienst führt die Signaturprüfung der PoPP-Token mit validen Signaturzertifikaten durch.</td>
</tr>
<tr>
<td>Inhaltliche Prüfung des PoPP Tokens</td>
<td>A_26452</td>
<td>Der TI-Flow-Fachdienst validiert, ob der PoPP-Token inhaltlich valide ist.<br>Prüfungen von Claims für den TI-Flow-Fachdienst sind im Kapitel "Ressource Task - HTTP-Operation GET - Prüfung PoPP-Token" beschrieben.</td>
</tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_030 Prüfschritte PoPP-Token</figcaption></div>

Anstelle zur nicht zugewiesenen Anforderung  A_27358 - Beziehen der URL für den PoPP-Service

<!-- A_28579 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-104" title="TI-Flow-Fachdienst - Prüfung PoPP-Token - Apotheke - PoPP Prüfung - Konfiguration PoPP-Service URL" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS einen Konfigurationsparameter PoPP_Service_Domain für die Domain des PoPP-Service verwalten.
</requirement>

Ergänzung der stündlichen Abfrage des JWKS zu A_26449 - Beziehen der Schlüssel für die PoPP-Token Signaturprüfung :

<!-- A_28580 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-105" title="TI-Flow-Fachdienst - Prüfung PoPP-Token - Aktualisierung des PoPP-Service JWK-Sets" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS stündlich die JWK-Set des PoPP-Service [RFC7517] über dem im Entity Statement metadata.oauth_resource.signed_jwks_uri angegeben URL abrufen und die öffentlichen Schlüssel zur Verifikation der PoPP-Token verwenden.
</requirement>

Der TI-Flow-Fachdienst prüft zur Umsetzung von A_27016-* das Signaturzertifikat des PoPP-Service wie folgt:

<!-- A_28724 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-106" title="TI-Flow-Fachdienst - Prüfung PoPP-Token - Prüfung Signaturzertifikat PoPP-Service" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das Signatur-Zertifikat des PoPP-Service für die Signatur des PoPP-Token gemäß [gemSpec_PKI#TUC_PKI_018] mit folgenden Parametern auf Gültigkeit prüfen:
    <table>
    <tr>
    <th>Parameter</th>
    <th></th>
    </tr>
    <tr>
    <td>Zertifikat</td>
    <td>Signaturzertifikat des PoPP-Service</td>
    </tr>
    <tr>
    <td>PolicyList</td>
    <td>oid_zd_sig</td>
    </tr>
    <tr>
    <td>intendedKeyUsage</td>
    <td>nonRepudiation</td>
    </tr>
    <tr>
    <td>intendedExtendedKeyUsage</td>
    <td>(leer)</td>
    </tr>
    <tr>
    <td>OCSP-Graceperiod</td>
    <td>60 Minuten</td>
    </tr>
    <tr>
    <td>Offline-Modus</td>
    <td>nein</td>
    </tr>
    <tr>
    <td>Prüfmodus</td>
    <td>OCSP</td>
    </tr>
    </table>
    <div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_031 Parameter Prüfung Signaturzertifikat PoPP-Service</figcaption></div>

    Das Signaturzertifikat muss gemäß dem TUC als befunden werden und im Fehlerfall das Signaturzertifikat nicht zur Signaturprüfung der PoPP-Token verwenden, damit sichergestellt wird dass, ausschließlich PoPP-Token von einem vertrauenswürdigen PoPP-Service akzeptiert werden.
</requirement>

Der TUC gibt neben dem Status der Zertifikatsprüfung auch die im Zertifikat enthaltene Rolle (Admission) zurück. Der TI-Flow-Fachdienst prüft zur Umsetzung von A_27016-* die Rolle. wie folgt:

<!-- A_28731 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-107" title="TI-Flow-Fachdienst - Prüfung PoPP-Token - Prüfung Rolle Signaturzertifikat PoPP-Service" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS prüfen, dass die im Zertifikat enthaltene Rolle (Admission) gleich oid_popp-token ist und im Fehlerfall das Signaturzertifikat nicht zur Signaturprüfung der PoPP-Token verwenden.
</requirement>

Der TI-Flow-Fachdienst prüft zur Umsetzung von A_26452-* die Telematik-ID aus dem PoPP-Token wie folgt:

<!-- A_23402-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-108" title="TI-Flow-Fachdienst - Prüfung PoPP-Token - Telematik-ID prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS bei der Prüfung des PoPP-Token prüfen, dass die Telematik-ID actor_id aus dem Token mit der Telematik-ID der Leistungserbringerinstitution (idNumber) im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests übereinstimmt und bei fehlerhafter Prüfung mit dem Fehler 403 abbrechen.
</requirement>

### GET /Task/<id> (Einzelne Verordnung)

Der Zugriff mittels der HTTP-Operation GET für die Einsichtnahme in eine spezifische Verordnung steht ausschließlich dem Versicherten bzw. einer abgebenden Institution mit Wissen um das Secret zur Verfügung. Die GET-Operation ohne Referenz einer FHIR-Operation führt zu keiner Statusänderung.

<!-- A_19113-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-109" title="TI-Flow-Fachdienst - Task abrufen - Rollenprüfung" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen konkreten über &lt;id&gt; adressierten /Task/&lt;id&gt; (ohne die Referenz einer FHIR-Operation) sicherstellen, dass ausschließlich Clientsysteme in einer der Rollen 
    <ul>
        <li>oid_versicherter</li>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
        <li>oid_kostentraeger</li> 
    </ul>
    die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_AUTH_ROLE_NOT_ALLOWED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-407" title="TI-Flow-Fachdienst - Task abrufen - Versicherter - Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in Task.for.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>???</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>???</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>???</td>
        </tr>
    </table> 
  abbrechen, damit ausschließlich der begünstigte Versicherte den Task abrufen kann.
</requirement>
<!-- ToDo Hendre: Fehler ergänzrn -->

<!-- A_21375-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-111" title="TI-Flow-Fachdienst - Task abrufen - Versicherter - Rückgabe Task inkl. Bundles" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; durch einen Versicherten die einzelne Task-Ressource um das referenzierte, serverseitig signierte E-Rezept-Bundle aus Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 als search.include im Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in den Task und den signierten Verordnungsdatensatz für eigene Dokumentationszwecke erhält.
</requirement>

<!-- A_21532-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-112" title="TI-Flow-Fachdienst - Task abrufen - Versicherter - Kein Secret" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /Task und GET /Task/&lt;id&gt; durch einen Versicherten oid_versicherter ein optional vorhandenes Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret aus dem zurückgegebenen Task entfernen, sodass Versicherte nicht in Kenntnis des Secrets gelangen, welches die Prozesshoheit der abgebenden Institution darstellt.
</requirement>

<!-- A_20702-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-113" title="TI-Flow-Fachdienst - Task abrufen - Keine Einlöseinformationen in unbekannten Clients" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/&lt;id&gt; ausschließlich solchen Clients die AccessCode Information (Task.identifier mit system="https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" ) in den Task-Ressourcen zurückgeben, welche anhand der mitgeteilten, gültigen Produktidentifikation als hierfür zulässige Clients erkannt werden.
</requirement>


<!-- A_24176-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-114" title="TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Verordnung abrufen - Prüfung Telematik-ID" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?ac=..." durch eine abgebende Institution die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden Institution mit der Telematik-ID aus dem ACCESS_TOKEN vergleichen und bei Ungleichheit die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>412 - Bad Request</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_AUTH_NOT_OWNER</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit der Zugriff auf diesen Datensatz nur durch Berechtigte erfolgt.
</requirement>

<!-- A_24177-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-115" title="TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Verordnung abrufen - Prüfung AccessCode" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?ac=..." durch eine abgebende Institution den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_ACCESSCODE_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCode erfolgen.
</requirement>

<!-- A_24178-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-116" title="TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Verordnung abrufen - Prüfung Status" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?ac=..." durch eine abgebende Institution den im referenzierten Task gespeicherten Status Task.status prüfen und, wenn Task.status ungleich "in-progress" und ungleich "completed" ist, die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>412 - Precondition Failed</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_TASK_STATUS_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit der Datensatz nur abgerufen werden, kann, wenn sich die Verordnung in Belieferung befindet oder der Workflow abgeschlossen ist.
</requirement>

<!-- A_24179-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-117" title="TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Verordnung abrufen - erneuter Abruf Verordnung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?ac=..." durch eine abgebende Institution den Task mit dem Geheimnis Task.identifier:Secret sowie im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurückgeben.
</requirement>

<!-- A_19226-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-118" title="TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Rückgabe Task inkl. Bundle im Bundle" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?secret=..." durch eine abgebende Institution den Task, sofern er den Status "completed" hat, um das referenzierte, serverseitig signierte Quittungs-Bundle aus Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 als search.include im Ergebnis-Bundle ergänzen und die Ergebnismenge Task + Quittungs-Bundle an den Abgebenden zurückgeben, damit ein Abgebender, der ein konkretes E-Rezept beliefert hat, bei Bedarf genau dieses belieferte E-Rezept inkl. der Quittung erneut abrufen kann.
</requirement>


### PATCH /Task

Der Zugriff mittels der HTTP-Operation PATCH steht ausschließlich dem Versicherten zur Verfügung. Die PATCH-Operation führt zu keiner Statusänderung des Tasks.

<!-- A_27548 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-120" title="TI-Flow-Fachdienst – Task markieren - alles Markieren verbieten" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /Task ohne Angabe einer &lt;id&gt; für eine konkrete Ressource mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>405 - Method Not Allowed</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_TASK_ID_REQUIRED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, um das Markieren mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<!-- A_27549 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-121" title="TI-Flow-Fachdienst - Task markieren - Versicherter - Rollenprüfung Versicherter markiert Rezepte" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei Aufruf der HTTP-PATCH-Operation auf den Endpunkt /Task/&lt;id&gt; sicherstellen, dass ausschließlich Versicherte in der Rolle: 
     <ul>
        <li>oid_versicherter</li>
     </ul>
     die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_AUTH_ROLE_NOT_ALLOWED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit E-Rezepte nicht durch Unberechtigte markiert werden können.
</requirement>

<!-- A_27550 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-122" title="TI-Flow-Fachdienst -Task markieren - Versicherter - Prüfung KVNR" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in Task.for.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_KVNR_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit ausschließlich der begünstigte Versicherte als Berechtigter einen Task ändert.
</requirement>
