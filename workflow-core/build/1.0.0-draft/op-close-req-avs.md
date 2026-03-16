# AVS-Anforderungen $close - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $close (Task schließen)**](op-close.md)
* **AVS-Anforderungen $close**

## AVS-Anforderungen $close

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$close`.

Die Erstellung der MedicationDispense erfolgt Flowtype-spezifisch.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Quittung abrufen" für das abgegebene E-Rezept die HTTP-Operation POST /Task/<id>/$close mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id>
* Geheimnis in URL-Parameter ?secret=
* optional, falls nicht zuvor mit Anwendungsfall "Dispensierinformation bereitstellen" übermittelt: MedicationDispense bzw. Bundle Ressource
ausführen.
Im Response liefert der Fachdienst die Quittung

#### Quittungssignatur prüfen

Der E-Rezept-Fachdienst prüft regelmäßig den Status seines Signaturzertifikats, die mandatorische Signaturprüfung der Quittung obliegt dem Quittungsempfänger, kann aber vom AVS vor der Weitergabe in die Abrechnungsprozesse ebenfalls geprüft werden.

Die Quittung wird als PKCS#7-Datei erstellt. Die quittierten Daten sind innerhalb der PKCS#7-Datei enthalten.

Das PS der abgebenden LEI KANN im Anwendungsfall "Quittung abrufen" zum Prüfen der Quittung des E-Rezepts die Operation POST //Konnektorservice mit
* Header "SOAPAction: \"http://ws.gematik.de/conn/SignatureService/v7.4#VerifyDocument\""
* PKCS#7-Datei in SignatureObject
ausführen.
Implementierungshinweise zur Signaturprüfung für Primärsysteme sind in [gemILF_PS#4.4.2] beschrieben. Die Außenschnittstelle des Konnektors ist in [gemSpec_Kon#TIP1-A_5034-x Operation VerifyDocument (nonQES und QES)] beschrieben. 

Als Response liefert der Konnektor einen standardisierten Prüfbericht in einer VerificationReport-Struktur gemäß [OASIS-VR].

#### Stapelverarbeitung

Eine Apotheke schließt nach Belieferung eines E-Rezepts den Vorgang mittels $close-Aufruf entsprechend vertraglicher Vorgaben bis zum Ende des folgenden Werktags ab. Der Abschluss des Vorgangs mittels $close-Operation kann einzeln oder auch als Stapelverarbeitung durchgeführt werden. Bei einer Stapelverarbeitung ruft das AVS hintereinander die $close-Operation für jedes E-Rezept auf. Um Lastspitzen am E-Rezept-Fachdienst zu vermeiden, gelten folgende Anforderungen für die Stapelverarbeitung.

Das PS der abgebenden LEI KANN im Anwendungsfall "Quittung abrufen" mehrere Vorgänge im Stapel verarbeiten.
Falls ein AVS diese Aufrufe im Stapel verarbeitet, soll der Startzeitpunkt für die Aufrufe der $close-Operation am E-Rezept-Fachdienst zufällig verteilt sein, um die betriebliche Stabilität des E-Rezept-Fachdienstes zu gewährleisten.

Das PS der abgebenden LEI MUSS bei Stapelverarbeitung im Anwendungsfall "Quittung abrufen" den Startzeitpunkt zufällig in einem Zeitraum mehreren Stunden setzen.

Das PS der abgebenden LEI MUSS bei Stapelverarbeitung im Anwendungsfall "Quittung abrufen" nach 40 Aufrufen jeweils 1000ms warten, bevor die Stapelverarbeitung fortgeführt wird.
Hinweis: Die [E-Rezept API Dokumentation] enthält im Abschnitt “E-Rezept-Abgabe vollziehen” einen Beispielalgorithmus, um den Startzeitpunkt der $close-Stapelverarbeitung zufällig zwischen 18:00 und 22:00 zu setzen.

