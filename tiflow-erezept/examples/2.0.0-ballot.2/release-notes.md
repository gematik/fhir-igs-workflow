# Release Notes - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

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
| ** NEU ** | [ IG-TIFLOW-ERP-A1 ](./menu-technische-umsetzung-abgabedatensatz.md) | PS abgebende LEI: Abgabedatensatz mit QES: OCSP Response einbetten |
| ** NEU ** | [ IG-TIFLOW-ERP-A10 ](./query-api-task-req-avs.md) | PS abgebende LEI: E-Rezepte von Versicherten abrufen (PoPP) - PoPP-Token abrufen |
| ** NEU ** | [ IG-TIFLOW-ERP-A100 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Startdatum nicht vor Ausstellungsdatum |
| ** NEU ** | [ IG-TIFLOW-ERP-A101 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Endedatum nicht vor Startdatum |
| ** NEU ** | [ IG-TIFLOW-ERP-A102 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Schema ID |
| ** NEU ** | [ IG-TIFLOW-ERP-A103 ](./query-api-task-req-fdv.md) | E-Rezept-FdV: Flowtype 166 - Hinweis auf Workflow-Besonderheit |
| ** NEU ** | [ IG-TIFLOW-ERP-A104 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Flowtype 160/166/169/200/209 - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-ERP-A105 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Mehrfachverordnung - Beginn Einlösefrist prüfen |
| ** NEU ** | [ IG-TIFLOW-ERP-A106 ](./op-accept-req-fd.md) | TI-Flow-Fachdienst - Task akzeptieren - Coverage PKV - Einwilligung Abrechnungsinformation ermitteln |
| ** NEU ** | [ IG-TIFLOW-ERP-A107 ](./op-dispense-req-avs.md) | PS abgebende LEI: Dispensierinformationen bereitstellen - Dispensierinformation übermitteln |
| ** NEU ** | [ IG-TIFLOW-ERP-A108 ](./op-accept-req-avs.md) | PS abgebende LEI: Übernahme Rezeptinformationen in Warenwirtschaftssystem |
| ** NEU ** | [ IG-TIFLOW-ERP-A109 ](./op-accept-req-avs.md) | PS abgebende LEI: E-Rezept abrufen - QES prüfen |
| ** NEU ** | [ IG-TIFLOW-ERP-A11 ](./query-api-task-req-avs.md) | PS abgebende LEI: E-Rezepte von Versicherten abrufen (PoPP) - E-Rezepte abrufen |
| ** NEU ** | [ IG-TIFLOW-ERP-A110 ](./menu-technische-umsetzung-kim.md) | E-Rezept - X-KIM-Dienstkennung - Zuweisung |
| ** NEU ** | [ IG-TIFLOW-ERP-A111 ](./menu-technische-umsetzung-kim.md) | E-Rezept - X-KIM-Dienstkennung - Kommunikation |
| ** NEU ** | [ IG-TIFLOW-ERP-A112 ](./menu-technische-umsetzung-kim.md) | E-Rezept - Struktur Zuweisungs-Message |
| ** NEU ** | [ IG-TIFLOW-ERP-A113 ](./menu-technische-umsetzung-kim.md) | E-Rezept - Zuweisungs-Message - CRLF |
| ** NEU ** | [ IG-TIFLOW-ERP-A114 ](./menu-technische-umsetzung-kim.md) | E-Rezept - Struktur Kommunikation-Message |
| ** NEU ** | [ IG-TIFLOW-ERP-A115 ](./index.md) | E-Rezept: Anwendung des IG 'E-Rezept für Arzneimittel' für Workflows 160, 166, 169, 200 und 209 |
| ** NEU ** | [ IG-TIFLOW-ERP-A116 ](./index.md) | E-Rezept: Umsetzung des Moduls 'E-Rezept für Arzneimittel' |
| ** NEU ** | [ IG-TIFLOW-ERP-A117 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuweisung - Hinweis |
| ** NEU ** | [ IG-TIFLOW-ERP-A118 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuweisung - Übernahme E-Rezept aus Nachricht in einen Vorgang |
| ** NEU ** | [ IG-TIFLOW-ERP-A119 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Nachrichtenkonfiguration |
| ** NEU ** | [ IG-TIFLOW-ERP-A12 ](./query-api-task-req-avs.md) | PS abgebende LEI: E-Rezepte von Versicherten abrufen - nicht belieferte E-Rezepte zurückgeben |
| ** NEU ** | [ IG-TIFLOW-ERP-A120 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Komposition einer Nachricht an einen Kunden mit Textvorlagen |
| ** NEU ** | [ IG-TIFLOW-ERP-A121 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Nachrichtenkonfiguration - automatischer Versand der Empfangsbestätigung |
| ** NEU ** | [ IG-TIFLOW-ERP-A122 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuweisung - Empfangsbestätigung |
| ** NEU ** | [ IG-TIFLOW-ERP-A123 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuweisung - Abholbenachrichtigung |
| ** NEU ** | [ IG-TIFLOW-ERP-A124 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuweisung - Nachricht bei Nicht-Verfügbarkeit eines Medikaments |
| ** NEU ** | [ IG-TIFLOW-ERP-A125 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuweisung - Nachrichten an Sender |
| ** NEU ** | [ IG-TIFLOW-ERP-A126 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuweisung - Nachrichten an Sender - ohne Medienbruch |
| ** NEU ** | [ IG-TIFLOW-ERP-A127 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuweisung - Nachrichten eines Vorgangs |
| ** NEU ** | [ IG-TIFLOW-ERP-A128 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Fristen eines Rezeptes - Anzeigen |
| ** NEU ** | [ IG-TIFLOW-ERP-A129 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Fristen eines Rezeptes - Hinweis bei überschrittener Frist |
| ** NEU ** | [ IG-TIFLOW-ERP-A13 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-ERP-A130 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Fristen eines Rezeptes - Überschreiten der Belieferungsfrist |
| ** NEU ** | [ IG-TIFLOW-ERP-A131 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Fristen eines Rezeptes - Überschreiten der Einlösefrist |
| ** NEU ** | [ IG-TIFLOW-ERP-A132 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Suche nach Vorgang mittels E-Rezept-Token |
| ** NEU ** | [ IG-TIFLOW-ERP-A133 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Freitextverordnung - Arzneimittelsuche |
| ** NEU ** | [ IG-TIFLOW-ERP-A134 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Freitextverordnung - Hinweis zur manuellen Prüfung |
| ** NEU ** | [ IG-TIFLOW-ERP-A135 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Prüfung mittels ABDA-Referenzvalidators |
| ** NEU ** | [ IG-TIFLOW-ERP-A136 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Zuordnung eines E-Rezepts zu einem bestehenden Vorgang |
| ** NEU ** | [ IG-TIFLOW-ERP-A137 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Weiterleitung eines E-Rezepts |
| ** NEU ** | [ IG-TIFLOW-ERP-A138 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Empfang eines weitergeleiteten eines E-Rezepts |
| ** NEU ** | [ IG-TIFLOW-ERP-A139 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Bedienung T-Rezept - Hinweis T-Rezept |
| ** NEU ** | [ IG-TIFLOW-ERP-A14 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Dispensierinformationen löschen |
| ** NEU ** | [ IG-TIFLOW-ERP-A140 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Bedienung T-Rezept - Hinweis T-Rezept Belieferungsoption |
| ** NEU ** | [ IG-TIFLOW-ERP-A141 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Quittung automatisch abrufen |
| ** NEU ** | [ IG-TIFLOW-ERP-A142 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Workflow von E-Rezepten abschließen |
| ** NEU ** | [ IG-TIFLOW-ERP-A143 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Abgabedatensatz signieren - QES Signatur in notwendigen Fällen |
| ** NEU ** | [ IG-TIFLOW-ERP-A144 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Abgabedatensatz signieren - QES Signatur |
| ** NEU ** | [ IG-TIFLOW-ERP-A145 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte |
| ** NEU ** | [ IG-TIFLOW-ERP-A146 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte - Hinweisen zu Abrechnungsfehlern |
| ** NEU ** | [ IG-TIFLOW-ERP-A147 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte - Verweis zur Korrektur |
| ** NEU ** | [ IG-TIFLOW-ERP-A148 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Nicht-Erreichbarkeit des TI-Flow-Fachdienstes - Automatische Behebung |
| ** NEU ** | [ IG-TIFLOW-ERP-A149 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Hinweis bei Nicht-Erreichbarkeit des TI-Flow-Fachdienstes |
| ** NEU ** | [ IG-TIFLOW-ERP-A15 ](./op-reject-req-fd.md) | TI-Flow-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Löschmarkierungen Medikationsliste bereitstellen (Dispensierinformationen) |
| ** NEU ** | [ IG-TIFLOW-ERP-A150 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Hinweis bei Nicht-Erreichbarkeit des TI-Flow-Fachdienstes - Operabilität des AVS |
| ** NEU ** | [ IG-TIFLOW-ERP-A151 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Verständliche Fehlermeldungen - technische Fehler |
| ** NEU ** | [ IG-TIFLOW-ERP-A152 ](./menu-fachlichkeit-ux-abgebend.md) | PS abgebende LEI: UX - Verständliche Fehlermeldungen - Handlungsempfehlung |
| ** NEU ** | [ IG-TIFLOW-ERP-A153 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - E-Rezept im Verordnungsvorgang erstellen |
| ** NEU ** | [ IG-TIFLOW-ERP-A154 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Verarbeitungsvorgänge im Hintergrund |
| ** NEU ** | [ IG-TIFLOW-ERP-A155 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Ergebnismeldung von Verarbeitungsvorgängen im Hintergrund |
| ** NEU ** | [ IG-TIFLOW-ERP-A156 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Konfigurationsparameter E-Rezept |
| ** NEU ** | [ IG-TIFLOW-ERP-A157 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Defaulteinstellung E-Rezept-Ausdruck |
| ** NEU ** | [ IG-TIFLOW-ERP-A158 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Stammdaten für Arzt und Einrichtung übernehmen |
| ** NEU ** | [ IG-TIFLOW-ERP-A159 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad |
| ** NEU ** | [ IG-TIFLOW-ERP-A16 ](./op-abort-req-fdv.md) | E-Rezept-FdV: E-Rezept löschen - Flowtype 169 / 209 - nur wenn beliefert |
| ** NEU ** | [ IG-TIFLOW-ERP-A160 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Erzeugung einer neuen Verordnung |
| ** NEU ** | [ IG-TIFLOW-ERP-A161 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Vorbelegung bekannter Informationen |
| ** NEU ** | [ IG-TIFLOW-ERP-A162 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Suche nach gewünschtem Präparat |
| ** NEU ** | [ IG-TIFLOW-ERP-A163 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Auswahl und Anpassung des Verordnungsinhalts und Signaturvorbereitung |
| ** NEU ** | [ IG-TIFLOW-ERP-A164 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Vorbereitung mehrerer Verordnungen zum späteren Signieren |
| ** NEU ** | [ IG-TIFLOW-ERP-A165 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Signieren aller vorbereiteten Verordnungen auf einmal |
| ** NEU ** | [ IG-TIFLOW-ERP-A166 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Hintergrund-Signaturprozess und Fehleranzeigen |
| ** NEU ** | [ IG-TIFLOW-ERP-A167 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Hinweistext bei erfolgreichem Signieren |
| ** NEU ** | [ IG-TIFLOW-ERP-A168 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Optimaler Klickpfad - Automatischer Ausdruck bei entsprechender Konfiguration |
| ** NEU ** | [ IG-TIFLOW-ERP-A169 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Anwendbarkeit E-Rezept |
| ** NEU ** | [ IG-TIFLOW-ERP-A17 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-ERP-A170 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Hinweis bei Freitextverordnungen |
| ** NEU ** | [ IG-TIFLOW-ERP-A171 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Abgabehinweise für den Apotheker |
| ** NEU ** | [ IG-TIFLOW-ERP-A172 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: E-Rezept erstellen - author Practitioner gemäß signierendem HBA |
| ** NEU ** | [ IG-TIFLOW-ERP-A173 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Vertretungssituation - Möglichkeit zur Entscheidung über Vertretungsfall |
| ** NEU ** | [ IG-TIFLOW-ERP-A174 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Vertretungssituation - Signatur eines E-Rezeptes |
| ** NEU ** | [ IG-TIFLOW-ERP-A175 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Vertretungssituation - Kollegiale Vertretung |
| ** NEU ** | [ IG-TIFLOW-ERP-A176 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Vertretungssituation - Persönliche Vertretung |
| ** NEU ** | [ IG-TIFLOW-ERP-A177 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Weiterbildungsassistent - Möglichkeit zur Entscheidung über Weiterbildungsassistent |
| ** NEU ** | [ IG-TIFLOW-ERP-A178 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Weiterbildungsassistent - Konfiguration ausbildende Person |
| ** NEU ** | [ IG-TIFLOW-ERP-A179 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Weiterbildungsassistent - E-Rezept erstellen |
| ** NEU ** | [ IG-TIFLOW-ERP-A18 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Profilprüfung MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-ERP-A180 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - E-T-Rezept - Hinweis T-Rezept |
| ** NEU ** | [ IG-TIFLOW-ERP-A181 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - E-T-Rezept - Automatische Berechnung der Reichdauer |
| ** NEU ** | [ IG-TIFLOW-ERP-A182 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - E-T-Rezept - Manuelle Eingabe der Reichdauer |
| ** NEU ** | [ IG-TIFLOW-ERP-A183 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - E-T-Rezept - Warnung Reichdauer |
| ** NEU ** | [ IG-TIFLOW-ERP-A184 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Mehrfachverordnungen als Option |
| ** NEU ** | [ IG-TIFLOW-ERP-A185 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - MVO - Generierung von Mehrfachverordnungen |
| ** NEU ** | [ IG-TIFLOW-ERP-A186 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - MVO- Automatische Befüllung von Teilverordnungen |
| ** NEU ** | [ IG-TIFLOW-ERP-A187 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - MVO - Auswahl der Anzahl von Teilverordnungen |
| ** NEU ** | [ IG-TIFLOW-ERP-A188 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - MVO - Unterstützung bei Einlösefristen |
| ** NEU ** | [ IG-TIFLOW-ERP-A189 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - MVO - Löschen von zusammengehörenden Teilverordnungen |
| ** NEU ** | [ IG-TIFLOW-ERP-A19 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Aufruf ohne MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-ERP-A190 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - MVO - Signieren von Teilverordnungen |
| ** NEU ** | [ IG-TIFLOW-ERP-A191 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - MVO - Vorbereitung durch MFA |
| ** NEU ** | [ IG-TIFLOW-ERP-A192 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Aufgabenliste |
| ** NEU ** | [ IG-TIFLOW-ERP-A193 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Aufgabenliste - Filtern und Sortieren |
| ** NEU ** | [ IG-TIFLOW-ERP-A194 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Anlegen eines E-Rezeptes durch MFA |
| ** NEU ** | [ IG-TIFLOW-ERP-A195 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Keine Signatur von Nutzern ohne HBA |
| ** NEU ** | [ IG-TIFLOW-ERP-A196 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Aufgabenliste - Benachrichtigungen für neue Aufgaben |
| ** NEU ** | [ IG-TIFLOW-ERP-A197 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Aufgabenliste - Bearbeiten einzelner Einträge |
| ** NEU ** | [ IG-TIFLOW-ERP-A198 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Aufgabenliste - Zugriff auf Patientendaten |
| ** NEU ** | [ IG-TIFLOW-ERP-A199 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Aufgabenliste - Grafische Anzeige E-Rezepte |
| ** NEU ** | [ IG-TIFLOW-ERP-A2 ](./menu-technische-umsetzung-abgabedatensatz.md) | PS abgebende LEI: Abgabedatensatz signieren - Signaturverfahren |
| ** NEU ** | [ IG-TIFLOW-ERP-A20 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Überschreiben vorheriger MedicationDispenses |
| ** NEU ** | [ IG-TIFLOW-ERP-A200 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Aufgabenliste - Mehrfachauswahl zur Signatur |
| ** NEU ** | [ IG-TIFLOW-ERP-A201 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: Benachrichtigungssystem - Information über Rezeptausstellung |
| ** NEU ** | [ IG-TIFLOW-ERP-A202 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: Benachrichtigungssystem - Schützenswerte Informationen |
| ** NEU ** | [ IG-TIFLOW-ERP-A203 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Verhalten bei Ausfall von TI Komponenten des E-Rezepts |
| ** NEU ** | [ IG-TIFLOW-ERP-A204 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Verständliche Fehlermeldungen - technische Fehler |
| ** NEU ** | [ IG-TIFLOW-ERP-A205 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Verständliche Fehlermeldungen - Handlungsempfehlung |
| ** NEU ** | [ IG-TIFLOW-ERP-A206 ](./menu-fachlichkeit-ux-verordnend.md) | PS verordnende LEI: UX - Fehlerbenachrichtigung bei Löschversuch eines E-Rezepts |
| ** NEU ** | [ IG-TIFLOW-ERP-A207 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - MedicationDispense erstellen |
| ** NEU ** | [ IG-TIFLOW-ERP-A208 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Bereitstellen von Dosierinformationen |
| ** NEU ** | [ IG-TIFLOW-ERP-A209 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Mehrere MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-ERP-A210 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Profilversion bei mehreren MedicationDispenses |
| ** NEU ** | [ IG-TIFLOW-ERP-A211 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Fertigarzneimittel: Chargeninfo |
| ** NEU ** | [ IG-TIFLOW-ERP-A212 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Fertigarzneimittel: Wirkstoff, Wirkstärke und Handelsname |
| ** NEU ** | [ IG-TIFLOW-ERP-A213 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Rezeptur: Wirkstoff, Wirkstärke |
| ** NEU ** | [ IG-TIFLOW-ERP-A214 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Dosieranweisung |
| ** NEU ** | [ IG-TIFLOW-ERP-A215 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Dosierangaben Freitext |
| ** NEU ** | [ IG-TIFLOW-ERP-A216 ](./menu-technische-umsetzung-dispensierinformationen.md) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/166/169/200/209 - Substitutionskennzeichen |
| ** NEU ** | [ IG-TIFLOW-ERP-A217 ](./op-create-req-fd.md) | TI-Flow-Fachdienst - Task erzeugen - Flowtype 160/166/169/200/209 - Ergänzung Performer-Typ für Einlöseinstitutstyp |
| ** NEU ** | [ IG-TIFLOW-ERP-A218 ](./menu-technische-umsetzung-audit-service.md) | TI-Flow-Fachdienst - Versichertenprotokoll zu Rx-Operationen |
| ** NEU ** | [ IG-TIFLOW-ERP-A219 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der PZN im Profil KBV_PR_ERP_Medication_PZN |
| ** NEU ** | [ IG-TIFLOW-ERP-A22 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - Daten ePA Medication Service bereitstellen (Dispensierinformationen) |
| ** NEU ** | [ IG-TIFLOW-ERP-A220 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Überprüfung der PZN im Profil KBV_PR_ERP_Medication_Compounding |
| ** NEU ** | [ IG-TIFLOW-ERP-A221 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Längenprüfung PZN |
| ** NEU ** | [ IG-TIFLOW-ERP-A222 ](./menu-technische-umsetzung-audit-service.md) | TI-Flow-Fachdienst - ePA - Medication Service - Versichertenprotokoll |
| ** NEU ** | [ IG-TIFLOW-ERP-A23 ](./op-close-req-fd.md) | TI-Flow-Fachdienst - Task schließen - T-Rezept Daten an BfArM Webdienst bereitstellen |
| ** NEU ** | [ IG-TIFLOW-ERP-A24 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: Anfrage Belieferung - Flowtype 162 / 169 / 209 - Anfrage nicht zulässig |
| ** NEU ** | [ IG-TIFLOW-ERP-A25 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: E-Rezept zuweisen - Flowtype 169 / 209 - Zuweisen nicht zulässig |
| ** NEU ** | [ IG-TIFLOW-ERP-A26 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: E-Rezept zuweisen- Flowtype 166 - Zuweisen als Versand nicht zulässig |
| ** NEU ** | [ IG-TIFLOW-ERP-A27 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: E-Rezept zuweisen - Beginn Gültigkeit prüfen |
| ** NEU ** | [ IG-TIFLOW-ERP-A28 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: E-Rezept zuweisen - Textnachricht ohne Link |
| ** NEU ** | [ IG-TIFLOW-ERP-A3 ](./menu-technische-umsetzung-abgabedatensatz.md) | PS abgebende LEI: Abgabedatensatz signieren - Gültigkeit SMC-B prüfen |
| ** NEU ** | [ IG-TIFLOW-ERP-A30 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: E-Rezept zuweisen - Zuweisen - Payload |
| ** NEU ** | [ IG-TIFLOW-ERP-A31 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: E-Rezept zuweisen - Auf Nachricht antworten - Payload |
| ** NEU ** | [ IG-TIFLOW-ERP-A32 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: E-Rezept zuweisen - Nachricht erstellen |
| ** NEU ** | [ IG-TIFLOW-ERP-A33 ](./query-api-communication-req-fdv.md) | E-Rezept-FdV: Apotheke suchen - Filter Öffentliche Apotheke |
| ** NEU ** | [ IG-TIFLOW-ERP-A34 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Liste Task abrufen - Flowtype 169 / 209 - Versicherter keine Einlöseinformationen |
| ** NEU ** | [ IG-TIFLOW-ERP-A35 ](./query-api-task-req-fd.md) | TI-Flow-Fachdienst - Task abrufen - Flowtype 169/209 - Nicht verfügbar bei KVNR-Mismatch |
| ** NEU ** | [ IG-TIFLOW-ERP-A36 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Rollenprüfung Abgebender stellt Dispensierinformationen bereit |
| ** NEU ** | [ IG-TIFLOW-ERP-A37 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Prüfung Secret |
| ** NEU ** | [ IG-TIFLOW-ERP-A38 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Prüfung Status |
| ** NEU ** | [ IG-TIFLOW-ERP-A39 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Schemaprüfung MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-ERP-A40 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Überschreiben vorheriger MedicationDispenses |
| ** NEU ** | [ IG-TIFLOW-ERP-A41 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - MedicationDispense speichern |
| ** NEU ** | [ IG-TIFLOW-ERP-A43 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Daten Medikationsliste bereitstellen (Dispensierinformationen) |
| ** NEU ** | [ IG-TIFLOW-ERP-A44 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Zeitstempel MedicationDispense |
| ** NEU ** | [ IG-TIFLOW-ERP-A45 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Telematik-ID der abgebenden LEI speichern |
| ** NEU ** | [ IG-TIFLOW-ERP-A46 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Push Notification Versicherter |
| ** NEU ** | [ IG-TIFLOW-ERP-A47 ](./op-dispense-req-fd.md) | TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Keine Statusänderung |
| ** NEU ** | [ IG-TIFLOW-ERP-A48 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Flowtype 160/166/169/200/209 - Rollenprüfung |
| ** NEU ** | [ IG-TIFLOW-ERP-A49 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Apotheke - Statusprüfung in-progress |
| ** NEU ** | [ IG-TIFLOW-ERP-A50 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Apotheke - Statusprüfung ungleich in-progress |
| ** NEU ** | [ IG-TIFLOW-ERP-A51 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Apotheke - Prüfung Secret |
| ** NEU ** | [ IG-TIFLOW-ERP-A52 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Flowtype 169 / 209 - Versicherter - Statusprüfung |
| ** NEU ** | [ IG-TIFLOW-ERP-A53 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Leistungserbringerinstitution |
| ** NEU ** | [ IG-TIFLOW-ERP-A54 ](./op-abort-req-fd.md) | TI-Flow-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Versicherter |
| ** NEU ** | [ IG-TIFLOW-ERP-A55 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachricht versenden - Externe URL ausschließlich für Einlösung |
| ** NEU ** | [ IG-TIFLOW-ERP-A56 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachricht versenden - Belieferung Arzneimittel - Nachricht erstellen |
| ** NEU ** | [ IG-TIFLOW-ERP-A57 ](./query-api-communication-req-avs.md) | PS abgebende LEI: Nachricht versenden - Belieferung Arzneimittel - Communication Ressource erstellen |
| ** NEU ** | [ IG-TIFLOW-ERP-A58 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Flowtype 160/166/169/200/209 - Bereitstellen von Dosierinformationen |
| ** NEU ** | [ IG-TIFLOW-ERP-A59 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Flowtype 200/209 - KVNR als Identifier |
| ** NEU ** | [ IG-TIFLOW-ERP-A60 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Flowtype 200/209 - Versicherungstyp PKV |
| ** NEU ** | [ IG-TIFLOW-ERP-A61 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Mehrfachverordnung - Beginn Einlösefrist |
| ** NEU ** | [ IG-TIFLOW-ERP-A62 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Flowtype 166 - zulässige Signatur Arzt |
| ** NEU ** | [ IG-TIFLOW-ERP-A63 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Flowtype 166 - Reichdauer nach Vorgaben |
| ** NEU ** | [ IG-TIFLOW-ERP-A64 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Flowtype 166 - Bestätigungen nach §3a Abs. 2, 5 AMVV |
| ** NEU ** | [ IG-TIFLOW-ERP-A65 ](./op-activate-req-pvs.md) | PS verordnende LEI: E-Rezept erstellen - Flowtype 169/209 - kein Patientenausdruck |
| ** NEU ** | [ IG-TIFLOW-ERP-A66 ](./op-activate-req-pvs.md) | PS verordnende LEI: Übergabe E-Rezept-Token an Apotheke |
| ** NEU ** | [ IG-TIFLOW-ERP-A67 ](./op-activate-req-pvs.md) | PS: Schutz des E-Rezept-Tokens bei Übertragung |
| ** NEU ** | [ IG-TIFLOW-ERP-A68 ](./op-activate-req-pvs.md) | PS verordnende LEI: Herstellende Apotheke für Übermittlungsverfahren |
| ** NEU ** | [ IG-TIFLOW-ERP-A69 ](./query-api-communication-req-data.md) | E-Rezept-FdV: Nachrichtenaustausch - E-Rezept einer Apotheke zuweisen - Datenstruktur Nachricht |
| ** NEU ** | [ IG-TIFLOW-ERP-A70 ](./query-api-communication-req-data.md) | PS abgebende LEI: Nachrichtenaustausch - Nachricht durch Abgebenden übermitteln - Datenstruktur Nachricht |
| ** NEU ** | [ IG-TIFLOW-ERP-A71 ](./menu-technische-umsetzung-anwendungsfaelle.md) | PS verordnende LEI: TIFlow-RX - verpflichtende Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-ERP-A72 ](./menu-technische-umsetzung-anwendungsfaelle.md) | E-Rezept-FdV: TIFlow-RX - verpflichtende Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-ERP-A73 ](./menu-technische-umsetzung-anwendungsfaelle.md) | PS abgebende LEI: TIFlow-RX - verpflichtende Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-ERP-A74 ](./menu-technische-umsetzung-anwendungsfaelle.md) | PS abgebende LEI: TIFlow-RX - empfohlene Anwendungsfälle |
| ** NEU ** | [ IG-TIFLOW-ERP-A75 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - QES durch berechtigte Berufsgruppe |
| ** NEU ** | [ IG-TIFLOW-ERP-A76 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 166 - QES durch berechtigte Berufsgruppe |
| ** NEU ** | [ IG-TIFLOW-ERP-A77 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - Prüfung Arzneimittelverordnung |
| ** NEU ** | [ IG-TIFLOW-ERP-A78 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 166 - Prüfung Arzneimittelverordnung |
| ** NEU ** | [ IG-TIFLOW-ERP-A79 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 160/166/169/200/209 - Prüfung Coverage Type |
| ** NEU ** | [ IG-TIFLOW-ERP-A80 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 160/169 - Prüfung Coverage Type |
| ** NEU ** | [ IG-TIFLOW-ERP-A81 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 200/209 - Prüfung Coverage Type |
| ** NEU ** | [ IG-TIFLOW-ERP-A82 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Ausschluss Betäubungsmittel |
| ** NEU ** | [ IG-TIFLOW-ERP-A83 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Bestimmung der Einlösbarkeit im EU-Ausland |
| ** NEU ** | [ IG-TIFLOW-ERP-A84 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Daten ePA Medication Service bereitstellen (Verordnungsdatensatz) |
| ** NEU ** | [ IG-TIFLOW-ERP-A85 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 160 - Prozessparameter |
| ** NEU ** | [ IG-TIFLOW-ERP-A86 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 166 - Prozessparameter |
| ** NEU ** | [ IG-TIFLOW-ERP-A87 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 169 - Prozessparameter |
| ** NEU ** | [ IG-TIFLOW-ERP-A88 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 200 - Prozessparameter |
| ** NEU ** | [ IG-TIFLOW-ERP-A89 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Flowtype 209 - Prozessparameter |
| ** NEU ** | [ IG-TIFLOW-ERP-A90 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Entlassparameter - Prozessparameter |
| ** NEU ** | [ IG-TIFLOW-ERP-A91 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - zulässige Flowtype |
| ** NEU ** | [ IG-TIFLOW-ERP-A92 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator-Denominator kleiner 5 |
| ** NEU ** | [ IG-TIFLOW-ERP-A93 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator größer 0 |
| ** NEU ** | [ IG-TIFLOW-ERP-A94 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Denominator größer 1 |
| ** NEU ** | [ IG-TIFLOW-ERP-A95 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator kleiner / gleich Denominator |
| ** NEU ** | [ IG-TIFLOW-ERP-A96 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Unzulässige Angaben |
| ** NEU ** | [ IG-TIFLOW-ERP-A97 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - kein Entlassrezept |
| ** NEU ** | [ IG-TIFLOW-ERP-A98 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - keine Ersatzverordnung |
| ** NEU ** | [ IG-TIFLOW-ERP-A99 ](./op-activate-req-fd.md) | TI-Flow-Fachdienst - Task aktivieren - Mehrfachverordnung - Beginn Einlösefrist-Pflicht |

Legende:
**NEU** = Hinzugefügt|
**ÄND** = Geändert|
**VERS** = Verschoben|
**DEL** = Entfernt

