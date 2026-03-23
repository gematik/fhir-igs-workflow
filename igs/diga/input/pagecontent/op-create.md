Die FHIR-Operation `$create` erstellt einen Workflow im TI-Flow-Fachdienst.

Diese Operation basiert auf der $create Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $create wird als HTTP POST auf /Task/$create ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$create`](./op-create-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für PVS zu `$create`](./op-create-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.


 
-API BEschreibung aus Cap Statement
 
### Hinweis
Es ist nicht zulässig Verordnungs-IDs "auf Vorrat" am TI-Flow-Fachdienst abzufragen.
 
### Geschäftslogik
ToDo: Diagram zum Ablauf