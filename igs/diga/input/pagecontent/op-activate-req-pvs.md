Diese Seite enthält die normativen Anforderungen an ein PVS für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

{% include core.op-activate-req-pvs.md %}

### Modulspezifische Anforderungen

Um die Einlösung einer elektronischen DiGA-Verordnung (Flowtype 162) sicherzustellen, ist dem Patienten ein Ausdruck auszuhändigen, ausgenommen der Patient lehnt einen Ausdruck ab, da er bspw. ein E-Rezept-Frontend des Versicherten der Krankenkasse oder der gematik nutzt.

<!-- A_28862 -->
<requirement conformance="SHALL" key="" title="PS verordnende LEI: E-Rezept einstellen - Flowtype 162 - Patientenausdruck" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS nach dem erfolgreichen Einstellen einer Verordnung mit dem Flowtype 162 einen Patientenausdruck erstellen, sofern der Nutzer in Rücksprache mit dem Versicherten dies nicht aktiv ablehnt.
</requirement>