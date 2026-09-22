Instance: ReadEUAccessPermission
InstanceOf: TIOperationDefinition
Usage: #definition
Title: "EU-Zugriffsberechtigung abfragen"
Description: "Die Operation $read-eu-access-permission liest den aktuell im E-Rezept-Fachdienst registrierten Zugriffscode für das Einlösen von E-Rezepten in einem EU-Land."
* insert Operation(ReadEUAccessPermission)
* id = "read-eu-access-permission"
* extension[method][+].valueCode = #POST
* code = #read-eu-access-permission
* system = true
* type = false
* instance = false
* affectsState = false

* outputProfile = Canonical(GEM_ERPEU_PR_PAR_Access_Authorization_Response)

// out
* parameter[+]
  * name = #countryCode
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The country for which the patient wants to grant access."
  * type = #Coding

* parameter[+]
  * name = #accessCode
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The access code for that country."
  * type = #Identifier

* parameter[+]
  * name = #validUntil
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The instant until the access code is valid."
  * type = #instant

* parameter[+]
  * name = #createdAt
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The instant when the record was created in the E-Rezept-Fachdienst."
  * type = #instant
