# FD-Anforderungen $create - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $create (Task erzeugen)**](op-create.md)
* **FD-Anforderungen $create**

## FD-Anforderungen $create

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks die Felder Task.performerType und Task.PrescriptionType.valueCoding.display entsprechend dem übergebenen, gültigen Parameter Task.extension:flowType belegen.
Die Belegung ergibt sich workflow-typ abhängig aus den [Prozessparametern](./op-activate-req-fd.md).

