
Communication wird für die Kommunikation zwischen Versicherten und Kostenträger verwendet.

## POST /Communication
- Zuweisung von Verordnungen durch den Versicherten an den Kostenträger. Der Payload ist hierbei optional (Kardinalitaet 0..1)
- Übermittlung des Freischaltcodes dürch den Kostenträger an den Versicherten.

ToDo: Afo für FD zum Prüfen des Payload ? Afo für FdV für Profilauswahl

<requirement conformance="SHALL" key="IG-TIFlow-DiGA-NEU" title="CS Kostenträger: Nachricht versenden - Flowtype 162 - Communication erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Konformitätsbestätigung"/>
  </actor>
  Das Clientsystem des Kostenträgers MUSS im Anwendungsfall "Nachricht an Versicherten versenden" eine FHIR-Ressource mit dem Profil GEM_ERP_PR_Communication_DiGA erstellen.
</requirement>

-API Beschreibung aus Cap Statement

## GET /Communication
- Abruf von Zuweisungen durch den Kostenträger
- Abruf von Rückmeldungen durch den Versicherten

-API Beschreibung aus Cap Statement
