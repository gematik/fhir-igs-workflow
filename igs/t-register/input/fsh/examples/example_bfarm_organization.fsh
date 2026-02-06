Instance: ExampleOrganization-T
InstanceOf: ERP_TPrescription_Organization
Title: "Beispiel BfArM Organisation"
Description: "Beispiel, wie eine BfArM Organisation maximal ausgefüllt wäre"
* name = "Stadt-Apotheke"
* identifier[TelematikID].value = "3-Test-APO000053"

* address[+]
  * line[+] = "Hauptstraße 10"
  * city = "Beispielstadt"
  * postalCode = "54321"
  * country = "DE"
* telecom[+]
  * system = #phone
  * value = "+49 987 6543210"
