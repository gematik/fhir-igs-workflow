Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-task-req-avs.md %}


### Modulspezifische Anforderungen


#### E-Rezepte von Versicherten abrufen (VSDM)

Mit diesem Anwendungsfall kann die abgebende LEI die E-Rezept-Token Information zu allen E-Rezepten mit dem Status "offen" von einem Versicherten, dessen eGK in ein mit dem Konnektor gepairten E-Health-Kartenterminal gesteckt wurde, vom TI-Flow-Fachdienst abrufen.

<!-- A_22435 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-4" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (VSDM) - VSD und PNW von eGK lesen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die eGK mittels der Konnektor-Operation ReadVSD mit den Parametern PerformOnlineCheck=true und ReadOnlineReceipt=true auslesen.
</requirement>

Der Parameter PerformOnlineCheck gibt an, dass eine Onlineprüfung und -aktualisierung durchgeführt werden soll. Der Parameter ReadOnlineReceipt gibt an, dass ein Prüfungsnachweis erstellt und an den aufrufenden Client übermittelt werden soll.

Der Response beinhaltet die Elemente PersoenlicheVersichertendaten, AllgemeineVersicherungsdaten, GeschuetzteVersichertendaten und Pruefungsnachweis. Deren Inhalte sind komprimiert sowie base64-kodiert und müssen vor dem Parsen entsprechend dekodiert werden.

Für weitere Informationen zur Operation ReadVSD siehe [gemILF_PS].

<!-- A_22436 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-5" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (VSDM) - Abbruch bei Fehler ReadVSD" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Anwendungsfall abbrechen, wenn die Operation ReadVSD mit einem Fehler antwortet oder im Response kein Prüfungsnachweis enthalten ist, um den Anwendungsfall nur fortzuführen, wenn der Operationsaufruf ReadVSD mit der Option "Onlineprüfung durchführen" erfolgreich durchgeführt werden konnte.
</requirement>

Der Prüfungsnachweis wird aus dem ReadVSD Response entnommen, URL-kodiert und in den Aufruf des TI-Flow-Fachdienstes übernommen. 

Die Werte für den Hashwert hcv werden aus UC_PersoenlicheVersichertendatenXML.Versicherter.Person.StrassenAdresse.Strasse und UC_AllgemeineVersicherungsdatenXML.Versicherter.Versicherungsschutz.Beginn entnommen. Der Hashwert hcv wird Base64URLSafe-kodiert und in den Aufruf des TI-Flow-Fachdienstes übernommen. 

Die Versicherten-ID kann aus UC_PersoenlicheVersichertendatenXML.Versicherter.Versicherten_ID ermittelt werden.

<!-- A_23182 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-6" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (VSDM) - Prüfungsnachweis URL-kodieren" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den im Aufruf der Operation ReadVSD erhaltenen Prüfungsnachweis URL-kodieren, um ihn als Parameter im Request an den TI-Flow-Fachdienst zu übermitteln.
</requirement>

<!-- A_27354 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-7" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (VSDM) - Hashwert hcv erzeugen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Hashwert hcv erzeugen.
</requirement>

Die Bildungsvorschrift für den Hashwert hcv ist in [gemSpec_Krypt#A_27352-*] beschrieben.

<!-- A_27355 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-8" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (VSDM) - Hashwert hcv Base64URLSafe kodieren" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Hashwert hcv Base64URLSafe kodieren.
</requirement>

Die Vorschrift zum Kodieren ist in https://www.educative.io/answers/what-is-base64urlsafeb64encodes-in-python beschrieben.

<!-- A_23449-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-9" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (VSDM) - E-Rezepte abrufen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die HTTP-Operation GET /Task mit 
    <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>base64- und URL-codierter Prüfungsnachweis in URL-Parameter pnw</li>
    <li>Versicherten-ID in URL-Parameter kvnr</li>
    <li>Base64URLSafe-kodierter Hashwert hcv in URL-Parameter hcv</li>
    </ul>
    ausführen.
</requirement>

Bsp.-URL: GET /Task?kvnr=X11058...&hcv=F9Z...I&pnw=H4sIAAAAA...

#### E-Rezepte von Versicherten abrufen (PoPP)

Mit diesem Anwendungsfall kann die abgebende LEI die Zugriffsinformationen zu allen einlösbaren E-Rezepten von einem Versicherten, dessen eGK mit einem im Rahmen von PoPP zulässigen Kartenlesegerät eingelesen wurde, vom TI-Flow-Fachdienst abrufen.

<!-- A_22435-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-10" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (PoPP) - PoPP-Token abrufen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" einen PoPP-Token vom PoPP-Service abrufen.
</requirement>

Für die Umsetzung siehe [spec-ilf-popp-client].
<!-- ToDo: Link auflösen -->

Hinweis: Im Response des PoPP-Service erhält das PS den PoPP-Token im JWT Compact Serialization Format (s. gemSpec_PoPP_Service#A_26432). Das PS gibt den PoPP-Token im gleichen Format an den TI-Flow-Fachdienst weiter.

<!-- A_22437-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-11" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (PoPP) - E-Rezepte abrufen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die HTTP-Operation GET /Task mit
  <ul>
  <li>ACCESS_TOKEN im Authorization-Header</li>
  <li>PoPP-Token in HTTP-Header X-PoPP-Token</li>
  </ul>
  ausführen.
</requirement>

Im Response ist eine Liste von Tasks enthalten. Für jeden Task sind u.a. folgende Informationen enthalten: Task-ID und AccessCode.

Auf Basis dieser Informationen können die Verordnungsdatensätze zu den E-Rezepten vom TI-Flow-Fachdienst abgerufen werden. Erst dann sind die Inhalte der Verordnungen im AVS bekannt und können mit dem Versicherten abgestimmt werden.

Abgerufene Rezepte, welche nicht durch die Apotheke beliefert werden, müssen durch die Apotheke zurückgegeben (Anwendungsfall "E-Rezept durch Abgebenden zurückgeben") werden.

<!-- A_23152 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-12" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - nicht belieferte E-Rezepte zurückgeben" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Nutzer geeignet unterstützen, heruntergeladene und damit reservierte E-Rezepte, welche nicht beliefert werden, wieder zurückzugeben, um dem Versicherten zu ermöglichen, diese in einer anderen Apotheke einzulösen.
</requirement>
