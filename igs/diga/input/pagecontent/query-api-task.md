
Die Query API für Task beschreibt den lesenden Zugriff auf Tasks.
Der Versicherte ruft die Liste aller seiner Verordnungen inklusive DiGA-Verordnungen ab.
Der Versicherte kann mit Referenz auf eine Task-ID eine einzelne Verordnung abrufen.

Der Kostenträger kann unter Angabe der Task-ID und des ACCESS_CODE die Daten einer einzelnen Verordnung abrufen und somit insbesondere den Anwendungfall "Recovery Secret" umsetzen.

Der Kostenträger kann unter Angabe der Task-ID und des Secrets die Daten einer einzelnen Verordnung abrufen und somit insbesondere den Anwendungfall "Quittung erneut abrufen" umsetzen.

### GET /Task (Suche)
- Der Aufruf basiert auf dem GET /Task Aufruf des Basis-Workflow für E-Rezepte.

Es gibt keine workflow-spezifischen Anforderungen für den E-Rezept-Fachdienst.

Es gibt keine workflow-spezifischen Anforderungen für das E-Rezept-FdV.

### GET /Task/<id> (Details)
- Der Aufruf basiert auf dem GET /Task/&#60;id&#62; Aufruf des Basis-Workflow für E-Rezepte.

Es gibt keine workflow-spezifischen Anforderungen für das E-Rezept-FdV.

Es gibt keine workflow-spezifischen Anforderungen für den Kostenträger.
