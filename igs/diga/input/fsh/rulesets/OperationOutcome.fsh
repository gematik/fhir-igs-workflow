RuleSet: OperationOutcomeForbidden(system, code)
* severity = #error
* code = #forbidden
* details.coding.system = {system}
* details.coding.code = {code}
* details.text = "Validation Failed"

RuleSet: OperationOutcomeInvalid(system, code)
* severity = #error
* code = #invalid
* details.coding.system = {system}
* details.coding.code = {code}
* details.text = "Validation Failed"

RuleSet: OperationOutcomeConflict(system, code)
* severity = #error
* code = #conflict
* details.coding.system = {system}
* details.coding.code = {code}
* details.text = "Conflict"