# Anforderungen an den verordnende Primärsystem für die $activate-Operation - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $activate**](op-activate.md)
* **Anforderungen an den verordnende Primärsystem für die $activate-Operation**

## Anforderungen an den verordnende Primärsystem für die $activate-Operation

Diese Seite enthält die normativen Anforderungen an ein PVS für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Um die Einlösung einer elektronischen DiGA-Verordnung (Flowtype 162) sicherzustellen, ist dem Patienten ein Ausdruck auszuhändigen, ausgenommen der Patient lehnt einen Ausdruck ab, da er bspw. ein E-Rezept-Frontend des Versicherten der Krankenkasse oder der gematik nutzt.

funkt. Eignung: HerstellererklärungDas PS der verordnenden LEI MUSS nach dem erfolgreichen Einstellen einer Verordnung mit dem Flowtype 162 einen Patientenausdruck erstellen, sofern der Nutzer in Rücksprache mit dem Versicherten dies nicht aktiv ablehnt.

