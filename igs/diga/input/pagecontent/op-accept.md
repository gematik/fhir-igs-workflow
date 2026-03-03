Die FHIR-Operation `$acsept` überführt einen im Status `ready` befindlichen `Task` in den Status `in-progress`, nachdem der Kostenträger die Verordnung vom Fachdienst abgerufen hat.

### Nachricht
Die Operation $accept wird als HTTP POST auf /Task/&#60;id&#62;/$accept ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$accept`](./op-accept-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für KTR zu `$accept`](./op-accept-req-ktr.html): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.
