# Löschfristen - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.3

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* **Löschfristen**

## Löschfristen

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter Ressourcen.

> **Hinweis:** Spezifische Löschfristen für Anwendungsmodule und deren Workflows und werden in den jeweiligen Implementation Guides definiert.

## Allgemeine Anforderungen zur Protokollierung beim Löschen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS eine gespeicherte Ressource AuditEvent nach 3 Jahren ab dem Erzeugungsdatum AuditEvent.recorded innerhalb von einem Monat löschen.

