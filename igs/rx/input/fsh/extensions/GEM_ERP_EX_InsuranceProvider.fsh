Extension: GEM_ERP_EX_InsuranceProvider
Id: GEM-ERP-EX-InsuranceProvider
Title: "GEM ERP EX InsuranceProvider"
Description: "IK-Nummer (Institutionskennzeichen) des Versicherungsträgers, der das angeforderte Medikament abdeckt"
* insert Meta
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only $identifier-iknr
