Die FHIR-Operation `$reject` überführt einen im Status `in-progress` befindlichen `Task` in den Status `ready`, wenn der Kostenträger die Verordnung an den Versicherten zurückgibt, weil eine fehlerhafte Zuweisung vorliegt, d.h. der Kostenträger nicht zuständig ist.
 
Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $reject wird als HTTP POST auf /Task/<id>/$reject ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $reject Operation.
ToDo: link zu übergreifenden Anforderungen 

[Workflow-spezifische Anforderungen für den E-Rezept-Fachdienst](./op-reject-req-server.html)


link AFO CS - PS der Verordnungen LEI
 
-API BEschreibung aus Cap Statement
 
### Hinweis
Es gelten die Vorgaben des Basis-Workflows für E-Rezepte.
ToDo: Warnungen aus API, z.B. $create nicht auf Vorrat
 
### Geschäftslogik
ToDo: Diagram zum Ablauf
