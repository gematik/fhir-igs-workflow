Logical: GEM_ERPEU_LOG_DispenseData
Parent: Element
Id: logical-eu-dispense-data
Title: "Dispense Data from EU"
Description: "Logical Information that is Provided in the dispensation document by the NCPeH of country B for Dispensing Medication"
* insert StructureDefinition(GEM_ERPEU_LOG_DispenseData)

* PatientData 1..1 BackboneElement "Patient Data"
  * RegionalNationalHealthIdentifier 1..1 Identifier "Regional/National Health Identifier (KVNR)"
    * ^definition = "If the patient has a regional or national Health Identification. This field is required by some national laws."
    * ^comment = "Angabe aus einem der dargestellten CDA Felder wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen. Als einziges Merkmal zu den PatientInnen soll die KVID eingetragen werden, da hierüber jede gesetzlich versicherte Person eindeutig identifizierbar ist."

* HealthCareProfessionalData 1..1 BackboneElement "HealthCareProfessional Data"
  * HPIdentifier 1..1 Identifier "HP Identifier"
    * ^definition = "The identification of the person as Health Professional."
    * ^comment = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Practitioner eingetragen."

  * GivenName 1..* string "Given Name"
    * ^definition = "The name of the HP dispensing the medicine to the patient. This field can contain more than one element."
    * ^comment = "ehdsi-dataelement-300 Given Name. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Practitioner eingetragen."

  * FamilyNameSurname 1..* string "Family Name/Surname"
    * ^definition = "The surname/s of the HP dispensing the medicine to the patient. This field can contain more than one element."
  * ^comment = "ehdsi-dataelement-299 Family Name/Surname. Der Nachname der die Medikation abgebenden Person wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils GEM_ERPEU_PR_Practitioner eingetragen. (Achtung: Da aus der EU nur ein Datenfeld kommt, entfallen Sonderfelder für Präfixe und Suffixe)"

* OrganizationData 1..1 BackboneElement "Organization Data"
  * FacilityIdentifier 1..1 Identifier "Facility (Pharmacy) Identifier"
    * ^definition = "The identification of the facility (pharmacy) from where the HP is dispensing the medicine."
    * ^comment = "Der Identifier des abgebenden Unternehmens wird aus dem angegebenen CDA Feld in die angegebenen Element Id des Profils GEM_ERPEU_PR_Organization übermittelt. Angaben mehrerer Identifier ist möglich."

  * OrganizationIdentifier 1..1 Identifier "Organization Identifier"
    * ^definition = "The identification of the healthcare provider organization of the HP dispensing the medicine."
    * ^comment = "ehdsi-dataelement-285 Organization Identifier. (Achtung wir werden vermutlich im neu erstellten EU Profil sowohl die Möglichkeit einen Facility als auch einen Organisation Identifier abzubilden - FHIR Grundprofil lässt dies zu)"

  * OrganizationName 1..1 string "Organization Name"
    * ^definition = "The name of the healthcare provider organization of the HP dispensing the medicine."
    * ^comment = "ehdsi-dataelement-286 Organization Name. Der Name der Organisation, die die Medikation abgibt wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils GEM_ERPEU_PR_Organization eingetragen. (Achtung: HL7 Grundprofil lässt nur einen Organisationsnamen zu deshalb diesen und nicht Facility name gewählt)"

  * StreetAddress 1..1 string "Street address"
    * ^definition = "The street of the place from where the HP is dispensing the medicine."
    * ^comment = "ehdsi-dataelement-293 Street address. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen."

  * City 1..1 string "City"
    * ^definition = "The city of the place from where the HP is dispensing the medicine."
    * ^comment = "ehdsi-dataelement-292 City. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen."

  * ZipOrPostalCode 1..1 string "Zip or Postal Code"
    * ^definition = "The postal code of the place from where the HP is dispensing the medicine."
    * ^comment = "ehdsi-dataelement-291 Zip or Postal Code. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen."

  * StateOrProvince 1..1 string "State or Province"
    * ^definition = "The province of the place from where the HP is dispensing the medicine."
    * ^comment = "ehdsi-dataelement-290 State or Province. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen."

  * Country 1..1 string "Country"
    * ^definition = "The country where the pharmacy is located."
    * ^comment = "ehdsi-dataelement-289 Country. Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils GEM_ERPEU_PR_Organization eingetragen."

* DispenseData 1..* BackboneElement "Dispense Data"
  * AdministrativeInformation 1..1 BackboneElement "Information regarding the dispensation"
  
    * DispensationIdentifier 1..1 string "Dispensation Identifier"
      * ^definition = "Identification of the dispensation."

    * PrescriptionIdentifier 1..1 Identifier "Prescription Identifier"
      * ^definition = "Identification of the related prescription (from Country of affiliation) of the dispensed medicine."
      * ^comment = "Der Prescription Identifier wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen. Die im CDA Feld gelieferte Information entspricht dem ursprünglich in Deutschland erstelltem Wert, weshalb sie ohne Probleme konform mit der Formatvorgabe dieses Feldes ist."

    * PrescriptionItemIdentifier 1..1 Identifier "Prescription Item Identifier"
      * ^definition = "Identification of the related prescription item (from Country of affiliation) of the dispensed medicine."
      * ^comment = "Dieses Feld ist im deutschen Country A Szenario ePrescription/eDispensation nicht notwendig, da deutsche eRezepte immer nur ein Prescription Item pro Verschreibung/Dispensierung beinhalten. Somit kann für eine jede Verordnung, für die im EU-Ausland eine Dispensierung erfolgte, ausschließlich ein Prescription Item enthalten sein."

    * DateOfIssueOfDispensation 1..1 dateTime "Date of issue of the dispensation"
      * ^definition = "Date when the medicine was dispensed."
      * ^comment = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen."

    * Substitution 0..1 boolean "Substitution"
      * ^definition = "It indicates if a substitution was performed in Country of treatment, based on their national legislation."
      * ^comment = "Wenn im dargestellten CDA Feld übermittelt wird, dass eine Substitution erfolgte, kann diese Information unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen werden."

    * NumberOfPackages 1..1 Quantity "Number of packages"
      * ^definition = "Number of boxes that have been dispensed."
      * ^comment = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen."

  * MedicinalInformation 1..1 BackboneElement "Information regarding the medication of the dispensation"
    * MedicinalProductIdentifier 0..1 Coding "Medicinal Product Identifier"
      * ^definition = "Identifier of a medicinal product refers to the product inside the package, not the packaged item as such."
      * ^comment = "Der Medicinal Product Identifier wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils Dispensation of the Prescription (GEM_ERPEU_PR_MedicationDispense) eingetragen. Da im FHIR Profil ein Data-String eingetragen werden darf, kann die übermittelte ISO-IDMP Nummer hier ohne Probleme eingetragen werden. Es ist angestrebt zusätzlich eine textuale Beschreibung abzubilden."

    * MedicinalProductBrandName 1..1 string "Medicinal Product Brand Name"
      * ^definition = "The name, which may be either an invented name not liable to confusion with the common name, or a common or scientific name accompanied by a trademark or the name of the marketing authorization holder."
      * ^comment = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) eingetragen. Die Abbildung dieser Information an dieser Stelle ist immens wichtig, da sie zur Medikationsbeschreibung verwendet werden."

    * ActiveIngredients 1..1 CodeableConcept "Active Ingredient(s)"
      * ^definition = "Substance that alone or in combination with one or more other ingredients produces the intended activity of a medicinal product."
      * ^comment = "In jedem Fall wird die Angabe aus dem dargestellten CDA Feld unter der angegebenen Element ID 'Medication.ingredient.item[x]:itemCodeableConcept.text' des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) als Freitext eingetragen. Handelt es sich um einen WHO-ATC Code kann dieser in Medication.ingredient.item[x]:itemCodeableConcept.coding:atc-de eingetragen werden. Handelt es sich um eine Euro-SRS Nummer, so kann diese über das oben im Zusammenhang der Prescription bereits beschriebene Mapping in eine ASK-Nummer übersetzt werden."

    * ActiveIngredientRoles 1..1 boolean "Active Ingredient Role(s)"
      * ^definition = "The role of the active ingredient in the strength calculation."
      * ^comment = "In Deutschland werden grundsätzlich nur solche Inhaltsstoffe in den FHIR Profilen angegeben, die einem Wirkstoff entsprechen."

    * ActiveIngredientStrengths 1..1 Ratio "Active Ingredient Strength(s)"
      * ^definition = "The content of the active ingredient expressed quantifiable per dosage unit, per unit of volume or per unit of weight, according to the pharmaceutical dose form."
      * ^comment = "Angabe aus dem dargestellten CDA Feld kann einerseits unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) eingetragen. Alternativ könnten die Element IDs Medication.ingredient.strength.numerator.code.value und Medication.ingredient.strength.denominator.code.value. in Kombination genutzt werden."

    * PharmaceuticalDoseForm 1..1 Coding "Pharmaceutical Dose Form"
      * ^definition = "The form in which a pharmaceutical product is presented (e.g. tablets, syrup)."
      * ^comment = "Angabe aus dem dargestellten CDA Feld wird auf jeden Fall als Valuestring und somit in Textform unter der angegebenen Element ID Medication.form.text des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) eingetragen. Zusätzlich sollen aus dem CDA Feld erhaltene Informationen über ein EDQM - KBV Darreichungsform Mapping in Medication.form.coding:kbvDarreichungsform eingetragen werden."

    * MedicinalProductPackageDescription 0..1 string "Medicinal Product Package description"
      * ^definition = "Textual description of the package."
      * ^comment = "Angabe aus dem dargestellten CDA Feld kann unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) eingetragen werden. Bei Kombipackungen kann über eine Extension im FHIR Profil Medication for the Dispensation of the Prescription (GEM_ERPEU_PR_Medication) auf das FHIR Profil EPA Pharmaceutical Product Medication und somit verschiedene Anganben im Element ID Medication.extension:packaging abgelegt werden."

    * MedicinalProductPackageIdentifier 0..1 Identifier "Medicinal Product Package identifier"
      * ^definition = "Identifier of a packaged medicinal product refers to a specific pack size of a specific product."
      * ^comment = "Angabe aus dem dargestellten CDA Feld kann unter der angegebenen Element ID des FHIR Profils EPA Pharmaceutical Product Medication eingetragen werden."

    * PackageType 1..1 string "Package type"
      * ^definition = "The type of package used for the medicinal product."
      * ^comment = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen."

    * PackageSize 1..1 string "Package size"
      * ^definition = "Size of the package dispensed in the Country of treatment."
      * ^comment = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen."
      
    * MarketingAuthorizationHolder 0..1 string "Marketing Authorization Holder of the dispensed medicinal product"
      * ^definition = "The name of the company or other legal entity that has the authorization to market a medicine in one, several or all European Union Member States."
      * ^comment = "Wenn im dargestellten CDA Feld eine Information hinterlegt ist, wird diese unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen."
      