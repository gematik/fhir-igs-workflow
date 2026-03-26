# AVS-Anforderungen $accept - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $accept (Task akzeptieren)**](op-accept.md)
* **AVS-Anforderungen $accept**

## AVS-Anforderungen $accept

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$accept`.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept abrufen" zum Herunterladen des E-Rezepts die HTTP-Operation POST /Task/<id>/$accept mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id>
* AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac=
ausführen.
### Modulspezifische Anforderungen

**Hinweis zu Mehrfachverordnung:** Wenn ein AVS eine Teilverordnung abruft, deren Einlösezeitraum noch nicht erreicht ist, dann liefert der TI-Flow-Fachdienst einen Fehler 403. Im OperationOutcome der Fehlermeldung liefert der TI-Flow-Fachdienst das Datum des Beginns der Einlösefrist.

**Flowtype 200/209** Für den Flowtype “200” und “209” wird im Response Bundle eine Consent Ressource mit Consent.category.coding.code = CHARGCONS übermittelt, falls der Versicherte eine Einwilligung zum Speichern von Abrechnungsinformationen erteilt hat. Diese Information kann in der Abstimmung mit dem Versicherten genutzt werden, ob die Abrechnungsinformation digital oder als Papierbeleg bereitgestellt wird.

Möchte der Versicherte die Möglichkeit einer Online-Rezepteinlösung nutzen, kann die abgebende LEI die Belieferungs- und ggfs. Zuzahlungsmodalitäten über ihr Warenwirtschaftssystem (“Onlineshop”) abwickeln. Hierzu ist ggfs. die Übernahme von Rezeptinformationen zur Befüllung eines Warenkorbs erforderlich. 

Das PS der abgebenden LEI MUSS bei der Übernahme von E-Rezept-Informationen in ein Warenwirtschaftssystem die Integrität und Vertraulichkeit  der personenbezogenen und medizinischen Daten sicherstellen und zusätzlich sicherstellen, dass der Umfang der übertragenen Daten nur auf das unmittelbare für die Einlösung erforderliche Maß beschränkt (Datenminimierung) ist und keine Verwendung der Daten über die unmittelbare Rezepteinlösung hinaus erfolgt (Zweckbindung).
#### QES des Verordnungsdatensatzes prüfen

Für die QES-Prüfung wird die PKCS#7-Datei verwendet. Die Verordnungsdaten des E-Rezepts sind innerhalb der PKCS#7-Datei enthalten und müssen für die Weiterverarbeitung extrahiert werden.

Das PS der abgebenden LEI KANN im Anwendungsfall "E-Rezept abrufen" die QES des E-Rezepts prüfen. Zum Prüfen der QES des E-Rezepts ist die Operation POST //Konnektorservice mit
* Header "SOAPAction: \"http://ws.gematik.de/conn/SignatureService/v7.4#VerifyDocument\"" 
* PKCS#7-Datei in SignatureObject
auszuführen.
Für weitere Informationen siehe Operation “Qualifizierte Signatur des E-Rezepts prüfen” aus der API-Schnittstelle [E-Rezept API Dokumentation]. Implementierungshinweise zur Signaturprüfung für Primärsysteme sind in [gemILF_PS#4.4.2] beschrieben. Die Außenschnittstelle des Konnektors ist in [gemSpec_Kon#TIP1-A_5034-x Operation VerifyDocument (nonQES und QES)] beschrieben. 

Als Response liefert der Konnektor einen standardisierten Prüfbericht in einer VerificationReport-Struktur gemäß [OASIS-VR].

Für die weitere Verarbeitung wird das E-Rezept-Bundle aus der PKCS#7-Datei verwendet.

