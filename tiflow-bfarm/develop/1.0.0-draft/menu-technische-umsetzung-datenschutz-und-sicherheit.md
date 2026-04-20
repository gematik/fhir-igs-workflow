# Schnittstellen - Datenschutz und Sicherheit - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Umsetzung - Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Schnittstellen - Datenschutz und Sicherheit**

## Schnittstellen - Datenschutz und Sicherheit

Die Verarbeitung von E-T-Rezepten bedingt im TI-Flow-Fachdienst nicht nur einen neuen Workflow (166), sondern auch eine Kommunikationsverbindung zu einem neuen Akteur – dem BfArM – verbunden mit einem neuen Anwendungsfall.

### Prüfungen beim Einstellen eines E-T-Rezepts

Der TI-Flow-Fachdienst prüft beim Einstellen des E-T-Rezeptes die Angaben im Verordnungsdatensatz gemäß dem FHIR-Profil:

* Die Bestätigung des Arztes, dass die Sicherheitsmaßnahmen gemäß der aktuellen Fachinformation eines entsprechenden Fertigarzneimittels eingehalten werden, insbesondere, dass erforderlichenfalls ein Schwangerschafts-Präventionsprogramm durchgeführt wird, muss vorhanden sein.
* Die Bestätigung des Arztes, dass der Patientin oder dem Patienten vor Beginn der medikamentösen Behandlung geeignete medizinische Informationsmaterialien ausgehändigt wurden, muss vorhanden sein.
* Die Bestätigung des Arztes, dass er über ausreichende Sachkenntnisse zur Verschreibung von Arzneimitteln nach §3a Abs. 1 Satz 1 AMVV verfügt, muss vorhanden sein.
* Die Angabe der Reichdauer muss vorhanden sein.

### Datenübertragung zum BfArM

Die Übertragung der Daten an das BfArM erfolgt durch den TI-Flow-Fachdienst automatisiert über das Internet unverzüglich nach dem Abschluss des Workflow durch eine Apotheke.

Der Umfang der Daten, der an das BfArM übertragen wird, ergibt sich einerseits aus gesetzlichen Vorgaben und andererseits aus dem Bedarf des BfArM zur Umsetzung seiner gesetzlichen Pflichten.

Hieraus ergibt sich, dass im Hinblick auf die Datenminimierung personenbezogener Daten

* keine Angaben zum Versicherten (gesetzlich verboten),
* keine Angaben zum ausstellenden Leistungserbringer (inkl. Signatur, da vom BfArM nicht benötigt), 
* Informationen zur Kontaktaufnahme mit der abgebenden Apotheke (vom BfArM benötigt) übertragen werden.

Die Daten des digitalen Durchschlags stammen im Wesentlichen aus dem Verordnungsdatensatz, dem Dispensierdatensatz und dem FHIR-VZD.

Vor dem Hintergrund einer zu verhindernden Profilbildung über die abgebenden Apotheken, wird die Vertraulichkeit dieser Information mit „hoch“ innerhalb des Verantwortungsbereichs der TI bzw. der gematik bewertet. Dies gilt auch für die Bewertung der Integrität (“hoch”).

Dieser Schutzbedarf wird berücksichtigt, in dem der verbindungsaufbauende Endpunkt einer TLS-gesicherten Verbindung zum T-Register beim BfArM innerhalb der VAU des TI-Flow-Fachdienstes liegt, der Betreiber des TI-Flow-Fachdienstes also nicht sieht, welche Daten übertragen werden. Im Rahmen der Nutzung von TLS findet eine Authentifizierung des T-Registers des BfArM durch den TI-Flow-Fachdienst (Anforderung der gematik) und eine Authentifizierung des TI-Flow-Fachdienstes durch das T-Register des BfArM (Anforderung des BfArM) statt.

Der TI-Flow-Fachdienst überträgt die Daten unmittelbar - also ohne Beteiligung eines Dritten - unverzüglich nach Abruf der Quittung an das T-Register - sofern dieses System erreicht werden kann. Im Falle einer temporären Nichtverfügbarkeit des T-Register werden die zu übertragenen Daten in einer Warteschlange gespeichert und übertragen, sobald das T-Register wieder erreicht werden kann.

Nach der Übertragung der Daten in das T-Register befinden sich die Daten im Verantwortungsbereich des BfArM (Grenze der Sicherheitsleistung der TI). Dies betrifft insbesondere die weitere Verarbeitung der Daten durch das BfArM und die sich anschließenden Verarbeitungsvorgänge. Eine ggf. notwendige Kommunikation vom BfArM mit abgebenden Apotheken oder eine Übermittlung von Daten vom BfArM an den TI-Flow-Fachdienst ist durch dieses Feature nicht vorgesehen.

Die Nutzung des FHIR-VZD durch den TI-Flow-Fachdienst erfolgt im Rahmen einer Anwendung der TI (E-Rezept) gemäß § 313 Abs. 3 SGB V. Dabei werden der Name, die Anschrift und – sofern eingetragen – die Telefonnummer der abgebenden Apotheke abgefragt und an das BfArM übermittelt.

### Neuer Anwendungsfall

Neben der Nutzung bereits spezifizierter Anwendungsfälle, wird ein neuer Anwendungsfall „Digitaler Durchschlag E-T-Rezept an den BfArM Webdienst übertragen“ spezifiziert. Die Verfügbarkeit des Anwendungsfall wird mit „normal“ bewertet, da ein bei einer Nichtverfügbarkeit die Daten in einer Warteschlange aufgehoben werden, bis der Anwendungsfall erfolgreich ausgeführt werden konnte.

### Protokollierung

Die Protokolleinträge für den Versicherten bei Verarbeitung von E-T-Rezepten im TI-Flow-Fachdienst folgen dem Muster für Verordnungen von apothekenpflichtigen Arzneimitteln. Demnach wird für den Versicherten das Einstellen und das Einlösen von E-T-Rezepten protokolliert, nicht aber die Übertragung von Daten an das BfArM, da hierbei keine Informationen über den Versicherten an das BfArM übermittelt werden.

Die Protokollierung in den Apotheken oder beim BfArM wird nicht durch die gematik geregelt (Grenze der Sicherheitsleistung der TI).

