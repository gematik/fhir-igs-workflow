# E-Rezept-spezifische KIM-Messages - E-Rezept für Arzneimittel v1.0.0-test

E-Rezept für Arzneimittel

Version 1.0.0-test - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* **E-Rezept-spezifische KIM-Messages**

## E-Rezept-spezifische KIM-Messages

### E-Rezept-spezifische KIM-Messages für E-Rezept-Zuweisung

Es werden zwei E-Rezept-spezifische KIM-Messages im Rahmen der Kommunikation zwischen verordnenden und abgebenden LEI für das Zuweisen eines E-Rezeptes spezifiziert.

Eine Message dient der direkten Zuweisung eines E-Rezepts und enthält einen Mitteilungstext, den E-Rezept-Token und optional einen Therapieplan. Die strukturierte Message kann automatisiert verarbeitet werden.

Der zweite Message-Typ dient der freien Kommunikation zur Belieferung des E-Rezepts, bspw. Rückfragen durch die Apotheke.

Das PS der verordnenden LEI MUSS bei der Übermittlung eines E-Rezepts über KIM im KIM-Header "X-KIM-Dienstkennung" den Wert "eRezept;Zuweisung;V1.0" für die direkte Zuweisung und Übermittlung der Einlöseinformationen verwenden.

Das PS der verordnenden oder abgebenden LEI MUSS in einer Nachricht zu einem E-Rezept über KIM im KIM-Header "X-KIM-Dienstkennung" den Wert "eRezept;Kommunikation;V1.0" für die sonstige Kommunikation untereinander im Rahmen der Belieferung durch eine Apotheke verwenden.

Das PS der verordnenden LEI MUSS bei Versand einer Zuweisungs-Message eine Message mit "Content-Type: multipart/mixed;..." und der folgenden Struktur verwenden. Tabelle # : Struktur der Message mit "Content-Type: multipart/mixed;..." Teil Inhalt optional Freitext Freitextmessage für den Empfänger default: "direkte Zuweisung E-Rezept" nein Einlöseinformation E-Rezept-Token als Link gemäß gemSpec_DM_eRp#A_19554 Nach 45 Zeichen MUSS ein Steuerzeichen "CRLF" eingefügt werden nein Therapieplan Therapieplan als Anhang, base64 codiert ja

Das PS der abgebenden LEI MUSS bei der Verarbeitung des Nachrichtenteils Einlöseinformation das Steuerzeichen "CRLF" aus dem E-Rezept-Token entfernen.

Das PS der abgebenden und verordnenden LEI MUSS bei Versand einer Kommunikation-Message eine Message mit "Content-Type: text/plain;charset=UTF-8" verwenden.
Für Beispiele zu E-Rezept spezifischen Nachrichten wird auf [GitHub API](https://github.com/gematik/api-erp/blob/master/docs/erp_steuerung_durch_le.adoc#kim-nachrichten-in-der-e-rezept-fachanwendung) verwiesen.

