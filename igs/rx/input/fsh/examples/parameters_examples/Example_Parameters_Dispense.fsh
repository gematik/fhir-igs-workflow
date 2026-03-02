Instance: ExampleDispenseInputParameters
InstanceOf: EFlowRxDispenseOperationInputParameters
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication

Instance: ExampleDispenseInputParametersMultipleMedicationDispenses
InstanceOf: EFlowRxDispenseOperationInputParameters
Usage: #example
Title: "Example Dispense Parameters"
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

Instance: ExampleDispenseInputParametersKombipackung
InstanceOf: EFlowRxDispenseOperationInputParameters
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Kombipackung
  * part[medication]
    * name = "medication"
    * resource = Medication-Kombipackung


/*
Instance: INVALID-ExampleDispenseInputParametersWithoutMedication
InstanceOf: EFlowRxDispenseOperationInputParameters
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Without-Medication

Instance: INVALID-ExampleDispenseInputParametersNoParts
InstanceOf: EFlowRxDispenseOperationInputParameters
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"

Instance: INVALID-ExampleDispenseInputParametersReferenceWrong
InstanceOf: EFlowRxDispenseOperationInputParameters
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SimpleMedication

Instance: INVALID-ExampleDispenseInputParametersReferenceWrongMultiple
InstanceOf: EFlowRxDispenseOperationInputParameters
Usage: #example
Title: "Example Dispense Parameters"
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