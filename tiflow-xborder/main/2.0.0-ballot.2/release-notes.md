# Release Notes - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* **Release Notes**

## Release Notes

### Release Notes

### Version 2.0.0

#### Anforderungen

Neue Anforderungen wurden hinzugefügt, bestehende geändert und nicht mehr benötigte gelöscht. Die folgenden Release Notes geben einen detaillierten Überblick über alle Anpassungen.

| | | |
| :--- | :--- | :--- |
| 🔍 Alle Details umschalten | | |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A1 ](./menu-technische-umsetzung-konzept.md) | Format Zugriffscode |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A10 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage aller einlösbaren Verordnungsinformationen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A11 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage nach Liste Rezept-Ids |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A12 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Schema des Response |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A13 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Abfrage der aktuellsten Verordnungsinformationen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A14 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Abfrage aller einlösbaren Verordnungsinformationen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A15 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A16 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Statuswechsel Task |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A17 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Secret |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A18 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Task Owner |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A19 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Abfrage aller einlösbaren Verordnungsinformationen - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A2 ](./menu-technische-umsetzung-konzept.md) | TI-Flow-Fachdienst - Zugriffsberechtigung - Liste zulässiger Länder |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A20 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A21 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst -Task markieren -Versicherter - FHIR-Validierung Parameters |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A22 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst -Task markieren -Versicherter - nur einlösbare E-Rezepte |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A23 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst -Task markieren -Versicherter - Änderung Markierung Task Ressource |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A24 ](./menu-technische-umsetzung-anwendungsfaelle.md) | E-Rezept-FdV: TIFlow-EU - optionale Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A25 ](./menu-technische-umsetzung-anwendungsfaelle.md) | E-Rezept-FdV: Zugriffsberechtigung anzeigen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A26 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezept zum Einlösen im EU-Ausland markieren |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A27 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezept zum Einlösen im EU-Ausland markieren - Hinweis Belieferungsmöglichkeit |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A28 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: optional: E-Rezept markieren |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A29 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezept markieren - E-Rezepte auswählen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A3 ](./menu-technische-umsetzung-konzept.md) | TI-Flow-Fachdienst - Zugriffsberechtigung - Caching Liste zulässiger Länder |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A30 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezept markieren |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A31 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezept markieren - FHIR Ressource erstellen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A32 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezept markieren - Speicherrequest |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A33 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent löschen - EUDISPCONS - Löschen Zugriffsberechtigung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A34 ](./op-revoke-eu-access-permission-req-fdv.md) | E-Rezept-FdV: Zugriffsberechtigung löschen - Abfragerequest |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A35 ](./op-revoke-eu-access-permission-req-fdv.md) | E-Rezept-FdV: Zugriffsberechtigung löschen - lokale Zugriffsberechtigung löschen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A36 ](./op-read-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung lesen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A37 ](./op-read-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung lesen - Response |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A38 ](./op-eu-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - EU - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A39 ](./op-eu-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - EU - Schemaprüfung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A4 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A40 ](./op-eu-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - EU - Prüfung Einwilligung für KVNR |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A41 ](./op-eu-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - EU - Prüfung Zugriffsberechtigung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A42 ](./op-eu-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - EU - Statusprüfung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A43 ](./op-eu-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - EU - Zeitstempel MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A44 ](./op-eu-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - EU - Status beenden |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A45 ](./op-eu-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - EU - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A46 ](./op-read-eu-access-permission-req-fdv.md) | E-Rezept-FdV: Zugriffsberechtigung abrufen - Abfragerequest |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A47 ](./index.md) | E-Rezept: Anwendung des IG 'EU Zugriff E-Rezept' für Einlösen von E-Rezepten im EU Ausland |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A48 ](./index.md) | E-Rezept: Umsetzung des Moduls 'EU Zugriff E-Rezept' |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A49 ](./op-grant-eu-access-permission-req-fdv.md) | E-Rezept-FdV: Zugriffsberechtigung - Liste zulässiger Länder |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A5 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Schemaprüfung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A50 ](./op-grant-eu-access-permission-req-fdv.md) | E-Rezept-FdV: Zugriffsberechtigung - Caching Liste zulässiger Länder |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A51 ](./op-grant-eu-access-permission-req-fdv.md) | E-Rezept-FdV: Zugriffsberechtigung - Land auswählen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A52 ](./op-grant-eu-access-permission-req-fdv.md) | E-Rezept-FdV: Zugriffsberechtigung - Zugriffscode erzeugen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A53 ](./op-grant-eu-access-permission-req-fdv.md) | E-Rezept-FdV: Zugriffsberechtigung - Zugriffsberechtigung am TI-Flow-Fachdienst speichern |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A54 ](./op-revoke-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung löschen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A55 ](./op-revoke-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung löschen - Löschen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A56 ](./op-grant-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A57 ](./op-grant-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Einwillung für KVNR |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A58 ](./op-grant-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Ländercode |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A59 ](./op-grant-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Zugriffscode |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A6 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Prüfung Einwilligung für KVNR |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A60 ](./op-grant-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Löschen bestehender Zugriffsberechtigung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A61 ](./op-grant-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Neue Zugriffsberechtigung speichern |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A62 ](./op-grant-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Response |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A63 ](./op-grant-eu-access-permission-req-fd.md) | TI-Flow-Fachdienst - Zugriffsberechtigung - periodische Bereinigung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A64 ](./menu-technische-umsetzung-audit-service.md) | TI-Flow-Fachdienst - Versichertenprotokoll zu DiGA-Operationen |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A7 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Prüfung Zugriffsberechtigung |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A8 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Filter einlösbarer E-Rezepte |
| ** NEU ** | [ IG-TIFLOW-XBORDER-A9 ](./op-get-eu-prescriptions-req-fd.md) | TI-Flow-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage der aktuellsten Verordnungsinformationen |

Legende:
**NEU** = Hinzugefügt|
**ÄND** = Geändert|
**VERS** = Verschoben|
**DEL** = Entfernt

