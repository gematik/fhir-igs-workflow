# Abrechnungsinformationen des E-Rezepts für PKV-Versicherte - E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte v1.1.0-draft

E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Abrechnungsinformationen des E-Rezepts für PKV-Versicherte**

## Abrechnungsinformationen des E-Rezepts für PKV-Versicherte

Das Feature „Abrechnungsinformationen für PKV-Versicherte“ erweitert die bestehenden E-Rezept-Workflows für Arzneimittel um die digitale Bereitstellung von Abrechnungsinformationen. Es beschreibt den zusätzlichen Funktionsumfang für den E-Rezept-Fachdienst und die beteiligten Clientsysteme, die Prozessparameter sowie die fachlichen und technischen Anforderungen.

### Zielsetzung

Die Beschreibung des Funktionsumfangs als Feature erleichtert das Verständnis und die Nachvollziehbarkeit der Lösung – von der Darstellung der Nutzersicht über das technische Konzept bis zur Spezifikation der technischen Details. Damit sollen Hersteller die notwendigen Umsetzungen für ihre Komponenten bewerten können.

### Zielgruppe

Hersteller und Anbieter des Produkttyps E-Rezept-Fachdienst sowie Hersteller von Clientsystemen für den Zugriff auf den E-Rezept-Fachdienst.

### Abgrenzungen

Die Festlegungen des Standard-Workflows für apothekenpflichtige Arzneimittel sind nicht Gegenstand dieses Dokuments. Die Ergänzungen widersprechen den bestehenden Festlegungen nicht.

### Methodik

Anforderungen werden durch eine eindeutige ID (IG-ERP-CHRG-*) und die Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN gemäß RFC 2119 gekennzeichnet. Die Schlüsselworte werden bei Bedarf um Pronomen ergänzt.

### Epic

TODO: Update link

Der Ablauf für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel für PKV-Versicherte orientiert sich an der Verordnung von apothekenpflichtige Arzneimittel für GKV-Versicherte, und wird in [gemIG_eRp_Prescription] beschrieben. Die Abrechnung der Apotheke erfolgt gegenüber dem Versicherten, sofern keine Direktabrechnung mit einer Krankenversicherung vereinbart wurde. Stattdessen wird der Prozess um Aspekte für die Bereitstellung von Informationen für die Erstattung der Kosten für den Versicherten erweitert.

#### Ablauf

Nach der Belieferung des E-Rezepts stellt die Apotheke, sofern das E-Rezept nicht dem Sachleistungsprinzip unterliegt, auf Wunsch des Versicherten die Abrechnungsinformation zum E-Rezept im E-Rezept-Fachdienst bereit. Dort werden sie mit Einwilligung des Versicherten bis zu 10 Jahren gespeichert. Alternativ übergibt der Apotheker dem Versicherten im Ersatzverfahren einen Papierbeleg mit den abrechnungsrelevanten Informationen für die Abrechnung. Der Versicherte lädt die digital bereitgestellte Abrechnungsinformation mit dem E-Rezept-FdV vom E-Rezept-Fachdienst herunter. Der Versicherte kann für die Abrechnung die Abrechnungsinformation an eine App seiner PKV / der Beihilfe weiterleiten, in einem Portal des Kostenträgers hochladen oder ausdrucken.

### User Stories

#### PKV-Versicherte

Als PKV-Versicherter möchte ich …

* … in der E-Rezept-App meine Zustimmung/Einwilligung geben können, so dass digitale Abrechnungsinformationen durch Apotheker im E-Rezept-Fachdienst gespeichert werden können.
* … in der E-Rezept-App meine Zustimmung/Einwilligung für die Speicherung von digitalen Abrechnungsinformationen zu jedem beliebigen Zeitpunkt widerrufen können.
* …, dass mein Apotheker erkennt, dass ich in der E-Rezept-App dem Speichern von digitalen Abrechnungsinformationen zugestimmt habe.
* … wählen können, ob der Apotheker mir die Abrechnungsinformation für ein E-Rezept analog (Papierbeleg) oder digital zur Verfügung stellt.
* … nach Abgabe in der Apotheke alle Belege in der E-Rezept-App aufrufen und nutzen können.
* … die digitalen Abrechnungsinformationen aus der E-Rezept-App als PDF-Dokument an einen anderen digitalen Speicherort exportieren und ausdrucken können, um meine Abrechnungen auch an einer anderen Stelle dokumentieren zu können.
* … aus der E-Rezept-App heraus alle abrechnungsrelevanten Informationen als PDF-Dokument digital an meinen Kostenträger übermitteln können, um eine Erstattung beantragen zu können (Eine Übermittlung erfolgt nicht automatisch).
* … meine eingereichten Abrechnungen im E-Rezept-Fachdienst markieren können.
* …, dass mein Apotheker die Abrechnungsinformationen ändern kann, wenn mir bei der Abrechnung ein Fehler auffällt. Dazu möchte ich den Apotheker in der App berechtigen können.
* … in der E-Rezept-App darauf hingewiesen werden, wenn die Abrechnungsinformationen nachträglich geändert wurden.
* … immer nur die neuste Version der Abrechnungsinformation an meinen Kostenträger weiterleiten können, damit ich nicht mit den Versionen durcheinanderkomme.
* … in der E-Rezept-App einen Hinweis angezeigt bekommen, bevor mein PKV-Rezept nach Ablauf von 10 Jahren automatisch gelöscht wird.

#### Apotheker

Als Apotheker möchte ich …

* … in meinem AVS erkennen können, ob der Versicherte dem Speichern von digitalen Abrechnungsinformationen zugestimmt hat.
* … dem Versicherten die digitalen Abrechnungsinformationen über den E-Rezept-Fachdienst bereitstellen können, falls der Versicherte seine Einwilligung erteilt hat.
* …, auf Wunsch des Versicherten, eine fehlerhaft erstellte digitale Abrechnungsinformation überschreiben können.
* … bei meinem Kunden die Einwilligung einholen können, um die Abrechnungsinformationen ändern zu können, wenn mir ein Fehler darin auffällt.
* … in meinem AVS benachrichtigt werden, wenn ein Kunde eine Änderung einer Abrechnungsinformation anfragt.

#### Kostenträger

Als Kostenträger möchte ich …

* … digital eingereichte E-Rezept-Abrechnungsinformationen direkt digital weiterverarbeiten können.
* … doppelte Einreichungen (analog und digital) von E-Rezept-Abrechnungsinformationen zur Erstattung erkennen können.

### Prozessabschnitte

Die digitale Abrechnungsinformation besteht aus den folgenden Datensätzen:

* Verordnungsdatensatz
* PKV-Abgabedatensatz
* Quittungsdatensatz

### Einwilligung zum Speichern der Abrechungsinformationen

Das Speichern der Abrechnungsinformationen erfolgt nur mit Einwilligung des Versicherten. Diese Einwilligung kann der Versicherte speichern, einsehen und jederzeit widerrufen. Sie wird unbefristet erteilt, und mit dem Widerruf der Einwilligung werden bereits gespeicherte Abrechnungsinformationen gelöscht.

**Beteiligte Akteure:** **Beteiligte Systeme:** E-Rezept-FdV, E-Rezept-Fachdienst

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

Der Versicherte kann nachträglich die Apotheke berechtigen Korrekturen am PKV-Abgabedatensatz vorzunehmen und den korrigierten Datensatz im E-Rezept-Fachdienst zu speichern. Dafür erzeugt der E-Rezept-Fachdienst einen AccessCode.

**Beteiligte Akteure:**

* abgebender Leistungserbringer (Apotheke)
* PKV-Versicherter

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

Die Quittung wird durch den E-Rezept-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im E-Rezept-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat außerdem die Möglichkeit, sie vorab (z. B. nach Abschluss der Abrechnung) zu löschen.

Eine Langzeitarchivierung der Abrechnungsinformation im E-Rezept-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Die Löschfristen für das E-Rezept mit den in Beziehung stehenden Daten, wie Dispensierinformationen und Kommunikationen zum E-Rezept, werden unabhängig von der zugehörigen Abrechnungsinformation durchgesetzt. Siehe [gemSysL_eRp]#A_18525.

**Beteiligte Akteure:**

* PKV-Versicherter
* Kostenträger

**Technische Anwendungsfälle**

| |
| :--- |
|  |
| [Abrechnungsinformationen durch den Versicherten weitergeben](menu-technische-umsetzung-anwendungsfaelle.md#abrechungsinformationen_durch_versicherten_weitergeben) |
| [UC 3.12 - Abrechnungsinformationen durch den Versicherten markieren](menu-technische-umsetzung-anwendungsfaelle.md#uc_3_12_abrechungsinformationen_durch_versicherten_markieren) |
| [UC 3.11 - Abrechnungsinformationen durch den Versicherten löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc_3_11_abrechungsinformation_durch_versicherten_löschen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Szenario
*Abrechnung durch den Versicherten*

