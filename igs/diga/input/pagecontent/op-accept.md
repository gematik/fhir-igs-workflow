## Operation: $accept

Die FHIR-Operation `$acsept` überführt einen im Status `ready` befindlichen `Task` in den Status `in-progress`, nachdem der Kostenträger die Verordnung vom Fachdienst abgerufen hat.

### Nachricht
Die Operation $accept wird als HTTP POST auf /Task/<id>/$accept ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $abort Operation.
ToDo: link zu übergreifenden Anforderungen 


Frage: was ist mit A_25993 - E-Rezept-Fachdienst - Task akzeptieren - Flowtype 162 - Rollenprüfung ? Kommt die Afo hierhin?

<!-- Quelle: A_25993 - E-Rezept-Fachdienst - Task akzeptieren - Flowtype 162 - Rollenprüfung -->
<requirement conformance="MUST" key="IG-TIFlow-DiGA-17" title="E-Rezept-Fachdienst - Task akzeptieren - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Abrufen eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten/Task/<id> die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  •	oid_kostentraeger
  die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten abgerufen werden kann.
</requirement>






### Hinweis
Es gelten die Vorgaben des Basis-Workflows für E-Rezepte.
