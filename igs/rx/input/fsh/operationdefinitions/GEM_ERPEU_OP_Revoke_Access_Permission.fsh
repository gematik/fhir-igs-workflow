Instance: RevokeEUAccessPermission
InstanceOf: TIOperationDefinition
Usage: #definition
Title: "EU-Zugriffsberechtigung löschen"
Description: "Die Operation $revoke-eu-access-permission widerruft den derzeit im E-Rezept-Fachdienst registrierten Zugriffscode für das Einlösen von Verordnungen in einem EU-Land."
* insert Operation(RevokeEUAccessPermission)
* id = "revoke-eu-access-permission"
* extension[method][+].valueCode = #POST
* code = #revoke-eu-access-permission
* system = true
* type = false
* instance = false
* affectsState = true
