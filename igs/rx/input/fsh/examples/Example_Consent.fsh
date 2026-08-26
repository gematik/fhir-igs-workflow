Instance: ExampleEUConsent
InstanceOf: GEM_ERPEU_PR_Consent
Title: "Example for a Consent to redeem EU Prescriptions"
Usage: #example
* insert Consent(GEM_ERPEU_CS_ConsentType#EUDISPCONS "Consent for redeeming e-prescriptions in EU countries")

Instance: ExampleGetConsent
InstanceOf: Bundle
Title: "Example for a Bundle with a Consent"
Usage: #example
* link[+]
  * relation = "self"
  * url = "https://erp-ref.example.org/Consent?category=EUDISPCONS"
* type = #searchset
* insert DateTimeStamp(timestamp)
* total = 1
* entry[+]
  * fullUrl = "https://erp-ref.example.org/Consent/ExampleEUConsent"
  * resource = ExampleEUConsent
  * search.mode = #match