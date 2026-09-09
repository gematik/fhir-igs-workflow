Instance: Example-GEM-ERPCHRG-ChargeItem-PUT-Request
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title: "PKV-Abgabedatensatz ändern"
Description: "Apotheke überschreibt mit dem AccessCode zum Ändern den zuvor gespeicherten PKV-Abgabedatensatz beim E-Rezept-Fachdienst"
Usage: #example
* contained = Example-Binary
* insert ChargeItemComplete
* supportingInformation[dispenseItemBinary] = Reference(Example-Binary)