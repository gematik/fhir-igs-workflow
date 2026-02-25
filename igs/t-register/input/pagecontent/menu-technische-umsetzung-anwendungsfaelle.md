### Technisches Konzept für die Verordnung
#### Autorisierte Ärzte
Die Verordnung von T-Rezepten mit Workflow 166 dürfen nur von Ärzten mit einem HBA ausgestellt werden. Tierärzte und Zahnärzte dürfen keine E-T-Rezepte ausstellen. Daher werden Verordnungen mit Workflow 166 am E-Rezept-Fachdienst nur mit einer QES von Berufsgruppen mit der professionOID oid_arzt zugelassen.

#### Einlösbarkeit im EU-Ausland
E-T-Rezepte dürfen nicht im EU-Ausland eingelöst werden. Daher wird beim Einstellen des E-T-Rezepts das Flag zur Einlösbarkeit im EU-Ausland auf false gesetzt.

#### Use Cases im Rahmen der Verordnung
Die Prozesse des verordnenden Leistungserbringers, welche für die Übermittlung von ärztlichen Verordnungen für apothekenpflichtige Arzneimittel konzipiert wurden, werden ebenso für die Verordnung von T-Rezepten genutzt.

Folgende Anwendungsfälle werden genutzt:

UC 2.1 - E-Rezepte erzeugen
UC 2.3 - E-Rezept einstellen
UC 2.5 - E-Rezept durch Verordnenden löschen
Für Details zu den Anwendungsfällen siehe [gemSysL_eRp].

#### Use Cases im Rahmen der Übermittlung an das ePA-Aktenkonto
E-T-Rezepten werden wie Arzneimittelinformationen an den Medication Service des ePA-Aktenkontos des Versicherten übertragen.

Folgende Anwendungsfälle werden für das T-Rezept genutzt:

UC 5.1 - Verordnungsdaten in Aktenkonto einstellen
UC 5.2 - Löschinformation Verordnungsdaten an Aktenkonto übermitteln
Für Details zu den Anwendungsfällen siehe [gemF_eRp_ePA].

#### T-Rezept FHIR-Profile
Die fachliche Verantwortung für die Vorgaben zur elektronischen Verordnung von T-Rezepten liegt beim BfArM und nicht in der Regelungshoheit der Partner des Bundesmantelvertrags. Die KBV veröffentlicht die FHIR-Profile.  

Die [Workflowprofile](https://simplifier.net/erezept-workflow) werden dahingehend erweitert, dass diese Profile ebenfalls unterstützt werden.

Der E-Rezept-Fachdienst prüft, ob Verordnungen, die mittels Flowtype 166 verordnet werden, mit den T-Rezept-Verordnungs-Profilen erstellt wurden und setzt damit auch die in den Profilen definierten Prüfungen durch.

### Technisches Konzept für die Verwaltung durch den Versicherten
#### Use Cases im Rahmen der Verwaltung durch den Versicherten
Die Prozesse des Versicherten für die Einsichtnahme in die Verordnungen, das Übermitteln der Zugriffsinformationen einer Verordnung an eine Apotheke und der Bereitstellung von Abrechnungsinformationen für privat Versicherte, entsprechen denen welche für die Verordnung von verschreibungspflichtigem Arzneimittel konzipiert wurden.

Folgende Anwendungsfälle werden genutzt:

UC 3.1 - E-Rezepte durch Versicherten abrufen
UC 3.6 - E-Rezept durch Vertreter abrufen
UC 3.2 - E-Rezept durch Versicherten löschen 
UC 3.3 - Nachricht durch Versicherten übermitteln
UC 3.4 - Nachrichten durch Versicherten empfangen
UC 3.5 - Protokolldaten abrufen
UC 3.8 - Nachricht durch Versicherten löschen
UC 3.9 - Abgabeinformationen durch Versicherten abrufen
UC 3.13 - Einwilligung zum Speichern von Abrechnungsinformationen abrufen
UC 3.14 - Einwilligung zum Speichern von Abrechnungsinformationen erteilen
UC 3.15 - Einwilligung zum Speichern von Abrechnungsinformationen löschen
Folgende Anwendungsfälle stehen für Versicherte mit einem Kostenträger mit einem Kostenerstattungsprinzip zur Verfügung:

UC 3.7 - Abrechnungsinformation durch Versicherten abrufen
UC 3.10 - Abrechnungsinformationen durch Versicherten abrufen
UC 3.11 - Abrechnungsinformation durch Versicherten löschen
UC 3.12 - Abrechnungsinformation durch Versicherten ändern
Für Details zu den Anwendungsfällen siehe [gemSysL_eRp] und [gemF_eRp_PKV].

### Technisches Konzept für die Abgabe
#### Use Cases im Rahmen der Abgabe
Die Prozesse der Apotheke für das Abrufen, das Zurückweisen, das Löschen des E-Rezeptes, das Abrufen der Quittung und die Kommunikation mit dem Versicherten, welche für die Übermittlung von ärztlichen Verordnungen für verschreibungspflichtige Arzneimittel konzipiert wurden, werden ebenso für die Verordnung von T-Rezepten genutzt.

Folgende Anwendungsfälle werden genutzt:

UC 4.1 - E-Rezept durch Abgebenden abrufen
UC 4.17 - E-Rezept erneut abrufen
UC 4.2 - E-Rezept durch Abgebenden zurückgeben
UC 4.3 - E-Rezept durch Abgebenden löschen
UC 4.16 - Dispensierinformationen bereitstellen
UC 4.4 - Quittung abrufen
UC 4.8 - Quittung erneut abrufen
UC 4.5 - Abgabedatensatz durch Abgebenden signieren
UC 4.6 - Nachricht von Versicherten empfangen
UC 4.7 - Nachricht an Versicherten versenden
UC 4.9 - Nachricht löschen
UC 4.12 - Liste einlösbarer E-Rezepte durch Abgebenden abrufen
UC 4.14 - Subscription registrieren
Folgende Anwendungsfälle können nur für Versicherte mit einem Kostenträger mit einem Kostenerstattungsprinzip ausgeführt werden:

UC 4.10 - Abrechnungsinformationen durch Abgebenden abrufen
UC 4.11 - Abrechnungsinformation durch Abgebenden bereitstellen
UC 4.13 - Abrechnungsinformation durch Abgebenden ändern
Für Details zu den Anwendungsfällen siehe [gemSysL_eRp] und [gemF_eRp_PKV].

#### Use Cases im Rahmen der Übermittlung an das ePA Aktenkonto
T-Rezept Abgabeinformationen werden analog zu denen der Arzneimittel an den Medication Service des ePA Aktenkontos des Versicherten übertragen. Folgende Anwendungsfälle werden hierfür genutzt:

UC 5.3 - Dispensierinformationen in Aktenkonto einstellen
UC 5.4 - Löschinformation Dispensierinformationen an Aktenkonto übermitteln
Für Details zu den Anwendungsfällen siehe [gemF_eRp_ePA].

### Technisches Konzept für die Übermittlung des digitalen Durchschlag E-T-Rezept
Um den Prüfauftrag des BfArM zu unterstützen, erstellt der E-Rezept-Fachdienst den digitalen Durchschlag E-T-Rezept. Nach Abgabe wird dieser über eine Webschnittstelle an den BfArM Webdienst übertragen.

#### Angaben zur Apotheke
Die abgebende Apotheke gibt im Dispensierdatensatz die Telematik-ID der Apotheke an, die die Abgabe vorgenommen hat. Für die Erstellung des digitalen Durchschlags und Auswertung im BfArM werden die Adress- und Kontaktinformationen der Apotheke benötigt. Diese bezieht der E-Rezept-Fachdienst über den FHIR-VZD und nutzt die Telematik-ID als Schlüssel der Organization zur Ermittlung der benötigten Informationen.

Die Telematik-ID der Apotheke wird ebenfalls an das BfArM übertragen, damit das BfArM in Zukunft falls gewünscht aktuelle Daten zur Apotheke über den FHIR-VZD ermitteln kann.

#### Daten des digitalen Durchschlags E-T-Rezept

Folgende Daten sind, sofern im jeweiligen Datensatz vorhanden, im digitalen Durchschlag E-T-Rezept enthalten:

|Fachliches Datum|Datengrundlage|Referenz der Datengrundlage|
|---|---|---|
|Datum der Signatur|QES des Verordnungsdatensatzes|1.2.840.113549.1.9.5 signingTime|
|Rezept-ID|Task|Task.identifier[PrescriptionID].value|
|Bezeichnung des Fertigarzneimittels oder des Wirkstoffes ODER Rezeptur (verordnetes Arzneimittel)|Verordnungsdatensatz|Medication.code<br>Medication.ingredient.itemCodeableConcept|
|Wirkstärke (verordnetes Arzneimittel)|Verordnungsdatensatz|Medication.ingredient.strength|
|Bezeichnung des Fertigarzneimittels oder des Wirkstoffes ODER Rezeptur (abgegebenes Arzneimittel)|Dispensierdatensatz|Medication.code<br>Medication.ingredient.itemCodeableConcept|
|Wirkstärke (abgegebenes Arzneimittel)|Dispensierdatensatz|Medication.ingredient.strength|
|Darreichungsform (verordnetes Arzneimittel)|Verordnungsdatensatz|Medication.form|
|Darreichungsform (abgegebenes Arzneimittel)|Dispensierdatensatz|Medication.form|
|Abzugebende Menge (verordnetes Arzneimittel), Packungsgröße, Anzahl Packungen|Verordnungsdatensatz|Medication.amount/Medication.extension:Normgroesse<br>MedicationRequest.dispenseRequest.quantity|
|Abzugebende Menge (abgegebenes Arzneimittel)|Dispensierdatensatz|Medication.amount/Medication.extension:Normgroesse<br>MedicationDispense.quantity|
|Dosierung (verordnetes Arzneimittel)|Verordnungsdatensatz|MedicationRequest.dosageInstruction|
|Dosierung (abgegebenes Arzneimittel)|Dispensierdatensatz|MedicationDispense.dosageInstruction|
|Reichdauer (verordnetes Arzneimittel)|Verordnungsdatensatz*|MedicationRequest.dispenseRequest.expectedSupplyDuration|
|Name der Apotheke|FHIR-VZD|Organization.name|
|Telematik-ID der Apotheke|Dispensierdatensatz|MedicationDispense.performer|
|Anschrift der Apotheke|FHIR-VZD|Organization<br>HealthcareService<br>Location.address|
|Telefonnummer der Apotheke (optional im FHIR-VZD)|FHIR-VZD|HealthcareService.telecom|
|Datum der Abgabe|Dispensierdatensatz|MedicationDispense.whenHandedOver|
|Bestätigung der ärztlichen Person zur Einhaltung der Sicherheitsmaßnahmen|Verordnungsdatensatz*|MedicationRequest.extension:T-Rezept:EinhaltungSicherheitsmassnahmen|
|Bestätigung der Aushändigung von Informationsmaterialien|Verordnungsdatensatz*|MedicationRequest.extension:T-Rezept:AushaendigungInformationsmaterialien|
|Behandlung außerhalb der zugelassenen Anwendungsgebiete (Off-Label)|Verordnungsdatensatz*|MedicationRequest.extension:T-Rezept:Off-Label|
|Angabe, ob Verschreibung für eine gebärfähige Frau|Verordnungsdatensatz*|MedicationRequest.extension:T-Rezept:GebaerfaehigeFrau|
|Bestätigung ausreichender Sachkenntnisse|Verordnungsdatensatz*|MedicationRequest.extension:T-Rezept:ErklaerungSachkenntnis|
<div><figcaption><strong>Tabelle: </strong>Daten des digitalen Durchschlags E-T-Rezept</figcaption></div>

#### Übertragung des digitalen Durchschlags
Der E-Rezept-Fachdienst erstellt nach Abschluss des Workflows des E-T-Rezeptes ($close Operation) den Datensatz für den digitalen Durchschlag zur Übermittlung an den BfArM Webdienst. Analog zum Vorgehen bei der Übertragung der Daten an den Medicaton Service der ePA Aktensysteme wird eine Warteschlange verwendet, um den digitalen Durchschlag asynchron zum Abschluss des Workflows durch die Apotheke zu übertragen. Die asynchrone Übertragung gewährleistet, dass sich für die Apotheke beim Aufruf der $close Operation keine verlängerte Bearbeitungszeit des E-Rezept-Fachdienstes ergibt.

Nach Erstellen des Datensatzes für den digitalen Durchschlag wird ein Übermittlungsauftrag in der Warteschlange eingestellt und die Übermittlung an den BfArM Webdienst via Webschnittstelle versucht. Nach erfolgreichem Übermitteln der Daten wird der Übermittlungsauftrag aus der Warteschlange gelöscht.

Bei Übermittlungsfehlern, bei denen ein Retry sinnvoll ist, wie z.B.

Nicht Erreichbarkeit des Dienstes
HTTP ErrorCodes 5xx: Serverfehler
HTTP ErrorCodes 408 (Timeout) und 429 (Zu viele Anfragen pro Zeiteinheit durch Nutzer)
wird ein Retry gemäß Exponential Backoff versucht, um die Daten einzustellen. Falls dies nach einem festgelegten Intervall nicht gelingt, werden diese Übermittlungsaufträge, sowie Übermittlungsaufträge mit HTTP ErrorCode 4xx in eine gesonderte Liste ausgesteuert, um nach Problemanalyse und ggf. einem Update des E-Rezept-Fachdienstes das Einstellen erneut zu versuchen.

<!-- UC 5.8 - Durchschlag E-T-Rezept beim BfArM einstellen -->
{% assign use_case = use_cases | where: "title", "UC 5.8 - Durchschlag E-T-Rezept beim BfArM einstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}