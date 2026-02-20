# Szenarien für den PKV-Workflow - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Überblick zur Verordnung und Belieferung von Arzneimitteln**](menu-fachlichkeit-ueberblick.md)
* **Szenarien für den PKV-Workflow**

## Szenarien für den PKV-Workflow

Szenarioübersicht zur digitalen Bereitstellung von Abrechnungsinformationen für PKV‑Versicherte.

Dieses Szenario beschreibt den Prozess zur digitalen Bereitstellung von Abrechnungsinformationen für PKV-Versicherte. Es ergänzt den Standard-E-Rezept-Workflow um die Erstellung, Speicherung und Bereitstellung des PKV-Abgabedatensatzes.

## Aufbau der Szenariobeschreibungen

1. **Kontext und Mehrwert**: kurze Einordnung, warum das Szenario existiert und welche Vorgaben maßgeblich sind.
1. **Prozessabschnitte**: strukturierte Abschnitte (Verordnung, Belieferung, Abrechnung) mit Hinweisen auf Flowtypes und Rollen.
1. **Beteiligte Akteure**: Übersicht der Akteure, die im Anwendungsfall beteiligt sind.
1. **Fachliche Anwendungsfälle**: Übersicht der relevanten Use Cases aus dem Katalog.

## Prozessabschnitte

Die digitale Abrechnungsinformation besteht aus den folgenden Datensätzen:

* Verordnungsdatensatz
* PKV-Abgabedatensatz
* Quittungsdatensatz

### TODO: Die Einwilligung zum Speichern der Abrechungsinformationen

…

**Beteiligte Akteure:**

* PKV-Versicherter

**Fachliche Anwendungsfälle**

| |
| :--- |
| [Einwilligung zum Speichern der Abrechnungsinformationen erteilen](menu-fachlichkeit-anwendungsfaelle.md#einwilligung-erteilen) |
| [Einwilligung zum Speichern der Abrechnungsinformationen einsehen](menu-fachlichkeit-anwendungsfaelle.md#einwilligung-einsehen) |

**Tabelle:**Fachliche Anwendungsfälle mit Bezug zu Szenario
*Verordnungen für PKV-Versicherte*
### Verordnungen für PKV-Versicherte

Die Verordnung erfolgt analog zu den bestehenden E-Rezept-Workflows. Für PKV-Versicherte werden die Flowtypes 200 und 209 genutzt. Der Verordnungsdatensatz basiert auf dem KBV-Modell [eRezept-Profile].

Der Verordnungsdatensatz wird durch den Arzt/Zahnarzt erstellt, mit einer Qualifizierten Elektronischen Signatur (QES) versehen und auf dem E-Rezept-Fachdienst eingestellt. Für den Abrechnungsprozess wird der Verordnungsdatensatz ohne QES übermittelt, um das Risiko von Mehrfacheinlösungen zu vermeiden. Statt der QES wird der Verordnungsdatensatz durch den E-Rezept-Fachdienst fortgeschritten signiert, um die Integrität des Datensatzes für den Abrechnungsprozess sicherzustellen.

**Beteiligte Akteure:**

* verordnender Leistungserbringer (Arzt/Zahnarzt)
* PKV-Versicherter

**Fachliche Anwendungsfälle**

| |
| :--- |
| [Einwilligung zum Speichern der Abrechnungsinformationen erteilen](menu-fachlichkeit-anwendungsfaelle.md#einwilligung-erteilen) |
| [Einwilligung zum Speichern der Abrechnungsinformationen einsehen](menu-fachlichkeit-anwendungsfaelle.md#einwilligung-einsehen) |

**Tabelle:**Fachliche Anwendungsfälle mit Bezug zu Szenario
*Verordnungen für PKV-Versicherte*
### Belieferung durch die Apotheke

Nach der Einlösung kann die Apotheke die Abrechnungsinformation digital bereitstellen, sofern eine Einwilligung vorliegt.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält – sofern in der Apotheke Änderungen bei der Abgabe vorgenommen werden – den QES-signierten PKV-Abgabedatensatz; andernfalls den fortgeschritten signierten PKV-Abgabedatensatz. Das Informationsmodell zum PKV-Abgabedatensatz wird durch den Verband der PKVen und DAV erarbeitet.

Der E-Rezept-Fachdienst erzeugt einen AccessCode, der für spätere Korrekturen genutzt werden kann.

**Beteiligte Akteure:**

* abgebender Leistungserbringer (Apotheke)
* PKV-Versicherter

**Fachliche Anwendungsfälle**

| |
| :--- |
| [Abrechnungsinformation durch Abgebenden bereitstellen](menu-fachlichkeit-anwendungsfaelle.md#abrechnungsinformation-bereitstellen) |
| [Abrechnungsinformation durch Abgebenden abrufen](menu-fachlichkeit-anwendungsfaelle.md#abrechnungsinformation-abrufen) |
| [PKV-Abgabedatensatz durch Abgebenden ändern](menu-fachlichkeit-anwendungsfaelle.md#pkv-abgabedatensatz-aendern) |

**Tabelle:**Fachliche Anwendungsfälle mit Bezug zu Szenario
*Belieferung durch die Apotheke*
### Abrechnung durch den Versicherten

Der Versicherte ruft die Abrechnungsinformation im FdV ab, kann sie exportieren und an den Kostenträger weiterleiten. Der Export in Form eines PDFs ermöglicht hierbei verschiedene Kanäle zur Übermittlung (wie E-Mail, Webportal oder App des Kostenträgers).

Die Quittung wird durch den E-Rezept-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im E-Rezept-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat außerdem die Möglichkeit, sie vorab (z. B. nach Abschluss der Abrechnung) zu löschen.

Eine Langzeitarchivierung der Abrechnungsinformation im E-Rezept-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Die Löschfristen für das E-Rezept mit den in Beziehung stehenden Daten, wie Dispensierinformationen und Kommunikationen zum E-Rezept, werden unabhängig von der zugehörigen Abrechnungsinformation durchgesetzt. Siehe [gemSysL_eRp]#A_18525.

**Beteiligte Akteure:**

* PKV-Versicherter
* Kostenträger

**Fachliche Anwendungsfälle**

| |
| :--- |
| [Abrechnungsinformationen durch den Versicherten abrufen](menu-fachlichkeit-anwendungsfaelle.md#abrechnungsinformationen-abrufen) |
| [Einwilligung zum Speichern der Abrechnungsinformationen widerrufen](menu-fachlichkeit-anwendungsfaelle.md#einwilligung-widerrufen) |

**Tabelle:**Fachliche Anwendungsfälle mit Bezug zu Szenario
*Abrechnung durch den Versicherten*

