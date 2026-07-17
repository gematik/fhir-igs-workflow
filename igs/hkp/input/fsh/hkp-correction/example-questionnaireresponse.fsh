Alias: $hkp-la = http://fhir.kbv.de/ValueSet/HKP/Leistungsart

Instance: example-questionnaire-response-new
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "example-questionnaire-response-new"
Description: "Beispiel für Anfrage zum Hinzufügen einer Maßnahme"
* status = #completed
* questionnaire = Canonical(KBVHKPKorrekturVerordnung)

// Neue Maßnahme Insulingabe
* item[+]
  * linkId = "ressourceHinzufuegen"
  * item[+]
    * linkId = "ressourceHinzufuegen.massnahmecode"
    * answer.valueCoding = $hkp-la#insulingabe

// Neue Maßnahme Verbandswechsel
* item[+]
  * linkId = "ressourceHinzufuegen"
  * item[+]
    * linkId = "ressourceHinzufuegen.massnahmecode"
    * answer.valueCoding = $hkp-la#verbandswechsel

Instance: example-questionnaire-response-change
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "example-questionnaire-response-change"
Description: "Beispiel für Anfrage zur Änderung einer Maßnahme"
* status = #completed
* questionnaire = Canonical(KBVHKPKorrekturVerordnung)
* item[+]
  * linkId = "ressourceAeandern.massnahme"
  * item[+]
    * linkId = "ressourceAeandern.massnahme.id"
    * answer.valueString = "7b68bba6-e14f-4982-aa3b-eac8d6d2dec3"
  * item[+]
    * linkId = "ressourceAeandern.massnahme.value"
    * answer.valueCoding = $hkp-la#verbandswechsel


Instance: example-questionnaire-response-delete
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "example-questionnaire-response-delete"
Description: "Beispiel für Anfrage zum Löschen einer Maßnahme"
* status = #completed
* questionnaire = Canonical(KBVHKPKorrekturVerordnung)
* item[+]
  * linkId = "ressourceLoeschen"
  * answer.valueString = "db660337-5f7b-4483-b344-7d3680680f5e"

Instance: example-questionnaire-response-mix
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "example-questionnaire-response-mix"
Description: "Beispiel für Anfrage mit mehreren Operationen"
* status = #completed
* questionnaire = Canonical(KBVHKPKorrekturVerordnung)
* item[+]
  * linkId = "ressourceHinzufuegen"
  * item[+]
    * linkId = "ressourceHinzufuegen.massnahmecode"
    * answer.valueCoding = $hkp-la#insulingabe
* item[+]
  * linkId = "ressourceLoeschen"
  * answer.valueString = "5f2cb17d-8bee-4e8c-a470-2f1fe559b1c8"
* item[+]
  * linkId = "ressourceAeandern.massnahme"
  * item[+]
    * linkId = "ressourceAeandern.massnahme.id"
    * answer.valueString = "a0da3d8b-428a-46ca-9d07-8cd5be622240"
  * item[+]
    * linkId = "ressourceAeandern.massnahme.value"
    * answer.valueCoding = $hkp-la#verbandswechsel