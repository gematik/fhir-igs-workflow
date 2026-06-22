### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Weitere Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/audit-service.html) zu finden, und unten sind die modulspezifischen Anforderungen.

<requirement conformance="SHALL" key="IG-TIFLOW-ERP-218" title="TI-Flow-Fachdienst - Versichertenprotokoll zu Rx-Operationen" version="0">
    <meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_RX_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
</requirement>

<table>
  <tr>
    <th>Operation</th>
    <th>Rolle des zugreifenden Nutzers</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>
  <tr>
    <td>http GET /rx/fhir/Task/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat das E-Rezept heruntergeladen</td>
  </tr>
  <tr>
    <td>http GET /rx/fhir/Task/&#60;id&#62;?secret</td>
    <td>Apotheke</td>
    <td>Apotheke hat die E-Rezept-Quittung heruntergeladen</td>
  </tr>
  <tr>
    <td>http GET /rx/fhir/Task</td>
    <td>Apotheke (PoPP)</td>
    <td>Die Apotheke hat die Liste der einlösbaren E-Rezepte abgerufen durch Autorisierung mittels &#60;PoPP-Anwendungsfall&#62;.</td>
  </tr>  
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$activate</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept bereitgestellt.</td>
  </tr>
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$accept</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept heruntergeladen</td>
  </tr>
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$reject</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept zurückgegeben.</td>
  </tr>
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$dispense</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept beliefert.</td>
  </tr>
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$close</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept abgeschlossen.</td>
  </tr>
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$abort</td>
    <td>Versicherter</td>
    <td>Versicherter hat das E-Rezept gelöscht.</td>
  </tr>
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$abort</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept gelöscht.</td>
  </tr>
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$abort</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept gelöscht.</td>
  </tr>
  <tr>
    <td>http GET /rx/fhir/MedicationDispense</td>
    <td>Versicherter</td>
    <td>Versicherter hat Medikament-Informationen heruntergeladen.</td>
  </tr>      
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_RX_004 Versichertenprotokoll</figcaption></div>

#### Zugriffsprotokollierung für Übermittlung für ePA Medication Service

Der TI-Flow-Fachdienst protokolliert das erfolgreiche Übermitteln von Daten für jedes E-Rezept an den Medication Service im Zugriffsprotokoll des Versicherten. Für Übermittlungsversuche, welche nicht erfolgreich durchgeführt werden konnten und für die die Übermittlung erneut versucht wird, wird kein Eintrag im Zugriffsprotokoll angelegt.

<!-- A_25962 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-36" title="TI-Flow-Fachdienst - ePA - Medication Service - Versichertenprotokoll" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
	Der TI-Flow-Fachdienst MUSS einen Aufruf der folgenden Endpunkte, für jeden betroffene E-Rezept abhängig von Ergebnis des Operationsaufrufes gemäß Tab_TIFlowFD_020 im Zugriffsprotokoll des Versicherten protokollieren:
  <table>
    <tr>
      <th>Endpunkt</th>
      <th>Ergebnis der Operation</th>
      <th>Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
    </tr>
    <tr>
      <td>/epa/medication/api/{version}/fhir/$provide-prescription-erp</td>
      <td>erfolgreich</td>
      <td>Die Verordnung wurde in die Patientenakte übertragen.</td>
    </tr>
    <tr>
      <td></td>
      <td>final nicht übermittelbar</td>
      <td>Die Verordnung konnte nicht in die Patientenakte übertragen werden.</td>
    </tr>
    <tr>
      <td>/epa/medication/api/{version}/fhir/$provide-dispensation-erp</td>
      <td>erfolgreich</td>
      <td>Die Medikamentenabgabe wurde in die Patientenakte übertragen.</td>
    </tr>
    <tr>
      <td></td>
      <td>final nicht übermittelbar</td>
      <td>Die Medikamentenabgabe konnte nicht in die Patientenakte übertragen werden.</td>
    </tr>
    <tr>
      <td>/epa/medication/api/{version}/fhir/$cancel-prescription-erp</td>
      <td>erfolgreich</td>
      <td>Die Löschinformation zum E-Rezept wurde in die Patientenakte übermittelt.</td>
    </tr>
    <tr>
      <td></td>
      <td>final nicht übermittelbar</td>
      <td>Die Löschinformation zum E-Rezept konnte nicht in die Patientenakte übermittelt werden.</td>
    </tr>
    <tr>
      <td>/epa/medication/api/{version}/fhir/$cancel-dispensation-erp</td>
      <td>erfolgreich</td>
      <td>Die Löschinformation für die Medikamentenabgabe wurde in die Patientenakte übertragen.</td>
    </tr>
    <tr>
      <td></td>
      <td>final nicht übermittelbar</td>
      <td>Die Löschinformation für die Medikamentenabgabe konnte nicht in die Patientenakte übertragen werden.</td>
    </tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>Tab_TIFlowFD_020 Versichertenprotokoll für ePA Medication Service</figcaption></div>

</requirement>

Das Ergebnis "final nicht übermittelbar" bedeutet, dass die Übermittlung auch nach den definierten Wiederholversuchen nicht erfolgreich durchgeführt werden konnte.

Für Übermittlungsversuche, welche nicht erfolgreich durchgeführt werden konnten und für die die Übermittlung erneut versucht werden soll, wird kein Eintrag im Zugriffsprotokoll angelegt.

Wenn ein Versicherter dem Einstellen von Verordnungsdaten und Dispensierinformationen durch den TI-Flow-Fachdienst widersprochen hat, wird keine Übermittlung von Daten gestartet (siehe A_25951-*). In dem Fall wird kein Eintrag im Zugriffsprotokoll angelegt.