# Release Notes - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.2

Implementation Guide

TIFlow - Abrechnungsinformationen

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
| ** NEU ** | [ IG-TIFLOW-CHRG-A1 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Nachricht erstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A10 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: optional: Liste Abrechnungsinformationen abrufen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A11 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: Liste Abrechnungsinformationen abrufen - Abfragerequest |
| ** NEU ** | [ IG-TIFLOW-CHRG-A12 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: optional: Abrechnungsinformation abrufen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A13 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: Abrechnungsinformation abrufen - Abfragerequest einzelner Datensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A14 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: optional: Abrechnungsinformation markieren |
| ** NEU ** | [ IG-TIFLOW-CHRG-A15 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: Abrechnungsinformation markieren - Markierungen auswählen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A16 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: Abrechnungsinformation markieren - Speicherrequest |
| ** NEU ** | [ IG-TIFLOW-CHRG-A17 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: optional: Abrechnungsinformation löschen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A18 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: Abrechnungsinformation löschen - Abrechnungsinformationen zum Löschen auswählen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A19 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: Abrechnungsinformation löschen - Bestätigung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A2 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Nachricht auf TI-Flow-Fachdienst einstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A20 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: Abrechnungsinformation löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CHRG-A21 ](./query-api-chargeitem-req-fdv.md) | E-Rezept-FdV: Hinweis automatisches Löschen Abrechnungsinformationen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A22 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: Abrechnungsinformation bereitstellen - Einwilligung muss vorliegen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A23 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: Abrechnungsinformation bereitstellen - E-Rezept auswählen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A24 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: Abrechnungsinformation bereitstellen - PKV-Abgabedatensatz erstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A25 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: Abrechnungsinformation bereitstellen - ChargeItem erstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A26 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: Abrechnungsinformation bereitstellen - Speicherrequest |
| ** NEU ** | [ IG-TIFLOW-CHRG-A27 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: PKV-Abgabedatensatz ändern - PKV-Abgabedatensatz zum Ändern auswählen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A28 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: PKV-Abgabedatensatz ändern - PKV-Abgabedatensatz erstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A29 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: PKV-Abgabedatensatz ändern - ChargeItem erstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A3 ](./menu-technische-umsetzung-verarbeitungsregeln.md) | E-Rezept-FdV: optional: 2D-Code Abrechnungsinformation anzeigen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A30 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: PKV-Abgabedatensatz ändern - Speicherrequest |
| ** NEU ** | [ IG-TIFLOW-CHRG-A31 ](./query-api-chargeitem-req-avs.md) | PS abgebende LEI: Abrechnungsinformation abrufen - Leserequest |
| ** NEU ** | [ IG-TIFLOW-CHRG-A32 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachricht versenden - Apotheke - Abrechnungsinformation - Communication Ressource erstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A33 ](./menu-technische-umsetzung-anwendungsfaelle.md) | E-Rezept-FdV: TIFlow-CHRG - verpflichtende Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-CHRG-A34 ](./menu-technische-umsetzung-anwendungsfaelle.md) | PS abgebende LEI: TIFlow-CHRG - verpflichtende Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-CHRG-A35 ](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) | Einwilligung in Verarbeitung von Abrechnungsinformationen nur für PKV-Versicherte |
| ** NEU ** | [ IG-TIFLOW-CHRG-A36 ](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) | Verarbeitung von Abrechnungsinformationen nur nach Einwilligung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A37 ](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) | Verarbeitung von Abrechnungsinformationen im TI-Flow-Fachdienst nur nach Einwilligung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A38 ](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) | Nichtabstreitbarkeit der Einwilligung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A39 ](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) | Löschen von Abrechnungsinformationen nach zehn Jahren |
| ** NEU ** | [ IG-TIFLOW-CHRG-A4 ](./menu-technische-umsetzung-verarbeitungsregeln.md) | E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen - E-Rezept auswählen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A40 ](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) | Information über Möglichkeit des Speicherns der Abrechnungsinformationen nur für konkretes E-Rezept |
| ** NEU ** | [ IG-TIFLOW-CHRG-A41 ](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) | Schutz der Abrechnungsinformationen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A42 ](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) | Protokollierung der Einwilligung bzw. des Widerrufs |
| ** NEU ** | [ IG-TIFLOW-CHRG-A43 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent löschen - Löschen der bestehenden Abrechnungsinformationen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A44 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - ChargeItem - unzulässige Operationen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A45 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Signaturzertifikat SMC-B prüfen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A46 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformationen abrufen - Rollenprüfung Versicherter |
| ** NEU ** | [ IG-TIFLOW-CHRG-A47 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformationen abrufen - Versicherter - Filter KVNR |
| ** NEU ** | [ IG-TIFLOW-CHRG-A48 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformationen abrufen - Suchkriterien |
| ** NEU ** | [ IG-TIFLOW-CHRG-A49 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformationen abrufen - Response |
| ** NEU ** | [ IG-TIFLOW-CHRG-A5 ](./menu-technische-umsetzung-verarbeitungsregeln.md) | E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen - Abrechnungsinformation-Token erstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A50 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation abrufen - Rollenprüfung Versicherter oder Apotheker |
| ** NEU ** | [ IG-TIFLOW-CHRG-A51 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation abrufen - Versicherter - Prüfung KVNR |
| ** NEU ** | [ IG-TIFLOW-CHRG-A52 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation abrufen - Apotheke - Prüfung Telematik-ID |
| ** NEU ** | [ IG-TIFLOW-CHRG-A53 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation abrufen - Apotheke - Prüfung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CHRG-A54 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation abrufen - Versicherte - Signieren |
| ** NEU ** | [ IG-TIFLOW-CHRG-A55 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation abrufen - Apotheke - kein AccessCode und Quittung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A56 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A57 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Prüfung Parameter Task |
| ** NEU ** | [ IG-TIFLOW-CHRG-A58 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Prüfung Existenz Task |
| ** NEU ** | [ IG-TIFLOW-CHRG-A59 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Prüfung Secret Task |
| ** NEU ** | [ IG-TIFLOW-CHRG-A6 ](./menu-technische-umsetzung-verarbeitungsregeln.md) | E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A60 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Prüfung Flowtype Task |
| ** NEU ** | [ IG-TIFLOW-CHRG-A61 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Prüfung Einwilligung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A62 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - ChargeItem-ID=Rezept-ID |
| ** NEU ** | [ IG-TIFLOW-CHRG-A63 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - FHIR-Validierung ChargeItem |
| ** NEU ** | [ IG-TIFLOW-CHRG-A64 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - PKV-Abgabedatensatz übernehmen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A65 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - FHIR-Validierung PKV-Abgabedatensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A66 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Signaturprüfung PKV-Abgabedatensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A67 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Prüfung Signaturzertifikat PKV-Abgabedatensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A68 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Verordnungsdatensatz übernehmen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A69 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Quittung übernehmen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A7 ](./menu-technische-umsetzung-verarbeitungsregeln.md) | E-Rezept-FdV: optional: Abrechnungsinformation exportieren |
| ** NEU ** | [ IG-TIFLOW-CHRG-A70 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Generierung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CHRG-A71 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - ChargeItem befüllen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A72 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - kein AccessCode und Quittung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A73 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-CHRG-A74 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern (PATCH) - alles Ändern verbieten |
| ** NEU ** | [ IG-TIFLOW-CHRG-A75 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern (PATCH) - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A76 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern (PATCH) - Versicherter - Prüfung KVNR |
| ** NEU ** | [ IG-TIFLOW-CHRG-A77 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern (PATCH) - FHIR-Validierung Parameters |
| ** NEU ** | [ IG-TIFLOW-CHRG-A78 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A79 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Prüfung Einwilligung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A8 ](./menu-technische-umsetzung-verarbeitungsregeln.md) | E-Rezept-FdV: Abrechnungsinformation exportieren - PDF/A erstellen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A80 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - Prüfung Telematik-ID |
| ** NEU ** | [ IG-TIFLOW-CHRG-A81 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - Prüfung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CHRG-A82 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - PKV-Abgabedatensatz übernehmen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A83 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - FHIR-Validierung PKV-Abgabedatensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A84 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - Signaturprüfung PKV-Abgabedatensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A85 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - Prüfung Signaturzertifikat PKV-Abgabedatensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A86 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - FHIR-Validierung ChargeItem |
| ** NEU ** | [ IG-TIFLOW-CHRG-A87 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - Generierung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CHRG-A88 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - kein AccessCode und Quittung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A89 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-CHRG-A9 ](./menu-technische-umsetzung-verarbeitungsregeln.md) | E-Rezept-FdV: Abrechnungsinformation exportieren - PDF teilen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A90 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation löschen - alles Löschen verbieten |
| ** NEU ** | [ IG-TIFLOW-CHRG-A91 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation löschen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CHRG-A92 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation löschen - Prüfung KVNR |
| ** NEU ** | [ IG-TIFLOW-CHRG-A93 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation löschen - zu löschende Ressourcen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A94 ](./index.md) | E-Rezept: Anwendung des IG 'Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte' für die Verwaltung von Abrechnungsinformationen |
| ** NEU ** | [ IG-TIFLOW-CHRG-A95 ](./index.md) | E-Rezept: Umsetzung des Moduls 'Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte' |
| ** NEU ** | [ IG-TIFLOW-CHRG-A96 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Prüfung Existenz ChargeItem |
| ** NEU ** | [ IG-TIFLOW-CHRG-A97 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - Prüfung Signaturzertifikat PKV-Abgabedatensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A98 ](./query-api-chargeitem-req-fd.md) | TI-Flow-Fachdienst - Abrechnungsinformation ändern - Apotheke - Prüfung Signaturzertifikat PKV-Abgabedatensatz |
| ** NEU ** | [ IG-TIFLOW-CHRG-A99 ](./menu-technische-umsetzung-audit-service.md) | TI-Flow-Fachdienst - Versichertenprotokoll zu DiGA-Operationen |

Legende:
**NEU** = Hinzugefügt|
**ÄND** = Geändert|
**VERS** = Verschoben|
**DEL** = Entfernt

### Version 1.1.0 (2025-04-10)

* `breaking-change` new meta.profile Version 1.1
* `breaking-change` new dependencies: 
* de.basisprofil.r4 1.5.2
 
* `breaking-change` new KVID Identifier from de.basisprofil.r4 (PKV Identifier is not allowed anymore)
* `breaking-change` GEM_ERPCHRG_PR_Consent.category now requires the use of GEM_ERPCHRG_VS_ConsentType
* `new profile` GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input for PATCH /ChargeItem
* `changed` fixed Slicing in ChargeItem
* `changed` fixed name in package.json

#### Anforderungen

Neue Anforderungen wurden hinzugefügt, bestehende geändert und nicht mehr benötigte gelöscht. Die folgenden Release Notes geben einen detaillierten Überblick über alle Anpassungen.

