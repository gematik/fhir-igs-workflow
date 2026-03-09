# Systemüberblick - E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte v1.1.0-draft

E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Systemüberblick**

## Systemüberblick

### Einordnung in die Telematikinfrastruktur

TODO: Fix link

E-Rezepts für PKV-Versicherte wird in [gemIG_eRp_Prescription] beschrieben. Die App des Kostenträgers ist eine neue Komponente, zu der das E-Rezept-Frontend des Versicherten eine Schnittstelle für Abrechnungsinformationen anbietet. Die App des Kostenträgers ist keine Komponente der TI. Der Export als PDF ermöglicht weitere Übermittlungskanäle (z. B. E-Mail, Webportal).

### Technisches Konzept

TODO: Fix link

Der Workflow-Typ “200” und der Workflow-Typ “209” werden in [gemIG_eRp_Prescription] beschrieben.

Für E-Rezepte der Workflow-Types “200” und “209” können die Abrechnungsinformationen über den E-Rezept-Fachdienst an den Versicherten übermittelt werden.

