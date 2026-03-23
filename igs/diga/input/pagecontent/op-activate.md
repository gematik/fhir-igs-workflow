Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, wenn das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt. 

Diese Operation basiert auf der $activate Operation des Basis-Workflow für E-Rezepte. Für DiGA-Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen. 

### Nachricht
Die Operation $activate wird als HTTP POST auf /Task/&#60;id&#62;/$activate ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$activate`](./op-activate-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für PVS zu `$activate`](./op-activate-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.


