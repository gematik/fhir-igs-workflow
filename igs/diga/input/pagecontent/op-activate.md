Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, wenn das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt. 

Diese Operation basiert auf der $activate Operation des Basis-Workflow für E-Rezepte. Für DiGA-Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen. 

### Nachricht
Die Operation $activate wird als HTTP POST auf /Task/&#60;id&#62;/$activate ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $activate Operation.
ToDo: link zu übergreifenden Anforderungen 

[Workflow-spezifische Anforderungen für den E-Rezept-Fachdienst](./op-activate-req-server.html)

[Workflowspezifische Anforderungen für das verordnende Primärsystem](./op-activate-req-client.html)

