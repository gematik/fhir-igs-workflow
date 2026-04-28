Profile: GEM_ERP_PR_Signature
Parent: Signature
Id: GEM-ERP-PR-Signature
Title: "GEM_ERP_PR_Signature"
Description: "Profil für die Signatur von Bundles im E-Rezept-Kontext"
* insert StructureDefinition(GEM_ERP_PR_Signature)
* type ..1 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #closed
  * ^binding.strength = #required
* type contains
    AuthorsSignature 0..1 and
    VerificationSignature 0..1
* type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013" (exactly)
* type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1 (exactly)
* type[VerificationSignature].system = "urn:iso-astm:E1762-95:2013" (exactly)
* type[VerificationSignature].code = #1.2.840.10065.1.12.1.5 (exactly)
* when MS
* who only Reference(GEM_ERP_PR_Device)
* who MS
* who.reference 1.. MS
* sigFormat 1.. MS
* data 1.. MS
