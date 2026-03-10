# FdV-Anforderungen: Pushers-Query - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Pushers**](query-api-pushers.md)
* **FdV-Anforderungen: Pushers-Query**

## FdV-Anforderungen: Pushers-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Pushers`-Query-Endpunkte.

Die Funktionalität zu Push Notification für FdVs ist anwendungsübergreifend in [gemF_PushNotification] beschrieben. In diesem Kapitel werden die zusätzlichen E-Rezept spezifischen Anforderungen beschrieben.

Das E-Rezept-FdV MUSS, wenn es den Anwendungsfall "Push Notifications" umsetzt, für die Registrierung und Verwaltung der FdV-Instanzen am E-Rezept-Fachdienst die Operationen gemäß [OpenAPI_FD] verwenden.

