# Anforderungen an den TI-Flow-Fachdienst für die $create-Operation - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $create**](op-create.md)
* **Anforderungen an den TI-Flow-Fachdienst für die $create-Operation**

## Anforderungen an den TI-Flow-Fachdienst für die $create-Operation

Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks die Felder Task.performerType und Task.PrescriptionType.valueCoding.display entsprechend dem übergebenen, gültigen Parameter Task.extension:flowType belegen.
Die Belegung ergibt sich workflow-typ abhängig aus den [Prozessparametern](./op-activate-req-fd.md).

