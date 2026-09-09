Instance: Example-GEM-ERPCHRG-ChargeItem-PATCH-Response
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title: "Aktualisierte Abrechnungsinformationen des Versicherten"
Description: "ChargeItem des E-Rezept-Fachdienstes nach der Markierung durch den Versicherten, ob die Abrechnungsdaten bei Abrechnungsstellen eingereicht wurden"
Usage: #example
* insert ChargeItemComplete
* extension[markingFlag]
  * extension[insuranceProvider].valueBoolean = true
  * extension[taxOffice].valueBoolean = true
