Instance: GrantEUAccessPermission
InstanceOf: TIOperationDefinition
Usage: #definition
Title: "EU-Zugriffsberechtigung erstellen"
Description: "Die Operation $grant-eu-access-permission empfängt den Zugriffscode und das Land, für das der Versicherte eine Zugriffsberechtigung erteilen möchte. Die Operation prüft das Land und registriert den Zugriffscode."
* insert Operation(GrantEUAccessPermission)
* id = "grant-eu-access-permission"
* extension[method][+].valueCode = #POST
* code = #grant-eu-access-permission
* system = true
* type = false
* instance = false
* affectsState = true

* inputProfile = Canonical(GEM_ERPEU_PR_PAR_Access_Authorization_Request)
* outputProfile = Canonical(GEM_ERPEU_PR_PAR_Access_Authorization_Response)

// in
// * parameter[+]
//   * name = #countryCode
//   * use = #in
//   * min = 1
//   * max = "1"
//   * documentation = "The country for which the patient wants to grant access."
//   * type = #Coding

// * parameter[+]
//   * name = #accessCode
//   * use = #in
//   * min = 1
//   * max = "1"
//   * documentation = "The access code for that country."
//   * type = #Identifier


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
