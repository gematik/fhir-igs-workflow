RuleSet: Consent(category)
* status = #active
* scope = $cs-consent-scope#patient-privacy "Privacy Consent"
* category = {category}
* policyRule = $v3-ActCode#OPTIN
* insert GKV_Identifier(patient.identifier)
* insert DateTime(dateTime)