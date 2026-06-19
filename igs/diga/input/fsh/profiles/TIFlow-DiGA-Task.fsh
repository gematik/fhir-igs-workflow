Profile: TIFlowDiGATask
Parent: TIFlowTask
Id: tiflow-diga-task
Title: "TIFlow - DiGA - Task"
Description: "Task für die Verwaltung des E-Rezept-Workflows für digitale Gesundheitsanwendungen"
* insert Meta

* extension contains TIFlowAcGEM_ERP_EX_AcceptDateceptDate named acceptDate 0..1 MS
and GEM_ERP_EX_ExpiryDate named expiryDate 0..1 MS

* identifier contains PrescriptionID 1..1 MS
* identifier[PrescriptionID] only EPrescriptionId
  * ^short = "E-Rezept-ID"
  * ^definition = "Die E-Rezept-ID ist der Hauptidentifikator für die Task Ressource und den gesamten TIFlow Workflow. Dieser Identifikator wird vom TI-Flow-Fachdienst generiert und darf nicht manuell geändert werden."

* for.identifier only IdentifierKvid10

* performerType.coding 1..1
* performerType.coding from TIFlowDiGATaskOrganizationsVS (required)

* input MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type.coding.code"
  * ^slicing.rules = #closed
  * ^short = "Input Bundle"
  * ^definition = "Referenz auf Eingabe und Ergebnis der DiGA Verordnung während des Prozesses"
* input contains ePrescription 0..1 and patientReceipt 0..1

// QES Binary ePrescription
* input[ePrescription] 0..1 MS
  * ^short = "QES-Binary der DiGA Verordnung"
  * value[x] only Reference(TIFlowDiGABinary)
  * type.coding 1..1
  * type.coding from GEM_ERP_VS_DocumentType (required)
    * system 1..1
    * code 1..1
    * code = #1 (exactly)

// ePriscription for the patient
* input[patientReceipt] 0..1 MS
  * ^short = "JSON-Bundle der Verordnung, das von einem FdV konsumiert werden soll"
  * value[x] only Reference(Bundle)
    * ^comment = "Dies ist ein Bundle eines Rezepts vom Profil [KBV_PR_EVDGA_Bundle](https://simplifier.net/evdga/kbv_pr_evdga_bundle)."
  * type.coding 1..1
  * type.coding from GEM_ERP_VS_DocumentType (required)
    * system 1..1
    * code 1..1
    * code = #2 (exactly)