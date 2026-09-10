RuleSet: Consent
* status = #active
* scope = $consentscope#patient-privacy "Privacy Consent"
* category = $GEM_ERPCHRG_CS_ConsentType#CHARGCONS "Consent for saving electronic charge item"
* insert PKV_Identifier(patient.identifier)
* policyRule = $v3-ActCode#OPTIN