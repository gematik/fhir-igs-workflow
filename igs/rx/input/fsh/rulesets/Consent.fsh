RuleSet: Consent(category)
* status = #active
* scope = $cs-consent-scope#patient-privacy "Privacy Consent"
* category = {category}
* policyRule = $v3-ActCode#OPTIN
* insert PKV_Identifier(patient.identifier)
* insert DateTime(dateTime)