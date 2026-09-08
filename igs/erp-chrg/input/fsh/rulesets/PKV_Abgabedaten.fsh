Instance: Example-DAV-PKV-Abgabedatensatz
InstanceOf: DAV_PKV_PR_ERP_AbgabedatenBundle
Usage: #example
* insert PKV_Abgabedatensatz

RuleSet: PKV_Abgabedatensatz
* identifier.value = "200.000.000.000.000.01"
* insert DateTimeStamp(timestamp)
* entry[ERezeptAbgabedaten].fullUrl = $URN_DAV_PKV_AbgabedatenComposition
* entry[ERezeptAbgabedaten].resource = Example-DAV-PKV-AbgabedatenComposition
* entry[Apotheke].fullUrl = $URN_DAV_PKV_AbgabedatenApotheke
* entry[Apotheke].resource = Example-DAV-PKV-AbgabedatenApotheke
* entry[Abgabeinformationen].fullUrl = $URN_DAV_PKV_Abgabeinformationen
* entry[Abgabeinformationen].resource = Example-DAV-PKV-Abgabeinformationen
* entry[Abrechnungszeilen].fullUrl = $URN_DAV_PKV_Abrechnungszeilen
* entry[Abrechnungszeilen].resource = Example-DAV-PKV-Abrechnungszeilen

Instance: Example-DAV-PKV-AbgabedatenComposition
InstanceOf: DAV_PKV_PR_ERP_AbgabedatenComposition
Usage: #inline
* id = $UUID_DAV_PKV_AbgabedatenComposition
* status = #final
* type = $DAV-CS-ERP-CompositionTypes#ERezeptAbgabedaten
* insert DateTime(date)
* author = Reference($URN_DAV_PKV_AbgabedatenApotheke)
* section[Abgabeinformationen].entry = Reference($URN_DAV_PKV_Abgabeinformationen)
* section[Apotheke].entry = Reference($URN_DAV_PKV_AbgabedatenApotheke)

Instance: Example-DAV-PKV-AbgabedatenApotheke
InstanceOf: DAV_PKV_PR_ERP_Apotheke
Usage: #inline
* id = $UUID_DAV_PKV_AbgabedatenApotheke
* identifier.value = "308412345"
* name = "Adler-Apotheke"
* address[+]
  * type = #physical
  * line = "Taunusstraße 89"
  * line.extension[Strasse].valueString = "Taunusstraße"
  * line.extension[Hausnummer].valueString = "89"
  * city = "Langen"
  * postalCode = "63225"
  * country = "D"

Instance: Example-DAV-PKV-Abgabeinformationen
InstanceOf: DAV_PKV_PR_ERP_Abgabeinformationen
Usage: #inline
* id = $UUID_DAV_PKV_Abgabeinformationen
* extension[Abrechnungszeilen].valueReference = Reference($URN_DAV_PKV_Abrechnungszeilen)
* extension[AbrechnungsTyp].valueCodeableConcept = $DAV-PKV-CS-ERP-AbrechnungsTyp#1
* medicationCodeableConcept = $cs-data-absent-reason#not-applicable
* performer.actor = Reference($URN_DAV_PKV_AbgabedatenApotheke)
* authorizingPrescription.identifier.value = "200.000.000.000.000.01"
* insert Date(whenHandedOver)

Instance: Example-DAV-PKV-Abrechnungszeilen
InstanceOf: DAV_PKV_PR_ERP_Abrechnungszeilen
Usage: #inline
* id = $UUID_DAV_PKV_Abrechnungszeilen
* lineItem[+]
  * sequence = 1
  * chargeItemCodeableConcept = $cs-pzn#03879429
  * chargeItemCodeableConcept.text = "BELOC-ZOK mite 47,5 mg Retardtabletten 30 St"
  * priceComponent
    * extension[MwSt-Satz].valueDecimal = 19.00
    * extension[KostenVersicherter].extension[Kategorie].valueCodeableConcept = $DAV-PKV-CS-ERP-KostenVersicherterKategorie#0
    * extension[KostenVersicherter].extension[Kostenbetrag].valueMoney.value = 0.00
    * extension[KostenVersicherter].extension[Kostenbetrag].valueMoney.currency = #EUR
    * type = #informational
    * factor = 1
    * amount.value = 21.04
    * amount.currency = #EUR
* totalGross.extension[Gesamtzuzahlung].valueMoney.value = 0.00
* totalGross.extension[Gesamtzuzahlung].valueMoney.currency = #EUR
* totalGross.value = 21.04
* totalGross.currency = #EUR