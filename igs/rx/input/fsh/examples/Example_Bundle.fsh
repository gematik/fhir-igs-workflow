
Instance: ReceiptBundleBinary
InstanceOf: GEM_ERP_PR_Digest
Title: "Quittungs-Hash Binärdaten"
Description: "Binäre Digest-Daten für ein E-Rezept-Quittungs-Bundle"
Usage: #inline
* id = "b939a82a-9c23-4b6d-a139-f468d1b9d652"
* contentType = #application/octet-stream
* data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="

Instance: Bundle-AcceptOperation
InstanceOf: GEM_ERP_PR_Bundle_OP_Accept
Usage: #example
Title: "Beispiel Accept-Bundle"
Description: "Dieses Bundle enthält den Task und das qualifiziert signierte E-Rezept für die Accept-Operation"
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/160.000.033.491.280.78/$accept/"
* entry[erxTask].resource = TaskIn-ProgressState
* entry[erxTask].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e"
* entry[erxBinary].resource = PrescriptionBinaryWithMeta
* entry[erxBinary].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Binary/PrescriptionBinaryWithMeta"

Instance: ExampleAcceptResponseBundle
InstanceOf: GEM_ERP_PR_Bundle_OP_Accept
Usage: #example
Title: "Beispielantwort fuer die $accept-Operation"
Description: "Bundle-Antwort der $accept-Operation mit Task und qualifiziert signiertem E-Rezept"
* id = "ExampleAcceptResponseBundle"
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/160.000.033.491.280.78/$accept/"
* entry[erxTask].resource = TaskIn-ProgressState
* entry[erxTask].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e"
* entry[erxBinary].resource = PrescriptionBinaryWithMeta
* entry[erxBinary].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Binary/PrescriptionBinaryWithMeta"