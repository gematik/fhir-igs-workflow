RuleSet: X-erp-user (required)
* extension[header][+]
  * extension[name].valueString = "x-erp-user"
  * extension[type].valueString = "string"
  * extension[description].valueString = "ÄUßERER REQUEST: Nutzergruppe zum Ermöglichen des Routings von nutzergruppenspezifischen Verarbeitungskontexten"
  * extension[required].valueBoolean = {required}

RuleSet: X-erp-resource (required)
* extension[header][+]
  * extension[name].valueString = "x-erp-resource"
  * extension[type].valueString = "string"
  * extension[description].valueString = "ÄUßERER REQUEST: Ressource zum Ermöglichen des Routings von Ressourcen-spezifischen Verarbeitungskontexten"
  * extension[required].valueBoolean = {required}

RuleSet: Content-Type (required)
* extension[header][+]
  * extension[name].valueString = "content-type"
  * extension[type].valueString = "string"
  * extension[description].valueString = "INNERER REQUEST: Content-Type des HTTP-Body"
  * extension[required].valueBoolean = {required}

RuleSet: Authorization (required)
* extension[header][+]
  * extension[name].valueString = "authorization"
  * extension[type].valueString = "string"
  * extension[description].valueString = "INNERER REQUEST: Bearer Token zur Authentifizierung gegenüber dem TI-Flow-Fachdienst"
  * extension[required].valueBoolean = {required}

