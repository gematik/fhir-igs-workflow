Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$abort`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch. 

<!-- A_20546-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-295" title="E-Rezept-Fachdienst - E-Rezept löschen - Versicherter - Prüfung KVNR" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
    Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts durch einen Versicherten, wenn der HTTP-Request keinen HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." enthält, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in Task.for hinterlegte KVNR des begünstigten Patienten prüfen und bei Missmatch den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte als Berechtigter ohne Kenntnis des AccessCodes ein E-Rezept löscht.
</requirement>

<!-- A_19120-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-296" title="E-Rezept-Fachdienst - E-Rezept löschen - Verordnender - Prüfung AccessCode und Status" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
    Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten/Task/&#60;id&#62;/$abort durch verordnende Leistungserbringer den im HTTPHeader "X-AccessCode" gegen den im referenzierten Task enthaltenen AccessCode prüfen und bei Missmatch oder Fehlen im HTTP-Header oder wenn der Task.Status ungleich "ready" ist, den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die verordnende Leistungserbringerinstitution in Kenntnis des AccessCodes als Berechtigte ein E-Rezept löschen.
</requirement>

<!-- A_19027-06 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-296" title="E-Rezept-Fachdienst - E-Rezept löschen - Medizinische und personenbezogene Daten löschen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten /Task/&#60;id&#62;/$abort alle personenbezogenen medizinischen Daten, außer der KVNR in Task.for, aus dem referenzierten Task entfernen. Dies gilt insbesondere für:
  <ul>
    <li>Task.input --> löschen (inkl. aller referenzierten Elemente)</li>
    <li>Task.output --> löschen (inkl. aller referenzierten Elemente)</li>
    <li>Task.identifier (AccessCode) --> löschen</li>
    <li>Task.identifier (Secret, falls vorhanden) --> löschen</li>
    <li>Task.extension:lastMedicationDispense (Zeitstempel, falls vorhanden) --> löschen</li>
    <li>Task.owner --> löschen</li>
    <li>Medication --> die in MedicationDispense.medication referenzierte Medication löschen</li>
    <li>MedicationDispense --> die in MedicationDispense.supportingInformation auf Task.id verweist löschen</li>
    <li>Communication --> die in Communication.basedOn auf Task.id verweist</li>
  </ul>
  damit dem Betroffenenrecht auf Löschen durch den Versicherten entsprochen wird und beim Löschen durch den Verordnenden dem Versicherten eine aussagekräftige Fehlermeldung durch einen Apotheker vermittelt werden kann.
</requirement>

Hinweis: Die KVNR in Task.for wird nicht gelöscht, damit der Versicherte den Status des Task mit dem E-Rezept-FdV abrufen kann.

Bestehende Übermittlungsaufträge in den ePA Medication Service für das zu löschende E-Rezept werden nicht gelöscht.

<!-- A_19121 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-296" title="E-Rezept-Fachdienst - E-Rezept löschen - Status" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten /Task/&#60;id&#62;/$abort den Status des Tasks Task.status auf den Wert "cancelled" setzen, damit der Task nicht weiter bearbeitet werden kann.
</requirement>

<!-- A_28131 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-296" title="E-Rezept-Fachdienst - E-Rezept löschen - Push Notification Versicherter" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$abort bei erfolgreichem Abschluss der Operation, wenn die Rolle des aufrufenden Nutzers ungleich oid_versicherter ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.abort" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>