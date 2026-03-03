Die FHIR-Operation `$reject` überführt einen im Status `in-progress` befindlichen `Task` in den Status `ready`, wenn der Kostenträger die Verordnung an den Versicherten zurückgibt, weil eine fehlerhafte Zuweisung vorliegt, d.h. der Kostenträger nicht zuständig ist.
 
Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $reject wird als HTTP POST auf /Task/&#60;id&#62;/$reject ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$reject`](./op-reject-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für KTR zu `$reject`](./op-reject-req-ktr.html): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

 
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
