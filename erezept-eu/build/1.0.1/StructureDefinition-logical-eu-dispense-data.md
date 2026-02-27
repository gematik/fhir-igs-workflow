# Dispense Data from EU - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Dispense Data from EU**

## Logical Model: Dispense Data from EU 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu//StructureDefinition/logical-eu-dispense-data | *Version*:1.0.1 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_LOG_DispenseData |

 
Logical Information that is Provided in the dispensation document by the NCPeH of country B for Dispensing Medication 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.erezept.eu|current/StructureDefinition/logical-eu-dispense-data)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-logical-eu-dispense-data.csv), [Excel](StructureDefinition-logical-eu-dispense-data.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "logical-eu-dispense-data",
  "url" : "https://gematik.de/fhir/erp-eu//StructureDefinition/logical-eu-dispense-data",
  "version" : "1.0.1",
  "name" : "GEM_ERPEU_LOG_DispenseData",
  "title" : "Dispense Data from EU",
  "status" : "active",
  "date" : "2026-01-08",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    },
    {
      "system" : "email",
      "value" : "erp-umsetzung@gematik.de"
    }]
  }],
  "description" : "Logical Information that is Provided in the dispensation document by the NCPeH of country B for Dispensing Medication",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
    "uri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPEU_PR_MedicationDispense",
    "name" : "Mapping for EU DispenseData to EU-MedicationDispense",
    "comment" : "This mapping maps the logical information of the EU DispenseData to the EU-MedicationDispense"
  },
  {
    "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
    "uri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPEU_PR_Medication",
    "name" : "Mapping for EU MedicationData to GEM_ERPEU_PR_Medication",
    "comment" : "This mapping maps the logical information of the EU MedicationData to GEM_ERPEU_PR_Medication"
  },
  {
    "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
    "uri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPEU_PR_Organization",
    "name" : "Mapping for EU DispenseData to EU-Organization",
    "comment" : "This mapping maps the logical information of the EU DispenseData to the EU-Organization"
  },
  {
    "identity" : "GEM-ERPEU-MAP-EU-Data-Practitioner",
    "uri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPEU_PR_Practitioner",
    "name" : "Mapping for EU DispenseData to EU-Practitioner",
    "comment" : "This mapping maps the logical information of the EU DispenseData to the EU-Practitioner"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://gematik.de/fhir/erp-eu//StructureDefinition/logical-eu-dispense-data",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Element",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "logical-eu-dispense-data",
      "path" : "logical-eu-dispense-data",
      "short" : "Dispense Data from EU",
      "definition" : "Logical Information that is Provided in the dispensation document by the NCPeH of country B for Dispensing Medication"
    },
    {
      "id" : "logical-eu-dispense-data.PatientData",
      "path" : "logical-eu-dispense-data.PatientData",
      "short" : "Patient Data",
      "definition" : "Patient Data",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "GEM_ERPEU_PR_MedicationDispense"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.PatientData.RegionalNationalHealthIdentifier",
      "path" : "logical-eu-dispense-data.PatientData.RegionalNationalHealthIdentifier",
      "short" : "Regional/National Health Identifier (KVNR)",
      "definition" : "If the patient has a regional or national Health Identification. This field is required by some national laws.",
      "comment" : "Angabe aus einem der dargestellten CDA Felder wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen. Als einziges Merkmal zu den PatientInnen soll die KVID eingetragen werden, da hierüber jede gesetzlich versicherte Person eindeutig identifizierbar ist.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "MedicationDispense.subject.identifier"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.HealthCareProfessionalData",
      "path" : "logical-eu-dispense-data.HealthCareProfessionalData",
      "short" : "HealthCareProfessional Data",
      "definition" : "HealthCareProfessional Data",
      "comment" : "ehdsi-dataelement-299 Family Name/Surname. Der Nachname der die Medikation abgebenden Person wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils GEM_ERPEU_PR_Practitioner eingetragen. (Achtung: Da aus der EU nur ein Datenfeld kommt, entfallen Sonderfelder für Präfixe und Suffixe)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Practitioner",
        "map" : "GEM_ERPEU_PR_Practitioner"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.HealthCareProfessionalData.HPIdentifier",
      "path" : "logical-eu-dispense-data.HealthCareProfessionalData.HPIdentifier",
      "short" : "HP Identifier",
      "definition" : "The identification of the person as Health Professional.",
      "comment" : "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Practitioner eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Practitioner",
        "map" : "Practitioner.identifier"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.HealthCareProfessionalData.GivenName",
      "path" : "logical-eu-dispense-data.HealthCareProfessionalData.GivenName",
      "short" : "Given Name",
      "definition" : "The name of the HP dispensing the medicine to the patient. This field can contain more than one element.",
      "comment" : "ehdsi-dataelement-300 Given Name. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Practitioner eingetragen.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Practitioner",
        "map" : "Practitioner.name.given"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.HealthCareProfessionalData.FamilyNameSurname",
      "path" : "logical-eu-dispense-data.HealthCareProfessionalData.FamilyNameSurname",
      "short" : "Family Name/Surname",
      "definition" : "The surname/s of the HP dispensing the medicine to the patient. This field can contain more than one element.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Practitioner",
        "map" : "Practitioner.family"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData",
      "path" : "logical-eu-dispense-data.OrganizationData",
      "short" : "Organization Data",
      "definition" : "Organization Data",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "GEM_ERPEU_PR_Organization"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData.FacilityIdentifier",
      "path" : "logical-eu-dispense-data.OrganizationData.FacilityIdentifier",
      "short" : "Facility (Pharmacy) Identifier",
      "definition" : "The identification of the facility (pharmacy) from where the HP is dispensing the medicine.",
      "comment" : "Der Identifier des abgebenden Unternehmens wird aus dem angegebenen CDA Feld in die angegebenen Element Id des Profils GEM_ERPEU_PR_Organization übermittelt. Angaben mehrerer Identifier ist möglich.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "Organization.identifier"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData.OrganizationIdentifier",
      "path" : "logical-eu-dispense-data.OrganizationData.OrganizationIdentifier",
      "short" : "Organization Identifier",
      "definition" : "The identification of the healthcare provider organization of the HP dispensing the medicine.",
      "comment" : "ehdsi-dataelement-285 Organization Identifier. (Achtung wir werden vermutlich im neu erstellten EU Profil sowohl die Möglichkeit einen Facility als auch einen Organisation Identifier abzubilden - FHIR Grundprofil lässt dies zu)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "Organization.identifier"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData.OrganizationName",
      "path" : "logical-eu-dispense-data.OrganizationData.OrganizationName",
      "short" : "Organization Name",
      "definition" : "The name of the healthcare provider organization of the HP dispensing the medicine.",
      "comment" : "ehdsi-dataelement-286 Organization Name. Der Name der Organisation, die die Medikation abgibt wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils GEM_ERPEU_PR_Organization eingetragen. (Achtung: HL7 Grundprofil lässt nur einen Organisationsnamen zu deshalb diesen und nicht Facility name gewählt)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "Organization.name"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData.StreetAddress",
      "path" : "logical-eu-dispense-data.OrganizationData.StreetAddress",
      "short" : "Street address",
      "definition" : "The street of the place from where the HP is dispensing the medicine.",
      "comment" : "ehdsi-dataelement-293 Street address. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "Organization.address.line"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData.City",
      "path" : "logical-eu-dispense-data.OrganizationData.City",
      "short" : "City",
      "definition" : "The city of the place from where the HP is dispensing the medicine.",
      "comment" : "ehdsi-dataelement-292 City. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "Organization.address.city"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData.ZipOrPostalCode",
      "path" : "logical-eu-dispense-data.OrganizationData.ZipOrPostalCode",
      "short" : "Zip or Postal Code",
      "definition" : "The postal code of the place from where the HP is dispensing the medicine.",
      "comment" : "ehdsi-dataelement-291 Zip or Postal Code. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "Organization.address.postalCode"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData.StateOrProvince",
      "path" : "logical-eu-dispense-data.OrganizationData.StateOrProvince",
      "short" : "State or Province",
      "definition" : "The province of the place from where the HP is dispensing the medicine.",
      "comment" : "ehdsi-dataelement-290 State or Province. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "Organization.address.state"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.OrganizationData.Country",
      "path" : "logical-eu-dispense-data.OrganizationData.Country",
      "short" : "Country",
      "definition" : "The country where the pharmacy is located.",
      "comment" : "ehdsi-dataelement-289 Country. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Organization",
        "map" : "Organization.address.country"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData",
      "path" : "logical-eu-dispense-data.DispenseData",
      "short" : "Dispense Data",
      "definition" : "Dispense Data",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "GEM_ERPEU_PR_MedicationDispense"
      },
      {
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "GEM_ERPEU_PR_MedicationDispense"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation",
      "path" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation",
      "short" : "Information regarding the dispensation",
      "definition" : "Information regarding the dispensation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "GEM_ERPEU_PR_MedicationDispense"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.DispensationIdentifier",
      "path" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.DispensationIdentifier",
      "short" : "Dispensation Identifier",
      "definition" : "Identification of the dispensation.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "MedicationDispense.identifier"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.PrescriptionIdentifier",
      "path" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.PrescriptionIdentifier",
      "short" : "Prescription Identifier",
      "definition" : "Identification of the related prescription (from Country of affiliation) of the dispensed medicine.",
      "comment" : "Der Prescription Identifier wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen. Die im CDA Feld gelieferte Information entspricht dem ursprünglich in Deutschland erstelltem Wert, weshalb sie ohne Probleme konform mit der Formatvorgabe dieses Feldes ist.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "MedicationDispense.identifier[prescriptionID]"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.PrescriptionItemIdentifier",
      "path" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.PrescriptionItemIdentifier",
      "short" : "Prescription Item Identifier",
      "definition" : "Identification of the related prescription item (from Country of affiliation) of the dispensed medicine.",
      "comment" : "Dieses Feld ist im deutschen Country A Szenario ePrescription/eDispensation nicht notwendig, da deutsche eRezepte immer nur ein Prescription Item pro Verschreibung/Dispensierung beinhalten. Somit kann für eine jede Verordnung, für die im EU-Ausland eine Dispensierung erfolgte, ausschließlich ein Prescription Item enthalten sein.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "n/a"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.DateOfIssueOfDispensation",
      "path" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.DateOfIssueOfDispensation",
      "short" : "Date of issue of the dispensation",
      "definition" : "Date when the medicine was dispensed.",
      "comment" : "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "MedicationDispense.whenHandedOver"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.Substitution",
      "path" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.Substitution",
      "short" : "Substitution",
      "definition" : "It indicates if a substitution was performed in Country of treatment, based on their national legislation.",
      "comment" : "Wenn im dargestellten CDA Feld übermittelt wird, dass eine Substitution erfolgte, kann diese Information unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen werden.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "MedicationDispense.substitution.wasSubstituted"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.NumberOfPackages",
      "path" : "logical-eu-dispense-data.DispenseData.AdministrativeInformation.NumberOfPackages",
      "short" : "Number of packages",
      "definition" : "Number of boxes that have been dispensed.",
      "comment" : "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-MedicationDispense",
        "map" : "MedicationDispense.quantity"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation",
      "short" : "Information regarding the medication of the dispensation",
      "definition" : "Information regarding the medication of the dispensation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "GEM_ERPEU_PR_MedicationDispense.medicationReference"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MedicinalProductIdentifier",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MedicinalProductIdentifier",
      "short" : "Medicinal Product Identifier",
      "definition" : "Identifier of a medicinal product refers to the product inside the package, not the packaged item as such.",
      "comment" : "Der Medicinal Product Identifier wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen. Da im FHIR Profil ein Data-String eingetragen werden darf, kann die übermittelte ISO-IDMP Nummer hier ohne Probleme eingetragen werden. Es ist angestrebt zusätzlich eine textuale Beschreibung abzubilden.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.identifier"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MedicinalProductBrandName",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MedicinalProductBrandName",
      "short" : "Medicinal Product Brand Name",
      "definition" : "The name, which may be either an invented name not liable to confusion with the common name, or a common or scientific name accompanied by a trademark or the name of the marketing authorization holder.",
      "comment" : "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) eingetragen. Die Abbildung dieser Information an dieser Stelle ist immens wichtig, da sie zur Medikationsbeschreibung verwendet werden.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.code.text"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.ActiveIngredients",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.ActiveIngredients",
      "short" : "Active Ingredient(s)",
      "definition" : "Substance that alone or in combination with one or more other ingredients produces the intended activity of a medicinal product.",
      "comment" : "In jedem Fall wird die Angabe aus dem dargestellten CDA Feld unter der angegebenen Element ID 'Medication.ingredient.item[x]:itemCodeableConcept.text' des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) als Freitext eingetragen. Handelt es sich um einen WHO-ATC Code kann dieser in Medication.ingredient.item[x]:itemCodeableConcept.coding:atc-de eingetragen werden. Handelt es sich um eine Euro-SRS Nummer, so kann diese über das oben im Zusammenhang der Prescription bereits beschriebene Mapping in eine ASK-Nummer übersetzt werden.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.ingredient.item[x]:itemCodeableConcept"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.ActiveIngredientRoles",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.ActiveIngredientRoles",
      "short" : "Active Ingredient Role(s)",
      "definition" : "The role of the active ingredient in the strength calculation.",
      "comment" : "In Deutschland werden grundsätzlich nur solche Inhaltsstoffe in den FHIR Profilen angegeben, die einem Wirkstoff entsprechen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.ingredient.isActive"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.ActiveIngredientStrengths",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.ActiveIngredientStrengths",
      "short" : "Active Ingredient Strength(s)",
      "definition" : "The content of the active ingredient expressed quantifiable per dosage unit, per unit of volume or per unit of weight, according to the pharmaceutical dose form.",
      "comment" : "Angabe aus dem dargestellten CDA Feld kann einerseits unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) eingetragen. Alternativ könnten die Element IDs Medication.ingredient.strength.numerator.code.value und Medication.ingredient.strength.denominator.code.value. in Kombination genutzt werden.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Ratio"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.ingredient.strength"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.PharmaceuticalDoseForm",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.PharmaceuticalDoseForm",
      "short" : "Pharmaceutical Dose Form",
      "definition" : "The form in which a pharmaceutical product is presented (e.g. tablets, syrup).",
      "comment" : "Angabe aus dem dargestellten CDA Feld wird auf jeden Fall als Valuestring und somit in Textform unter der angegebenen Element ID Medication.form.text des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) eingetragen. Zusätzlich sollen aus dem CDA Feld erhaltene Informationen über ein EDQM - KBV Darreichungsform Mapping in Medication.form.coding:kbvDarreichungsform eingetragen werden.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Coding"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.form.text"
      },
      {
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.form.coding:kbvDarreichungsform"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MedicinalProductPackageDescription",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MedicinalProductPackageDescription",
      "short" : "Medicinal Product Package description",
      "definition" : "Textual description of the package.",
      "comment" : "Angabe aus dem dargestellten CDA Feld kann unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) eingetragen werden. Bei Kombipackungen kann über eine Extension im FHIR Profil Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) auf das FHIR Profil EPA Pharmaceutical Product Medication und somit verschiedene Anganben im Element ID Medication.extension:packaging abgelegt werden.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.extension:packageDescription"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MedicinalProductPackageIdentifier",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MedicinalProductPackageIdentifier",
      "short" : "Medicinal Product Package identifier",
      "definition" : "Identifier of a packaged medicinal product refers to a specific pack size of a specific product.",
      "comment" : "Angabe aus dem dargestellten CDA Feld kann unter der angegebenen Element ID des FHIR Profils EPA Pharmaceutical Product Medication eingetragen werden.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.extension:packageIdentifier"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.PackageType",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.PackageType",
      "short" : "Package type",
      "definition" : "The type of package used for the medicinal product.",
      "comment" : "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.extension:packaging"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.PackageSize",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.PackageSize",
      "short" : "Package size",
      "definition" : "Size of the package dispensed in the Country of treatment.",
      "comment" : "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.amount.numerator.extension:packagingSize"
      }]
    },
    {
      "id" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MarketingAuthorizationHolder",
      "path" : "logical-eu-dispense-data.DispenseData.MedicinalInformation.MarketingAuthorizationHolder",
      "short" : "Marketing Authorization Holder of the dispensed medicinal product",
      "definition" : "The name of the company or other legal entity that has the authorization to market a medicine in one, several or all European Union Member States.",
      "comment" : "Wenn im dargestellten CDA Feld eine Information hinterlegt ist, wird diese unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERPEU-MAP-EU-Data-Medication",
        "map" : "Medication.manufacturer.display"
      }]
    }]
  }
}

```
