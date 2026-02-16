Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, wenn das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt. 
Für DiGA-Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen. Die allgemeinen Anforderungen des Basis-Workflows gelten unverändert.

## Nachricht
Die Operation $activate wird als HTTP POST auf /Task/<id>/$activate ausgeführt.

## Anforderungen an Schnittstelle

[Anforderungen für den E-Rezept-Fachdienst](./op-activate-req-server.html)
[Anforderungen für das verordnende Primärsystem](./op-activate-req-client.html)

<!-- folgende Anforderungen gelten für den FD und können auf eine andere Seite ausgelagert und hier verlinkt werden. --> 

