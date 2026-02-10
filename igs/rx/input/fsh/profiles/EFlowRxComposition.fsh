Profile: EFlowRxComposition
Parent: Composition
Id: eflow-rx-composition
Title: "GEM ERP PR Composition"
Description: "Quittung für die Einlösung eines E-Rezepts"
* insert Versioning

// extensions
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.description = "Erweiterungen für die Composition, die durch url unterschieden werden sollen"
* extension ^slicing.rules = #closed
* extension contains EFlowRxBeneficiaryExtension named Beneficiary 1..1

* extension[Beneficiary] ^short = "Die ID des Begünstigten des E-Rezept-Belegs (z. B. TelematikID der Apotheke)"
* extension[Beneficiary].value[x].system 1..
* extension[Beneficiary].value[x].value 1..

* status MS
* status = #final (exactly)
  * ^short = "Status = \"final\""

* type MS
* type ^short = "Document Type = \"Receipt\""
  * coding 1..1
    * code 1..1
    * code = #3 (exactly)
    * system 1..1
    * system = Canonical(EFlowRxDocumentTypeCS) (exactly)
    * display = "Receipt" (exactly)
  * coding from EFlowRxDocumentTypeVS (required)

* date MS
* author only Reference(EFlowRxDevice)
* author MS
  * ^short = "Referenz zur Überprüfung des Dienstes (Gerät)"
  * ^type.aggregation[0] = #referenced
  * ^type.aggregation[+] = #bundled

* title = "Quittung" (exactly)
* title MS
* title ^short = "Document title = \"Quittung\""

* event 1..1
  * period 1.. MS
    * start 1.. MS
    * start ^short = "Startzeit der Ausgabe"
    * start ^definition = "Zeitpunkt der Einreichung des Rezepts bei der abgebenden Leistungserbringerorganisation"
    * end 1..
    * end ^short = "Das Ende der Ausgabe"
    * end ^definition = "Zeitpunkt, an dem die Abgabe abgeschlossen ist, d. h. wenn der Server die Quittung erstellt."
  * detail MS
  * detail.reference 1.. MS
