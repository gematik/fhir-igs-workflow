Die gesetzlichen Grundlagen zu diesem Feature sind insbesondere in § 361 Abs. 5 SGB V festgelegt. Danach muss der Versicherte vor einem Zugriff von Leistungserbringern aus dem EU-Ausland über den NCPeH-FD grundsätzlich in die Übermittlung eingewilligt haben. Zudem muss der Versicherte jeden konkreten Zugriff durch einen Leistungserbringer aus dem EU-Ausland (LE-EU) in diesem Rahmen technisch freigeben. Die Einwilligung wird durch den Versicherten mittels eines FdV mit E-Rezept-Funktionalität gegeben (bzw. widerrufen) und im E-Rezept-Fachdienst gespeichert (bzw. gelöscht). Sie ist länderunspezifisch, d.h. sie gilt für alle teilnehmenden Länder in der EU. In der Umsetzung kann die Einwilligung in das Verfahren in Verbindung mit der ersten Freigabe eines Zugriffs für einen LE-EU erfolgen.

Die technische Freigabe für einen Leistungserbringer im EU-Ausland erteilt der Versicherte durch einen sechsstelligen alphanumerischen Zugriffscode, den er im FdV angezeigt bekommt und die er dem Leistungserbringer mitteilt (z.B. durch Vorzeigen des im FdV angezeigten Zugriffscodes). Der Zugriffscode ist nach der Erzeugung einen begrenzten Zeitraum (höchstens eine Stunde) gültig. Nach Ablauf dieses Zeitraums muss ein neuer Zugriffscode erzeugt werden. Der Versicherte kann auch vor Ablauf des Zeitraums einen neuen Zugriffscode erzeugen, wobei der vorherige Zugriffscode damit ungültig wird. Der E-Rezept-Fachdienst erhält den jeweils gültigen Zugriffscode vom FdV und lehnt Anfragen mit einem ungültigen Zugriffscode ab. Neben dem Zugriffscode erhält der E-Rezept-Fachdienst vom FdV die Information, in welchem Land der aktuelle Zugriffscode Verwendung finden soll. Die Information, in welchem Land sich der LE-EU befindet, erhält der E-Rezept-Fachdienst vom deutschen NCPeH-FD. Stimmen die beiden Informationen nicht überein, lehnt der E-Rezept-Fachdienst die Anfrage ebenfalls ab.

### Anwendungsfälle

Aus diesem Feature ergeben sich für den E-Rezept-Fachdienst ein neuer direkter Akteur, der NCPeH-FD in Deutschland, der zur Ausführung folgender Anwendungsfälle mit seiner eigenen kryptografischen Identität auf den E-Rezept-Fachdienst zugreift:

Demographische Daten eines Versicherten abrufen
Damit berechtigte LE-EU die E-Rezepte des Versicherten abrufen können, ist es notwendig, die demografischen Daten des Versicherten zuvor in Deutschland ermitteln zu lassen. Ein LE-EU kann die ermittelten demografischen Versichertendaten mit den auf der eGK oder einem Ausweisdokument abgebildeten Daten vergleichen und so auf Richtigkeit prüfen. Die Ermittlung dieser Daten erfolgt aus einem E-Rezept des Versicherten im E-Rezept-Fachdienst – sofern mindestens eines vorhanden ist.

Liste der einlösbaren E-Rezepte eines Versicherten abrufen
Mittels KVNR und Zugriffscode ruft der LE-EU die Liste aller einlösbaren E-Rezepte vom E-Rezept-Fachdienst ab. Dabei liefert der E-Rezept-Fachdienst alle Informationen aus den E-Rezepten an den NCPeH-FD, der zur Erstellung der Liste nur bestimmte Informationen verwendet (mindestens die obligatorischen Angaben gemäß den europäischen Vorgaben). Der E-Rezept-Fachdienst liefert keine Informationen zu E-Rezepten, die in den europäischen Vorgaben ausgeschlossen sind, z.B. Betäubungsmittel und Arzneimittel, die nach ärztlicher Verschreibung oder nach den Vorschriften eines Arzneibuchs für den Versicherten zubereitet werden.

Liste ausgewählter E-Rezepte eines Versicherten abrufen
Ausgehend von der Liste der einlösbaren E-Rezepte für einen Versicherten, kann der LE-EU eine Liste der zur Einlösung ausgewählten E-Rezepte abrufen (transkodiert und im Original).

Abgabe von E-Rezepten im europäischen Ausland
Beim Einlösen von E-Rezepten erfolgt die Übermittlung der Datensätze über die an den Versicherten abgegebenen Arzneimittel mittels des NCPeH-FD an den E-Rezept-Fachdienst.

Daneben gibt es die Anwendungsfälle für die Versicherten zur Erteilung, zur Einsicht und zum Widerruf der Einwilligung.

Aufgrund der starken Abhängigkeit von Systemen außerhalb der TI werden keine Aussagen zur Verfügbarkeit dieser Anwendungsfälle getroffen. Die Verfügbarkeit der Komponenten bzw. Dienste der TI ist hierfür in jedem Fall ausreichend.

### Informationsobjekte

Durch dieses Feature werden die folgenden wesentlichen Informationsobjekte eingeführt:

|Informationsobjekt|Beschreibung|Personenbezug|Vertraulichkeit|Integrität|
|---|---|---|---|---|
|Zugriffscode|Sechsstelliger alphanumerischer Zugriffscode zur Autorisierung eines LE-EU zum Abruf und zur Einlösung von E-Rezepten eines Versicherten.|nein|hoch|hoch|
|Zugriffscode – Schutzbedarf Vertraulichkeit|Der Schutzbedarf für die Vertraulichkeit des Freischaltcodes wird mit „hoch“ bewertet, da die Kenntnis des Zugriffscodes allein nicht für das Einlösen eines E-Rezepts ausreicht.|nein|hoch|–|
|Zugriffscode – Schutzbedarf Integrität|Eine Verletzung der Integrität verhindert den Zugriff auf E-Rezepte.|nein|–|hoch|

<div><figcaption><strong>Tabelle: </strong>Neue Informationsobjekte im Kontext E-Rezept-Fachdienst im EU Kontext</figcaption></div>

### Authentifizierung und Autorisierung

Der NCPeH-FD in Deutschland ist ein neuer (VAU-) Client im E-Rezept-System. Die Authentifizierung des NCPeH-FD in Deutschland findet durch den Authorization Server des E-Rezept-Fachdienstes statt, der einen ACCESS_TOKEN ausstellt, der im E-Rezept-Fachdienst validiert wird. Dabei findet ein länderspezifisches Zertifikat Verwendung – also nicht das Zertifikat des NCPeH-FD in Deutschland, sondern ein Zertifikat, dass den NCPeH-FD im jeweiligen anfragenden EU-Ausland repräsentiert.

Indirekt wirkende Akteure sind Leistungserbringer im EU-Ausland, die über den NCPeH-FD in ihrem Land und den NCPeH-FD in Deutschland Daten aus dem E-Rezept-Fachdienst abrufen können. Die Authentisierung der Leistungserbringer im EU-Ausland erfolgt durch den NCPeH-FD in ihrem Land (vgl. unten Grenzen der Sicherheitsleistung).

Die Kommunikation zwischen dem NCPeH-FD und dem E-Rezept-Fachdienst erfolgt zum einen über TLS mit serverseitiger Authentifizierung des E-Rezept-Fachdienstes und zum anderen mittels VAU-Verschlüsselung zwischen der VAU im NCPeH-FD und VAU im E-Rezept-Fachdienst. Hierbei prüft der E-Rezept-Fachdienst das VAU-Zertifikat der VAU im NCPeH-FD. Hierdurch wird eine beidseitige Authentifizierung der Systeme erreicht.

Der Zugriffscode dient – in Kombination mit der KVNR - der Autorisierung eines LE-EU zum Abruf der E-Rezepte eines Versicherten.

### Protokollierung

Die Protokollierung im E-Rezept-Fachdienst erfolgt für alle o.g. Anwendungsfälle und umfasst jeweils folgende Informationen:

- das Land, aus dem der Zugriff erfolgte,
- die Leistungserbringerinstitution, aus der der Zugriff erfolgte,
- der Leistungserbringer-EU, der zugegriffen hat,
- der ausgeführte Anwendungsfall,
- falls ein E-Rezept eingelöst wurde: die Rezept-ID,
- der Zeitpunkt des Zugriffs,
- ob der Zugriff erfolgreich war bzw. warum ein Zugriff abgelehnt wurde (in für den Versicherten verständlicher Sprache).

Abgelehnte Zugriffsversuche werden nur protokolliert, wenn die KVNR in Verbindung mit dem Zugriffscode passen, damit der Versicherte erkennen kann, ob er alle Voraussetzungen geschaffen hat, um es dem LE-EU zu ermöglichen, seine E-Rezepte abzurufen. Gründe für eine Ablehnung können sein:

- Die Einwilligung wurde zwischenzeitlich entzogen.
- Es liegen keine einlösbaren E-Rezept vor, aus denen die Daten extrahierbar wären.

Falls die Kombination von KVNR und Zugriffscode nicht korrekt war, wird kein Protokolleintrag erzeugt, da eine Ablehnung auch an einer falschen KVNR liegen kann. In diesem Fall würde der Versicherte mit der übertragenden KVNR einen Protokolleintrag über einen abgelehnten Zugriff sehen, obwohl er keine Einlösung im Ausland ausgelöst hat. Da es sich aber nicht um einen Angriff handelt, könnte der Versicherte aus einem Protokolleintrag keine sinnvolle Handlung ableiten.

Angriffe mittels Durchprobieren von KVNR- und Zugriffscode-Kombinationen müssen durch die NCPeH-FD mitigiert werden. In Verdachtsfällen, müssen die Protokolle in den NCPeH-FD ausgewertet werden.

### Robustheit

Der NCPeH-FD in Deutschland prüft bei Anfragen an den E-Rezept-Fachdienst, ob die mitgegebene KVNR syntaktisch korrekt ist und dass der Zugriffscode sechsstellig ist. Damit werden syntaktisch unkorrekte Anfragen bereits im NCPeH-FD abgeblockt. Generell muss der Anbieter des NCPeH-FDs Maßnahmen zur Erkennung und Verhinderung von dem Erraten eines Zugriffscodes umsetzen.

### Grenzen der Sicherheitsleistung

Der E-Rezept-Fachdienst muss von integren und korrekt arbeitenden NCPeHs ausgehen.

In der Realisierung der o.g. Anwendungsfälle übernehmen die NCPeH im EU-Ausland die Authentisierung der Leistungserbringer im jeweiligen Land. Anfragen von nicht-authentisierten Leistungserbringern werden nicht an den NCPeH-FD in Deutschland weitergeleitet und damit auch nicht an den E-Rezept-Fachdienst. Dies gilt auch für Anfragen aus EU-Ländern, die nicht in der Liste der teilnehmenden Länder stehen.

Der NCPeH-FD in Deutschland protokolliert jegliche Transaktion, in der er involviert ist. Wie ein Betroffener diese Protokolldaten einsehen kann, wird durch den Betreiber des NCPeH-FD geregelt.

Der NCPeH-FD in Deutschland muss grundlegende Denial-of-Service-Abwehrmechanismen implementieren. Diese sind nicht näher spezifiziert und deshalb kann hier auch keine Annahme über deren Wirksamkeit getroffen werden. Zumindest werden nur Anfragen mit syntaktisch korrekten KVNRs und ausschließlich sechsstelligen Zugriffscodes weitergereicht.

Über die Sicherheit der Systeme der LE-EU kann keine Aussage getroffen werden. Ggf. ist die Situation in den verschiedenen EU-Ländern unterschiedlich.

Aufgrund der Vorgaben der EU können Situationen entstehen, in denen eine Mehrfacheinlösung von E-Rezepten durch den E-Rezept-Fachdienst nicht verhindert werden kann. Dies betrifft insbesondere Situationen in grenznahen Gebieten, in denen ein Versicherter erst eine Einlösung im Ausland initiiert, aber das Medikament noch nicht erhält, er dann das E-Rezept in Deutschland regulär einlöst, um dann zurück in der EU-Apotheke das Medikament nochmals zu erhalten – sofern die EU-Apotheke das Medikament ausgibt, obwohl der E-Rezept-Fachdienst einen Fehler meldet (z.B. um den Umsatz dennoch zu machen). Ein finanzieller Schaden für Apotheken im Ausland würde hierbei nicht entstehen, da Versicherte die im Ausland erhaltenen Medikamente zunächst selbst bezahlen. Kostenträger können einen finanziellen Schaden abwenden, wenn sie durch geeignete Prüfungen eine oben geschilderte mehrfache Einlösung eines E-Rezepts feststellen. Für Apotheker in Deutschland könnte ein finanzieller Schaden entstehen, falls der Kostenträger einem Versicherten die Rechnung für ein im Ausland erhaltenes Medikament erstattet, bevor die Abrechnung des E-Rezepts durch die Apotheke in Deutschland erfolgt – unter der Annahme, dass der Kostenträger in diesem Fall das E-Rezept nicht noch einmal abrechnen wird. Solche Schadensszenarien können nicht durch die Komponenten und Dienste der TI abgewendet werden.