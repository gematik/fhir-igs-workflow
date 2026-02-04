Profile: ERP_TPrescription_CarbonCopy
Id: erp-tprescription-carbon-copy
Parent: Parameters
Title: "Digitaler Durchschlag T-Rezept"
Description: "Dieses Profil beschreibt den digitalen Durchschlag T-Rezept der alle Informationen zusammenführt und verlinkt. Alle für den Anwendungsfall relevanten Ressourcen sind hier aufgelistet."
* insert Profile(erp-tprescription-carbon-copy)

* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
rxPrescription 1..1
and rxDispensation 1..*

* parameter[rxPrescription]
  * ^short = "Angaben zur Verordnung"
  * name 1..1 MS
  * name = "rxPrescription" (exactly)
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    prescriptionSignatureDate 1..1 and
    prescriptionId 1..1 and
    medicationRequest 1..1 and
    medication 1..1

  * part[prescriptionSignatureDate]
    * ^short = "Signaturzeitpunkt der Verordnung"
    * ^comment = "Der Zeitpunkt wird aus der QES extrahiert (1.2.840.113549.1.9.5 signingTime) und muss in das FHIR Format für instant transformiert werden. Hierbei ist der höchstmögliche Genauigkeitsgrad anzugeben. Fachlich wird maximal Sekundengenauigkeit gefordert."
    * name MS
    * name = "prescriptionSignatureDate"  (exactly)
    * value[x] 1..1 MS
    * value[x] only instant
    * resource 0..0
    * part 0..0
  * part[prescriptionId]
    * ^short = "Rezept-ID der Verordnung"
    * ^comment = "Das Format der Rezept ID wird in [gemSpec_DM_eRp#E-Rezept-ID](https://gemspec.gematik.de/docs/gemSpec/gemSpec_DM_eRp/latest/#2.2) beschrieben und hat das Format aaa.bbb.bbb.bbb.bbb.cc"
    * name MS
    * name = "prescriptionId"  (exactly)
    * value[x] 1..1 MS
    * value[x] only EPrescriptionId
    * resource 0..0
    * part 0..0 
  * part[medicationRequest]
    * ^short = "Verordnung"
    * name MS
    * name = "medicationRequest"  (exactly)
    * value[x] 0..0
    * resource 1..1
    * resource only ERP_TPrescription_MedicationRequest
    * part 0..0 
  * part[medication]
    * ^short = "Verordnetes Medikament"
    * name MS
    * name = "medication"  (exactly)
    * value[x] 0..0
    * resource 1..1
    * resource only ERP_TPrescription_Medication
    * part 0..0 

* parameter[rxDispensation]
  * ^short = "Angaben zur Dispensierung"
  * name 1..1 MS
  * name = "rxDispensation" (exactly)
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    dispenseInformation 1..* and
    dispenseOrganization 1..1
  * part[dispenseInformation]
    * ^short = "Angaben zu medizinischen Daten der Dispensierung"
    * name 1..1 MS
    * name = "dispenseInformation" (exactly)
    * value[x] 0..0
    * resource 0..0
    * part MS
      * ^slicing.discriminator.type = #value
      * ^slicing.discriminator.path = "name"
      * ^slicing.rules = #open
    * part contains
      medicationDispense 1..1 and
      medication 1..1
    * part[medicationDispense]
      * ^short = "Dispensierinformationen"
      * name MS
      * name = "medicationDispense"  (exactly)
      * value[x] 0..0
      * resource 1..1
      * resource only ERP_TPrescription_MedicationDispense
      * part 0..0 
    * part[medication]
      * ^short = "Abgegebenes Medikament"
      * name MS
      * name = "medication"  (exactly)
      * value[x] 0..0
      * resource 1..1
      * resource only ERP_TPrescription_Medication
      * part 0..0 
  * part[dispenseOrganization]
    * ^short = "Abgebende Apotheke"
    * ^comment = "Bei der Dispensierung überträgt die Apotheke an den E-Rezept-Fachdienst nur die Telematik-ID. Angaben zu Name, Adresse und Telefonnummer bezieht der E-Rezept-Fachdienst aus dem FHIR-VZD der TI. Falls aktuelle Daten benötigt werden, können diese am FHIR-VZD unter bezugnahme der Telematik-ID bezogen werden. A_27825 beschreibt textuell den Abruf."
    * name MS
    * name = "dispenseOrganization"  (exactly)
    * value[x] 0..0
    * resource 1..1
    * resource only ERP_TPrescription_Organization
    * part 0..0








