# Release Notes - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* **Release Notes**

## Release Notes

### Version 2.0.0

#### Anforderungen

Neue Anforderungen wurden hinzugefügt, bestehende geändert und nicht mehr benötigte gelöscht. Die folgenden Release Notes geben einen detaillierten Überblick über alle Anpassungen.

| | | |
| :--- | :--- | :--- |
| 🔍 Alle Details umschalten | | |
| ** NEU ** | [ IG-TIFLOW-CORE-A100 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Rezepte lesen - Apotheke - PoPP - PoPP - Filter KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A104 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Prüfung PoPP-Token - Apotheke - PoPP Prüfung - Konfiguration PoPP-Service URL |
| ** NEU ** | [ IG-TIFLOW-CORE-A105 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Prüfung PoPP-Token - Aktualisierung des PoPP-Service JWK-Sets |
| ** NEU ** | [ IG-TIFLOW-CORE-A106 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Prüfung PoPP-Token - Prüfung Signaturzertifikat PoPP-Service |
| ** NEU ** | [ IG-TIFLOW-CORE-A107 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Prüfung PoPP-Token - Prüfung Rolle Signaturzertifikat PoPP-Service |
| ** NEU ** | [ IG-TIFLOW-CORE-A108 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Prüfung PoPP-Token - Telematik-ID prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A109 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A111 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - Versicherter - Rückgabe Task inkl. Bundles |
| ** NEU ** | [ IG-TIFLOW-CORE-A112 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - Versicherter - Kein Secret |
| ** NEU ** | [ IG-TIFLOW-CORE-A113 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - Keine Einlöseinformationen in unbekannten Clients |
| ** NEU ** | [ IG-TIFLOW-CORE-A114 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Verordnung abrufen - Prüfung Telematik-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A115 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Verordnung abrufen - Prüfung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CORE-A116 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Verordnung abrufen - Prüfung Status |
| ** NEU ** | [ IG-TIFLOW-CORE-A117 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Verordnung abrufen - erneuter Abruf Verordnung |
| ** NEU ** | [ IG-TIFLOW-CORE-A118 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - abgebende Institution - Rückgabe Task inkl. Bundle im Bundle |
| ** NEU ** | [ IG-TIFLOW-CORE-A120 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task markieren - alles Markieren verbieten |
| ** NEU ** | [ IG-TIFLOW-CORE-A121 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task markieren - Versicherter - Rollenprüfung Versicherter markiert Rezepte |
| ** NEU ** | [ IG-TIFLOW-CORE-A122 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst -Task markieren - Versicherter - Prüfung KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A123 ](./ttl.md) | TI-Flow-Fachdienst - Löschfrist abgelaufener Rezepte |
| ** NEU ** | [ IG-TIFLOW-CORE-A124 ](./ttl.md) | TI-Flow-Fachdienst - Löschinformation ePA Medication Service bereitstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A125 ](./ttl.md) | TI-Flow-Fachdienst - Löschen referenzierter Bundles |
| ** NEU ** | [ IG-TIFLOW-CORE-A126 ](./ttl.md) | TI-Flow-Fachdienst - Löschfrist veraltete MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-CORE-A127 ](./ttl.md) | TI-Flow-Fachdienst - Löschfrist ChargeItem |
| ** NEU ** | [ IG-TIFLOW-CORE-A128 ](./ttl.md) | TI-Flow-Fachdienst - Löschfrist veraltete Nachrichten |
| ** NEU ** | [ IG-TIFLOW-CORE-A129 ](./ttl.md) | TI-Flow-Fachdienst - Löschfrist veraltete Protokolleinträge |
| ** NEU ** | [ IG-TIFLOW-CORE-A130 ](./query-api-medicationdispense-req-fd.md) | TI-Flow-Fachdienst - MedicationDispense - unzulässige Operationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A131 ](./query-api-medicationdispense-req-fd.md) | TI-Flow-Fachdienst - MedicationDispense abrufen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A132 ](./query-api-medicationdispense-req-fd.md) | TI-Flow-Fachdienst - MedicationDispense abrufen - Filter MedicationDispense auf KVNR des Versicherten |
| ** NEU ** | [ IG-TIFLOW-CORE-A133 ](./query-api-medicationdispense-req-fd.md) | TI-Flow-Fachdienst - MedicationDispense abrufen - Referenzierung MedicationDispense und Medication |
| ** NEU ** | [ IG-TIFLOW-CORE-A134 ](./query-api-medicationdispense-req-fd.md) | TI-Flow-Fachdienst - MedicationDispense abrufen - Rückgabe mehrerer MedicationDispenses |
| ** NEU ** | [ IG-TIFLOW-CORE-A135 ](./query-api-auditevent-req-fd.md) | TI-Flow-Fachdienst - unzulässige Operationen AuditEvent |
| ** NEU ** | [ IG-TIFLOW-CORE-A136 ](./query-api-auditevent-req-fd.md) | TI-Flow-Fachdienst - AuditEvent lesen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A137 ](./query-api-auditevent-req-fd.md) | TI-Flow-Fachdienst - AuditEvent lesen - Filter KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A138 ](./query-api-auditevent-req-fd.md) | TI-Flow-Fachdienst - AuditEvent lesen - Rückgabe im Bundle |
| ** NEU ** | [ IG-TIFLOW-CORE-A139 ](./query-api-channels-req-fdv.md) | E-Rezept-FdV: Push Notifications - Channelkonfiguration - OpenAPI |
| ** NEU ** | [ IG-TIFLOW-CORE-A140 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Versicherter - Prüfung KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A141 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Verordnender - Prüfung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CORE-A142 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Verordnender - Prüfung Status |
| ** NEU ** | [ IG-TIFLOW-CORE-A143 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Medizinische und personenbezogene Daten löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A144 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Status |
| ** NEU ** | [ IG-TIFLOW-CORE-A145 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-CORE-A146 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachrichten abrufen - Häufigkeit |
| ** NEU ** | [ IG-TIFLOW-CORE-A147 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachrichten abrufen - Abfrage |
| ** NEU ** | [ IG-TIFLOW-CORE-A148 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachricht versenden - Nachricht auf Fachdienst einstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A149 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachricht löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A150 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept einstellen - Task auf Fachdienst aktivieren |
| ** NEU ** | [ IG-TIFLOW-CORE-A151 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept einstellen - kein Patientenausdruck bei Fehler beim Aktivieren |
| ** NEU ** | [ IG-TIFLOW-CORE-A152 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept einstellen - separater Patientenausdruck je Flowtype |
| ** NEU ** | [ IG-TIFLOW-CORE-A153 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept einstellen - E-Rezept-Token erstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A154 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept einstellen - Datamatrix-Code erstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A155 ](./kommunikation-dienste-ti.md) | CS: Lokalisierung TI-Flow-Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A156 ](./kommunikation-dienste-ti.md) | CS: Endpunkt Schnittstelle TI-Flow-Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A157 ](./kommunikation-dienste-ti.md) | CS: Kommunikation über TLS-Verbindung |
| ** NEU ** | [ IG-TIFLOW-CORE-A158 ](./kommunikation-dienste-ti.md) | CS: Unzulässige TLS-Verbindungen ablehnen |
| ** NEU ** | [ IG-TIFLOW-CORE-A162 ](./kommunikation-dienste-ti.md) | CS: Umsetzung sicherer Kanal zur VAU des TI-Flow-Fachdienstes |
| ** NEU ** | [ IG-TIFLOW-CORE-A163 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription Service - Webschnittstelle |
| ** NEU ** | [ IG-TIFLOW-CORE-A164 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription Service - Prüfung Bearer-Token |
| ** NEU ** | [ IG-TIFLOW-CORE-A165 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription Service - Upgrade |
| ** NEU ** | [ IG-TIFLOW-CORE-A166 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription Service - abgelaufene Verbindungen schließen |
| ** NEU ** | [ IG-TIFLOW-CORE-A167 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription Service - Verbot Profilbildung |
| ** NEU ** | [ IG-TIFLOW-CORE-A168 ](./op-abort-req-avs.md) | PS abgebende LEI: E-Rezepte löschen - E-Rezept auswählen |
| ** NEU ** | [ IG-TIFLOW-CORE-A169 ](./op-abort-req-avs.md) | PS abgebende LEI: E-Rezept löschen - Bestätigung |
| ** NEU ** | [ IG-TIFLOW-CORE-A170 ](./op-abort-req-avs.md) | PS abgebende LEI: E-Rezept durch Abgebenden löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A171 ](./op-abort-req-avs.md) | PS abgebende LEI: E-Rezept löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A172 ](./op-abort-req-avs.md) | PS abgebende LEI: E-Rezept löschen - E-Rezept-Token löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A173 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A174 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Prüfung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CORE-A175 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Prüfung Status |
| ** NEU ** | [ IG-TIFLOW-CORE-A176 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Schemavalidierung |
| ** NEU ** | [ IG-TIFLOW-CORE-A177 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA |
| ** NEU ** | [ IG-TIFLOW-CORE-A178 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Verordnung QES prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A180 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Prüfung Rezept-ID in Task gegen Verordnungsdatensatz |
| ** NEU ** | [ IG-TIFLOW-CORE-A181 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Versicherten-ID als Identifikator von Versicherten |
| ** NEU ** | [ IG-TIFLOW-CORE-A182 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Prüfregel Ausstellungsdatum |
| ** NEU ** | [ IG-TIFLOW-CORE-A183 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Übernahme der Versicherten-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A184 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-CORE-A185 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Status ready |
| ** NEU ** | [ IG-TIFLOW-CORE-A186 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Serversignatur |
| ** NEU ** | [ IG-TIFLOW-CORE-A187 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der IK Nummer im Profil KBV_PR_FOR_Coverage |
| ** NEU ** | [ IG-TIFLOW-CORE-A188 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der IK Nummer im Profil KBV_PR_FOR_Coverage - AlternativeID |
| ** NEU ** | [ IG-TIFLOW-CORE-A189 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung KVNR im Profil KBV_PR_FOR_Patient |
| ** NEU ** | [ IG-TIFLOW-CORE-A190 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR im Profil KBV_PR_FOR_Practitioner |
| ** NEU ** | [ IG-TIFLOW-CORE-A191 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration bei Auffälligkeiten |
| ** NEU ** | [ IG-TIFLOW-CORE-A192 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration Fehler |
| ** NEU ** | [ IG-TIFLOW-CORE-A193 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration Warning |
| ** NEU ** | [ IG-TIFLOW-CORE-A197 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezepte abrufen - Liste E-Rezepte abrufen |
| ** NEU ** | [ IG-TIFLOW-CORE-A198 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezept abrufen - E-Rezepte lokal speichern |
| ** NEU ** | [ IG-TIFLOW-CORE-A199 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: E-Rezepte abrufen - Spezifisches E-Rezept herunterladen |
| ** NEU ** | [ IG-TIFLOW-CORE-A201 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent - unzulässige Operationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A202 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent schreiben - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A203 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent schreiben - Prüfung KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A204 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent schreiben - FHIR-Validierung |
| ** NEU ** | [ IG-TIFLOW-CORE-A205 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent schreiben - nur eine Einwilligung pro KVNR und Einwilligungstyp |
| ** NEU ** | [ IG-TIFLOW-CORE-A206 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent schreiben - Zeitstempel setzen |
| ** NEU ** | [ IG-TIFLOW-CORE-A207 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent schreiben - Persistieren |
| ** NEU ** | [ IG-TIFLOW-CORE-A208 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent schreiben - Persistieren |
| ** NEU ** | [ IG-TIFLOW-CORE-A209 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent lesen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A210 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent lesen - Filter KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A211 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent löschen - alles Löschen verbieten |
| ** NEU ** | [ IG-TIFLOW-CORE-A212 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent löschen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A213 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent löschen - Prüfung category |
| ** NEU ** | [ IG-TIFLOW-CORE-A214 ](./query-api-consent-req-fd.md) | TI-Flow-Fachdienst - Consent löschen - Ressource löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A215 ](./query-api-task-req-ktr.md) | CS Kostenträger: Recovery Secret - Statusrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A216 ](./query-api-task-req-ktr.md) | CS Kostenträger: Quittung erneut abrufen - Statusrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A217 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A218 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Schemavalidierung Rezept anlegen |
| ** NEU ** | [ IG-TIFLOW-CORE-A219 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Parametrierung Task für Workflow-Typ |
| ** NEU ** | [ IG-TIFLOW-CORE-A221 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Generierung Rezept-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A222 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Task-ID=Rezept-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A223 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Generierung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CORE-A224 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Status draft |
| ** NEU ** | [ IG-TIFLOW-CORE-A225 ](./menu-technische-umsetzung-push.md) | TI-Flow-Fachdienst - Push Notification senden - Nachrichteninhalt erzeugen |
| ** NEU ** | [ IG-TIFLOW-CORE-A226 ](./menu-technische-umsetzung-push.md) | TI-Flow-Fachdienst - Push Notification senden - verpflichtende Verschlüsselung |
| ** NEU ** | [ IG-TIFLOW-CORE-A227 ](./menu-technische-umsetzung-push.md) | TI-Flow-Fachdienst - Push Notification senden - Referenz auf Protokolleintrag |
| ** NEU ** | [ IG-TIFLOW-CORE-A228 ](./menu-technische-umsetzung-push.md) | E-Rezept - Push Notifications - Datenstruktur Nachrichteninhalte |
| ** NEU ** | [ IG-TIFLOW-CORE-A229 ](./datamatrix-code-client.md) | Datenstruktur Einlöseinformationen für E-Rezept |
| ** NEU ** | [ IG-TIFLOW-CORE-A230 ](./datamatrix-code-client.md) | Generierung 2D-Code als Sammlung |
| ** NEU ** | [ IG-TIFLOW-CORE-A231 ](./datamatrix-code-client.md) | Generierung DataMatrix-Code |
| ** NEU ** | [ IG-TIFLOW-CORE-A232 ](./datamatrix-code-client.md) | E-Rezept-FdV: E-Rezept-Token als 2D-Code anzeigen - Flowtype 169 / 209 - Anzeige nicht zulässig |
| ** NEU ** | [ IG-TIFLOW-CORE-A233 ](./datamatrix-code-client.md) | E-Rezept-FdV: E-Rezept-Token als 2D-Code anzeigen - maximal 3 E-Rezept-Token in 2D-Code |
| ** NEU ** | [ IG-TIFLOW-CORE-A234 ](./datamatrix-code-client.md) | E-Rezept-FdV: E-Rezept-Token als 2D-Code anzeigen - personenbezogene Daten |
| ** NEU ** | [ IG-TIFLOW-CORE-A235 ](./datamatrix-code-client.md) | CS: 2D-Code scannen - Gescannte Inhalte prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A236 ](./datamatrix-code-client.md) | PS abgebende LEI: 2D-Code scannen - Mehrfachverordnung - Teilverordnungen nicht speichern |
| ** NEU ** | [ IG-TIFLOW-CORE-A237 ](./datamatrix-code-client.md) | PS abgebende LEI: 2D-Code scannen - Mehrfachverordnung - Teilverordnungen speichern falls gewünscht |
| ** NEU ** | [ IG-TIFLOW-CORE-A238 ](./datamatrix-code-client.md) | Datenstruktur Zugriffsinformationen für Abrechnungsinformation |
| ** NEU ** | [ IG-TIFLOW-CORE-A239 ](./datamatrix-code-client.md) | Generierung 2D-Code Abrechnungsinformation-Token |
| ** NEU ** | [ IG-TIFLOW-CORE-A240 ](./health-check.md) | CS: Health-Check - Datensparsamkeit |
| ** NEU ** | [ IG-TIFLOW-CORE-A241 ](./health-check.md) | CS: Health-Check - keine Health-Checks mit Fehlerrückgabe |
| ** NEU ** | [ IG-TIFLOW-CORE-A242 ](./health-check.md) | CS: erweiterter Health-Check |
| ** NEU ** | [ IG-TIFLOW-CORE-A243 ](./health-check.md) | CS: erweiterter Health-Check - keine periodische Durchführung |
| ** NEU ** | [ IG-TIFLOW-CORE-A244 ](./health-check.md) | CS: erweiterter Health-Check - keine anderen Endpunkte zulässig |
| ** NEU ** | [ IG-TIFLOW-CORE-A245 ](./health-check.md) | CS: einfacher Health-Check |
| ** NEU ** | [ IG-TIFLOW-CORE-A246 ](./health-check.md) | CS: einfacher Health-Check - keine anderen Endpunkte zulässig |
| ** NEU ** | [ IG-TIFLOW-CORE-A247 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Prüfung Datensatz zwischenzeitlich gelöscht |
| ** NEU ** | [ IG-TIFLOW-CORE-A248 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Prüfung AccessCode |
| ** NEU ** | [ IG-TIFLOW-CORE-A249 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Rezept bereits in Abgabe oder Bearbeitung |
| ** NEU ** | [ IG-TIFLOW-CORE-A250 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Ende Einlösefrist prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A251 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Generierung Secret, Statuswechsel in Abgabe und Rückgabewert |
| ** NEU ** | [ IG-TIFLOW-CORE-A252 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Telematik-ID der abgebenden Institution speichern |
| ** NEU ** | [ IG-TIFLOW-CORE-A253 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-CORE-A254 ](./op-reject-req-avs.md) | PS abgebende LEI: E-Rezept zurückgeben - Statusrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A255 ](./op-reject-req-avs.md) | PS abgebende LEI: E-Rezept zurückgeben - E-Rezept löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A256 ](./op-accept-req-avs.md) | PS abgebende LEI: E-Rezept abrufen - Task herunterladen |
| ** NEU ** | [ IG-TIFLOW-CORE-A257 ](./op-create-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - E-Rezept-Bundle erstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A258 ](./op-create-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Gleichheit Ausstellungsdatum und QES Erstellung |
| ** NEU ** | [ IG-TIFLOW-CORE-A259 ](./op-create-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - E-Rezept-ID abrufen |
| ** NEU ** | [ IG-TIFLOW-CORE-A260 ](./op-create-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - E-Rezept-Bundle QES signieren |
| ** NEU ** | [ IG-TIFLOW-CORE-A263 ](./fehlerbehandlung-client.md) | CS: Verständliche Fehlermeldung |
| ** NEU ** | [ IG-TIFLOW-CORE-A264 ](./fehlerbehandlung-client.md) | CS: Fehlerbehandlung - Retry von Anfragen an TI-Flow-Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A265 ](./fehlerbehandlung-client.md) | CS: Schreiben eines Fehlerprotokolls |
| ** NEU ** | [ IG-TIFLOW-CORE-A266 ](./fehlerbehandlung-client.md) | CS: Anzeige von Meldungen |
| ** NEU ** | [ IG-TIFLOW-CORE-A267 ](./fehlerbehandlung-client.md) | CS: Exponential Backoff bei Verbindungsfehlern |
| ** NEU ** | [ IG-TIFLOW-CORE-A268 ](./query-api-pushers-req-fd.md) | TI-Flow-Fachdienst - unzulässige Operationen Pushers |
| ** NEU ** | [ IG-TIFLOW-CORE-A269 ](./query-api-pushers-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - Pushers - OpenApi_Notification_Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A270 ](./query-api-pushers-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - App-Registrierungen abrufen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A271 ](./query-api-pushers-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - App-Registrierungen abrufen - Filter auf KVNR des Versicherten |
| ** NEU ** | [ IG-TIFLOW-CORE-A272 ](./query-api-pushers-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - App-Registrierung - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A273 ](./fhir-validate.md) | TI-Flow-Fachdienst - Prüfung Gültigkeit FHIR Ressourcen |
| ** NEU ** | [ IG-TIFLOW-CORE-A274 ](./fhir-validate.md) | TI-Flow-Fachdienst - FHIR-Ressource validieren - Prüfung Datumsangabe ohne Zeitzoneninformation |
| ** NEU ** | [ IG-TIFLOW-CORE-A275 ](./fhir-validate.md) | FHIR-Ressourcen - Datumsangabe ohne Zeitzoneninformation |
| ** NEU ** | [ IG-TIFLOW-CORE-A276 ](./fhir-validate.md) | TI-Flow-Fachdienst - FHIR-Ressource validieren - Eindeutige Angabe meta.profile |
| ** NEU ** | [ IG-TIFLOW-CORE-A277 ](./fhir-validate.md) | FHIR-Ressourcen - Eindeutige Angabe meta.profile |
| ** NEU ** | [ IG-TIFLOW-CORE-A278 ](./fhir-validate.md) | TI-Flow-Fachdienst - FHIR-Ressource validieren - Pruefung Konsistenz Ressource IDs |
| ** NEU ** | [ IG-TIFLOW-CORE-A279 ](./fhir-validate.md) | TI-Flow-Fachdienst - FHIR-Ressource validieren - Prüfung Format fullUrl |
| ** NEU ** | [ IG-TIFLOW-CORE-A280 ](./fhir-validate.md) | TI-Flow-Fachdienst - FHIR-Ressource validieren - Prüfung Existenz von Ressource.id |
| ** NEU ** | [ IG-TIFLOW-CORE-A281 ](./fhir-validate.md) | TI-Flow-Fachdienst - FHIR-Ressource validieren - Prüfung Auflösbarkeit von Referenzen |
| ** NEU ** | [ IG-TIFLOW-CORE-A282 ](./fhir-validate.md) | FHIR-Ressourcen - Ressource-ID in fullUrl |
| ** NEU ** | [ IG-TIFLOW-CORE-A283 ](./fhir-validate.md) | FHIR-Ressourcen - Format fullUrl |
| ** NEU ** | [ IG-TIFLOW-CORE-A284 ](./fhir-validate.md) | FHIR-Ressourcen Versionsangabe |
| ** NEU ** | [ IG-TIFLOW-CORE-A285 ](./fhir-validate.md) | TI-Flow-Fachdienst - FHIR-Ressource validieren - Ausschluss unspezifizierter Extensions |
| ** NEU ** | [ IG-TIFLOW-CORE-A286 ](./fhir-validate.md) | FHIR Ressourcen - Ausschluss unspezifizierter Extensions |
| ** NEU ** | [ IG-TIFLOW-CORE-A287 ](./query-api-consent-req-fdv.md) | E-Rezept-FdV: Einwilligung erteilen - Einwilligungstext |
| ** NEU ** | [ IG-TIFLOW-CORE-A288 ](./query-api-consent-req-fdv.md) | E-Rezept-FdV: Einwilligung erteilen - Einwilligung eingeben |
| ** NEU ** | [ IG-TIFLOW-CORE-A289 ](./query-api-consent-req-fdv.md) | E-Rezept-FdV: Einwilligung erteilen - Consent Ressource erstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A290 ](./query-api-consent-req-fdv.md) | E-Rezept-FdV: Einwilligung erteilen - Speicherrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A291 ](./query-api-consent-req-fdv.md) | E-Rezept-FdV: Einwilligungsinformation abrufen - Abfragerequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A292 ](./query-api-consent-req-fdv.md) | E-Rezept-FdV: Einwilligung widerrufen - Widerruf eingeben |
| ** NEU ** | [ IG-TIFLOW-CORE-A293 ](./query-api-consent-req-fdv.md) | E-Rezept-FdV: Einwilligung widerrufen - Bestätigung |
| ** NEU ** | [ IG-TIFLOW-CORE-A294 ](./query-api-consent-req-fdv.md) | E-Rezept-FdV: Einwilligung widerrufen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A295 ](./op-close-req-avs.md) | PS abgebende LEI: Quittung abrufen - Abschluss des Workflows durchführen |
| ** NEU ** | [ IG-TIFLOW-CORE-A296 ](./op-close-req-avs.md) | PS abgebende LEI: Quittung abrufen - Statusrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A297 ](./op-close-req-avs.md) | PS abgebende LEI: Quittung abrufen - Quittungssignatur prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A298 ](./op-close-req-avs.md) | PS abgebende LEI: Quittung abrufen - Stapelverarbeitung |
| ** NEU ** | [ IG-TIFLOW-CORE-A299 ](./op-close-req-avs.md) | PS abgebende LEI: Quittung abrufen - Stapelverarbeitung - Startzeitpunkt |
| ** NEU ** | [ IG-TIFLOW-CORE-A30 ](./audit-service.md) | TI-Flow-Fachdienst - Inhalt Protokolleintrag |
| ** NEU ** | [ IG-TIFLOW-CORE-A300 ](./op-close-req-avs.md) | PS abgebende LEI: Quittung abrufen - Stapelverarbeitung - Wartezeit zwischen Aufrufen |
| ** NEU ** | [ IG-TIFLOW-CORE-A301 ](./query-api-auditevent-req-fdv.md) | E-Rezept-FdV: Protokolldaten anzeigen - Protokolleinträge abrufen |
| ** NEU ** | [ IG-TIFLOW-CORE-A302 ](./pki-zertifikatspruefung.md) | CS: verpflichtende Zertifikatsprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A303 ](./pki-zertifikatspruefung.md) | CS: Prüfung TI-Zertifikate |
| ** NEU ** | [ IG-TIFLOW-CORE-A304 ](./pki-zertifikatspruefung.md) | CS: Prüfung der Zertifikate für TLS-Verbindung zu TI-Flow-Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A305 ](./query-api-subscription-req-avs.md) | PS abgebende LEI: Subscription für neue Communication - eine Subscription pro Telematik-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A307 ](./query-api-subscription-req-avs.md) | PS abgebende LEI: Subscription für neue Communication - Subscription Ressource erstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A308 ](./query-api-subscription-req-avs.md) | PS abgebende LEI: Subscription für neue Communication - Subscription registrieren |
| ** NEU ** | [ IG-TIFLOW-CORE-A309 ](./query-api-subscription-req-avs.md) | PS abgebende LEI: Subscription für neue Communication - Subscription |
| ** NEU ** | [ IG-TIFLOW-CORE-A31 ](./audit-service.md) | TI-Flow-Fachdienst - Versichertenprotokoll zu Operationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A310 ](./query-api-subscription-req-avs.md) | PS abgebende LEI: Subscription für neue Communication - Wartezeit |
| ** NEU ** | [ IG-TIFLOW-CORE-A311 ](./op-abort-req-pvs.md) | PS verordnende LEI: E-Rezepte löschen - E-Rezept zum Löschen auswählen |
| ** NEU ** | [ IG-TIFLOW-CORE-A312 ](./op-abort-req-pvs.md) | PS verordnende LEI: E-Rezept löschen - Bestätigung |
| ** NEU ** | [ IG-TIFLOW-CORE-A313 ](./op-abort-req-pvs.md) | PS verordnende LEI: E-Rezept durch Verordnenden löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A314 ](./op-abort-req-pvs.md) | PS verordnende LEI: E-Rezept löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A315 ](./op-abort-req-pvs.md) | PS verordnende LEI: E-Rezept löschen - E-Rezept-Token löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A316 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Communication - unzulässige Operationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A317 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Communication - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A318 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachrichten abrufen - für Empfänger filtern |
| ** NEU ** | [ IG-TIFLOW-CORE-A319 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachrichten abrufen - als abgerufen markieren |
| ** NEU ** | [ IG-TIFLOW-CORE-A32 ](./audit-service.md) | TI-Flow-Fachdienst - Versichertenprotokoll zu automatischen Löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A320 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Schemaprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A321 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Validierung Payload GEM_ERP_PR_Communication_DispReq |
| ** NEU ** | [ IG-TIFLOW-CORE-A323 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Absender und Sendedatum |
| ** NEU ** | [ IG-TIFLOW-CORE-A327 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Ausschluss Nachrichten an Empfänger gleich Absender |
| ** NEU ** | [ IG-TIFLOW-CORE-A328 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Schadcodeprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A329 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Prüfung Versichertenbezug |
| ** NEU ** | [ IG-TIFLOW-CORE-A33 ](./audit-service.md) | TI-Flow-Fachdienst - Versichertenprotokoll zu Löschen nach Fehlerbehandlung |
| ** NEU ** | [ IG-TIFLOW-CORE-A330 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Prüfung des Empfängers |
| ** NEU ** | [ IG-TIFLOW-CORE-A331 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Prüfung Existenz Task |
| ** NEU ** | [ IG-TIFLOW-CORE-A332 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Status Task |
| ** NEU ** | [ IG-TIFLOW-CORE-A333 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Ende Gültigkeit Task |
| ** NEU ** | [ IG-TIFLOW-CORE-A334 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Beginn Gültigkeit Task |
| ** NEU ** | [ IG-TIFLOW-CORE-A335 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Notification Apotheke |
| ** NEU ** | [ IG-TIFLOW-CORE-A336 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht einstellen - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-CORE-A337 ](./query-api-communication-req-fd.md) | TI-Flow-Fachdienst - Nachricht löschen - Absender-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A339 ](./query-api-medicationdispense-req-fdv.md) | E-Rezept-FdV: Abgabeinformationen abfragen - MedicationDispense abrufen |
| ** NEU ** | [ IG-TIFLOW-CORE-A34 ](./audit-service.md) | TI-Flow-Fachdienst - Protokolleintrag Versichertenprotokoll leicht verständlich |
| ** NEU ** | [ IG-TIFLOW-CORE-A340 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Http-Status-Codes |
| ** NEU ** | [ IG-TIFLOW-CORE-A341 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Fehlerdetails in OperationOutcome |
| ** NEU ** | [ IG-TIFLOW-CORE-A342 ](./op-close-req-ktr.md) | CS Kostenträger: Quittung abrufen - Abschluss des Workflows durchführen |
| ** NEU ** | [ IG-TIFLOW-CORE-A343 ](./op-close-req-ktr.md) | CS Kostenträger: Quittung abrufen - Statusrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A344 ](./op-reject-req-ktr.md) | CS Kostenträger: Verordnung zurückgeben - Statusrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A345 ](./op-reject-req-ktr.md) | CS Kostenträger: Verordnung zurückgeben - Verordnung löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A346 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription registrieren - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A347 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription registrieren - Response |
| ** NEU ** | [ IG-TIFLOW-CORE-A348 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription registrieren - Pseudonym der Telematik-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A349 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Generierungsschlüssel - Pseudonym der Telematik-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A35 ](./audit-service.md) | TI-Flow-Fachdienst - Protokollierung - keine Angabe zu organizationName |
| ** NEU ** | [ IG-TIFLOW-CORE-A350 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription registrieren - Barrier-Token |
| ** NEU ** | [ IG-TIFLOW-CORE-A351 ](./query-api-subscription-req-fd.md) | TI-Flow-Fachdienst - Subscription registrieren - Prüfung Telematik-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A352 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - RESTful API |
| ** NEU ** | [ IG-TIFLOW-CORE-A353 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - RESTful API MimeType fhir+xml |
| ** NEU ** | [ IG-TIFLOW-CORE-A354 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - RESTful API MimeType fhir+json |
| ** NEU ** | [ IG-TIFLOW-CORE-A355 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - RESTful API MimeType Aufrufparameter |
| ** NEU ** | [ IG-TIFLOW-CORE-A356 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - RESTful API Capability Statement |
| ** NEU ** | [ IG-TIFLOW-CORE-A357 ](./menu-schnittstellen-generelle-prinzipien.md) | Aufbau Verordnungs-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A358 ](./menu-schnittstellen-generelle-prinzipien.md) | Prüfung Verordnungs-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A359 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - Verarbeitung von Datensätzen - Deserialisierung von PKCS#7 Enveloping-Daten |
| ** NEU ** | [ IG-TIFLOW-CORE-A360 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - Verarbeitung von Datensätzen - Forcieren von UTF-8 ohne BOM |
| ** NEU ** | [ IG-TIFLOW-CORE-A361 ](./menu-schnittstellen-generelle-prinzipien.md) | Character Encoding für TI-Flow-Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A362 ](./menu-schnittstellen-generelle-prinzipien.md) | Verbot Angabe von BOM für TI-Flow-Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A363 ](./menu-schnittstellen-generelle-prinzipien.md) | CS: Verarbeitung von Datumsangaben ohne Zeitzoneninformation |
| ** NEU ** | [ IG-TIFLOW-CORE-A37 ](./query-api-task-req-avs.md) | PS abgebende LEI: Recovery Secret - Statusrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A374 ](./query-api-pushers-req-fdv.md) | E-Rezept-FdV: Push Notifications - Instanz registrieren - OpenAPI |
| ** NEU ** | [ IG-TIFLOW-CORE-A375 ](./query-api-device-req-fd.md) | TI-Flow-Fachdienst - Selbstauskunft Device-Informationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A376 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - TLS-Server X.509-Zertifikat des ePA-Aktensystems auf Gültigkeit prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A377 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - TLS-Server X.509-Zertifikat des ePA-Aktensystems Rolle prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A378 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - JWT Bearer-Token Claims |
| ** NEU ** | [ IG-TIFLOW-CORE-A379 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - JWT Bearer-Token Signatur |
| ** NEU ** | [ IG-TIFLOW-CORE-A38 ](./query-api-task-req-avs.md) | PS abgebende LEI: Quittung erneut abrufen - Statusrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A380 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Festlegung der ClientID |
| ** NEU ** | [ IG-TIFLOW-CORE-A381 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Lokalisierung des ePA-Aktensysteme |
| ** NEU ** | [ IG-TIFLOW-CORE-A382 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Aktualisierung Cache ePA-Aktensysteme |
| ** NEU ** | [ IG-TIFLOW-CORE-A383 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - ePA-Aktensystem für KVNR ermitteln |
| ** NEU ** | [ IG-TIFLOW-CORE-A384 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Aktualisierung Cache Zuordnung KVNR zu ePA-Aktensystem |
| ** NEU ** | [ IG-TIFLOW-CORE-A385 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Aktualisierung Cache Zuordnung KVNR zu ePA-Aktensystem - Statuscode 404 |
| ** NEU ** | [ IG-TIFLOW-CORE-A386 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Fehlerbehandlung - Information Service - Fehler im Information Service |
| ** NEU ** | [ IG-TIFLOW-CORE-A387 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Fehlerbehandlung - Information Service - Struktureller Fehler |
| ** NEU ** | [ IG-TIFLOW-CORE-A388 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Flowtype 160/166/169/200/209 |
| ** NEU ** | [ IG-TIFLOW-CORE-A389 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - asynchrone Bereitstellung und Übermittlung |
| ** NEU ** | [ IG-TIFLOW-CORE-A39 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Prüfung Secret |
| ** NEU ** | [ IG-TIFLOW-CORE-A390 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Mapping |
| ** NEU ** | [ IG-TIFLOW-CORE-A391 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - provide-dispensation-erp - Organisation-Ressource |
| ** NEU ** | [ IG-TIFLOW-CORE-A392 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Mapping - Übernahme von Werten zwischen Profilen |
| ** NEU ** | [ IG-TIFLOW-CORE-A393 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Mapping - Handhabung von Extensions |
| ** NEU ** | [ IG-TIFLOW-CORE-A394 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Fehlerbehandlung - Nichtauffinden in allen ePA-Aktensystemen |
| ** NEU ** | [ IG-TIFLOW-CORE-A395 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Prüfung des Widerspruchs vor Übermittlung |
| ** NEU ** | [ IG-TIFLOW-CORE-A396 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Übermittlung - Bereitstellung von Verordnungsdaten |
| ** NEU ** | [ IG-TIFLOW-CORE-A397 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Übermittlung - Löschinformation von Verordnungsdaten |
| ** NEU ** | [ IG-TIFLOW-CORE-A398 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Übermittlung - Bereitstellung von Dispensierinformationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A399 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Übermittlung - Löschinformation von Dispensierinformationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A40 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Prüfung Status |
| ** NEU ** | [ IG-TIFLOW-CORE-A400 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Übermittlung - Bündelung von Übermittlungsaufträgen nach KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A401 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Fehlerbehandlung - Aktenkonto-Umzug |
| ** NEU ** | [ IG-TIFLOW-CORE-A402 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Fehlerbehandlung - Reaktion auf Scheitern des Operationaufrufs |
| ** NEU ** | [ IG-TIFLOW-CORE-A403 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Fehlerbehandlung - Probleme bei der Entschlüsselung durch den Medication Service |
| ** NEU ** | [ IG-TIFLOW-CORE-A404 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Fehlerbehandlung - Probleme bei der Entschlüsselung durch den TI-Flow-Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A405 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Fehlerbehandlung - Reaktion auf Nichtverfügbarkeit des Medication Service |
| ** NEU ** | [ IG-TIFLOW-CORE-A406 ](./op-accept-req-ktr.md) | CS Kostenträger: E-Rezept abrufen - Task herunterladen |
| ** NEU ** | [ IG-TIFLOW-CORE-A407 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - Versicherter - Prüfung KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A408 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA - fehlender OCSP-Response |
| ** NEU ** | [ IG-TIFLOW-CORE-A409 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Verordnung FHIR Validierung |
| ** NEU ** | [ IG-TIFLOW-CORE-A41 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Secret löschen und Status setzen |
| ** NEU ** | [ IG-TIFLOW-CORE-A410 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Verordnung speichern |
| ** NEU ** | [ IG-TIFLOW-CORE-A411 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA - OCSP-Response einbetten |
| ** NEU ** | [ IG-TIFLOW-CORE-A412 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Prüfung Präfix Rezept-ID gegen Flowtype |
| ** NEU ** | [ IG-TIFLOW-CORE-A413 ](./query-api-subscription-req-ktr.md) | CS Kostenträger: Subscription für neue Communication - eine Subscription pro Telematik-ID |
| ** NEU ** | [ IG-TIFLOW-CORE-A414 ](./query-api-subscription-req-ktr.md) | CS Kostenträger: Subscription für neue Communication - Subscription Ressource erstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A415 ](./query-api-subscription-req-ktr.md) | CS Kostenträger: Subscription für neue Communication - Subscription registrieren |
| ** NEU ** | [ IG-TIFLOW-CORE-A416 ](./query-api-subscription-req-ktr.md) | CS Kostenträger: Subscription für neue Communication - Subscription |
| ** NEU ** | [ IG-TIFLOW-CORE-A417 ](./query-api-subscription-req-ktr.md) | CS Kostenträger: Subscription für neue Communication - Wartezeit |
| ** NEU ** | [ IG-TIFLOW-CORE-A418 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - Reihenfolge Eingansprüfungen für Operationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A419 ](./query-api-pushers-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - App-Registrierung - Zeitstempel ändern |
| ** NEU ** | [ IG-TIFLOW-CORE-A42 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Telematik-ID der abgebenden LEI löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A420 ](./menu-technische-umsetzung-epa-ms.md) | TI-Flow-Fachdienst - ePA - Übermittlung - Spezifikation der Schnittstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A421 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - HTTP Formatfehler |
| ** NEU ** | [ IG-TIFLOW-CORE-A422 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - HTTP-Timeoutfehler |
| ** NEU ** | [ IG-TIFLOW-CORE-A423 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Serverfehler |
| ** NEU ** | [ IG-TIFLOW-CORE-A424 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_UNKNOWN_TYPE |
| ** NEU ** | [ IG-TIFLOW-CORE-A425 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_RESOURCE_ID_FAIL |
| ** NEU ** | [ IG-TIFLOW-CORE-A426 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_DELETED |
| ** NEU ** | [ IG-TIFLOW-CORE-A427 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_PARAM_UNKNOWN |
| ** NEU ** | [ IG-TIFLOW-CORE-A428 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_BAD_SYNTAX |
| ** NEU ** | [ IG-TIFLOW-CORE-A429 ](./error-codes-req-fd.md) | TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_UNKNOWN_OPERATION |
| ** NEU ** | [ IG-TIFLOW-CORE-A43 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-CORE-A430 ](./query-api-channels-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - Channels konfigurieren - Schemavalidierung |
| ** NEU ** | [ IG-TIFLOW-CORE-A431 ](./query-api-pushers-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - App-Registrierung - Schemavalidierung |
| ** NEU ** | [ IG-TIFLOW-CORE-A432 ](./error-codes.md) | TI-Flow-Fachdienst - Fehlerdetails in OperationOutcome |
| ** NEU ** | [ IG-TIFLOW-CORE-A433 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - Nutzerinformationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A434 ](./zeta-client.md) | CS: ZETA Client |
| ** NEU ** | [ IG-TIFLOW-CORE-A435 ](./zeta-client.md) | CS: ZETA Client - Kommunikation mit Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A436 ](./zeta-client.md) | CS: ZETA Client - Authentisierung |
| ** NEU ** | [ IG-TIFLOW-CORE-A437 ](./zeta-client.md) | CS: ZETA Client - ZETA/ASL-Kanal |
| ** NEU ** | [ IG-TIFLOW-CORE-A438 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - Clientsystem-Informationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A439 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Task-ID Nummernkreis |
| ** NEU ** | [ IG-TIFLOW-CORE-A44 ](./op-abort-req-fdv.md) | E-Rezept-FdV: E-Rezept löschen - Hinweis zu Daten in ePA |
| ** NEU ** | [ IG-TIFLOW-CORE-A440 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Task-ID sequentielle Zählung |
| ** NEU ** | [ IG-TIFLOW-CORE-A441 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - Verarbeitung von Suchparameter |
| ** NEU ** | [ IG-TIFLOW-CORE-A442 ](./menu-schnittstellen-generelle-prinzipien.md) | TI-Flow-Fachdienst - Verarbeitung von Sortierparameter |
| ** NEU ** | [ IG-TIFLOW-CORE-A443 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Konfigurationsparameter je Flowtype |
| ** NEU ** | [ IG-TIFLOW-CORE-A444 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Fehlerausgabe bei deaktiviertem Flowtype |
| ** NEU ** | [ IG-TIFLOW-CORE-A445 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Konfigurationsparameter je Feature |
| ** NEU ** | [ IG-TIFLOW-CORE-A446 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Fehlerausgabe bei deaktiviertem Feature |
| ** NEU ** | [ IG-TIFLOW-CORE-A447 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Konfigurationsparameter für FHIR-Konfiguration im CapabilityStatement |
| ** NEU ** | [ IG-TIFLOW-CORE-A448 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Offset für Referenzzeitpunkt der FHIR-Validierung |
| ** NEU ** | [ IG-TIFLOW-CORE-A449 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Konfigurationsparameter je Flowtype als valueCannonical |
| ** NEU ** | [ IG-TIFLOW-CORE-A45 ](./op-abort-req-fdv.md) | E-Rezept-FdV: E-Rezept löschen - E-Rezept zum Löschen auswählen |
| ** NEU ** | [ IG-TIFLOW-CORE-A450 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Umsetzung der Deaktivierung eines Features |
| ** NEU ** | [ IG-TIFLOW-CORE-A451 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Kein Offset in der Produktivumgebung |
| ** NEU ** | [ IG-TIFLOW-CORE-A452 ](./capability-statement-extensions.md) | TI-Flow-Fachdienst - Konfigurationsausgabe im CapabilityStatement |
| ** NEU ** | [ IG-TIFLOW-CORE-A453 ](./query-api-communication-req-ktr.md) | CS Kostenträger: Nachricht löschen - Nachricht auswählen |
| ** NEU ** | [ IG-TIFLOW-CORE-A454 ](./query-api-communication-req-ktr.md) | CS Kostenträger: Nachricht löschen - Bestätigung einholen |
| ** NEU ** | [ IG-TIFLOW-CORE-A455 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachricht löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A456 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachricht löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A46 ](./op-abort-req-fdv.md) | E-Rezept-FdV: E-Rezepte löschen - Coverage PKV - Warnung Abgabeinformationen |
| ** NEU ** | [ IG-TIFLOW-CORE-A47 ](./op-abort-req-fdv.md) | E-Rezept-FdV: E-Rezept löschen - Bestätigung |
| ** NEU ** | [ IG-TIFLOW-CORE-A48 ](./op-abort-req-fdv.md) | E-Rezept-FdV: E-Rezept löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A49 ](./op-abort-req-fdv.md) | E-Rezept-FdV: E-Rezept löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A50 ](./op-abort-req-fdv.md) | E-Rezept-FdV: E-Rezept löschen - E-Rezept-Token löschen |
| ** NEU ** | [ IG-TIFLOW-CORE-A51 ](./query-api-communication-req-ktr.md) | CS Kostenträger: Nachrichten abrufen - Häufigkeit |
| ** NEU ** | [ IG-TIFLOW-CORE-A52 ](./query-api-communication-req-ktr.md) | CS Kostenträger: Nachrichten abrufen - Abfrage |
| ** NEU ** | [ IG-TIFLOW-CORE-A53 ](./query-api-communication-req-ktr.md) | CS Kostenträger: Nachricht versenden - Nachricht auf Fachdienst einstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A54 ](./query-api-communication-req-ktr.md) | CS Kostenträger: Nachricht löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A55 ](./query-api-channels-req-fd.md) | TI-Flow-Fachdienst - unzulässige Operationen Channels |
| ** NEU ** | [ IG-TIFLOW-CORE-A56 ](./query-api-channels-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - Channels- OpenApi_Notification_Fachdienst |
| ** NEU ** | [ IG-TIFLOW-CORE-A57 ](./query-api-channels-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - Channels abrufen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A58 ](./query-api-channels-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - Channels einer Instanz abrufen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A59 ](./query-api-channels-req-fd.md) | TI-Flow-Fachdienst - Push Notifications - Channels konfigurieren - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A60 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Prüfung Secret |
| ** NEU ** | [ IG-TIFLOW-CORE-A61 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Prüfung Status |
| ** NEU ** | [ IG-TIFLOW-CORE-A62 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Schemaprüfung MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-CORE-A63 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - MedicationDispense speichern |
| ** NEU ** | [ IG-TIFLOW-CORE-A64 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Zeitstempel MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-CORE-A65 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Telematik-ID der abgebenden LEI speichern |
| ** NEU ** | [ IG-TIFLOW-CORE-A66 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-CORE-A67 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Status beenden |
| ** NEU ** | [ IG-TIFLOW-CORE-A68 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Quittung erstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A69 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - OCSP-Response nicht älter als 24h |
| ** NEU ** | [ IG-TIFLOW-CORE-A70 ](./query-api-communication-req-fdv.md) | Nachrichten abrufen - Nachrichten von Fachdienst herunterladen |
| ** NEU ** | [ IG-TIFLOW-CORE-A71 ](./query-api-communication-req-fdv.md) | Nachricht senden - E-Rezept zuweisen - Status prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A72 ](./query-api-communication-req-fdv.md) | Nachricht senden - E-Rezept zuweisen - Ende Gültigkeit prüfen |
| ** NEU ** | [ IG-TIFLOW-CORE-A73 ](./query-api-communication-req-fdv.md) | Nachricht senden - E-Rezept zuweisen - Zuweisen - TransactionID |
| ** NEU ** | [ IG-TIFLOW-CORE-A74 ](./query-api-communication-req-fdv.md) | Nachricht senden - E-Rezept zuweisen - Auf Nachricht antworten - TransactionID |
| ** NEU ** | [ IG-TIFLOW-CORE-A75 ](./query-api-communication-req-fdv.md) | Nachricht senden - Nachricht auf Fachdienst einstellen |
| ** NEU ** | [ IG-TIFLOW-CORE-A78 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: Nachricht löschen - Löschrequest |
| ** NEU ** | [ IG-TIFLOW-CORE-A79 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - unzulässige Operationen Task |
| ** NEU ** | [ IG-TIFLOW-CORE-A80 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Liste Task abrufen - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-CORE-A81 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Liste Task abrufen - Versicherter- Filter auf KVNR |
| ** NEU ** | [ IG-TIFLOW-CORE-A82 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Liste Task abrufen - Versicherter - Rückgabe Tasks im Bundle |
| ** NEU ** | [ IG-TIFLOW-CORE-A98 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Rezepte lesen - Apotheke - Prüfung PoPP-Token |
| ** NEU ** | [ IG-TIFLOW-CORE-A99 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Rezepte lesen - Apotheke - PoPP - Zeitraum Akzeptanz PoPP-Token |

Legende:
**NEU** = Hinzugefügt|
**ÄND** = Geändert|
**VERS** = Verschoben|
**DEL** = Entfernt

