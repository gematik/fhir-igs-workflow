Das Feature „E-Rezepte für PKV-Versicherte: apothekenpflichtige Arzneimittel“ erweitert die bestehenden E-Rezept-Workflows um die digitale Bereitstellung und Verarbeitung von Abrechnungsinformationen. Es beschreibt den zusätzlichen Funktionsumfang für den E-Rezept-Fachdienst und die beteiligten Clientsysteme, die Prozessparameter sowie die fachlichen und technischen Anforderungen.

## Zielsetzung
Die Beschreibung des Funktionsumfangs als Feature erleichtert das Verständnis und die Nachvollziehbarkeit der Lösung – von der Darstellung der Nutzersicht über das technische Konzept bis zur Spezifikation der technischen Details. Damit sollen Hersteller die notwendigen Umsetzungen für ihre Komponenten bewerten können.

## Zielgruppe
Hersteller und Anbieter des Produkttyps E-Rezept-Fachdienst sowie Hersteller von Clientsystemen für den Zugriff auf den E-Rezept-Fachdienst.

## Abgrenzungen
Die Festlegungen des Standard-Workflows für apothekenpflichtige Arzneimittel sind nicht Gegenstand dieses Dokuments. Die Ergänzungen widersprechen den bestehenden Festlegungen nicht.

## Methodik
Anforderungen werden durch eine eindeutige ID (IG-ERP-CHRG-*) und die Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN gemäß RFC 2119 gekennzeichnet. Die Schlüsselworte werden bei Bedarf um Pronomen ergänzt.

## Epic: E-Rezept für PKV-Versicherte
Der Ablauf für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel für PKV-Versicherte orientiert sich an der Verordnung von apothekenpflichtige Arzneimittel für GKV-Versicherte. Die Abrechnung der Apotheke erfolgt gegenüber dem Versicherten, sofern keine Direktabrechnung mit einer Krankenversicherung vereinbart wurde. Stattdessen wird der Prozess um Aspekte für die Bereitstellung von Informationen für die Erstattung der Kosten für den Versicherten erweitert. 

**Ablauf**
Der (Zahn-)Arzt verschreibt ein E-Rezept. Das E-Rezept wird auf den E-Rezept-Fachdienst übertragen. Der Versicherte erhält einen E-Rezept-Token im E-Rezept-FdV oder auf einem Tokenausdruck. Der Versicherte übermittelt den E-Rezept-Token an eine Apotheke seiner Wahl. Die Apotheke ruft das E-Rezept vom E-Rezept-Fachdienst ab und dispensiert es. Die Apotheke stellt, sofern das E-Rezept nicht dem Sachleistungsprinzip unterliegt, auf Wunsch des Versicherten die Abrechnungsinformation zum E-Rezept im E-Rezept-Fachdienst bereit. Dort werden sie mit Einwilligung des Versicherten bis zu 10 Jahren gespeichert. Alternativ übergibt der Apotheker dem Versicherten im Ersatzverfahren einen Papierbeleg mit den abrechnungsrelevanten Informationen für die Abrechnung. Der Versicherte lädt die digital bereitgestellte Abrechnungsinformation mit dem E-Rezept-FdV vom E-Rezept-Fachdienst herunter. Der Versicherte kann für die Abrechnung die Abrechnungsinformation an eine App seiner PKV / der Beihilfe weiterleiten, in einem Portal des Kostenträgers hochladen oder ausdrucken.

Der Ablauf für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer für PKV-Versicherte orientiert sich an der Verordnung von apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer für GKV-Versicherte (Workflow-Typ "169").

## User Stories

### PKV-Versicherte

- Als PKV-Versicherter möchte ich in der E-Rezept-App meine Zustimmung/Einwilligung geben können, so dass digitale Abrechnungsinformationen durch Apotheker im E-Rezept-Fachdienst gespeichert werden können.
- Als PKV-Versicherter möchte ich in der E-Rezept-App meine Zustimmung/Einwilligung für die Speicherung von digitalen Abrechnungsinformationen zu jedem beliebigen Zeitpunkt widerrufen können.
- Als PKV-Versicherter möchte ich, dass mein Apotheker erkennt, dass ich in der E-Rezept-App dem Speichern von digitalen Abrechnungsinformationen zugestimmt habe.
- Als PKV-Versicherter möchte ich wählen können, ob der Apotheker mir die Abrechnungsinformation für ein E-Rezept analog (Papierbeleg) oder digital zur Verfügung stellt.
- Als PKV-Versicherter möchte ich nach Abgabe in der Apotheke alle Belege in der E-Rezept-App aufrufen und nutzen können.
- Als PKV-Versicherter möchte ich die Verordnungs- und Abgabedaten sowie Dispensierinformationen zusammenhängend in der App angezeigt bekommen, sodass ich nachvollziehen kann, was mir vom Arzt verordnet, was mir in der Apotheke mitgegeben  wurde und was ich gegenüber meiner Kasse abrechnen kann.
- Als PKV-Versicherte möchte ich die digitalen Abrechnungsinformationen aus der E-Rezept-App als PDF-Dokument an einen anderen digitalen Speicherort exportieren und ausdrucken können, um meine Abrechnungen auch an einer anderen Stelle dokumentieren zu können. 
- Als PKV-Versicherter möchte ich aus der E-Rezept-App heraus alle abrechnungsrelevanten Informationen als PDF-Dokument digital an meinen Kostenträger übermitteln können, um eine Erstattung beantragen zu können (Eine Übermittlung erfolgt nicht automatisch).
- Als PKV-Versicherter möchte ich meine eingereichten Abrechnungen im E-Rezept-Fachdienst markieren können.
- Als PKV-Versicherter möchte ich, dass mein Apotheker die Abrechnungsinformationen ändern kann, wenn mir bei der Abrechnung ein Fehler auffällt. Dazu möchte ich den Apotheker in der App berechtigen können.
- Als PKV-Versicherter möchte ich in der E-Rezept-App darauf hingewiesen werden, wenn die Abrechnungsinformationen nachträglich geändert wurden.
- Als PKV-Versicherter möchte ich immer nur die neuste Version der Abrechnungsinformation an meinen Kostenträger weiterleiten können, damit ich nicht mit den Versionen durcheinanderkomme.
- Als PKV-Versicherter möchte ich in der E-Rezept-App einen Hinweis angezeigt bekommen, bevor mein PKV-Rezept nach Ablauf von 10 Jahren automatisch gelöscht wird. 

### Apotheker

- Als Apotheker möchte ich in meinem AVS erkennen können, ob der Versicherte dem Speichern von digitalen Abrechnungsinformationen zugestimmt hat.
- Als Apotheker möchte ich dem Versicherten die digitalen Abrechnungsinformationen über den E-Rezept-Fachdienst bereitstellen können, falls der Versicherte seine Einwilligung erteilt hat.
- Als Apotheker möchte ich, auf Wunsch des Versicherten, eine fehlerhaft erstellte digitale Abrechnungsinformation überschreiben können.
- Als Apotheker möchte ich bei meinem Kunden die Einwilligung einholen können, um die Abrechnungsinformationen ändern zu können, wenn mir ein Fehler darin auffällt.
- Als Apotheker möchte ich in meinem AVS benachrichtigt werden, wenn ein Kunde eine Änderung einer Abrechnungsinformation anfragt.


### Kostenträger

- Als Kostenträger möchte ich digital eingereichte E-Rezept-Abrechnungsinformationen direkt digital weiterverarbeiten können.
- Als Kostenträger möchte ich doppelte Einreichungen (analog und digital) von E-Rezept-Abrechnungsinformationen zur Erstattung erkennen können.
