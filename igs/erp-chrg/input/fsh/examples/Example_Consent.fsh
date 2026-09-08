Instance: Example-GEM-ERPCHRG-Consent
InstanceOf: GEM_ERPCHRG_PR_Consent
Title:   "Consent to store digital ChargeItem"
Usage: #example
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"
* category = GEM_ERPCHRG_CS_ConsentType#CHARGCONS "Consent for saving electronic charge item"
* insert PKV_Identifier(patient.identifier)
* patient.identifier.assigner.identifier
  * system = $identifier-iknr
  * value = "168140950"
* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTIN