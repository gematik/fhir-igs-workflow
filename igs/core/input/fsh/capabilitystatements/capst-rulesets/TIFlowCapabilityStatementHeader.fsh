RuleSet: Content-Type (required)
* extension[header][+]
  * extension[name].valueString = "Content-Type"
  * extension[type].valueString = "string"
  * extension[description].valueString = "INNERER REQUEST: Content-Type des HTTP-Body"
  * extension[required].valueBoolean = {required}

RuleSet: Authorization (required)
* extension[header][+]
  * extension[name].valueString = "Authorization"
  * extension[type].valueString = "string"
  * extension[description].valueString = "INNERER REQUEST: Bearer Token zur Authentifizierung gegenüber dem TI-Flow-Fachdienst"
  * extension[required].valueBoolean = {required}

