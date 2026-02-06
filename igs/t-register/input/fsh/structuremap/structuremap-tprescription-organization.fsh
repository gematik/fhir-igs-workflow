Instance: ERPTPrescriptionStructureMapOrganization
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for Organization"
Description: "Mapping-Anweisungen zur Erstellung einer BfArM Organization aus dem VZD SearchSet"
* insert Instance(StructureMap, ERPTPrescriptionStructureMapOrganization)

* insert sd_structure(https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-vzd-searchset, source, vzdSearchSet)
* insert sd_structure(https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-organization, target, bfarmOrganization)

* group[+]
  * name = "ERPTPrescriptionStructureMapOrganization"
  * typeMode = #none
  * documentation = "Mapping-Anweisungen zur Erstellung einer BfArM Organization aus dem VZD SearchSet"

  * insert sd_input(vzdSearchSet, source)
  * insert sd_input(bfarmOrganization, target)

  * rule[+]
    * name = "mapOrganization"
    * documentation = "Mappt Organization-Einträge aus dem VZD SearchSet"
    * insert treeSource(vzdSearchSet, entry, srcEntryOrgVar)
    * rule[+]
      * name = "entry"
      * documentation = "Verarbeitet jeden Eintrag im SearchSet"
      * insert treeSource(srcEntryOrgVar, resource, srcEntryOrganizationVar)
      * source[=].condition = "ofType(Organization)"
      // * source[=].logMessage = "ofType(Organization)"
      
      // Name
      * rule[+]
        * name = "name"
        * insert treeSource(srcEntryOrganizationVar, name, srcOrgNameVar)
        * insert targetSetIdVariable(bfarmOrganization, name, srcOrgNameVar)
        * documentation = "Übernimmt den Namen der Organisation aus dem VZD in die BfArM Organization"
      
      // TelematikID
      * rule[+]
        * name = "tid"
        * documentation = "Mappt die Telematik-ID der Organisation"
        * insert treeSource(srcEntryOrganizationVar, identifier, srcOrgIdentifierVar)
        * source[=].condition = "$this.system='https://gematik.de/fhir/sid/telematik-id'"
        // * source[=].logMessage = "'Telematik-ID Identifier present: ' + ($this.system='https://gematik.de/fhir/sid/telematik-id').toString()"
        * insert treeTarget(bfarmOrganization, identifier, bfarmOrganizationIdentifierVar)
        * rule[+]
          * name = "tidValue"
          * insert treeSource(srcOrgIdentifierVar, value, srcOrgIdentifierValueVar)
          * source[=].logMessage = "tgtTidIdentifier"
          * insert targetSetStringVariable(bfarmOrganizationIdentifierVar, system, https://gematik.de/fhir/sid/telematik-id)
          * insert targetSetIdVariable(bfarmOrganizationIdentifierVar, value, srcOrgIdentifierValueVar)
          * insert targetSetIdVariable(bfarmOrganization, id, srcOrgIdentifierValueVar)
          * documentation = "Kopiert die Telematik-ID mit korrektem System-Identifier in die Ziel-Organisation"

  * rule[+]
    * name = "mapHealthcareService"
    * documentation = "Mappt HealthcareService-Informationen für Kontaktdaten"
    * insert treeSource(vzdSearchSet, entry, srcEntryHCSVar)
    * rule[+]
      * name = "entry"
      * documentation = "Verarbeitet HealthcareService-Einträge aus dem SearchSet"
      * insert treeSource(srcEntryHCSVar, resource, srcEntryHealthcareServiceVar)
      * source[=].condition = "ofType(HealthcareService)"
      // * source[=].logMessage = "ofType(HealthcareService)"
      * rule[+]
        * name = "telecom"
        * insert treeSource(srcEntryHealthcareServiceVar, telecom, srcHcsTelecomVar)
        * insert targetSetIdVariable(bfarmOrganization, telecom, srcHcsTelecomVar)
        * documentation = "Übernimmt Kontaktinformationen (Telefon, E-Mail) aus dem HealthcareService in die Organisation"

  * rule[+]
    * name = "mapLocation"
    * documentation = "Mappt Location-Informationen für Adressdaten"
    * insert treeSource(vzdSearchSet, entry, srcEntryHCSVar)
    * rule[+]
      * name = "entry"
      * documentation = "Verarbeitet Location-Einträge aus dem SearchSet"
      * insert treeSource(srcEntryHCSVar, resource, srcEntryLocationVar)
      * source[=].condition = "ofType(Location)"
      // * source[=].logMessage = "ofType(Location)"
      * rule[+]
        * name = "address"
        * insert treeSource(srcEntryLocationVar, address, srcLocationAddressVar)
        * insert targetSetIdVariable(bfarmOrganization, address, srcLocationAddressVar)
        * documentation = "Übernimmt die Adressinformationen aus der Location in die Organisation"
