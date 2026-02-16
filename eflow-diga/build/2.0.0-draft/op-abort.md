## Operation: $abort

Die FHIR-Operation `$abort` überführt einen im Status `ready` befindlichen `Task` in den Status `cancelled`, nachdem der Verordnende die Verordnung gelöscht hat. 
Die FHIR-Operation `$abort` überführt einen im Status `ready` oder `completed` befindlichen `Task` in den Status `cancelled`, nachdem der Versicherte die Verordnung gelöscht hat.

Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $abort wird als HTTP POST auf /Task/<id>/$abort ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $abort Operation.
ToDo: link zu übergreifenden Anforderungen 

Es gibt keine workflow-spezifischen Anforderungen für den E-Rezept-Fachdienst.

link: AFO FD - Der E-Rezept-Fachdienst MUSS
link AFO CS - PS der Verordnungen LEI
 
-API BEschreibung aus Cap Statement
 
### Hinweis
ToDo: Warnungen aus API, z.B. $create nicht auf Vorrat
 
### Geschäftslogik
ToDo: Diagram zum Ablauf