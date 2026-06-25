Profile: GEM_ERP_PR_Medication
Parent: TIMedicationDgMP
Id: GEM-ERP-PR-Medication
Title: "GEM ERP PR Medication"
Description: "Medikament zur Ausgabe des Rezepts"
* insert LegacyMetaProfile(GEM_ERP_PR_Medication)
 
* contained MS

* extension[isVaccine] MS
* extension[drugCategory] MS

* extension[normSizeCode] MS
* extension[packaging] MS
* extension[manufacturingInstructions] MS
* extension[type] MS

* amount.numerator.extension[totalQuantity] MS
* amount.numerator.extension[packagingSize] MS

* ingredient MS
  * itemCodeableConcept ^short = "Komponente in codierter Form" // Diese Zeile ist notwendig, um den HAPI-Validator-Fehler zu vermeiden
  * itemCodeableConcept.coding[atc-de] 0..0
  * itemReference MS
  * itemReference ^type.aggregation = #contained

* ingredient.extension[darreichungsform] MS
  * ^short = "Darreichungsform"
  * ^definition = "Angabe der Darreichungsform eines Wirkstoffes als string"
* ingredient.strength.extension[amountText] MS
  * ^short = "Angabe der Menge"
  * ^definition = "Freitextmenge des Wirkstoffs für klassische lateinische Notationen wie 'ad 100,0' oder 'quantum satis', einschließlich der Einheit."

* batch MS
  * lotNumber MS

// descriptions for fields
* contained
  * ^short = "Enthaltene Medications"
  * ^definition = "Dieses Feld kann weitere Medication Ressourcen enthalten, die hier gelistet werden. Dies tritt z.B. bei Rezepturen auf."

* code
  * ^short = "Code der Medikation"
  * ^definition = "Ein Code (oder eine Gruppe von Codes), der dieses Medikament identifiziert, oder eine textuelle Beschreibung, falls kein Code verfügbar ist."
  * coding[atc-de] 0..0

* status 1..1
* status = #completed
* manufacturer 0..0

* form
  * ^short = "Darreichungsform"
  * ^definition = "Beschreibt die Darreichungsform des Arzneimittels."
* amount
  * ^short = "Menge des Arzneimittels in einer Packung"
  * ^definition = "Angabe der Packungsgröße, bzw. der Gesamtmenge der Packung"
* ingredient
  * ^short = "Wirkstoffe"
  * ^definition = "Hier können Bestandteile, die Wirkstoffe oder keine Wirkstoffe sind, erfasst werden."
  * itemCodeableConcept
    * ^short = "Wirkstoff kodiert"
    * ^definition = "An dieser Stelle können die Informationen des Wirkstoffs in einer kodierten Art und weise angegeben werden."
  * itemReference
    * ^short = "Wirkstoff Referenz"
    * ^definition = "An dieser Stelle können Referenzen zu verlinkten Medikationen angegeben werden."
    * ^comment = "Wird in diesem Profil ausschließlich dafür genutzt, um für Rezepturen und Kombipackungen die Einzelbestandteile unter `.contained` anzugeben"
  * strength
    * ^short = "Wirkstärke"
    * ^definition = "Angabe zur Wirkstärke des Wirkstoffs"
* batch
  * ^short = "Chargeninformationen"
  * ^definition = "Informationen, die nur für Packungen gelten (nicht für Produkte)."
  * lotNumber
    * ^short = "Chargennummer"
    * ^definition = "Die zugewiesene Chargennummer einer Charge des angegebenen Produkts."
  * expirationDate
    * ^short = "Verfallsdatum"
    * ^definition = "Wann diese spezielle Charge des Produkts abläuft"

// Removed fields and elements
* extension[context]
* extension[rxPrescriptionProcessIdentifier]
* identifier 0..0
  * ^short = "Business-Identifier der Medication"
  * ^definition = "Dieses Feld bietet die Möglichkeit, für eine Medikation Business Identifier zu belegen."
  * ^comment = "Gegenüber dem E-Rezept-Fachdienst wird dieser Wert nicht ausgewertet."