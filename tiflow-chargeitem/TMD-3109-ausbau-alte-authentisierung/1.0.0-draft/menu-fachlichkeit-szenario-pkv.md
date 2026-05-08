# Abrechnungsinformationen des E-Rezepts für PKV-Versicherte - TIFlow - Abrechnungsinformationen v1.0.0-draft

TIFlow - Abrechnungsinformationen

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Abrechnungsinformationen des E-Rezepts für PKV-Versicherte**

## Abrechnungsinformationen des E-Rezepts für PKV-Versicherte

In diesem Abschnitt wird das Feature fachlich motiviert und der Mehrwert für Nutzer vorgestellt. Aus diesen Epics und User Stories wird anschließend ein technisches Konzept abgeleitet.

### Epic

Der Ablauf für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel für PKV-Versicherte orientiert sich an der Verordnung von apothekenpflichtige Arzneimittel für GKV-Versicherte, und wird in [gemIG_eRp_Prescription] beschrieben. Die Abrechnung der Apotheke erfolgt gegenüber dem Versicherten, sofern keine Direktabrechnung mit einer Krankenversicherung vereinbart wurde. Stattdessen wird der Prozess um Aspekte für die Bereitstellung von Informationen für die Erstattung der Kosten für den Versicherten erweitert.

**Abbildung: **Ablauf Einreichen von Abrechnungsinformationen


Der (Zahn-)Arzt verschreibt ein E-Rezept. Das E-Rezept wird auf den TI-Flow-Fachdienst übertragen. Der Versicherte erhält einen E-Rezept-Token im E-Rezept-FdV oder auf einem Tokenausdruck. Der Versicherte übermittelt den E-Rezept-Token an eine Apotheke seiner Wahl. Die Apotheke ruft das E-Rezept vom TI-Flow-Fachdienst ab und dispensiert es. Die Apotheke stellt, sofern das E-Rezept nicht dem Sachleistungsprinzip unterliegt, auf Wunsch des Versicherten die Abrechnungsinformation zum E-Rezept im TI-Flow-Fachdienst bereit. Dort werden sie mit Einwilligung des Versicherten bis zu 10 Jahren gespeichert. Alternativ übergibt der Apotheker dem Versicherten im Ersatzverfahren einen Papierbeleg mit den abrechnungsrelevanten Informationen für die Abrechnung. Der Versicherte lädt die digital bereitgestellte Abrechnungsinformation mit dem E-Rezept-FdV vom TI-Flow-Fachdienst herunter. Der Versicherte kann für die Abrechnung die Abrechnungsinformation an eine App seiner PKV / der Beihilfe weiterleiten, in einem Portal des Kostenträgers hochladen oder ausdrucken.

Der Ablauf für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer für PKV-Versicherte orientiert sich an der Verordnung von apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer für GKV-Versicherte (Workflow-Typ “169”).

### User Stories

#### PKV-Versicherte

* Als PKV-Versicherter möchte ich in der E-Rezept-App meine Zustimmung/Einwilligung geben können, so dass digitale Abrechnungsinformationen durch Apotheker im TI-Flow-Fachdienst gespeichert werden können.
* Als PKV-Versicherter möchte ich in der E-Rezept-App meine Zustimmung/Einwilligung für die Speicherung von digitalen Abrechnungsinformationen zu jedem beliebigen Zeitpunkt widerrufen können.
* Als PKV-Versicherter möchte ich, dass mein Apotheker erkennt, dass ich in der E-Rezept-App dem Speichern von digitalen Abrechnungsinformationen zugestimmt habe.
* Als PKV-Versicherter möchte ich wählen können, ob der Apotheker mir die Abrechnungsinformation für ein E-Rezept analog (Papierbeleg) oder digital zur Verfügung stellt.
* Als PKV-Versicherter möchte ich nach Abgabe in der Apotheke alle Belege in der E-Rezept-App aufrufen und nutzen können.
* Als PKV-Versicherter möchte ich die Verordnungs- und Abgabedaten sowie Dispensierinformationen zusammenhängend in der App angezeigt bekommen, sodass ich nachvollziehen kann, was mir vom Arzt verordnet, was mir in der Apotheke mitgegeben wurde und was ich gegenüber meiner Kasse abrechnen kann .
* Als PKV-Versicherte möchte ich die digitalen Abrechnungsinformationen aus der E-Rezept-App als PDF-Dokument an einen anderen digitalen Speicherort exportieren und ausdrucken können, um meine Abrechnungen auch an einer anderen Stelle dokumentieren zu können.
* Als PKV-Versicherter möchte ich aus der E-Rezept-App heraus alle abrechnungsrelevanten Informationen als PDF-Dokument digital an meinen Kostenträger übermitteln können, um eine Erstattung beantragen zu können (Eine Übermittlung erfolgt nicht automatisch).
* Als PKV-Versicherter möchte ich meine eingereichten Abrechnungen im TI-Flow-Fachdienst markieren können.
* Als PKV-Versicherter möchte ich, dass mein Apotheker die Abrechnungsinformationen ändern kann, wenn mir bei der Abrechnung ein Fehler auffällt. Dazu möchte ich den Apotheker in der App berechtigen können.
* Als PKV-Versicherter möchte ich in der E-Rezept-App darauf hingewiesen werden, wenn die Abrechnungsinformationen nachträglich geändert wurden.
* Als Versicherter möchte ich immer nur die neuste Version der Abrechnungsinformation an meinen Kostenträger weiterleiten können, damit ich nicht mit den Versionen durcheinanderkomme.
* Als PKV-Versicherter möchte ich in der E-Rezept-App einen Hinweis angezeigt bekommen, bevor mein PKV-Rezept nach Ablauf von 10 Jahren automatisch gelöscht wird.

#### Apotheker

* Als Apotheker möchte ich in meinem AVS erkennen können, ob der Versicherte dem Speichern von digitalen Abrechnungsinformationen zugestimmt hat.
* Als Apotheker möchte ich dem Versicherten die digitalen Abrechnungsinformationen über den TI-Flow-Fachdienst bereitstellen können, falls der Versicherte seine Einwilligung erteilt hat.
* Als Apotheker möchte ich, auf Wunsch des Versicherten, eine fehlerhaft erstellte digitale Abrechnungsinformation überschreiben können.
* Als Apotheker möchte ich bei meinem Kunden die Einwilligung einholen können, um die Abrechnungsinformationen ändern zu können, wenn mir ein Fehler darin auffällt.
* Als Apotheker möchte ich in meinem AVS benachrichtigt werden, wenn ein Kunde eine Änderung einer Abrechnungsinformation anfragt.

#### Kostenträger

* Als Kostenträger möchte ich digital eingereichte E-Rezept-Abrechnungsinformationen direkt digital weiterverarbeiten können.
* Als Kostenträger möchte ich doppelte Einreichungen (analog und digital) von E-Rezept-Abrechnungsinformationen zur Erstattung erkennen können.

### Fachliches Konzept

Die digitale Abrechnungsinformation besteht aus den folgenden Datensätzen: Verordnungsdatensatz, PKV-Abgabedatensatz und Quittungsdatensatz.

Der Verordnungsdatensatz wird durch den Arzt/Zahnarzt erstellt, mit einer Qualifizierten Elektronischen Signatur (QES) versehen und auf dem TI-Flow-Fachdienst eingestellt. Für den Abrechnungsprozess wird der Verordnungsdatensatz ohne QES übermittelt, um das Risiko vom Mehrfacheinlösungen zu vermeiden. Statt der QES wird der Verordnungsdatensatz durch den TI-Flow-Fachdienst fortgeschritten signiert, um die Integrität des Datensatzes für den Abrechnungsprozess sicherzustellen.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält, sofern in der Apotheke Änderungen bei der Abgabe vorgenommen werden, den QES-signierten PKV-Abgabedatensatz und sofern in der Apotheke keine Änderungen erfolgen, den fortgeschritten signierten PKV-Abgabedatensatz. Das Informationsmodell zum PKV-Abgabedatensatz wird durch den Verband der PKVen und DAV erarbeitet.

Die Quittung wird durch den TI-Flow-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im TI-Flow-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (Rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat die Möglichkeit, sie vorab, beispielsweise wenn die Abrechnung abgeschlossen wurde, zu löschen.

Eine Langzeitarchivierung der Abrechnungsinformation im TI-Flow-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Der PKV-Versicherte kann über die E-Rezept App die Abrechnungsinformation digital an seine PKV schicken, um die Erstattung zu beantragen. Der Export in Form eines PDFs ermöglicht hierbei verschiedene Kanäle zur Übermittlung (wie E-Mail, Webportal, App des Kostenträgers).

### Einwilligung zum Speichern der Abrechungsinformationen

Das Speichern der Abrechnungsinformationen erfolgt nur mit Einwilligung des Versicherten. Diese Einwilligung kann der Versicherte speichern, einsehen und jederzeit widerrufen. Sie wird unbefristet erteilt, und mit dem Widerruf der Einwilligung werden bereits gespeicherte Abrechnungsinformationen gelöscht.

**Beteiligte Systeme:** TI-Flow-Fachdienst, E-Rezept-FdV

**Technische Anwendungsfälle**

| |
| :--- |
| [UC 3.14 - Einwilligung durch Versicherten erteilen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-14-einwilligung-erteilen) |
| [UC 3.13 - Einwilligungen durch Versicherten einsehen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-13-einwilligungen-einsehen) |
| [UC 3.15 - Einwilligung durch Versicherten widerrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-15-einwilligung-widerrufen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zum Szenario
*Einwilligung zum Speichern der Abrechungsinformationen*
### Belieferung der Abrechnungsinformation durch die Apotheke

Nach der Einlösung kann die Apotheke die Abrechnungsinformation digital bereitstellen, sofern eine Einwilligung vorliegt.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält – sofern in der Apotheke Änderungen bei der Abgabe vorgenommen werden – den QES-signierten PKV-Abgabedatensatz; andernfalls den fortgeschritten signierten PKV-Abgabedatensatz. Das Informationsmodell zum PKV-Abgabedatensatz wird durch den Verband der PKVen und DAV erarbeitet.

Der Versicherte kann nachträglich die Apotheke berechtigen Korrekturen am PKV-Abgabedatensatz vorzunehmen und den korrigierten Datensatz im TI-Flow-Fachdienst zu speichern. Dafür erzeugt der TI-Flow-Fachdienst einen AccessCode.

**Beteiligte Systeme:** TI-Flow-Fachdienst, AVS

**Technische Anwendungsfälle**

| |
| :--- |
| [UC 4.11 - Abrechnungsinformation durch Abgebenden bereitstellen](menu-technische-umsetzung-anwendungsfaelle.md#uc_4_11_abrechungsinformation_durch_abgebenden_bereitstellen) |
| [UC 4.10 - Abrechnungsinformationen durch Abgebenden abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc_4_10_abrechungsinformationen_durch_abgebenden_abrufen) |
| [UC 4.13 - PKV-Abgabedatensatz durch Abgebenden ändern](menu-technische-umsetzung-anwendungsfaelle.md#uc_4_13_abgabedatensatz_durch_abgebenden_aktualisieren) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Szenario
*Belieferung durch die Apotheke*
### Abrechnung durch den Versicherten

Der Versicherte ruft die Abrechnungsinformation im FdV ab, kann sie exportieren und an den Kostenträger weiterleiten. Der Export in Form eines PDFs ermöglicht hierbei verschiedene Kanäle zur Übermittlung (wie E-Mail, Webportal oder App des Kostenträgers).

Die Quittung wird durch den TI-Flow-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im TI-Flow-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat außerdem die Möglichkeit, sie vorab (z. B. nach Abschluss der Abrechnung) zu löschen.

Eine Langzeitarchivierung der Abrechnungsinformation im TI-Flow-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Die Löschfristen für das E-Rezept mit den in Beziehung stehenden Daten, wie Dispensierinformationen und Kommunikationen zum E-Rezept, werden unabhängig von der zugehörigen Abrechnungsinformation durchgesetzt. Siehe [gemSysL_eRp]#A_18525.

**Beteiligte Systeme:** TI-Flow-Fachdienst, E-Rezept-FdV

**Technische Anwendungsfälle**

| |
| :--- |
|  |
| [Abrechnungsinformationen durch den Versicherten weitergeben](menu-technische-umsetzung-anwendungsfaelle.md#abrechungsinformationen_durch_versicherten_weitergeben) |
| [UC 3.12 - Abrechnungsinformationen durch den Versicherten markieren](menu-technische-umsetzung-anwendungsfaelle.md#uc_3_12_abrechungsinformationen_durch_versicherten_markieren) |
| [UC 3.11 - Abrechnungsinformationen durch den Versicherten löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc_3_11_abrechungsinformation_durch_versicherten_löschen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Szenario
*Abrechnung durch den Versicherten*

