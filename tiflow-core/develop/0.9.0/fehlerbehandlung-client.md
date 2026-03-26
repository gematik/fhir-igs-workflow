# Fehlerbehandlung Clientsysteme - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* **Fehlerbehandlung Clientsysteme**

## Fehlerbehandlung Clientsysteme

Tritt ein Fehler bei der Verarbeitung von Operationsaufrufen an einem Dienst der TI (bspw. TI-Flow-Fachdienst) auf, dann antwortet der Dienst mit einer Fehlermeldung. Das Format und die verwendeten Fehlercodes sind in den Spezifikationen der Interfaces (bspw. [gemSpec_FD_eRp]) beschrieben. Weiterhin können Fehler in der lokalen Verarbeitung auftreten.

Das Clientsystem des TI-Flow-Fachdienstes MUSS im Falle von Fehlern Fehlermeldungen bereitstellen, die es den Mitarbeitern der Leistungserbringerinstitution ermöglichen, die Ursache des Fehlers zu identifizieren und mögliche Gegenmaßnahmen zu ergreifen.
Während der Auslösung von Anfragen durch einen Client können diverse Fehler auftreten. Bei einigen dieser Fehler ist eine erneute Anfrage (Retry) sinnvoll, für alle anderen Fälle soll kein Retry versucht werden. Um eine klare Leitlinie für die Fehlerbehandlung zu etablieren, wird auf die Webseite https://github.com/gematik/api-erp/blob/master/docs/erp_statuscodes.adoc verwiesen. Dort sind sämtliche Fehlercodes aufgeführt und für jeden einzelnen Code wird bewertet, ob ein erneuter Versuch der Anfrage (Retry) sowie ein Client-Failover empfohlen sind. Diese Bewertungen dienen als Orientierungshilfe für die Implementierung einer effektiven Fehlerbehandlungsstrategie, um die Robustheit und Zuverlässigkeit des Systems zu gewährleisten.

Das Clientsystem des TI-Flow-Fachdienstes MUSS im Falle von Fehlern bei einer Anfrage am TI-Flow-Fachdienst einen Retry und/oder Client-Failover nur gemäß der Fehlerbehandlung in [E-Rezept API Dokumentation] durchführen.
### Logging und Meldungen

Das Clientsystem des TI-Flow-Fachdienstes SOLL alle in der Kommunikation mit den Diensten der TI auftretenden Fehler und Warnungen in ein dediziertes Fehlerprotokoll schreiben und diese Protokollinformationen für Supportmaßnahmen über eine Zeitraum von mindestens 14 Tagen zur Verfügung halten.

Das Clientsystem des TI-Flow-Fachdienstes SOLL alle in der Kommunikation mit den Diensten der TI auftretenden Probleme für den Benutzer verständlich anzeigen und dabei erkennen lassen, ob durch den Anwender oder den verantwortlichen Leistungserbringer Maßnahmen zur Behebung eingeleitet werden müssen.

Das Clientsystem des TI-Flow-Fachdienstes SOLL bei serverseitigen Fehlermeldungen, die auf eine Überlastung des Zielsystems schließen lassen (z.B. http-status 5xx, 429 - too many requests, etc.), erneute Verbindungsversuche nach dem Prinzips des Exponential Backoffs [ExpBack] durchführen.

