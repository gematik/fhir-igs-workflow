# Release Notes - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

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
| ** NEU ** | [ IG-TIFLOW-DIGA-A1 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Flowtype 162 - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-DIGA-A10 ](./api-add-fhirvzd.md) | E-Rezept-FdV: Kostenträger suchen - Telematik-ID im Verzeichnisdienst suchen |
| ** NEU ** | [ IG-TIFLOW-DIGA-A11 ](./api-add-fhirvzd.md) | E-Rezept-FdV: Kostenträger Suchen - Liste verfügbarer Kostenträger ermitteln |
| ** NEU ** | [ IG-TIFLOW-DIGA-A12 ](./menu-technische-umsetzung-anwendungsfaelle.md) | PS verordnende LEI: TIFlow-DIGA - verpflichtende Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-DIGA-A13 ](./menu-technische-umsetzung-anwendungsfaelle.md) | E-Rezept-FdV: TIFlow-DIGA - verpflichtende Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-DIGA-A14 ](./menu-technische-umsetzung-anwendungsfaelle.md) | CS Kostenträger: TIFlow-DIGA - verpflichtende Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-DIGA-A15 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - QES durch berechtigte Berufsgruppe |
| ** NEU ** | [ IG-TIFLOW-DIGA-A17 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der PZN im Profil KBV_PR_EVDGA_HealthAppRequest |
| ** NEU ** | [ IG-TIFLOW-DIGA-A18 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Coverage Type |
| ** NEU ** | [ IG-TIFLOW-DIGA-A19 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Coverage Alternative IK |
| ** NEU ** | [ IG-TIFLOW-DIGA-A2 ](./query-api-communication-req-ktr.md) | CS Kostenträger: Nachricht versenden - Flowtype 162 - Communication erstellen |
| ** NEU ** | [ IG-TIFLOW-DIGA-A20 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - Prozessparameter |
| ** NEU ** | [ IG-TIFLOW-DIGA-A21 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Flowtype 162 - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-DIGA-A22 ](./op-create-req-pvs.md) | PS verordnende LEI: keine elektronische Verordnung einer DiGA zu Lasten BG/UK |
| ** NEU ** | [ IG-TIFLOW-DIGA-A23 ](./index.md) | E-Rezept: Anwendung des IG 'Verordnungen für Digitale Gesundheitsanwendungen (DiGA)' für Workflow 162 |
| ** NEU ** | [ IG-TIFLOW-DIGA-A24 ](./index.md) | E-Rezept: Umsetzung des Moduls 'Verordnungen für Digitale Gesundheitsanwendungen (DiGA)' |
| ** NEU ** | [ IG-TIFLOW-DIGA-A25 ](./query-api-medicationdispense-req-fdv.md) | E-Rezept-FdV: Abgabeinformationen abfragen - Flowtyp 162 - Anzeige des Freischaltcodes |
| ** NEU ** | [ IG-TIFLOW-DIGA-A26 ](./query-api-medicationdispense-req-fdv.md) | E-Rezept-FdV: Abgabeinformationen abfragen - Flowtyp 162 - Supportinformationen für DiGA-App |
| ** NEU ** | [ IG-TIFLOW-DIGA-A27 ](./op-close-req-ktr.md) | CS Kostenträger: Dispensierinformationen - Flowtype 162 - MedicationDispense erstellen |
| ** NEU ** | [ IG-TIFLOW-DIGA-A28 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Flowtype 162 - Ergänzung Performer-Typ für Einlöseinstitutstyp |
| ** NEU ** | [ IG-TIFLOW-DIGA-A29 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept einstellen - Flowtype 162 - Patientenausdruck |
| ** NEU ** | [ IG-TIFLOW-DIGA-A3 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schliessen - Flowtype 162 - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-DIGA-A30 ](./menu-technische-umsetzung-audit-service.md) | TI-Flow-Fachdienst - Versichertenprotokoll zu DiGA-Operationen |
| ** NEU ** | [ IG-TIFLOW-DIGA-A4 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Flowtype 162 - Profilprüfung MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-DIGA-A5 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: E-Rezept zuweisen - Flowtype 162 - Kostenträger auswählen |
| ** NEU ** | [ IG-TIFLOW-DIGA-A6 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: Verordnung zuweisen - Nachricht erstellen |
| ** NEU ** | [ IG-TIFLOW-DIGA-A7 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Flowtype 162 - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-DIGA-A8 ](./api-add-fhirvzd.md) | E-Rezept-FdV: optional: Kostenträger suchen |
| ** NEU ** | [ IG-TIFLOW-DIGA-A9 ](./api-add-fhirvzd.md) | E-Rezept-FdV: Kostenträger suchen - IKNR aus ACCESS_TOKEN beziehen |

Legende:
**NEU** = Hinzugefügt|
**ÄND** = Geändert|
**VERS** = Verschoben|
**DEL** = Entfernt

