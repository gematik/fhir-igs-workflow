Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$abort`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch. 

<!-- A_20546-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-140" title="TI-Flow-Fachdienst - E-Rezept löschen - Versicherter - Prüfung KVNR" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
    Der TIFlow-Fachdienst MUSS beim Löschen eines E-Rezepts durch einen Versicherten, wenn der HTTP-Request keinen HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." enthält, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in Task.for hinterlegte KVNR des begünstigten Patienten prüfen und bei Missmatch den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte als Berechtigter ohne Kenntnis des AccessCodes ein E-Rezept löscht.
</requirement>

<!-- A_19120-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-141" title="TI-Flow-Fachdienst - E-Rezept löschen - Verordnender - Prüfung AccessCode" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten/Task/&#60;id&#62;/$abort durch verordnende Leistungserbringer den im HTTP-Header "X-AccessCode" gegen den im referenzierten Task enthaltenen AccessCode prüfen und bei Missmatch oder Fehlen im HTTP-Header, den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die verordnende Leistungserbringerinstitution in Kenntnis des AccessCodes als Berechtigte ein E-Rezept löschen.
</requirement>

<!-- A_19120-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-142" title="TI-Flow-Fachdienst - E-Rezept löschen - Verordnender - Prüfung Status" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten/Task/&#60;id&#62;/$abort durch verordnende Leistungserbringer den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "ready" ist, damit die verordnende Leistungserbringerinstitution eine Verordnung nur löschen kann, wenn sie sich noch nicht in Belieferung befindet oder beliefert wurde.
</requirement>

<!-- A_19027-06 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-143" title="TI-Flow-Fachdienst - E-Rezept löschen - Medizinische und personenbezogene Daten löschen" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten /Task/&#60;id&#62;/$abort alle personenbezogenen medizinischen Daten, außer der KVNR in Task.for, aus dem referenzierten Task entfernen. Dies gilt insbesondere für:
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-144" title="TI-Flow-Fachdienst - E-Rezept löschen - Status" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten /Task/&#60;id&#62;/$abort den Status des Tasks Task.status auf den Wert "cancelled" setzen, damit der Task nicht weiter bearbeitet werden kann.
</requirement>

<!-- A_28131 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-145" title="TI-Flow-Fachdienst - E-Rezept löschen - Push Notification Versicherter" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$abort bei erfolgreichem Abschluss der Operation, wenn die Rolle des aufrufenden Nutzers ungleich oid_versicherter ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.abort" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>