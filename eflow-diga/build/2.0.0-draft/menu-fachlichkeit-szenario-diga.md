# Szenario: Verordnungen für DiGA - Verordnungen fuer Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen fuer Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Überblick zur Verordnung von DiGAs**](menu-fachlichkeit-ueberblick.md)
* [**Szenarien für den DiGA-Workflow**](menu-fachlichkeit-szenarien.md)
* **Szenario: Verordnungen für DiGA**

## Szenario: Verordnungen für DiGA

Die elektronische Verordnung für Digitale Gesundheitsanwendungen (DiGA) ersetzt das Muster-16-Verfahren und sorgt dafür, dass zertifizierte DiGAs medienbruchfrei, sicher und nachvollziehbar verordnet, die Verordnung an Kostenträger übermittelt und der Freischaltcode übermittelt an den Versicherten werden können. Es ergänzt die bestehenden Abläufe des E-Rezepts, erweitert sie um Psychotherapeutinnen und Psychotherapeuten sowie Kostenträger und ermöglicht eine vollständig digitale Bereitstellung der Freischaltcodes.

## Vorteile durch das elektronische Verordnen von DiGAs

* Versicherte müssen Anträge und Muster-16-Vordrucke nicht mehr postalisch einreichen, sondern erhalten Verordnungen sofort in der Versicherten-App (FdV) oder optional als Ausdruck (Section 360 Abs. 9 SGB V).
* Ärztinnen, Zahnärzte und Psychotherapeutinnen nutzen etablierte E-Rezept-Prozesse weiter, inklusive QES und Workflowsteuerung, wodurch Schulungs- und Dokumentationsaufwände sinken.
* Krankenkassen empfangen Anfragen überwiegend digital, können die Verordnungsdaten strukturiert abrufen und sparen manuelle Bearbeitung der Papierformulare.
* Der Workflow-Fachdienst dokumentiert Bereitstellung und Nutzung des Freischaltcodes transparent, was Missbrauch erschwert und revisionssichere Nachweise liefert.

## DiGA-Verordnung erstellen

PVS/KIS greifen auf das BfArM-DiGA-Verzeichnis zu, wählen die passende PZN (inklusive indikations- oder laufzeitbezogener Varianten) und erzeugen eine elektronische Verordnung. Nach Vergabe der PrescriptionID wird die Verordnung qualifiziert elektronisch signiert, an den Workflow-Fachdienst übermittelt und dort als Flowtype 162 geprüft. Ärztinnen, Zahnärzte und Psychotherapeutinnen folgen damit den gleichen QES- und Aktivierungsabläufen wie bei Arzneimitteln. Bei TI-Störungen steht das Muster 16 weiterhin als Ersatzverfahren bereit.

> Offener Punkt: Das BMG und die KBV stimmen ab, ob die PZN dauerhaft als Identifier genutzt wird. Das Datenmodell wird an das Ergebnis angepasst.

**Beteiligte Systeme:** PVS/KIS (inkl. Psychotherapeutinnen-Systeme), Konnektor, Fachdienst

**Fachliche Anwendungsfälle**

| |
| :--- |
| [E-Rezept erstellen](menu-fachlichkeit-anwendungsfaelle.md#e-rezept-erstellen) |
| [E-Rezept qualifiziert signieren](menu-fachlichkeit-anwendungsfaelle.md#e-rezept-qualifiziert-signieren) |
| [E-Rezept vervollstaendigen und Task aktivieren](menu-fachlichkeit-anwendungsfaelle.md#e-rezept-vervollstaendigen-und-task-aktivieren) |

## DiGA zuweisen und Freischaltcode anfordern

Versicherte sehen eine neue DiGA-Verordnung im E-Rezept-FdV (oder erhalten einen Ausdruck) und weisen sie ihrem Kostenträger zu. Das E-Rezept-FdV ermittelt - idealerweise automatisch - die Telematik-ID der Krankenkasse über den FHIR-VZD, erstellt eine `Communication_DispReq` und übermittelt darin Verordnungs-ID und AccessCode. Alternativ können Versicherte den Ausdruck per Post, Servicecenter oder Service-App der Krankenkasse einreichen. Der Kostenträger startet daraufhin den Abruf. Status- und Protokolleinträge im E-Rezept-FdV machen den Fortschritt (Freischaltcode angefordert, in Prüfung, erledigt) sichtbar.

**Beteiligte Systeme:** E-Rezept-FdV nach Section 360 Abs. 10 SGB V, Krankenkassen-App, Kostenträger-Backend, E-Rezept-Fachdienst

**Fachliche Anwendungsfälle**

| |
| :--- |
| [DiGA-Verordnung einem Kostentraeger zuweisen](menu-fachlichkeit-anwendungsfaelle.md#diga-e-rezept-zuweisen) |

## Prüfung durch Kostenträger und Bereitstellung des Freischaltcodes

Kostenträger authentisieren sich über ihren Basis-Consumer, rufen die Verordnung mit `$accept` ab und prüfen Anspruch, Indikation sowie ggf. ergänzende Unterlagen. Nach erfolgreicher Prüfung erzeugen sie den Freischaltcode, legen ihn als Abgabeinformation via `$close` im Fachdienst ab und schliessen den Workflow mit einer Quittung ab. Falls kein Freischaltcode ausgegeben werden kann, hinterlegen sie eine versichertenfreundliche Begründung, damit Versicherte den Ausgang im E-Rezept-FdV nachvollziehen können.

**Beteiligte Systeme:** Kostenträger-Backend inkl. Basis-Consumer, e-Rezept-Fachdienst, interne Freischaltcode-Services

**Fachliche Anwendungsfälle**

| |
| :--- |
| [DiGA-E-Rezept abrufen (Kostentraeger)](menu-fachlichkeit-anwendungsfaelle.md#diga-e-rezept-abrufen-kostentraeger) |
| [Freischaltcode bereitstellen oder Rueckmeldung geben](menu-fachlichkeit-anwendungsfaelle.md#diga-freischaltcode-bereitstellen) |

