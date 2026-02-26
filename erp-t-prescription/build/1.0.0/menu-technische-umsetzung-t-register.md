# Technische Umsetzung - Übermittlung an das BfArM T-Register - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Umsetzung - Systemueberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Umsetzung - Übermittlung an das BfArM T-Register**

## Technische Umsetzung - Übermittlung an das BfArM T-Register

Um den Prüfauftrag des BfArM zu unterstützen, erstellt der E-Rezept-Fachdienst den digitalen Durchschlag E-T-Rezept. Nach Abgabe wird dieser über eine Webschnittstelle an den BfArM Webdienst übertragen.

### Ablaufdiagramm Abgabe T-Rezept

**Abbildung: **Ablaufdiagramm Abgabe T-Rezept
### Daten des digitalen Durchschlags E-T-Rezept

#### Angaben zur Apotheke

Die abgebende Apotheke gibt im Dispensierdatensatz die Telematik-ID der Apotheke an, die die Abgabe vorgenommen hat. Für die Erstellung des digitalen Durchschlags und Auswertung im BfArM werden die Adress- und Kontaktinformationen der Apotheke benötigt. Diese bezieht der E-Rezept-Fachdienst über den FHIR-VZD und nutzt die Telematik-ID als Schlüssel der Organization zur Ermittlung der benötigten Informationen.

Die Telematik-ID der Apotheke wird ebenfalls an das BfArM übertragen, damit das BfArM in Zukunft falls gewünscht aktuelle Daten zur Apotheke über den FHIR-VZD ermitteln kann.

#### Fachliche Informationseinheiten des digitalen Durchschlags

Folgende Daten sind, sofern im jeweiligen Datensatz vorhanden, im digitalen Durchschlag E-T-Rezept enthalten:

| | | |
| :--- | :--- | :--- |
| Datum der Signatur | QES des Verordnungsdatensatzes | 1.2.840.113549.1.9.5 signingTime |
| Rezept-ID | Task | Task.identifier[PrescriptionID].value |
| Bezeichnung des Fertigarzneimittels oder des Wirkstoffes ODER Rezeptur (verordnetes Arzneimittel) | Verordnungsdatensatz | Medication.codeMedication.ingredient.itemCodeableConcept |
| Wirkstärke (verordnetes Arzneimittel) | Verordnungsdatensatz | Medication.ingredient.strength |
| Bezeichnung des Fertigarzneimittels oder des Wirkstoffes ODER Rezeptur (abgegebenes Arzneimittel) | Dispensierdatensatz | Medication.codeMedication.ingredient.itemCodeableConcept |
| Wirkstärke (abgegebenes Arzneimittel) | Dispensierdatensatz | Medication.ingredient.strength |
| Darreichungsform (verordnetes Arzneimittel) | Verordnungsdatensatz | Medication.form |
| Darreichungsform (abgegebenes Arzneimittel) | Dispensierdatensatz | Medication.form |
| Abzugebende Menge (verordnetes Arzneimittel), Packungsgröße, Anzahl Packungen | Verordnungsdatensatz | Medication.amount/Medication.extension:NormgroesseMedicationRequest.dispenseRequest.quantity |
| Abzugebende Menge (abgegebenes Arzneimittel) | Dispensierdatensatz | Medication.amount/Medication.extension:NormgroesseMedicationDispense.quantity |
| Dosierung (verordnetes Arzneimittel) | Verordnungsdatensatz | MedicationRequest.dosageInstruction |
| Dosierung (abgegebenes Arzneimittel) | Dispensierdatensatz | MedicationDispense.dosageInstruction |
| Reichdauer (verordnetes Arzneimittel) | Verordnungsdatensatz* | MedicationRequest.dispenseRequest.expectedSupplyDuration |
| Name der Apotheke | FHIR-VZD | Organization.name |
| Telematik-ID der Apotheke | Dispensierdatensatz | MedicationDispense.performer |
| Anschrift der Apotheke | FHIR-VZD | OrganizationHealthcareServiceLocation.address |
| Telefonnummer der Apotheke (optional im FHIR-VZD) | FHIR-VZD | HealthcareService.telecom |
| Datum der Abgabe | Dispensierdatensatz | MedicationDispense.whenHandedOver |
| Bestätigung der ärztlichen Person zur Einhaltung der Sicherheitsmaßnahmen | Verordnungsdatensatz* | MedicationRequest.extension:T-Rezept:EinhaltungSicherheitsmassnahmen |
| Bestätigung der Aushändigung von Informationsmaterialien | Verordnungsdatensatz* | MedicationRequest.extension:T-Rezept:AushaendigungInformationsmaterialien |
| Behandlung außerhalb der zugelassenen Anwendungsgebiete (Off-Label) | Verordnungsdatensatz* | MedicationRequest.extension:T-Rezept:Off-Label |
| Angabe, ob Verschreibung für eine gebärfähige Frau | Verordnungsdatensatz* | MedicationRequest.extension:T-Rezept:GebaerfaehigeFrau |
| Bestätigung ausreichender Sachkenntnisse | Verordnungsdatensatz* | MedicationRequest.extension:T-Rezept:ErklaerungSachkenntnis |

**Tabelle: **Daten des digitalen Durchschlags E-T-Rezept

Die Informationseinheiten sind auch im [Logischen Modell digitaler Durchschlag E-T-Rezept](./StructureDefinition-erp-tprescription-carbon-copy-logical.md) beschrieben.

### Übertragung des digitalen Durchschlags

Der E-Rezept-Fachdienst erstellt nach Abschluss des Workflows des E-T-Rezeptes ($close Operation) den Datensatz für den digitalen Durchschlag zur Übermittlung an den BfArM Webdienst. Analog zum Vorgehen bei der Übertragung der Daten an den Medicaton Service der ePA Aktensysteme wird eine Warteschlange verwendet, um den digitalen Durchschlag asynchron zum Abschluss des Workflows durch die Apotheke zu übertragen. Die asynchrone Übertragung gewährleistet, dass sich für die Apotheke beim Aufruf der $close Operation keine verlängerte Bearbeitungszeit des E-Rezept-Fachdienstes ergibt.

Für das Mapping zur Erstellung des digitalen Durchschlags wird die Seite [Erzeugen digitaler Durchschlag](./menu-technische-umsetzung-mapping.md) bereitgestellt.

Nach Erstellen des Datensatzes für den digitalen Durchschlag wird ein Übermittlungsauftrag in der Warteschlange eingestellt und die Übermittlung an den BfArM Webdienst via Webschnittstelle versucht. Nach erfolgreichem Übermitteln der Daten wird der Übermittlungsauftrag aus der Warteschlange gelöscht.

Bei Übermittlungsfehlern, bei denen ein Retry sinnvoll ist, wie z.B.

* Nicht Erreichbarkeit des Dienstes
* HTTP ErrorCodes 5xx: Serverfehler
* HTTP ErrorCodes 408 (Timeout) und 429 (Zu viele Anfragen pro Zeiteinheit durch Nutzer) wird ein Retry gemäß Exponential Backoff versucht, um die Daten einzustellen. Falls dies nach einem festgelegten Intervall nicht gelingt, werden diese Übermittlungsaufträge, sowie Übermittlungsaufträge mit HTTP ErrorCode 4xx in eine gesonderte Liste ausgesteuert, um nach Problemanalyse und ggf. einem Update des E-Rezept-Fachdienstes das Einstellen erneut zu versuchen.

Der technsiche Anwendungsfall für die Übertragung ist auf [UC 5.8 - Durchschlag E-T-Rezept beim BfArM einstellen](./menu-technische-umsetzung-anwendungsfaelle.md#166-uebertrag-t-register) dargestellt.

