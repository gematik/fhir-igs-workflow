Extension: EFlowRxInsuranceProviderExtension
Id: eflow-rx-insuranceprovider-extension
Title: "GEM ERP EX InsuranceProvider"
Description: "IK-Nummer (Institutionskennzeichen) des Versicherungsträgers, der das angeforderte Medikament abdeckt"
* insert Versioning
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only $identifier-iknr
