## Operation: $reject

Die FHIR-Operation `$reject` überführt einen im Status `in-progress` befindlichen `Task` in den Status `ready`, wenn der Kostenträger die Verordnung an den Versicherten zurückgibt, weil eine fehlerhafte Zuweisung vorliegt, d.h. der Kostenträger nicht zuständig ist.
 
Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $reject wird als HTTP POST auf /Task/<id>/$reject ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $reject Operation.
ToDo: link zu übergreifenden Anforderungen 

<!-- Quelle: A_19170-02 - E-Rezept-Fachdienst - Task zurückweisen - Rollenprüfung -->
<requirement conformance="MUST" key="IG-TIFlow-DiGA-23" title="E-Rezept-Fachdienst - Task zurückweisen - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$reject-Operation auf den in der URL referenzierten/Task/<id> die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  -	oid_kostentraeger
  die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten zurückgewiesen werden kann.
</requirement>

link: AFO FD - Der E-Rezept-Fachdienst MUSS
link AFO CS - PS der Verordnungen LEI
 
-API BEschreibung aus Cap Statement
 
### Hinweis
Es gelten die Vorgaben des Basis-Workflows für E-Rezepte.
ToDo: Warnungen aus API, z.B. $create nicht auf Vorrat
 
### Geschäftslogik
ToDo: Diagram zum Ablauf
