Die FHIR-Operation `$abort` überführt einen im Status `ready` befindlichen `Task` in den Status `cancelled`, nachdem der Verordnende die Verordnung gelöscht hat. 
Die FHIR-Operation `$abort` überführt einen im Status `ready` oder `completed` befindlichen `Task` in den Status `cancelled`, nachdem der Versicherte die Verordnung gelöscht hat.

Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $abort wird als HTTP POST auf /Task/<id>/$abort ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $abort Operation.
ToDo: link zu übergreifenden Anforderungen 

Es gibt keine workflow-spezifischen Anforderungen für den E-Rezept-Fachdienst.

Es gibt keine workflow-spezifischen Anforderungen für das PS der verordnenden LEI.

Es gibt keine workflow-spezifischen Anforderungen für das E-Rezept-FdV.

 
-API BEschreibung aus Cap Statement
 
### Hinweis
keine
 
### Geschäftslogik
ToDo: Diagram zum Ablauf