{% assign use_cases = site.data['use-cases'] %}

In diesem Abschnitt wird das Feature fachlich motiviert und der Mehrwert für Nutzer vorgestellt. Aus diesen Epics und User Stories wird anschließend ein technisches Konzept abgeleitet.

### Epic Direkte Zuweisung des E-Rezepts durch den Verordnenden

Dieses Epic beschreibt besondere Versorgungssituationen, in denen, abweichend vom Regelprozess des E-Rezepts mit Verordnung erstellen → QES → Übergabe an Versicherten → Zuweisung an Apotheke → Dispensierung an Versicherten /Vertreter, ein E-Rezept direkt vom verordnenden Leistungserbringer an die abgebende Apotheke zugewiesen und übermittelt wird. Grundlage für die Anwendung dieses Workflows sind die Regelungen für anwendungsfertige Zytostatikazubereitungen in § 11 Absatz 2 Apothekengesetz (ApoG) und für die Arzneimittelversorgung durch krankenhausversorgende Apotheken und Krankenhausapotheken im Rahmen von § 14 Absätze 7 und 8 des Apothekengesetzes (ApoG).

Für die hier dargestellten Verordnungen existiert ein direkter Patientenbezug, sie sind daher abzugrenzen von Verordnungen für Sprechstundenbedarf.

Das Epic beschreibt die Zuweisung und Übermittlung eines E-Rezepts an eine Apotheke durch die verordnenden Leistungserbringer sowie die Abgabe in der Apotheke. Prozesse der Herstellung von Arzneimitteln sowie der Dokumentation der Herstellung als Voraussetzung für die Abrechnung finden außerhalb der TI statt und werden daher hier nicht beschrieben. Da insbesondere im Bereich der Zytostatikazubereitungen zwischen abgebender und herstellender Apotheke unterschieden wird, wird in den folgenden User Stories von der abgebenden Apotheke gesprochen, um diese Prozessabgrenzung zu verdeutlichen.

### User Stories
Voraussetzung jeder nachfolgenden User Story ist, dass die gesetzlichen Grundlagen in § 11 Absatz 2 und § 14 Absätze 7 und 8 des ApoG erfüllt sind.

#### Arzt
- Als Arzt möchte ich für bestimmte Medikamentenverordnungen ein E-Rezept unkompliziert einer Apotheke im gesetzlichen Rahmen direkt zuweisen können.
- Als Arzt möchte ich für bestimmte Medikamentenverordnungen nicht, dass der Patient diese Verordnungen löscht.
- Als Arzt möchte ich für bestimmte Medikamentenverordnungen nicht, dass der Patient diese Verordnungen einer Apotheke zuweisen kann.
- Als Arzt möchte ich für bestimmte Medikamentenverordnungen den von mir gewohnten Standard für die Übermittlung des E-Rezept-Tokens an die Apotheke nutzen, so dass ich ihn beliebig teilen kann (z.B. Ausdruck oder Weiterleiten mit sicherem Übermittlungsverfahren).
- Als Arzt möchte ich für bestimmte Medikamentenverordnungen E-Rezepte bestimmten, von mir einstellbaren Apotheken zuweisen können.
- Als Arzt möchte ich für bestimmte Medikamentenverordnungen E-Rezepte automatisch an meine herstellende Apotheke zuweisen können, wenn ich die herstellende Apotheke vorher festgelegt und die automatische Zuweisung eingerichtet habe, so dass ich mir zusätzliche und sich wiederholende Arbeitsschritte sparen kann.
- Als Arzt möchte ich für bestimmte Medikamentenverordnungen die Zuweisung eines E-Rezepts an eine Apotheke auch an meine Mitarbeiter delegieren können, so dass ich nicht alles selber machen muss.
- Als Arzt möchte ich einstellen können, dass ich für bestimmte Medikamentenverordnungen benachrichtigt werde, wenn ein E-Rezept in der Apotheke nicht beliefert werden kann und daher zurückgegeben wird oder wenn es gelöscht wird, oder wenn das Medikament abgegeben worden ist, so dass ich immer über den aktuellen Status informiert bin und wenn notwendig handeln kann.

#### Abgebende Apotheke

- Als abgebende Apotheke möchte ich, dass sich die Zuweisung von E-Rezepten für alle Medikamentenverordnungen aus meiner Sicht nicht unterscheidet, unabhängig davon, um welche Medikamentenverordnungen es sich handelt und wer die Zuweisung vorgenommen hat.
- Als abgebende Apotheke möchte ich bei den durch einen Verordnenden zugewiesenen Medikamentenverordnungen nicht mit dem Patienten kommunizieren, weil die Kommunikation, falls notwendig, mit dem Verordnenden erfolgt.
- Als abgebende Apotheke möchte ich die unterschiedlichen Typen von Medikamentenverordnungen unterscheiden können.
- Als abgebende Apotheke möchte ich unabhängig davon, wer mir ein E-Rezept zugewiesen hat, ein Medikament schnell liefern können.
- Als abgebende Apotheke möchte ich dem verordnenden Arzt auf dem gleichen Übermittlungsweg, über den er mir das ERezept zugewiesen hat, antworten können, um mit ihm direkt und unkompliziert zur Belieferung eines E-Rezepts kommunizieren zu können.

#### Versicherter

- Als Versicherter möchte ich auch Medikamentenverordnungen, die mein Arzt direkt einer Apotheke zuweist, in meiner ERezept-App einsehen können, so dass ich volle Transparenz über alle meine Verordnungen habe.
- Als Versicherter möchte ich für bestimmte Medikamentenverordnungen in meiner E-Rezept-App den Status des E-Rezepts einsehen können.
- Als Versicherter möchte ich für bestimmte Medikamentenverordnungen Einsicht in die Zugriffsprotokolle haben.
- Als Versicherter möchte ich für bestimmte Medikamentenverordnungen nicht benachrichtigt werden, wenn ein E-Rezept in der Apotheke nicht beliefert werden kann und daher zurückgegeben wird oder wenn es gelöscht wird, oder wenn das Medikament abgegeben worden ist.
- Als Versicherter möchte ich für bestimmte Medikamentenverordnungen keine Nachrichten an die Apotheke senden und auch keine Nachrichten von der Apotheke erhalten.


### Anwendungsfälle

**Beteiligte Systeme:** PVS/KIS, AVS, E-Rezept-Fachdienst

#### Technische Anwendungsfälle der Verordnung

{% assign scenario_use_cases = "169_e_rezept_erzeugen, E_Rezept_qualifiziert_signieren, UC_2_3_E_Rezept_einstellen, 169_e_rezept_token_uebermitteln, UC_2_5_E_Rezept_durch_Verordnenden_loeschen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Verordnung von Verordnungen mit Workflowsteuerung durch LE</i>" %}

#### Technische Anwendungsfälle für die Belieferung

{% assign scenario_use_cases = "UC_4_1_E_Rezept_durch_Abgebenden_abrufen, UC_4_2_E_Rezept_durch_Abgebenden_zurueckgeben, UC_4_3_E_Rezept_durch_Abgebenden_loeschen, UC_4_4_Quittung_abrufen, UC_4_5_Abgabedatensatz_signieren, UC_4_8_Quittung_erneut_abrufen, UC_4_16_Dispensierinformationen_bereitstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Belieferung von Verordnungen mit Workflowsteuerung durch LE</i>" %}