Zur Übertragung von Daten vom TI-Flow-Fachdienst an die T-Register Schnittstellen des BfArM Webdienst gelten die folgenden Anforderungen:

### Authentifizierung für die Dienste des BfArM

Der TI-Flow-Fachdienst nutzt den OAuth 2.0 Client Credentials Flow nach [OAuth 2.0 RFC 6749, section 4.4](https://tools.ietf.org/html/rfc6749#section-4.4) zur Authentifizierung an den Diensten des BfArM.

Über einen organisatorischen Prozess müssen Client Credentials beim BfArM angefragt werden, welche zur Authentifizierung des TI-Flow-Fachdienst ggü. dem BfArM Webdienst genutzt werden.

<!-- A_27819 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-1" title="Anbieter TI-Flow-Fachdienst - BfArM - Registrierung für Client Credentials am BfArM Webdienst" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der Anbieter des TI-Flow-Fachdienst MUSS sich über einen organisatorischen Prozess Client Credentials für den Zugriff auf den BfArM Webdienst beim BfArM registrieren.
</requirement>

Die technische Authentifizierung erfolgt dann über den `/token` Endpunkt, der durch Angabe der Client Credentials dann einen AccessToken ausstellt. Mit diesem AccessToken ist der TI-Flow-Fachdienst berechtigt Daten am BfArM Webdienst einzustellen.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 500px; margin-bottom: 30px;">
    {% include seq-bfarm-t-rezept-auth.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>Authentifizierung BfArM Webdienst</figcaption>
</figure>

<!-- A_27820 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-2" title="TI-Flow-Fachdienst - BfArM - Prüfung Gültigkeit AccessToken" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS vor dem Zugriff auf den BfArM Webdienst prüfen, ob der zuletzt bezogene AccessToken noch gültig ist und im Falle der Ungültigkeit einen neuen AccessToken über den /ords/rezepte/oauth/token Endpunkt am BfArM Webdienst beziehen.
</requirement>

<!-- A_27821 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-3" title="TI-Flow-Fachdienst - BfArM - Beziehen des AccessTokens" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS zum Beziehen eines AccessTokens den Endpunkt /ords/rezepte/oauth/token am BfArM Webdienst mit folgenden Parametern aufrufen: 
    <table>
      <tr>
        <th>HTTP-Methode </th>
        <td>POST</td>
      </tr>
      <tr> 
        <th>HTTP-Header </th>
        <td>Content-Type: application/x-www-form-urlencoded Authorization: Basic &lt;base64(client_id:client_secret)&gt; </td>
      </tr>
      <tr>
        <th>HTTP-Body </th>
        <td>Form-Parameter: grant_type=client_credential</td>
      </tr>
    </table>
    , um einen AccessToken für den Zugriff auf den BfArM Webdienst zu beziehen.
</requirement>

<!-- A_27822 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-4" title="TI-Flow-Fachdienst - BfArM - AccessToken für Zugriff auf den BfArM Webdienst" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS für den Zugriff auf den BfArM Webdienst einen AccessToken für die Authentifizierung im HTTP-Header wie folgt angeben: 
    <ul>
    <li>Authorization: Bearer &lt;AccessToken vom Token Endpunkt&gt; </li>
    </ul>
    , um auf die Endpunkte des BfArM Webdienstes zugreifen zu können.
</requirement>


### Lokalisierung

<!-- A_27882 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-5" title="TI-Flow-Fachdienst - BfArM - Lokalisierung Konfigurationsparameter BfArM_Domain" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS einen Konfigurationsparameter BfArM_Domain für die Domain des BfArM Webdienstes verwalten.
</requirement>

Der Defaultwert für den Parameter ist  `https://webapps-public.bfarm.de`.

<!-- A_27817 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-6" title="TI-Flow-Fachdienst - BfArM - Lokalisierung des BfArM Webdienstes" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS zur Lokalisierung des BfArM Webdienstes die im DNS für BfArM_Domain eingestellten Informationen aufrufen.
</requirement>

### Bereitstellung digitaler Durchschlag

Nach Abschluss eines Workflows 166 durch Aufrufen der $close Operation erstellt der TI-Flow-Fachdienst den digitalen Durchschlag für den Vorgang des E-T-Rezeptes. Die fachlichen Informationen hierzu sind im Dokument [gemF_eRp_T-Rezept] dokumentiert.

<!-- A_27823 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-7" title="TI-Flow-Fachdienst - BfArM - Flowtype 166" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS sicherstellen, dass ausschließlich Daten zu Tasks mit dem Flowtype 166 für den Webdienst des BfArM bereitgestellt werden.
</requirement>

<!-- A_27824 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-8" title="TI-Flow-Fachdienst - BfArM - asynchrone Bereitstellung und Übermittlung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS das Übermitteln der Daten an den BfArM Webdienst asynchron zur Bereitstellung der Daten durch die Clientsysteme umsetzen, damit für das bereitstellende Primärsystem der abgebenden Leistungserbringerinstitution keine verlängerte Verarbeitungsdauer der auslösenden Operation auftritt.
</requirement>

Der digitale Durchschlag zum T-Rezept ist ein Artefakt, welches Informationen zum Vorgang eines E-T-Rezeptes bündelt und gesammelt an das BfArM übermittelt.

Als Datengrundlage für diesen Durchschlag dient der Verordnungsdatensatz samt QES, der Dispensierdatensatz, der Task der Verordnung und Daten der Apotheke aus dem FHIR-VZD. Als Kriterium für die Suche nach Apothekendaten im FHIR-VZD wird die Telematik-ID der Apotheke genutzt.

<!-- A_27825 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-9" title="TI-Flow-Fachdienst - BfArM - Suche nach Apothekendaten" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS für das Bereitstellen eines digitalen Durchschlags für ein E-T-Rezept die Daten der abgebenden Apotheke aus dem Verzeichnisdienst ermitteln, indem an den Verzeichnisdienst folgende Abfrage gestellt wird: 
     <ul>
     <li>Abfrage der Ressource "HealthcareService", </li>
     <li>HealthcareServices, deren Organisation aktiv sind, </li>
     <li>HealthcareServices, deren origin tag = ldap ist, </li>
     <li>HealthcareServices, deren Organisation als Identifier die Telematik-ID trägt, die im Dispensierdatensatz angegeben wurde, </li>
     <li>Einbeziehen der Organisation in das Rückgabeergebnis, </li>
     <li>Einbeziehen der Location in das Rückgabeergebnis</li>
     </ul>
</requirement>

**Beispiel Aufruf**

```
<fhir-vzd-url>
/HealthcareService
?organization.active=true
&_tag=ldap
&organization.identifier=https://gematik.de/fhir/sid/telematik-id7C%<telematik-id>
&_include=HealthcareService:organization
&_include=HealthcareService:location
```

Als Antwort erhält der TI-Flow-Fachdienst mit dieser Anfrage genau drei Ressourcen: Organization, HealthcareService und Location, welche die benötigten Daten zur Apotheke für den digitalen Durchschlag enthalten. Alle Daten sind optional im FHIR-VZD eingetragen, d.h. wenn die Daten nicht vorhanden sind, müssen diese nicht im digitalen Durchschlag enthalten sein.

Anschließend erstellt der TI-Flow-Fachdienst den digitalen Durchschlag für den BfArM Webdienst. Dieser basiert auf einem definierten FHIR-Profil.

<!-- A_27826-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-10" title="TI-Flow-Fachdienst - BfArM - Erzeugen digitaler Durchschlag E-T-Rezept" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Bereitstellen eines digitalen Durchschlag für ein T-Rezept an den BfArM Webdienst einen Datensatz nach dem Profil ERP_TPrescription_CarbonCopy erzeugen.
</requirement>

<!-- A_27827 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-11" title="TI-Flow-Fachdienst - BfArM - Anwendungsfall Übertragen des digitalen Durchschlags" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS den Anwendungsfall "Übertragen des digitalen Durchschlags" gemäß Tabelle TAB_eRPFD_029 ausführen. 
    <table>
    <tr>
      <th>Name</th>
      <td>Übertragen des digitalen Durchschlags</td>
    </tr>
    <tr>
      <th>Auslöser</th>
      <td>Abschluss eines E-Rezept Workflows mit Flowtype 166 via Aufruf der $close-Operation</td>
    </tr>
    <tr>
      <th>Akteur</th>
      <td>TI-Flow-Fachdienst</td>
    </tr>
    <tr>
      <th>Vorbedingung</th>
      <td>
        <ul>
          <li>Dem TI-Flow-Fachdienst liegen Client Credentials des BfArM zur Authentifizierung vor</li>
          <li>Verordnungsdaten, Dispensierinformationen und Informationen aus dem FHIR-VZD liegen vor</li>
          <li>Ein gültiger AccessToken für den Zugriff auf den BfArM Webdienst liegt vor</li>
        </ul>
      </td>
    </tr>
    <tr>
      <th>Nachbedingung</th>
      <td>Am BfArM Webdienst wurde der digitale Durchschlag E-T-Rezept erfolgreich übertragen.</td>
    </tr>
    <tr>
      <th>Standardablauf</th>
      <td>
        <ol>
          <li>Prüfen, ob ein gültiger AccessToken vorliegt.</li>
          <li>Falls nicht: Client Credentials an den Token-Endpunkt übertragen.</li>
          <li>AccessToken speichern.</li>
          <li>Erzeugen des digitalen Durchschlags E-T-Rezept.</li>
          <li>Auftrag zur Übertragung des digitalen Durchschlags E-T-Rezept in einer Warteschlange einstellen.</li>
          <li>Aufruf des Endpunktes <code>/ords/rezepte/t-rezept/v1</code>.</li>
          <li>Nach erfolgreicher Übertragung: Löschen des Auftrags aus der Warteschlange.</li>
        </ol>
      </td>
    </tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>title</figcaption></div>
</requirement>

<!-- A_27828 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-12" title="TI-Flow-Fachdienst - BfArM - Übertragen des digitalen Durchschlags" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS für das Übertragen eines digitalen Durchschlags den BfArM Webdienst RESTful wie folgt aufrufen: 
     <table>
      <tr>
        <th>HTTP-Parameter</th>
        <th>Wert</th>
      </tr>
      <tr>
        <td>Methode</td>
        <td>POST</td>
      </tr>
      <tr>
        <td>Endpunkt</td>
        <td>/ords/rezepte/t-rezept/v1</td>
      </tr>
      <tr>
        <td>Header</td>
        <td>
          <ul>
            <li>Authorization: Bearer &lt;AccessToken&gt;</li>
            <li>Content-Type: application/fhir+json</li>
            <li>X-Request-ID: &lt;random-uuid&gt;</li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>Body</td>
        <td>&lt;digitaler Durchschlag E-T-Rezept&gt;</td>
      </tr>
    </table>
</requirement>

### Fehlerbehandlung

Bei der Suche nach Apothekendaten basierend auf der Telematik-lD besteht die Möglichkeit, dass im FHIR-VZD kein Eintrag gefunden wird Falls zu der zu übermittelnden Apotheke (Identifikation durch die Telematik-lD) kein entsprechender Eintrag im FHIR-VZD gefunden werden kann, setzt der TI-Flow-Fachdienst folgendes um:

1. Die betroffene Telematik-ID wird unverändert in den digitalen Durchschlag aus den Dispensierinformationen übernommen.
2. Der Wert für organizationName wird aus dem ACCESS_TOKEN der Anfrage als Name der Apotheke im digitalen Durchschlag gesetzt. Sollte der organizationName aus ACCESS_TOKEN nicht gesetzt sein (NULL), dann wird "unbekannt" als Name der Apotheke im digitalen Durchschlag gesetzt.
3. Der Datensatz wird an den BfArM-Webdienst übertragen.
4. Sollte der übermittelte Datensatz durch das BfArM untersucht werden müssen, erfolgt eine bilaterale Abstimmung zwischen gematik und BfArM zur Klärung des Sachverhalts.

Dieses Vorgehen stellt sicher, dass die Übertragung an das T-Register nicht aufgrund eines fehlenden FHIR-VZD-Eintrags blockiert wird und gleichzeitig die Nachvollziehbarkeit über die Telematik-ID gewährleistet bleibt.

<!-- A_27830 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-13" title="TI-Flow-Fachdienst - BfArM - Fehlerbehandlung - Reaktion auf Scheitern des Operationaufrufs" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS die Datenübermittlung an den BfArM Webdienst für mindestens eine Minute unterbrechen, wenn ein Aufruf mit dem Statuscode 500 oder 429 scheitert. Bei anhaltenden Problemen MUSS der TI-Flow-Fachdienst einen exponentiellen Backoff-Mechanismus anwenden, der die Wartezeit zwischen den Versuchen sukzessive verdoppelt, um die Systembelastung zu minimieren.
</requirement>

<!-- A_27831 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-14" title="TI-Flow-Fachdienst - BfArM - Fehlerbehandlung - Protokollierung struktureller Fehler" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS den Aufruf am BfArM Webdienst als fehlerhaft kennzeichnen und eine detaillierte Fehlermeldung für interne Analysezwecke protokollieren, wenn der BfArM Webdienst auf einen Operationsaufruf mit einem Statuscode 400 (Bad Request) oder 422 (Unprocessable Entity) reagiert.
</requirement>
