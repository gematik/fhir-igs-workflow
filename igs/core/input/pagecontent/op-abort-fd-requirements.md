Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$abort`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch. 

<!-- A_20546-03 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - E-Rezept löschen - Versicherter - Prüfung KVNR" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
    Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts durch einen Versicherten, wenn der HTTP-Request keinen HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." enthält, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in Task.for hinterlegte KVNR des begünstigten Patienten prüfen und bei Missmatch den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte als Berechtigter ohne Kenntnis des AccessCodes ein E-Rezept löscht.
</requirement>

 <!-- A_19120-03 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - E-Rezept löschen - Verordnender - Prüfung AccessCode und Status" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
    Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten/Task/&#60;id&#62;/$abort durch verordnende Leistungserbringer den im HTTPHeader "X-AccessCode" gegen den im referenzierten Task enthaltenen AccessCode prüfen und bei Missmatch oder Fehlen im HTTP-Header oder wenn der Task.Status ungleich "ready" ist, den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die verordnende Leistungserbringerinstitution in Kenntnis des AccessCodes als Berechtigte ein E-Rezept löschen.
</requirement>