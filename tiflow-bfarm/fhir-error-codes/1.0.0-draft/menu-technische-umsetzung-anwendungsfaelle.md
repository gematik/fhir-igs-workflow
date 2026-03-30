# Technische Umsetzung - Anwendungsfälle - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Umsetzung - Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Umsetzung - Anwendungsfälle**

## Technische Umsetzung - Anwendungsfälle

Diese Seite dokumentiert die technischen Anwendungsfälle für die in diesem IG beschriebenen fachlichen Szenarien.

### UC 5.8 - Durchschlag E-T-Rezept beim BfArM einstellen

* Beschreibung: Vorbedingungen
  * Mit diesem Anwendungsfall erstellt ein Leistungserbringer einen Verordnungsdatensatz mit workflowspezifischen Parametern. Der Verordnungsdatensatz erhält von dem TI-Flow-Fachdienst eine Rezept-ID und wird von dem Leistungserbringer qualifiziert signiert. Der Leistungserbringer muss in seinem Primärsystem den workflowspezifischen Parameter für die direkte Zuweisung an eine Apotheke auswählen.: * Der Anwendungsfall “UC 4.4 - Quittung abrufen” wird ausgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Mit diesem Anwendungsfall erstellt ein Leistungserbringer einen Verordnungsdatensatz mit workflowspezifischen Parametern. Der Verordnungsdatensatz erhält von dem TI-Flow-Fachdienst eine Rezept-ID und wird von dem Leistungserbringer qualifiziert signiert. Der Leistungserbringer muss in seinem Primärsystem den workflowspezifischen Parameter für die direkte Zuweisung an eine Apotheke auswählen.: * Das PS einer abgebenden LEI ruft die Operation am TI-Flow-Fachdienst auf und übermittelt die Dispensierinformationen.
* Der TI-Flow-Fachdienst führt die Prüfungen der Operation aus.
* Der TI-Flow-Fachdienst erstellt, wenn die Prüfung erfolgreich abgeschlossen wurde, einen Datenübermittlungsauftrag inklusive des digitalen Durchschlags E-T-Rezept.
* Der TI-Flow-Fachdienst überträgt den digitalen Durchschlag E-T-Rezept an den BfArM Webdienst.
* Der BfArM Webdienst verarbeitet und persistiert die übermittelten Daten.
* Der TI-Flow-Fachdienst löscht den Datenübermittlungsauftrag aus der Warteschlange, wenn der BfArM Webdienst die Daten erfolgreich verarbeiten konnte.

* Beschreibung: Nachbedingungen
  * Mit diesem Anwendungsfall erstellt ein Leistungserbringer einen Verordnungsdatensatz mit workflowspezifischen Parametern. Der Verordnungsdatensatz erhält von dem TI-Flow-Fachdienst eine Rezept-ID und wird von dem Leistungserbringer qualifiziert signiert. Der Leistungserbringer muss in seinem Primärsystem den workflowspezifischen Parameter für die direkte Zuweisung an eine Apotheke auswählen.: * Die Daten des “digitalen Durchschlag E-T-Rezept” sind, sofern die Verarbeitung im BfArM Webdienst erfolgreich abgeschlossen werden konnten, im BfArM Webdienst gespeichert.

* Beschreibung: Schnittstellen
  * Mit diesem Anwendungsfall erstellt ein Leistungserbringer einen Verordnungsdatensatz mit workflowspezifischen Parametern. Der Verordnungsdatensatz erhält von dem TI-Flow-Fachdienst eine Rezept-ID und wird von dem Leistungserbringer qualifiziert signiert. Der Leistungserbringer muss in seinem Primärsystem den workflowspezifischen Parameter für die direkte Zuweisung an eine Apotheke auswählen.: * [API-ERP: Digitaler Durchschlag E-T-Rezept am T-Register einstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bfarm.adoc#digitaler-durchschlag-e-t-rezept-am-t-register-einstellen)


**Tabelle:**Fachlicher Anwendungsfall UC 5.8 - Durchschlag E-T-Rezept beim BfArM einstellen
**Sequenzdiagramm:**

**Abbildung: **UC 5.8 - Durchschlag E-T-Rezept beim BfArM einstellen

