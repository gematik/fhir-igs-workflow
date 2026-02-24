Die FHIR-Operation `$reject` überführt einen im Status `in-progress` befindlichen `Task` in den Status `ready`, wenn der Kostenträger die Verordnung an den Versicherten zurückgibt, weil eine fehlerhafte Zuweisung vorliegt, d.h. der Kostenträger nicht zuständig ist.
 
Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $reject wird als HTTP POST auf /Task/&#60;id&#62;/$reject ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $reject Operation.
ToDo: link zu übergreifenden Anforderungen 

[Workflow-spezifische Anforderungen für den E-Rezept-Fachdienst](./op-reject-req-server.html)


link AFO CS - PS der Verordnungen LEI
 
-API BEschreibung aus Cap Statement
 
### Hinweis
Falls es bei der Verarbeitung einer Zuweisung einer digitalen Gesundheitsanwendung zu
einem Fehler kommt, bspw. wenn der Nutzer nicht beim Kostenträger versichert ist, muss
das Clientsystem den Nutzer informieren und das E-Rezept zur weiteren Nutzung
zurückgeben.

Hierzu führt der Kostenträger die E-Rezept-Fachdienst Operation "$reject" aus und
übermittelt dem Nutzer eine Communication GEM_ERP_PR_Communication_DiGA in der der Kostenträger
angeben kann, warum die Verordnung nicht bearbeitet werden kann.
 
### Geschäftslogik
ToDo: Diagram zum Ablauf
