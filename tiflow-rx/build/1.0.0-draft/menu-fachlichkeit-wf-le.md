# Verordnung mit Steuerung durch Leistungserbringer - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Fachliche Aspekte zur Arzneimittelverordnung**](menu-fachlichkeit.md)
* **Verordnung mit Steuerung durch Leistungserbringer**

## Verordnung mit Steuerung durch Leistungserbringer

In diesem Abschnitt wird das Feature fachlich motiviert und der Mehrwert für Nutzer vorgestellt. Aus diesen Epics und User Stories wird anschließend ein technisches Konzept abgeleitet.

### Epic Direkte Zuweisung des E-Rezepts durch den Verordnenden

Dieses Epic beschreibt besondere Versorgungssituationen, in denen, abweichend vom Regelprozess des E-Rezepts mit Verordnung erstellen → QES → Übergabe an Versicherten → Zuweisung an Apotheke → Dispensierung an Versicherten /Vertreter, ein E-Rezept direkt vom verordnenden Leistungserbringer an die abgebende Apotheke zugewiesen und übermittelt wird. Grundlage für die Anwendung dieses Workflows sind die Regelungen für anwendungsfertige Zytostatikazubereitungen in § 11 Absatz 2 Apothekengesetz (ApoG) und für die Arzneimittelversorgung durch krankenhausversorgende Apotheken und Krankenhausapotheken im Rahmen von § 14 Absätze 7 und 8 des Apothekengesetzes (ApoG).

Für die hier dargestellten Verordnungen existiert ein direkter Patientenbezug, sie sind daher abzugrenzen von Verordnungen für Sprechstundenbedarf.

Das Epic beschreibt die Zuweisung und Übermittlung eines E-Rezepts an eine Apotheke durch die verordnenden Leistungserbringer sowie die Abgabe in der Apotheke. Prozesse der Herstellung von Arzneimitteln sowie der Dokumentation der Herstellung als Voraussetzung für die Abrechnung finden außerhalb der TI statt und werden daher hier nicht beschrieben. Da insbesondere im Bereich der Zytostatikazubereitungen zwischen abgebender und herstellender Apotheke unterschieden wird, wird in den folgenden User Stories von der abgebenden Apotheke gesprochen, um diese Prozessabgrenzung zu verdeutlichen.

### User Stories

Voraussetzung jeder nachfolgenden User Story ist, dass die gesetzlichen Grundlagen in § 11 Absatz 2 und § 14 Absätze 7 und 8 des ApoG erfüllt sind.

#### Arzt

* Als Arzt möchte ich für bestimmte Medikamentenverordnungen ein E-Rezept unkompliziert einer Apotheke im gesetzlichen Rahmen direkt zuweisen können.
* Als Arzt möchte ich für bestimmte Medikamentenverordnungen nicht, dass der Patient diese Verordnungen löscht.
* Als Arzt möchte ich für bestimmte Medikamentenverordnungen nicht, dass der Patient diese Verordnungen einer Apotheke zuweisen kann.
* Als Arzt möchte ich für bestimmte Medikamentenverordnungen den von mir gewohnten Standard für die Übermittlung des E-Rezept-Tokens an die Apotheke nutzen, so dass ich ihn beliebig teilen kann (z.B. Ausdruck oder Weiterleiten mit sicherem Übermittlungsverfahren).
* Als Arzt möchte ich für bestimmte Medikamentenverordnungen E-Rezepte bestimmten, von mir einstellbaren Apotheken zuweisen können.
* Als Arzt möchte ich für bestimmte Medikamentenverordnungen E-Rezepte automatisch an meine herstellende Apotheke zuweisen können, wenn ich die herstellende Apotheke vorher festgelegt und die automatische Zuweisung eingerichtet habe, so dass ich mir zusätzliche und sich wiederholende Arbeitsschritte sparen kann.
* Als Arzt möchte ich für bestimmte Medikamentenverordnungen die Zuweisung eines E-Rezepts an eine Apotheke auch an meine Mitarbeiter delegieren können, so dass ich nicht alles selber machen muss.
* Als Arzt möchte ich einstellen können, dass ich für bestimmte Medikamentenverordnungen benachrichtigt werde, wenn ein E-Rezept in der Apotheke nicht beliefert werden kann und daher zurückgegeben wird oder wenn es gelöscht wird, oder wenn das Medikament abgegeben worden ist, so dass ich immer über den aktuellen Status informiert bin und wenn notwendig handeln kann.

#### Abgebende Apotheke

* Als abgebende Apotheke möchte ich, dass sich die Zuweisung von E-Rezepten für alle Medikamentenverordnungen aus meiner Sicht nicht unterscheidet, unabhängig davon, um welche Medikamentenverordnungen es sich handelt und wer die Zuweisung vorgenommen hat.
* Als abgebende Apotheke möchte ich bei den durch einen Verordnenden zugewiesenen Medikamentenverordnungen nicht mit dem Patienten kommunizieren, weil die Kommunikation, falls notwendig, mit dem Verordnenden erfolgt.
* Als abgebende Apotheke möchte ich die unterschiedlichen Typen von Medikamentenverordnungen unterscheiden können.
* Als abgebende Apotheke möchte ich unabhängig davon, wer mir ein E-Rezept zugewiesen hat, ein Medikament schnell liefern können.
* Als abgebende Apotheke möchte ich dem verordnenden Arzt auf dem gleichen Übermittlungsweg, über den er mir das ERezept zugewiesen hat, antworten können, um mit ihm direkt und unkompliziert zur Belieferung eines E-Rezepts kommunizieren zu können.

#### Versicherter

* Als Versicherter möchte ich auch Medikamentenverordnungen, die mein Arzt direkt einer Apotheke zuweist, in meiner ERezept-App einsehen können, so dass ich volle Transparenz über alle meine Verordnungen habe.
* Als Versicherter möchte ich für bestimmte Medikamentenverordnungen in meiner E-Rezept-App den Status des E-Rezepts einsehen können.
* Als Versicherter möchte ich für bestimmte Medikamentenverordnungen Einsicht in die Zugriffsprotokolle haben.
* Als Versicherter möchte ich für bestimmte Medikamentenverordnungen nicht benachrichtigt werden, wenn ein E-Rezept in der Apotheke nicht beliefert werden kann und daher zurückgegeben wird oder wenn es gelöscht wird, oder wenn das Medikament abgegeben worden ist.
* Als Versicherter möchte ich für bestimmte Medikamentenverordnungen keine Nachrichten an die Apotheke senden und auch keine Nachrichten von der Apotheke erhalten.

### Anwendungsfälle

**Beteiligte Systeme:** PVS/KIS, AVS, E-Rezept-Fachdienst

#### Technische Anwendungsfälle der Verordnung

| |
| :--- |
| [E-Rezept für Workflow 169 durch Verordnenden erzeugen](menu-technische-umsetzung-anwendungsfaelle.md#169-e-rezept-erzeugen) |
| [E-Rezept qualifiziert signieren](menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-qualifiziert-signieren) |
| [UC 2.3 - E-Rezept einstellen](menu-technische-umsetzung-anwendungsfaelle.md#uc-2-3-e-rezept-einstellen) |
| [E-Rezept-Token an Apotheker übermitteln](menu-technische-umsetzung-anwendungsfaelle.md#169-e-rezept-token-uebermitteln) |
| [UC 2.5 - E-Rezept durch Verordnenden löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc-2-5-e-rezept-durch-verordnenden-loeschen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Anwendungsfall
*Verordnung von Verordnungen mit Workflowsteuerung durch LE*
#### Technische Anwendungsfälle für die Belieferung

| |
| :--- |
| [UC 4.1 - E-Rezept durch Abgebenden abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-1-e-rezept-durch-abgebenden-abrufen) |
| [UC 4.2 - E-Rezept durch Abgebenden zurückgeben](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-2-e-rezept-durch-abgebenden-zurueckgeben) |
| [UC 4.3 - E-Rezept durch Abgebenden löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-3-e-rezept-durch-abgebenden-loeschen) |
| [UC 4.4 - Quittung abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-4-quittung-abrufen) |
| [UC 4.5 - Abgabedatensatz durch Abgebenden signieren](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-5-abgabedatensatz-signieren) |
| [UC 4.8 - Quittung erneut abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-8-quittung-erneut-abrufen) |
| [UC 4.16 - Dispensierinformationen bereitstellen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-16-dispensierinformationen-bereitstellen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Anwendungsfall
*Belieferung von Verordnungen mit Workflowsteuerung durch LE*

