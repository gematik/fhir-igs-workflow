
<!-- TI-Flow-26-2 PKV-FD-09 -->
Die Übermittlung von Daten an den ePA Medication Service wird über einen asynchronen Prozess realisiert. Diese Übertragung wird durch den Aufruf eines Clients am E-Rezept-Fachdienst ausgelöst, bspw. durch die Bereitstellung der Verordnung. Nachdem die Verordnung eingestellt wurde, wird der REST-Aufruf gegenüber dem Client bestätigt und die Verbindung abgebaut. Anschließend erfolgt die Aufbereitung und Übertragung der Daten an den ePA Medication Service.

Ein Clientsystem, welches einen Aufruf gegenüber dem E-Rezept-Fachdienst durchführt, muss dadurch nicht warten, bis die Übertragung an das ePA Aktensystem durchgeführt wurde.

Die asynchrone Verarbeitung der Übertragung hat neben den Vorteilen für die Clientsysteme die folgenden Konsequenzen:

- Clientsysteme wissen nach Abschluss ihres Operationsaufrufes nicht, ob und wann die Übertragung der Daten an den ePA Medication Service erfolgt
- Es kann im Livebetrieb nicht nachvollzogen werden, warum eine Übertragung nicht erfolgreich stattgefunden hat, weil der Response des ePA Medication Service mit der Fehlerbeschreibung nicht an das Clientsystem übermittelt wird.


<!-- A_25944-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A294" title="TI-Flow-Fachdienst - ePA - Flowtype 160/166/169/200/209" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS sicherstellen, dass ausschließlich Daten zu Tasks mit dem Flowtype 160, 166, 169, 200 oder 209 für den ePA Medication Service bereitstellt werden.
</requirement>

<!-- A_25945 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A295" title="TI-Flow-Fachdienst - ePA - asynchrone Bereitstellung und Übermittlung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS das Übermitteln der Daten an den ePA Medication Service asynchron zur Bereitstellung der Daten durch die Clientsysteme umsetzen, damit für das bereitstellende Primärsystem der verordnenden oder abgebenden Leistungserbringerinstitution oder E-Rezept-FdV keine verlängerte Verarbeitungsdauer der auslösenden Operation auftritt.
</requirement>


### Mappingregeln

<!-- A_25946 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A296" title="TI-Flow-Fachdienst - ePA - Mapping" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Bereitstellen der Daten für ePA Medication Service die durch Clientsysteme des TI-Flow-Fachdienst bereitgestellten Ressourcen (E-Rezept FHIR Ressource) in Ressourcen des ePA Medication Service (ePA Medication Service FHIR Ressourcen) gemäß der Tabelle Tab_eRPFD_019 unter Beachtung der Ausnahmeregelungen überführen.
    
<table>
<tr>
<th>Ausgangsprofil der E-Rezept FHIR Ressourcen</th>
<th>Zielprofil der ePA Medication Service FHIR Ressourcen</th>
<th>Ausnahmeregelungen des Mappings</th>
</tr>

<tr>
<td>
KBV_PR_ERP_Medication_PZN
https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN
</td>
<td>
Medication resource for the ePA Medication Service
https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
</td>
<td>
Keine Übernahme von "extension:Kategorie"-Elementen
</td>
</tr>

<tr>
<td>
KBV_PR_ERP_Medication_Ingredient
https://simplifier.net/erezept/kbvprerpmedicationingredient
</td>
<td>
Medication resource for the ePA Medication Service
https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
</td>
<td></td>
</tr>

<tr>
<td>
KBV_PR_ERP_Medication_Compounding
https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding
</td>
<td>
Medication resource for the ePA Medication Service
https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
</td>
<td>
Keine Übernahme von "extension:Kategorie"-Elementen
</td>
</tr>

<tr>
<td>
KBV_PR_ERP_Medication_FreeText
https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText
</td>
<td>
Medication resource for the ePA Medication Service
https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
</td>
<td></td>
</tr>

<tr>
<td>
KBV_PR_ERP_Prescription
https://simplifier.net/erezept/kbvprerpprescription
</td>
<td>
MedicationRequest resource for the ePA Medication Service
https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request
</td>
<td>
Setzen des Pattern "filler-order" für .inten
Keine Übernahme von "insurance"-Elemente
Keine Übernahme von "requester.reference"-Elemente
Keine Übernahme von "subject.reference"-Elemente
Keine Übernahme von "extension:Notdienstgebuehr"-Elemente
Keine Übernahme von "extension:Zuzahlungsstatus"-Elemente
Keine Übernahme von "dosageInstruction.extension:Dosierungskennzeichen"-Elemente
Keine Übernahme von "MedicationRequest.extension:Unfallinformationen"-Elementen
</td>
</tr>

<tr>
<td>
KBV_PR_FOR_Practitioner
https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner
</td>
<td>
Practitioner in gematik Directory
https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory
</td>
<td>
Überschreiben/Setzen der "identifier:Telematik-ID" des Arztes aus dem Signaturzertifikat der QES
</td>
</tr>

<tr>
<td>
KBV_PR_FOR_Organization
https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization
</td>
<td>
Organization in gematik Directory
https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory
</td>
<td>
Überschreiben/Setzen des "identifier:TelematikID" mit zeta-user-info.identifier aus den Nutzerinformationen des verwendeten Operationsaufrufes
</td>
</tr>

<tr>
<td>
GEM_ERP_PR_MedicationDispense
https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense
</td>
<td>
EPA MedicationDispense
https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-dispense
</td>
<td></td>
</tr>

<tr>
<td>
GEM_ERP_PR_Medication
https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication
</td>
<td>
Medication resource for the ePA Medication Service
https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication
</td>
<td></td>
</tr>
</table>

<div><figcaption><strong>Tabelle: </strong>Übersicht Mapping und Ausnahmeregelungen des Mappings</figcaption></div>

</requirement>


<!-- A_25947 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A297" title="TI-Flow-Fachdienst - ePA - provide-dispensation-erp - Organisation-Ressource" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Bereitstellen der MedicationDispense für den ePA Medication Service eine Ressource des Profils https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory erstellen und Organization.identifier:TelematikID mit zeta-user-info.identifier sowie Organization.name mit zeta-user-info.commonName aus den Nutzerinformationen belegen.
</requirement>

<!-- A_25948 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A298" title="TI-Flow-Fachdienst - ePA - Mapping - Übernahme von Werten zwischen Profilen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Bereitstellen der Daten für den ePA Medication Service sicherstellen, dass Datenwerte der E-Rezept FHIR Ressource übernommen werden, sofern das entsprechende Element in dem Ausgangs- und Zielprofilen vorhanden ist.
</requirement>

<!-- A_25949 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A299" title="TI-Flow-Fachdienst - ePA - Mapping - Handhabung von Extensions" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Bereitstellen der Daten für den ePA Medication Service sicherstellen, dass alle Extensions aus den E-Rezept FHIR-Ressourcen in die ePA Medication Service FHIR-Ressource übernommen werden, es sei denn, eine Ausnahmeregelung ist in der Tab_eRPFD_019 festgelegt.
</requirement>

*Hinweis: Falls in GEM_ERP_PR_MedicationDispense eine Extension MedicationDispense.medication[x].extension:dataAbsentReason vorhanden ist, wird diese in die EPA MedicationDispense übernommen. Der TI-Flow-Fachdienst loggt die Verwendung dieser Extension in den Betriebsdaten.*


Für die Kommunikation mit dem Medication Service wurde [gemIG_ePA_Medication] definiert. Dieser FHIR-IG enthält Spezifikationen für Schnittstellen und Datenmodelle des ePA Medication Service.
<!-- ToDo Link [gemIG_ePA_Medication] -->

<!-- A_28691 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A300" title="TI-Flow-Fachdienst - ePA - Übermittlung - Spezifikation der Schnittstellen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei der Übermittlung von Daten an den Medication Service die Schnittstellen nach [gemIG_ePA_Medication] verwenden.
</requirement>

<!-- A_25952 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A301" title="TI-Flow-Fachdienst - ePA - Übermittlung - Bereitstellung von Verordnungsdaten" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS zur Bereitstellung von Verordnungsdaten an den ePA Medication Service die Operation `providePrescription_MedicationSvc` des Medication Service aufrufen.
</requirement>

<!-- A_25953 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A302" title="TI-Flow-Fachdienst - ePA - Übermittlung - Löschinformation von Verordnungsdaten" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS, um die Löschinformation für Verordnungsdaten an den ePA Medication Service zu übermitteln, die Operation `cancelPrescription_MedicationSvc` des Medication Service aufrufen.
</requirement>

<!-- A_25954-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A303" title="TI-Flow-Fachdienst - ePA - Übermittlung - Bereitstellung von Dispensierinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS zur Bereitstellung von Dispensierinformationen an den ePA Medication Service die Operation `provideDispensation_MedicationSvc` des Medication Service mit rxDispensation.status gemäß dem bereitgestellten Status aufrufen.
</requirement>

<!-- A_25955 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A304" title="TI-Flow-Fachdienst - ePA - Übermittlung - Löschinformation von Dispensierinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS, um die Löschinformation für Dispensierinformationen an den ePA Medication Service zu übermitteln, die Operation `cancelDispensation_MedicationSvc` des Medication Service aufrufen.
</requirement>

<!-- A_25956 -->
<requirement conformance="MAY" key="IG-TIFLOW-ERP-A305" title="TI-Flow-Fachdienst - ePA - Übermittlung - Bündelung von Übermittlungsaufträgen nach KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst KANN für die Übermittlung von Verordnungsdaten und Dispensierinformationen an den ePA Medication Service mehrere Instanzen von MedicationRequest oder mehrere Instanzen von MedicationDispense einer KVNR in einem einzigen Operationsaufruf bündeln.
</requirement>