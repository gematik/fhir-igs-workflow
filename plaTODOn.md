Aktuell:

SD.url = https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense
meta.profile = https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.6

## Option 1
SD.url = https://gematik.de/fhir/tiflow/rx/StructureDefinition/rx-medicationdispense
SD.version = 1.0.0
meta.profile = https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.6
-> Validatoren finden das Profil nicht

## Option 2 - special-url

### Legacy Profile
SD.url = https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense
SD.version = 1.7.0
meta.profile = https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.7

### Neue Profile mit neuem schema
SD.url = https://gematik.de/fhir/tiflow/core/StructureDefinition/GEM_ERP_PR_MedicationDispense_New
SD.version = 1.0.0
meta.profile = https://gematik.de/fhir/tiflow/core/StructureDefinition/GEM_ERP_PR_MedicationDispense_New|1.0

## Option 3 - harte Umstellung 
SD.url = https://gematik.de/fhir/tiflow/rx/StructureDefinition/rx-medicationdispense
SD.version = 1.0.0
meta.profile = https://gematik.de/fhir/tiflow/rx/StructureDefinition/rx-medicationdispense|1.0

## Option 4

- schleichender Übergang, Änderungen an Profilen auch Namen ändern, aber nicht alles gleichzeitig
- Version vom IG und den Profilen auf 2.0.0
- diga: Eigene Operation und Namensanpassung der diga Profile
- alles was kein meta.profile hat kann nach neuem Naming Schema umbenannt werden

### meta.profile
- Überlegung ob man meta.profile nicht profiliert
- clients können angeben, müssen aber nicht
  - wenn angegeben wird genau dagegen validiert
- clients können nicht angeben
  - beides gleichzeitig
  - FD taggt mit höchst gültiger Version
- Vorteil: Anpassung nicht notwendig, wenn keine Änderungen der Struktur