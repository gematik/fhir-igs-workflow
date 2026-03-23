# AVS-Anforderungen: Task-Query - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **AVS-Anforderungen: Task-Query**

## AVS-Anforderungen: Task-Query

Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Task`-Query-Endpunkte.

#### Recovery Secret

Das PS der abgebenden LEI MUSS im Anwendungsfall "Recovery Secret" für das E-Rezept die HTTP-Operation GET /Task/<id>/ mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Access_Code in URL-Parameter ?ac=
ausführen.
#### Quittung erneut abrufen

Mit diesem Anwendungsfall kann eine abgebende LEI die Quittung erneut abrufen, falls bei der Übermittlung vom E-Rezept-Fachdienst ein Fehler aufgetreten ist.

Der Anwendungsfall kann bei Bedarf wiederholt werden.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Quittung erneut abrufen" für das E-Rezept die HTTP-Operation GET /Task/<id>/ mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.
### Modulspezifische Anforderungen

#### E-Rezepte von Versicherten abrufen (VSDM)

Mit diesem Anwendungsfall kann die abgebende LEI die E-Rezept-Token Information zu allen E-Rezepten mit dem Status “offen” von einem Versicherten, dessen eGK in ein mit dem Konnektor gepairten E-Health-Kartenterminal gesteckt wurde, vom E-Rezept-Fachdienst abrufen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die eGK mittels der Konnektor-Operation ReadVSD mit den Parametern PerformOnlineCheck=true und ReadOnlineReceipt=true auslesen.
Der Parameter PerformOnlineCheck gibt an, dass eine Onlineprüfung und -aktualisierung durchgeführt werden soll. Der Parameter ReadOnlineReceipt gibt an, dass ein Prüfungsnachweis erstellt und an den aufrufenden Client übermittelt werden soll.

Der Response beinhaltet die Elemente PersoenlicheVersichertendaten, AllgemeineVersicherungsdaten, GeschuetzteVersichertendaten und Pruefungsnachweis. Deren Inhalte sind komprimiert sowie base64-kodiert und müssen vor dem Parsen entsprechend dekodiert werden.

Für weitere Informationen zur Operation ReadVSD siehe [gemILF_PS].

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Anwendungsfall abbrechen, wenn die Operation ReadVSD mit einem Fehler antwortet oder im Response kein Prüfungsnachweis enthalten ist, um den Anwendungsfall nur fortzuführen, wenn der Operationsaufruf ReadVSD mit der Option "Onlineprüfung durchführen" erfolgreich durchgeführt werden konnte.
Der Prüfungsnachweis wird aus dem ReadVSD Response entnommen, URL-kodiert und in den Aufruf des E-Rezept-Fachdienstes übernommen. 

Die Werte für den Hashwert hcv werden aus UC_PersoenlicheVersichertendatenXML.Versicherter.Person.StrassenAdresse.Strasse und UC_AllgemeineVersicherungsdatenXML.Versicherter.Versicherungsschutz.Beginn entnommen. Der Hashwert hcv wird Base64URLSafe-kodiert und in den Aufruf des E-Rezept-Fachdienstes übernommen. 

Die Versicherten-ID kann aus UC_PersoenlicheVersichertendatenXML.Versicherter.Versicherten_ID ermittelt werden.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den im Aufruf der Operation ReadVSD erhaltenen Prüfungsnachweis URL-kodieren, um ihn als Parameter im Request an den E-Rezept-Fachdienst zu übermitteln.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Hashwert hcv erzeugen.
Die Bildungsvorschrift für den Hashwert hcv ist in [gemSpec_Krypt#A_27352-*] beschrieben.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Hashwert hcv Base64URLSafe kodieren.
Die Vorschrift zum Kodieren ist in https://www.educative.io/answers/what-is-base64urlsafeb64encodes-in-python beschrieben.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die HTTP-Operation GET /Task mit
* ACCESS_TOKEN im Authorization-Header
* base64- und URL-codierter Prüfungsnachweis in URL-Parameter pnw
* Versicherten-ID in URL-Parameter kvnr
* Base64URLSafe-kodierter Hashwert hcv in URL-Parameter hcv
ausführen.
Bsp.-URL: GET /Task?kvnr=X11058…&hcv=F9Z…I&pnw=H4sIAAAAA…

#### E-Rezepte von Versicherten abrufen (PoPP)

Mit diesem Anwendungsfall kann die abgebende LEI die Zugriffsinformationen zu allen einlösbaren E-Rezepten von einem Versicherten, dessen eGK mit einem im Rahmen von PoPP zulässigen Kartenlesegerät eingelesen wurde, vom E-Rezept-Fachdienst abrufen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" einen PoPP-Token vom PoPP-Service abrufen.
Für die Umsetzung siehe [spec-ilf-popp-client]. 

Hinweis: Im Response des PoPP-Service erhält das PS den PoPP-Token im JWT Compact Serialization Format (s. gemSpec_PoPP_Service#A_26432). Das PS gibt den PoPP-Token im gleichen Format an den E-Rezept-Fachdienst weiter.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die HTTP-Operation GET /Task mit
* ACCESS_TOKEN im Authorization-Header
* PoPP-Token in HTTP-Header X-PoPP-Token
ausführen.
Im Response ist eine Liste von Tasks enthalten. Für jeden Task sind u.a. folgende Informationen enthalten: Task-ID und AccessCode.

Auf Basis dieser Informationen können die Verordnungsdatensätze zu den E-Rezepten vom E-Rezept-Fachdienst abgerufen werden. Erst dann sind die Inhalte der Verordnungen im AVS bekannt und können mit dem Versicherten abgestimmt werden.

Abgerufene Rezepte, welche nicht durch die Apotheke beliefert werden, müssen durch die Apotheke zurückgegeben (Anwendungsfall “E-Rezept durch Abgebenden zurückgeben”) werden.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Nutzer geeignet unterstützen, heruntergeladene und damit reservierte E-Rezepte, welche nicht beliefert werden, wieder zurückzugeben, um dem Versicherten zu ermöglichen, diese in einer anderen Apotheke einzulösen.

