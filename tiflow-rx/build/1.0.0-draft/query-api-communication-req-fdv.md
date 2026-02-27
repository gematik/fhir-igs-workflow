# E-Rezept-FdV Anforderungen: Communication-Query - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **E-Rezept-FdV Anforderungen: Communication-Query**

## E-Rezept-FdV Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Modulspezifische Anforderungen

Das E-Rezept-FdV DARF es dem Nutzer NICHT ermöglichen, für ein E-Rezept mit dem Flowtype 162, 169 oder 209 eine Anfrage zur Belieferung an eine abgebende Institution zu senden.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" es dem Nutzer NICHT ermöglichen, ein E-Rezept mit dem Flowtype 169 oder 209 an eine Apotheke zuzuweisen.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" für ein E-Rezept mit dem Flowtype 166 es dem Nutzer NICHT ermöglichen ein E-T-Rezept mit der Belieferungsart "Postversand" an eine Apotheke zuzuweisen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" prüfen, ob bei Teilverordnungen von Mehrfachverordnungen (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) erreicht ist und in diesem Fall den Anwendungsfall abbrechen.

Das E-Rezept-FdV DARF NICHT im Anwendungsfall "Vertreterkommunikation" es dem Nutzer ermöglichen, bezüglich einem E-Rezept mit dem Flowtype 169 oder 209 mit einem Vertreter zu kommunizieren.

