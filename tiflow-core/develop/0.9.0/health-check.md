# Health Check - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* **Health Check**

## Health Check

Ein Health-Check ist eine https-Abfrage mit der Aufgabe, die Erreichbarkeit und damit gleichzeitig die Nutzbarkeit des TI-Flow-Fachdienstes festzustellen. Ein Health-Check dient nicht dazu, die fachliche Korrektheit des TI-Flow-Fachdienstes zu überprüfen. Ein Health-Check kann genutzt werden, um die Erreichbarkeit des TI-Flow-Fachdienstes zu überprüfen. 

Endanwender müssen sich darauf verlassen können, dass vom Betreiber des TI-Flow-Fachdienstes nur Endpunkte zur Verfügung gestellt werden, deren fachliche Korrektheit und Funktionalität kontinuierlich intern überwacht werden. Dadurch kann der Hersteller eines Primärsystems davon ausgehen, dass – sofern eine Erreichbarkeit eines Endpunktes gegeben ist – auch die fachliche Korrektheit und damit die Verfügbarkeit des Dienstes gegeben sind. Der Betreiber des TI-Flow-Fachdienstes prüft periodisch, ob alle verbunden Backendsysteme in den festgelegten Parametern ordnungsgemäß funktionieren. Sollte dies nicht der Fall sein, so wird der entsprechende Host automatisiert vom Netz getrennt, wodurch keine Anfragen an ihn mehr stattfinden können.

Durch die kontinuierliche Weiterentwicklung und Sicherstellung dieses Verfahrens kann damit bei Erreichbarkeit des TI-Flow-Fachdienstes von einer Verfügbarkeit der angebotenen Endpunkte ausgegangen werden.

Da jeglicher Aufruf am TI-Flow-Fachdienst Last erzeugt, ist es notwendig, dass zur Art und Weise der Durchführung dieser Health-Checks eine klarere Regelung getroffen wird.

Es wird folgend eine Klassifikation der Health-Checks vorgenommen, um den tatsächlichen Anwendungsfall konkret zu unterstützen und transparent zu machen.

## Erweiterter Health-Check

Ein erweiterter Health-Check ist ein spezieller Aufruf auf den Endpunkt /metadata mit der http-Methode GET im inneren, verschlüsselten http-Request an die /VAU ⇒ ( “POST /VAU [GET /metadata]” ). Ziel dieses Health-Checks soll es sein, die Anmeldung am TI-Flow-Fachdienst und dem damit einhergehenden VAU-Protokoll zur Ver- und Entschlüsselung zu überprüfen. Dabei wird ebenfalls das ACCESS_TOKEN überprüft, welches vorher am IDP-Dienst abgeholt wurde. Dieses Verfahren soll in der produktiven Betriebsumgebung nur dann angewandt werden, wenn z.B. ein neuer Client in Betrieb genommen wird. Als Abfrage zum Systemstart darf dieser Health-Check nicht eingesetzt werden!

Spezialfall: Für Hersteller von Primärsystemen der abgebenden LEI ist, ersetzend zum o.g. Verfahren, die Nutzung von /Subscription mit der http-Methode POST im inneren, verschlüsselten http-Request an die /VAU vorzuziehen, da dieses Verfahren bereits dazu dient, die Verbindungen zum TI-Flow-Fachdienst auf einen WebSocket zu reduzieren ⇒ ( “POST /VAU [POST /Subscription]” ).

## Einfacher Health-Check

Ein einfacher Health-Check ist ein leichtgewichtiger Aufruf auf den Fachdienst-Endpunkt / (root) mit der http-Methode GET (“äußerer http-Request”), ohne eine zusätzliche VAU-Verschlüsselung ⇒ ( “GET / [—]” ). Ziel dieses Health-Checks soll es sein, die Verfügbarkeit des TI-Flow-Fachdienstes vom Clientsystem aus sicherzustellen. Dabei werden weder ACCESS_TOKEN noch Verschlüsselung benötigt, was ihn für wiederkehrende Abfragen optimiert.

Dieses Verfahren soll in der produktiven Betriebsumgebung nur dann angewandt werden, wenn z.B. binnen einer festgelegten Periode vom Clientsystem keine Anfragen an den TI-Flow-Fachdienst gestellt worden sind. Der Health-Check soll nicht in festgelegten Zeitintervallen, unabhängig von fachlichen Anwendungsfällen benutzt werden – sondern soll erst bei einem echten Idle-Zeitraum Anwendung finden.

## Festlegungen zum Verfahren mit Health-Checks

Das Clientsystem des TI-Flow-Fachdienstes MUSS auf Grundlage der Datensparsamkeit sicherstellen, dass neben den fachlich notwendigen Anfragen an den TI-Flow-Fachdienst so sparsam wie möglich mit Health-Checks umgegangen wird.

Das Clientsystem des TI-Flow-Fachdienstes DARF NICHT einen Health-Check durchführen, welcher die erwartete Rückgabe eines Fehlercodes vorsieht.

Das Clientsystem des TI-Flow-Fachdienstes KANN einen erweiterten Health-Check auf der Endpunkt ⇒ "POST /VAU [GET /metadata]" durchführen.

Das Clientsystem des TI-Flow-Fachdienstes DARF NICHT einen erweiterten Health-Check periodisch durchführen, welcher periodisch den Endpunkt ⇒ "POST /VAU [GET /metadata]" abfragt.
A_23216 - PS: erweiterter Health-Check - Das Primärsystems <=

Das Clientsystem des TI-Flow-Fachdienstes DARF NICHT einen erweiterten Health-Check durchführen, welcher andere als die jeweils vorgegebenen Endpunkte des TI-Flow-Fachdienstes nutzt.

Das Clientsystem des TI-Flow-Fachdienstes KANN einen einfachen Health-Check auf der Endpunkt / (root) mit Abfrage ⇒ ( "GET / [---]" ) durchführen, welcher mit Ausnahmen periodisch die Erreichbarkeit des TI-Flow-Fachdienstes feststellt und folgende Kriterien erfüllt:
1. Die festgelegte Idle-Periode darf 10 Minuten nicht unterschreiten.
1. Der Zeitraum zwischen den Aufrufen (Idle-Periode) muss um eine zufällige Zeitspanne zwischen 0 und 10.000 Millisekunden verlängert werden, um eine Gleichverteilung der Anfragen am TI-Flow-Fachdienst über alle Clientsysteme zu erreichen.

**Ausnahme bei technischen Störungen:** Das Primärsystem darf einen weiteren einfachen Health-Check innerhalb der Idle-Periode durchführen, sofern ein fachlicher Aufruf die Nichterreichbarkeit des E-Rezept Fachdienstes zurückmeldet. Die Wiederholung des Health-Checks muss dann den Exponential Backoff-Algorithmus zur Wiederherstellung der erfolgreichen Verbindung umsetzen.

**Ausnahme bei parallel durchgeführten, fachlichen Aufrufen:** Das Primärsystem DARF KEINEN Health-Check durchführen, wenn innerhalb der festgelegten Idle-Periode ein regulärer Aufruf an einem beliebigen Endpunkt des TI-Flow-Fachdienstes mit erhaltener Antwort durchgeführt wurde. Die Antwort des TI-Flow-Fachdienstes MUSS die festgelegte Idle-Periode von Beginn starten lassen.

Das Clientsystem des TI-Flow-Fachdienstes DARF NICHT einen einfachen Health-Check durchführen, welcher einen anderen Endpunkt als ⇒ ( "GET / [---]" ) abfragt.
Das Primärsystem soll zur Vermittlung der Erreichbarkeit an den Endnutzer geeignete Informationen bereitstellen, um die Fehlerursache der Nichterreichbarkeit transparent darzustellen. Fehlerursachen für die Nichterreichbarkeit können beispielsweise sein: die Verbindung zum Konnektor, Verfügbarkeit der SMC-B, Verbindung zum VPN oder andere.

