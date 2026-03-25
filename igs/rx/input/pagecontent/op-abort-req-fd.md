Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$abort`.

### Anforderungen aus der Core Spezifikation

{% include core.op-abort-req-fd.md %}

### Modulspezifische Anforderungen

<!-- A_19026-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-48" title="TI-Flow-Fachdienst - E-Rezept löschen - Flowtype 160/166/169/200/209 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Löschen eines Tasks für eine Verordnung mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$abort-Operation auf den in der URL referenzierten/Task/&#60;id&#62; die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  <ul>
    <li>oid_versicherter</li>
    <li>oid_praxis_arzt</li>
    <li>oid_zahnarztpraxis</li>
    <li>oid_krankenhaus</li>
    <li>oid_institution-vorsorge-reha</li>
    <li>oid_oeffentliche_apotheke</li>
    <li>oid_krankenhausapotheke</li>
  </ul>
  die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten gelöscht werden kann.
</requirement>

<!-- A_19145-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-49" title="TI-Flow-Fachdienst - E-Rezept löschen - Apotheke - Statusprüfung in-progress" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts über den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort verhindern und die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_TASK_STATUS_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Task has invalid status.</td>
        </tr>
    </table> 
    abweisen, wenn der Status des adressierten Tasks gleich "in-progress" ist und die Rolle des aufrufenden Nutzers nicht einer der folgenden Rollen entspricht:
    <ul>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
    </ul>
    damit Nutzer außerhalb der Apotheke keine Rezepte löschen, die sich aktuell in Belieferung befinden.
</requirement>

<!-- A_19146 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-50" title="TI-Flow-Fachdienst - E-Rezept löschen - Apotheke - Statusprüfung ungleich in-progress" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts über den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort verhindern und die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_TASK_STATUS_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Task has invalid status.</td>
        </tr>
    </table> 
    abweisen, wenn der Status des adressierten Tasks ungleich "in-progress" ist und die Rolle des aufrufenden Nutzers einer der folgenden Rollen entspricht: 
    <ul>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
    </ul>
    damit kein Apotheker ein Rezept löscht, das ihm nicht ausdrücklich zugewiesen wurde.
</requirement>

<!-- A_19224 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-51" title="TI-Flow-Fachdienst - E-Rezept löschen - Apotheke - Prüfung Secret" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der &#60;id&#62; adressierten /Task/&#60;id&#62;/$abort durch abgebende Leistungserbringer (Apotheken) das im URL-Parameter "?secret=..." übertragene Geheimnis gegen das im referenzierten Task enthaltene Secret in Task.identifier prüfen und bei Missmatch oder Fehlen des URL-Parameters den Aufruf mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_SECRET_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abweisen, damit ausschließlich Apotheker in Kenntnis des Secret als Berechtigte ein E-Rezept löschen.
</requirement>

<!-- A_22102-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-52" title="TI-Flow-Fachdienst - E-Rezept löschen - Flowtype 169 / 209 - Versicherter - Statusprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts mit dem Flowtype 169 oder 209 über den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort verhindern und die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_TASK_STATUS_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Task has invalid status.</td>
        </tr>
    </table> 
    abweisen, wenn der Status des adressierten Tasks ungleich "completed" ist und die Rolle des aufrufenden Nutzers der folgenden Rollen entspricht: oid_versicherter damit kein Versicherter ein E-Rezept aus einem Workflow mit Workflowsteuerung durch Leistungserbringer (169, 209) löscht, das nicht bereits beliefert wurde.
</requirement>

<!-- A_25930 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-53" title="TI-Flow-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Leistungserbringerinstitution" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/&lt;id&gt;/$abort durch eine verordnende oder abgebende Leistungserbringerinstitution die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.
</requirement>

<!-- A_25931 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-54" title="TI-Flow-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/$abort durch einen Versicherten, wenn Task.status = ready, die Daten für die Löschinformation des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>
