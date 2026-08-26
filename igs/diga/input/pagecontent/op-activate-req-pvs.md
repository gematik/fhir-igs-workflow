Diese Seite enthält die normativen Anforderungen an ein PVS für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Um die Einlösung einer elektronischen DiGA-Verordnung (Flowtype 162) sicherzustellen, ist dem Patienten ein Ausdruck auszuhändigen, ausgenommen der Patient lehnt einen Ausdruck ab, da er bspw. ein TI-Flow-FdV der Krankenkasse oder der gematik nutzt.

<!-- A_28862 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A29" title="PS verordnende LEI: E-Rezept einstellen - Flowtype 162 - Patientenausdruck" version="0">
  <meta lockversion="false"/>
  <actor name="PS_TI-Flow_verordnend" description="PS-Schnittstelle für TI-Flow/verordnendes System">
    <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
  </actor>
  Das PS der verordnenden LEI MUSS nach dem erfolgreichen Einstellen einer Verordnung mit dem Flowtype 162 einen Patientenausdruck erstellen, sofern der Nutzer in Rücksprache mit dem Versicherten dies nicht aktiv ablehnt.
</requirement>