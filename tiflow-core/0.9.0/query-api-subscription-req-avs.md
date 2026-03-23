# AVS-Anforderungen: Subscription-Query - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Subscription**](query-api-subscription.md)
* **AVS-Anforderungen: Subscription-Query**

## AVS-Anforderungen: Subscription-Query

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Subscription`-Query-Endpunkte.

Um die Last am E-Rezept-Fachdienst zu kontrollieren, wurde festgelegt, dass ein AVS nicht öfter als alle 5 min nach neuen Nachrichten anfragen darf (A_21556). Die dadurch bis zu 5 min entstehende Verzögerung verlängert die Zeit, bis eine Apotheke auf die Nachricht des Versicherten reagieren kann. Aus dem Grund wird eine Funktionalität eingeführt, mit der AVS eine Notification erhalten, dass eine neue Nachricht für eine Telematik-ID vorliegt. Nach Erhalt einer Notification darf das AVS die neue Nachricht sofort abrufen.

Das PS der abgebenden LEI DARF NICHT mehr als eine Subscription pro Telematik-ID registrieren.

Das PS der abgebenden LEI MUSS den Anwendungsfall "Subscription für neue Communication" gemäß TAB_ILFERP_017 umsetzen. Tabelle # : TAB_ILFERP_017 – Subscription für neue Communication Name Subscription für neue Communication Auslöser Periodischer Aufruf, wenn keine Websocket-Verbindung für die Notification besteht Akteur AVS Vorbedingung Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Es besteht eine Websocket-Verbindung zum Empfang der Notification Standardablauf Subscription Ressource erstellen Subscription registrieren Websocket-Verbindung zu Subscription Service aufbauen Listening

Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" eine Subscription Ressource mit Telematik-ID in Element criteria Attribut receipient erstellen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" zum Registrieren im E-Rezept-Fachdienst die HTTP-Operation POST /v1/Subscription mit ACCESS_TOKEN im Authorization-Header ausführen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" nach der Registrierung eine Web Socket Verbindung zum Subscription Service mit Authorization Header aufbauen und ein Upgrade durchführen.

Der Primärsystem der abgebenden LEI KANN eine beliebige Wartezeit bis zum Abruf der Nachrichten mit Anwendungsfall „Nachrichten von Versicherten empfangen“ umsetzen, wenn in einem Zeitraum sehr viele ping-Benachrichtigungen empfangen werden.

