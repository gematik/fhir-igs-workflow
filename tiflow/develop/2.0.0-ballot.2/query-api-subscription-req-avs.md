# AVS-Anforderungen: Subscription - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Additional API**](menu-schnittstellen-additional-api.md)
* [**Additional API: Subscription**](query-api-subscription.md)
* **AVS-Anforderungen: Subscription**

## AVS-Anforderungen: Subscription

Diese Seite enthält die normativen Anforderungen an das AVS zur Nutzung der Subscription-Schnittstelle.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI DARF NICHT mehr als eine Subscription pro Telematik-ID registrieren.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" eine Subscription Ressource mit Telematik-ID in Element criteria Attribut receipient erstellen.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" zum Registrieren im TI-Flow-Fachdienst die HTTP-Operation POST /v1/Subscription ausführen.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" nach der Registrierung eine Web Socket Verbindung zum Subscription Service mit Authorization Header aufbauen und ein Upgrade durchführen.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI KANN eine beliebige Wartezeit bis zum Abruf der Nachrichten mit Anwendungsfall "Nachrichten von Versicherten empfangen" umsetzen, wenn in einem Zeitraum sehr viele ping-Benachrichtigungen empfangen werden.

