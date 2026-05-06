# Datamatrix Code - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Datamatrix Code**

## Datamatrix Code

### 2D-Code für E-Rezept-Token

Um ein E-Rezept beliefern zu können, muss die Apotheke das Wissen um die Referenz des steuernden Tasks und den AccessCode zum Nachweis der Berechtigung erlangen. Diese beiden Datenfelder, URL des Tasks und AccessCode, werden vom Versicherten zur Verfügung gestellt. Die Bereitstellung kann als E-Rezept-Nachricht über den TI-Flow-Fachdienst oder als 2D-Code erfolgen. Die Bereitstellung als 2D-Code erfolgt entweder über das Abscannen des Codes von einem Patientenausdruck oder vom Display des E-Rezept-FdV, welches den Code auf dem Display des Geräts des Versicherten anzeigt.

Das E-Rezept-FdV und das PS der verordnenden LEI MÜSSEN zum Erstellen eines E-Rezept-Token die ID auf einen Task zusammen mit dem AccessCode des Tasks aus den lokal verfügbaren Informationen einer Verordnung als URL in der Form:
* 2D-Code-Daten = "Task/" + Task.id + "/$accept?ac=" + AccessCode
zusammenstellen, damit diese Zeichenkette als Referenz in einer E-Rezept-Nachricht oder in einem JSON-Array für die Generierung eines 2D-Codes verwendet werden kann.
Beispiel für E-Rezept-Einlöseinformationen (z.B. für Nutzung als Referenz in Communication-Ressource):
 “Task/160.000.000.000.123.76/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea”

Das E-Rezept-FdV MUSS eine Sammlung von einer und bis zu drei E-Rezept-Referenzen als Array in JSON-Notation gemäß [JSON] der folgenden Form
* 2D-Code-Daten = { "urls": [ "E-Rezept 1", "E-Rezept 2", "E-Rezept 3" ] }
zusammenfassen, um daraus einen 2D-Code generieren zu können.
Beispiel für genau ein E-Rezept-Token (für die Codierung als 2D-Code):

{   “urls”: [ “Task/160.000.000.000.123.76/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea” ]}

Beispiel für eine Sammlung von drei E-Rezept-Token (für die Codierung als 2D-Code):

{   “urls”: [“Task/160.000.000.000.123.76/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea”, “Task/160.123.456.789.123.58/$accept?ac=0936cfa582b447144b71ac89eb7bb83a77c67c99d4054f91ee3703acf5d6a629”,  “Task/160.000.346.211.638.15/$accept?ac=d3e6092ae3af14b5225e2ddbe5a4f59b3939a907d6fdd5ce6a760ca71f45d8e5”   ] } 

Der Datentyp der Task.id erlaubt bis zu 64 Zeichen zur Angabe einer ID des Tasks. Mit der zulässigen Maximallänge ergibt sich folgendes Beispiel, aus dem die maximale Datengröße für einen 2D-Datamatrix-Code ergibt (Umbrücke und Leerzeichen werden im Sinne der Datenkomprimierung entfernt).

{“urls”:[“Task/1234567891011121314151617181920212223242526272829303132333435361/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea”,”Task/1234567891011121314151617181920212223242526272829303132333435362/$accept?ac=0936cfa582b447144b71ac89eb7bb83a77c67c99d4054f91ee3703acf5d6a629”,”Task/1234567891011121314151617181920212223242526272829303132333435363/$accept?ac=d3e6092ae3af14b5225e2ddbe5a4f59b3939a907d6fdd5ce6a760ca71f45d8e5”]} 

Das E-Rezept-FdV und das PS der verordnenden LEI MÜSSEN die Datenstruktur für 2D-Code-Daten in eine DataMatrix-Darstellung gemäß ISO/IEC 16022:2006 überführen können.
### 2D-Code anzeigen

Der Nutzer eines E-Rezept-FdV kann die Zugriffs Rezeptinformationen als 2D-Code auf dem Bildschirm seines E-Rezept-FdVs anzeigen lassen, um das/die E-Rezept/E-Rezepte direkt in der Apotheke einlösen zu können.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept-Token als 2D-Code anzeigen" es dem Nutzer NICHT ermöglichen, einen E-Rezept-Token für ein E-Rezept mit dem Flowtype 169 oder 209 zu erstellen und anzuzeigen.
Ein 2D-Code kann bis zu 3 E-Rezept-Token beinhalten. Sollen mehr E-Rezept-Token übermittelt werden, können bspw. mehrere 2D-Codes erzeugt und angezeigt werden.

Das E-Rezept-FdV DARF NICHT im Anwendungsfall "E-Rezept-Token als 2D-Code anzeigen" mehr als drei E-Rezept-Token in einem 2D-Code zusammenfassen.

Das E-Rezept-FdV DARF NICHT im Anwendungsfall "E-Rezept-Token als 2D-Code anzeigen" personenbezogene Daten zusammen mit der Anzeige des 2D-Codes anzeigen.
### 2D-Code einscannen

Eine Alternative zur Übermittlung eines E-Rezept-Token oder eines Abrechnungsinformation-Token vom Versicherten mittels E-Rezept-Nachricht ist die persönliche Übergabe in der Apotheke vor Ort. Hierzu übergibt der Kunde (Versicherter oder Vertreter) dem Mitarbeiter der abgebenden LEI einen Patientenausdruck mit 2D-Code oder präsentiert einen 2D-Code auf dem Display seines mobilen Gerätes. Ebenso besteht die Möglichkeit, dass ein Versicherter den Patientenausdruck eines E-Rezept-Tokens an eine Versandapotheke sendet. Der 2D-Code wird eingescannt.

Das PS der abgebenden LEI muss es dem Nutzer ermöglichen, einen 2D-Code für das Zuweisen von E-Rezepten oder zum Ändern einer Abrechnungsinformation einzuscannen.

Das CS einer abgebenden Institution MUSS die gescannten Inhalte vor einer weiteren Verarbeitung validieren, um sich vor Schadsoftware zu schützen.
Der 2D-Code für E-Rezept-Token enthält mindestens einen Token für ein E-Rezept und kann zu 3 Token zusammenfassen. Dies dient einer besseren Usability.

Der 2D-Code für Abrechnungsinformation-Token enthält genau einen Token.

Für den Aufbau des 2D-Codes und Struktur des E-Rezept-Token bzw. Abrechnungsinformation-Token siehe [gemSpec_DM_eRp].Mit den Informationen aus einem E-Rezept-Token kann das E-Rezept vom TI-Flow-Fachdienst heruntergeladen werden.Mit der Information aus dem Abrechnungsinformation-Token kann die Abrechnungsinformation vom TI-Flow-Fachdienst heruntergeladen und der PKV-Abgabedatensatz einmalig auf dem TI-Flow-Fachdienst aktualisiert werden.

**Hinweis zu Mehrfachverordnung:** Wenn Datamatrix-Codes einer Mehrfachverordnung von einem Ausdruck eingescannt werden, dann dürfen die E-Rezept-Token der Teilverordnungen, welche noch nicht ihren Gültigkeitszeitraum erreicht haben, nicht automatisch im AVS gespeichert werden, da der Versicherte das Recht hat, für diese ggf. eine andere Apotheke für das Einlösen auszuwählen.

Das PS der abgebenden LEI DARF die E-Rezept-Token von Teilverordnungen einer Mehrfachverordnung, deren Einlösefrist noch nicht begonnen hat, NICHT automatisch speichern.

Das PS der abgebenden LEI KANN die E-Rezept-Token von Teilverordnungen einer Mehrfachverordnung, deren Einlösefrist noch nicht begonnen hat, speichern, wenn der Versicherte es wünscht.
Die Apotheke stimmt mit dem Patienten ab, wie mit der Teilverordnung verfahren wird, bspw. telefonische Rücksprache mit dem Patienten, ob das Rezept beliefert werden soll oder automatische Belieferung bei Erreichen der Einlösefrist.

### 2D-Code für Abrechnungsinformation-Token

Um auf Wunsch des Versicherten den PKV-Abgabedatensatz ändern zu können, muss die Apotheke das Wissen um die Referenz des ChargeItem und den AccessCode zum Nachweis der Berechtigung erlangen. Diese Informationen werden vom Versicherten zur Verfügung gestellt. Die Bereitstellung kann als Nachricht über den TI-Flow-Fachdienst oder durch Abscannen als 2D-Code vom Display der E-Rezept-FdV erfolgen. 

Das E-Rezept-FdV MUSS zum Erstellen eines Token für die Zugriffsinformationen für eine Abrechnungsinformation die ID auf einen ChargeItem zusammen mit dem AccessCode zum Ändern aus den lokal verfügbaren Informationen einer Abrechnungsinformation als URL in der Form: 2D-Code-Daten = "ChargeItem/" + ChargeItem.id  + "?ac=" + AccessCode zusammenstellen, damit diese Zeichenkette als Referenz in einer E-Rezept-Nachricht oder für die Generierung eines 2D-Codes verwendet werden kann.
Beispiel für Abrechnungsinformation-Token: 
 “ChargeItem/200.100.000.000.004.30?ac=0037c20b8e893b690f07d784fcfcf38c748454c08253a8b2c0499347576ca612”

Das E-Rezept-FdV MUSS einen Abrechnungsinformation-Token in JSON-Notation gemäß [JSON] der folgenden Form
* 2D-Code-Daten = { "urls": [ "Abrechnungsinformation" ] }
darstellen, um daraus einen 2D-Code generieren zu können.
Beispiel für die Codierung als 2D-Code: { “urls”: [ “ChargeItem/200.100.000.000.004.30?ac=0037c20b8e893b690f07d784fcfcf38c748454c08253a8b2c0499347576ca612” ] }

