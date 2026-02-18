Instance: ExampleCloseInputParameters
InstanceOf: EFlowRxCloseOperationInputParameters
Usage: #example
Title: "Beispiel Close-Parameter"
Description: "Beispiel für Eingabeparameter der Close-Operation mit einfacher Medikamentenabgabe"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication

Instance: ExampleCloseInputParametersMultipleMedicationDispenses
InstanceOf: EFlowRxCloseOperationInputParameters
Title: "Beispiel Close-Parameter mit mehreren MedicationDispenses"
Description: "Beispiel für Eingabeparameter der Close-Operation mit mehreren Medikamentenabgaben"
Usage: #example
* parameter[rxDispensation][+]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication
* parameter[rxDispensation][+]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-2
  * part[medication]
    * name = "medication"
    * resource = SimpleMedication

Instance: ExampleCloseInputParametersKombipackung
InstanceOf: EFlowRxCloseOperationInputParameters
Usage: #example
Title: "Beispiel Close-Parameter für Kombipackung"
Description: "Beispiel für Eingabeparameter der Close-Operation für eine Kombipackung"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Kombipackung
  * part[medication]
    * name = "medication"
    * resource = Medication-Kombipackung

Instance: ExampleCloseInputParametersRezeptur
InstanceOf: EFlowRxCloseOperationInputParameters
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Rezeptur
  * part[medication]
    * name = "medication"
    * resource = Medication-Rezeptur

/*
Instance: INVALID-ExampleCloseInputParametersWithoutMedication
InstanceOf: EFlowRxCloseOperationInputParameters
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Without-Medication

Instance: INVALID-ExampleCloseInputParametersWithoutMedicationDispense
InstanceOf: EFlowRxCloseOperationInputParameters
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medication]
    * name = "medication"
    * resource = SimpleMedication

Instance: INVALID-ExampleCloseInputParametersNoParts
InstanceOf: EFlowRxCloseOperationInputParameters
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"

Instance: INVALID-ExampleCloseInputParametersReferenceWrong
InstanceOf: EFlowRxCloseOperationInputParameters
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SimpleMedication

Instance: INVALID-ExampleCloseInputParametersReferenceWrongMultiple
InstanceOf: EFlowRxCloseOperationInputParameters
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation][+]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = Medication-Without-Strength-Code
* parameter[rxDispensation][+]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-2
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication
*/