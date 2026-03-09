{% assign use_cases = site.data['gen-use-cases'] %}

In diesem Abschnitt wird das Feature fachlich motiviert und der Mehrwert für Nutzer vorgestellt. Aus diesen Epics und User Stories wird anschließend ein technisches Konzept abgeleitet.

### Epic
<!-- TODO: Update link -->

Der Ablauf für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel für PKV-Versicherte orientiert sich an der Verordnung von apothekenpflichtige Arzneimittel für GKV-Versicherte, und wird in [gemIG_eRp_Prescription] beschrieben. Die Abrechnung der Apotheke erfolgt gegenüber dem Versicherten, sofern keine Direktabrechnung mit einer Krankenversicherung vereinbart wurde. Stattdessen wird der Prozess um Aspekte für die Bereitstellung von Informationen für die Erstattung der Kosten für den Versicherten erweitert. 

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="./epic-1.png" alt="todo" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Ablauf Einreichen von Abrechnungsinformationen</figcaption>
</figure>

<br>

Der (Zahn-)Arzt verschreibt ein E-Rezept. Das E-Rezept wird auf den E-Rezept-Fachdienst übertragen. Der Versicherte erhält einen E-Rezept-Token im E-Rezept-FdV oder auf einem Tokenausdruck. Der Versicherte übermittelt den E-Rezept-Token an eine Apotheke seiner Wahl. Die Apotheke ruft das E-Rezept vom E-Rezept-Fachdienst ab und dispensiert es. Die Apotheke stellt, sofern das E-Rezept nicht dem Sachleistungsprinzip unterliegt, auf Wunsch des Versicherten die Abrechnungsinformation zum E-Rezept im E-Rezept-Fachdienst bereit. Dort werden sie mit Einwilligung des Versicherten bis zu 10 Jahren gespeichert. Alternativ übergibt der Apotheker dem Versicherten im Ersatzverfahren einen Papierbeleg mit den abrechnungsrelevanten Informationen für die Abrechnung. Der Versicherte lädt die digital bereitgestellte Abrechnungsinformation mit dem E-Rezept-FdV vom E-Rezept-Fachdienst herunter. Der Versicherte kann für die Abrechnung die Abrechnungsinformation an eine App seiner PKV / der Beihilfe weiterleiten, in einem Portal des Kostenträgers hochladen oder ausdrucken.

Der Ablauf für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer für PKV-Versicherte orientiert sich an der Verordnung von apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer für GKV-Versicherte (Workflow-Typ "169").

### User Stories

#### PKV-Versicherte
- Als PKV-Versicherter möchte ich in der E-Rezept-App meine Zustimmung/Einwilligung geben können, so dass digitale Abrechnungsinformationen durch Apotheker im E-Rezept-Fachdienst gespeichert werden können.
- Als PKV-Versicherter möchte ich in der E-Rezept-App meine Zustimmung/Einwilligung für die Speicherung von digitalen Abrechnungsinformationen zu jedem beliebigen Zeitpunkt widerrufen können.
- Als PKV-Versicherter möchte ich, dass mein Apotheker erkennt, dass ich in der E-Rezept-App dem Speichern von digitalen Abrechnungsinformationen zugestimmt habe.
- Als PKV-Versicherter möchte ich wählen können, ob der Apotheker mir die Abrechnungsinformation für ein E-Rezept analog (Papierbeleg) oder digital zur Verfügung stellt.
- Als PKV-Versicherter möchte ich nach Abgabe in der Apotheke alle Belege in der E-Rezept-App aufrufen und nutzen können.
- Als PKV-Versicherter möchte ich die Verordnungs- und Abgabedaten sowie Dispensierinformationen zusammenhängend in der App angezeigt bekommen, sodass ich nachvollziehen kann, was mir vom Arzt verordnet, was mir in der Apotheke mitgegeben  wurde und was ich gegenüber meiner Kasse abrechnen kann .
- Als PKV-Versicherte möchte ich die digitalen Abrechnungsinformationen aus der E-Rezept-App als PDF-Dokument an einen anderen digitalen Speicherort exportieren und ausdrucken können, um meine Abrechnungen auch an einer anderen Stelle dokumentieren zu können. 
- Als PKV-Versicherter möchte ich aus der E-Rezept-App heraus alle abrechnungsrelevanten Informationen als PDF-Dokument digital an meinen Kostenträger übermitteln können, um eine Erstattung beantragen zu können (Eine Übermittlung erfolgt nicht automatisch).
- Als PKV-Versicherter möchte ich meine eingereichten Abrechnungen im E-Rezept-Fachdienst markieren können.
- Als PKV-Versicherter möchte ich, dass mein Apotheker die Abrechnungsinformationen ändern kann, wenn mir bei der Abrechnung ein Fehler auffällt. Dazu möchte ich den Apotheker in der App berechtigen können.
- Als PKV-Versicherter möchte ich in der E-Rezept-App darauf hingewiesen werden, wenn die Abrechnungsinformationen nachträglich geändert wurden.
- Als  Versicherter möchte ich immer nur die neuste Version der Abrechnungsinformation an meinen Kostenträger weiterleiten können, damit ich nicht mit den Versionen durcheinanderkomme.
- Als PKV-Versicherter möchte ich in der E-Rezept-App einen Hinweis angezeigt bekommen, bevor mein PKV-Rezept nach Ablauf von 10 Jahren automatisch gelöscht wird.

#### Apotheker
- Als Apotheker möchte ich in meinem AVS erkennen können, ob der Versicherte dem Speichern von digitalen Abrechnungsinformationen zugestimmt hat.
- Als Apotheker möchte ich dem Versicherten die digitalen Abrechnungsinformationen über den E-Rezept-Fachdienst bereitstellen können, falls der Versicherte seine Einwilligung erteilt hat.
- Als Apotheker möchte ich, auf Wunsch des Versicherten, eine fehlerhaft erstellte digitale Abrechnungsinformation überschreiben können.
- Als Apotheker möchte ich bei meinem Kunden die Einwilligung einholen können, um die Abrechnungsinformationen ändern zu können, wenn mir ein Fehler darin auffällt.
- Als Apotheker möchte ich in meinem AVS benachrichtigt werden, wenn ein Kunde eine Änderung einer Abrechnungsinformation anfragt.


#### Kostenträger
- Als Kostenträger möchte ich digital eingereichte E-Rezept-Abrechnungsinformationen direkt digital weiterverarbeiten können.
- Als Kostenträger möchte ich doppelte Einreichungen (analog und digital) von E-Rezept-Abrechnungsinformationen zur Erstattung erkennen können.


### Fachliches Konzept
Die digitale Abrechnungsinformation besteht aus den folgenden Datensätzen: Verordnungsdatensatz, PKV-Abgabedatensatz und Quittungsdatensatz.

Der Verordnungsdatensatz wird durch den Arzt/Zahnarzt erstellt, mit einer Qualifizierten Elektronischen Signatur (QES) versehen und auf dem E-Rezept-Fachdienst eingestellt. Für den Abrechnungsprozess wird der Verordnungsdatensatz ohne QES übermittelt, um das Risiko vom Mehrfacheinlösungen zu vermeiden. Statt der QES wird der Verordnungsdatensatz durch den E-Rezept-Fachdienst fortgeschritten signiert, um die Integrität des Datensatzes für den Abrechnungsprozess sicherzustellen.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält, sofern in der Apotheke Änderungen bei der Abgabe vorgenommen werden, den QES-signierten PKV-Abgabedatensatz und sofern in der Apotheke keine Änderungen erfolgen, den fortgeschritten signierten PKV-Abgabedatensatz. Das Informationsmodell zum PKV-Abgabedatensatz wird durch den Verband der PKVen und DAV erarbeitet. 

Die Quittung wird durch den E-Rezept-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im E-Rezept-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (Rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat die Möglichkeit, sie vorab, beispielsweise wenn die Abrechnung abgeschlossen wurde, zu löschen.

Eine Langzeitarchivierung der Abrechnungsinformation im E-Rezept-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Der PKV-Versicherte kann über die E-Rezept App die Abrechnungsinformation digital an seine PKV schicken, um die Erstattung zu beantragen. Der Export in Form eines PDFs ermöglicht hierbei verschiedene Kanäle zur Übermittlung (wie E-Mail, Webportal, App des Kostenträgers).

### Einwilligung zum Speichern der Abrechungsinformationen
Das Speichern der Abrechnungsinformationen erfolgt nur mit Einwilligung des Versicherten. Diese Einwilligung kann der Versicherte speichern, einsehen und jederzeit widerrufen. Sie wird unbefristet erteilt, und mit dem Widerruf der Einwilligung werden bereits gespeicherte Abrechnungsinformationen gelöscht. 

**Beteiligte Systeme:** E-Rezept-Fachdienst, E-Rezept-FdV

**Technische Anwendungsfälle**

{% assign scenario_use_cases = "UC_3_14_Einwilligung_erteilen, UC_3_13_Einwilligungen_einsehen, UC_3_15_Einwilligung_widerrufen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zum Szenario <i>Einwilligung zum Speichern der Abrechungsinformationen</i>" %}

### Belieferung der Abrechnungsinformation durch die Apotheke
Nach der Einlösung kann die Apotheke die Abrechnungsinformation digital bereitstellen, sofern eine Einwilligung vorliegt.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält – sofern in der Apotheke Änderungen bei der Abgabe vorgenommen werden – den QES-signierten PKV-Abgabedatensatz; andernfalls den fortgeschritten signierten PKV-Abgabedatensatz. Das Informationsmodell zum PKV-Abgabedatensatz wird durch den Verband der PKVen und DAV erarbeitet.

Der Versicherte kann nachträglich die Apotheke berechtigen Korrekturen am PKV-Abgabedatensatz vorzunehmen und den korrigierten Datensatz im E-Rezept-Fachdienst zu speichern. Dafür erzeugt der E-Rezept-Fachdienst einen AccessCode.

**Beteiligte Systeme:** E-Rezept-Fachdienst, AVS

**Technische Anwendungsfälle**

{% assign scenario_use_cases = "UC_4_11_Abrechungsinformation_durch_Abgebenden_bereitstellen, UC_4_10_Abrechungsinformationen_durch_Abgebenden_abrufen, UC_4_13_Abgabedatensatz_durch_Abgebenden_aktualisieren" | split: ", " %}
{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Szenario <i>Belieferung durch die Apotheke</i>" %}

### Abrechnung durch den Versicherten
Der Versicherte ruft die Abrechnungsinformation im FdV ab, kann sie exportieren und an den Kostenträger weiterleiten. Der Export in Form eines PDFs ermöglicht hierbei verschiedene Kanäle zur Übermittlung (wie E-Mail, Webportal oder App des Kostenträgers).

Die Quittung wird durch den E-Rezept-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im E-Rezept-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat außerdem die Möglichkeit, sie vorab (z. B. nach Abschluss der Abrechnung) zu löschen.

Eine Langzeitarchivierung der Abrechnungsinformation im E-Rezept-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Die Löschfristen für das E-Rezept mit den in Beziehung stehenden Daten, wie Dispensierinformationen und Kommunikationen zum E-Rezept, werden unabhängig von der zugehörigen Abrechnungsinformation durchgesetzt. Siehe [gemSysL_eRp]#A_18525.

**Beteiligte Systeme:** E-Rezept-Fachdienst, E-Rezept-FdV

**Technische Anwendungsfälle**

{% assign scenario_use_cases = "UC_3_12_Abrechungsinformationen_durch_Versicherten_abrufen, Abrechungsinformationen_durch_Versicherten_weitergeben, UC_3_12_Abrechungsinformation_durch_Versicherten_markieren, UC_3_11_Abrechungsinformation_durch_Versicherten_löschen" | split: ", " %}
{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Szenario <i>Abrechnung durch den Versicherten</i>" %}


