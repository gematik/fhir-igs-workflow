Instance: Example-KBV-PKV-Verordnungsdatensatz
InstanceOf: KBV_PR_ERP_Bundle
Usage: #example
* insert PKV_Verordnungsdatensatz

RuleSet: PKV_Verordnungsdatensatz
* meta.versionId = "1"
* type = #document
* identifier.value = "200.000.000.000.000.01"
* insert DateTimeStamp(meta.lastUpdated)
* insert DateTimeStamp(timestamp)
* entry[Dokumenteninformation].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Composition/Example-PKV-Composition"
* entry[Dokumenteninformation].resource = Example-PKV-Composition
* entry[VerordnungArzneimittel].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/MedicationRequest/Example-KBV-PKV-Prescription"
* entry[VerordnungArzneimittel].resource = Example-KBV-PKV-Prescription
* entry[RezeptierdatenWirkstoffverordnung].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Medication/Example-PKV-MedicationIngredient"
* entry[RezeptierdatenWirkstoffverordnung].resource = Example-PKV-MedicationIngredient
* entry[Patient].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Patient/Example-PKV-Patient"
* entry[Patient].resource = Example-PKV-Patient
* entry[AusstellendeVerschreibendeVerantwortlichePerson][+].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Practitioner/Example-PKV-Practitioner"
* entry[AusstellendeVerschreibendeVerantwortlichePerson][=].resource = Example-PKV-Practitioner
* entry[Einrichtung].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Organization/Example-PKV-Organization"
* entry[Einrichtung].resource = Example-PKV-Organization
* entry[Krankenversicherungsverhaeltnis].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Coverage/Example-PKV-Coverage"
* entry[Krankenversicherungsverhaeltnis].resource = Example-PKV-Coverage


Instance: Example-PKV-Composition
InstanceOf: KBV_PR_ERP_Composition
Usage: #inline
* meta.versionId = "1"
* extension[Rechtsgrundlage].valueCoding = $KBV_CS_SFHIR_KBV_STATUSKENNZEICHEN#00
* extension[PKV-Tarif].valueCoding = $KBV_CS_SFHIR_KBV_PKV_TARIFF#03
* subject = Reference(Example-PKV-Patient)
* insert DateTime(date)
* author[Arzt] = Reference(Example-PKV-Practitioner)
* author[Pruefnummer].identifier.value = "Y/400/1910/36/346"
* custodian = Reference(Example-PKV-Organization)
* section[Verordnung_Arzneimittel].entry = Reference(Example-KBV-PKV-Prescription)
* section[Krankenversicherungsverhaeltnis].entry = Reference(Example-PKV-Coverage)

Instance: Example-KBV-PKV-Prescription
InstanceOf: KBV_PR_ERP_Prescription
Usage: #inline
* meta.versionId = "1"
* status = #active
* intent = #order
* extension[Zuzahlungsstatus].valueCoding = $KBV_CS_FOR_StatusCoPayment#0
* extension[Notdienstgebuehr].valueBoolean = false
* extension[SER].valueBoolean = false
* extension[Unfallinformationen].extension[Unfallkennzeichen].valueCoding = $KBV_CS_FOR_Ursache_Type#1
* extension[Unfallinformationen].extension[Unfalltag].valueDate = "2023-07-01"
* extension[Mehrfachverordnung].extension[Kennzeichen].valueBoolean = true
* extension[Mehrfachverordnung].extension[Nummerierung].valueRatio.numerator.value = 2
* extension[Mehrfachverordnung].extension[Nummerierung].valueRatio.denominator.value = 4
* extension[Mehrfachverordnung].extension[Zeitraum].valuePeriod.start = "2023-07-02"
* extension[Mehrfachverordnung].extension[Zeitraum].valuePeriod.end = "2023-09-30"
* extension[Mehrfachverordnung].extension[ID].valueIdentifier.system = "urn:ietf:rfc:3986"
* extension[Mehrfachverordnung].extension[ID].valueIdentifier.value = "urn:uuid:24e2e10d-e962-4d1c-be4f-8760e690a5f0"
* medicationReference = Reference(Example-PKV-MedicationIngredient)
* subject = Reference(Example-PKV-Patient)
* insert Date(authoredOn)
* requester = Reference(Example-PKV-Practitioner)
* insurance = Reference(Example-PKV-Coverage)
* note.text = "Dummy-Hinweis für die Apotheke"
* extension[Dosierungskennzeichen].valueBoolean = false
* dispenseRequest.quantity.value = 2

Instance: Example-PKV-MedicationIngredient
InstanceOf: KBV_PR_ERP_Medication_Ingredient
Usage: #inline
* meta.versionId = "1"
* extension[Arzneimittelkategorie].valueCoding = $KBV_CS_ERP_Medication_Category#00
* extension[Impfstoff].valueBoolean = false
* form.text = "Tabletten"
* amount.numerator.extension[Packungsgroesse].valueString = "2x20"
* amount.numerator.unit = "Stk"
* amount.denominator.value = 1
* ingredient[+]
  * itemCodeableConcept = $ask#Dummy-ASK
  * itemCodeableConcept.text = "Ibuprofen"
  * strength.numerator.value = 800
  * strength.numerator.unit = "mg"
  * strength.denominator.value = 1
  * strength.denominator.unit = "Tablette"

Instance: Example-PKV-Practitioner
InstanceOf: KBV_PR_FOR_Practitioner
Usage: #inline
* meta.versionId = "1"
* identifier[ANR].value = "838382210"
* name[name]
  * use = #official
  * family.extension[nachname].valueString = "Meier"
  * family = "Meier"
  * given = "Jörgen"
* qualification[Typ].code = $KBV_CS_FOR_Qualification_Type#03
* qualification[Berufsbezeichnung].code.text = "FA Onkologie"

Instance: Example-PKV-Organization
InstanceOf: KBV_PR_FOR_Organization
Usage: #inline
* meta.versionId = "1"
* identifier[Betriebsstaettennummer].value = "031234567"
* name = "Hausarztpraxis Dr. Topp-Glücklich"
* telecom[telefon].value = "0301234567"
* address[Strassenanschrift]
  * type = #both
  * line = "Musterstr. 2"
  * line.extension[Hausnummer].valueString = "2"
  * line.extension[Strasse].valueString = "Musterstr."
  * city = "Berlin"
  * postalCode = "10623"

Instance: Example-PKV-Patient
InstanceOf: KBV_PR_FOR_Patient
Usage: #inline
* meta.versionId = "1"
* identifier[versichertenId].value = "P123464117"
* name[name]
  * .use = #official
  * family.extension[nachname].valueString = "Königsstein"
  * family = "Ludger Königsstein"
  * given = "Ludger"
* birthDate = "1935-06-22"
* address[Strassenanschrift]
  * type = #both
  * line = "Musterstr. 1"
  * line.extension[Hausnummer].valueString = "1"
  * line.extension[Strasse].valueString = "Musterstr."
  * city = "Berlin"
  * postalCode = "10623"

Instance: Example-PKV-Coverage
InstanceOf: KBV_PR_FOR_Coverage
Usage: #inline
* meta.versionId = "1"
* extension[BesonderePersonengruppe].valueCoding = $KBV_CS_SFHIR_KBV_PERSONENGRUPPE#00
* extension[DMPKennzeichen].valueCoding = $KBV_CS_SFHIR_KBV_DMP#00
* extension[Versichertenart].valueCoding = $KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS#1
* type = $versicherungsart-de-basis#PKV
* beneficiary = Reference(Example-PKV-Patient)
* payor.identifier.value = "168140346"
* payor.display = "Allianz Private Krankenversicherungs-AG"