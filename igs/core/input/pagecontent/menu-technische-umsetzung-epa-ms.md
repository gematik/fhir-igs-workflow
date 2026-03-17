### Kommunikation mit ePA-Aktensystem

Die Datenübermittlung zwischen E-Rezept-Fachdienst und ePA-Aktensystem erfolgt über HTTPS/TLS gemäß den Vorgaben aus den referenzierten Spezifikationen. Dabei wird das Server-Zertifikat des ePA-Aktensystems geprüft. Zusätzlich wird das VAU-Protokoll verwendet. Für die Authentisierung erstellt der E-Rezept-Fachdienst ein self-signed JWT Bearer-Token, und für Operationsaufrufe wird die clientID für den User-Agent festgelegt.

#### TLS-Verbindung

Zur Absicherung der Datenübermittlung muss der Transport der Nachrichten zwischen E-Rezept-Fachdienst uns ePA-Aktensystem mittels HTTPS erfolgen. Transport Layer Security (TLS) ist gemäß den Vorgaben aus [gemSpec_Krypt] einzusetzen.

Der ePA-Aktensystem unterstützt an den genutzten Schnittstellen mindestens die HTTP Version 1.1 (siehe A_24654 – ePA: http-Version).

Der ePA-Aktensystem nutzt sein C.FD.TLS-S Zertifikat für den TLS-Verbindungsaufbau. Der E-Rezept-Fachdienst prüft beim Verbindungsaufbau das Server-Zertifikat des ePA-Aktensystems entsprechend der Vorgaben von [gemSpec_PKI].



<!-- A_25971 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-337" title="E-Rezept-Fachdienst - ePA - TLS-Server X.509-Zertifikat des ePA-Aktensystems auf Gültigkeit prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS das Zertifikat des ePA-Aktensystems gemäß den Vorgaben von [gemSpec_PKI] und des TUC_PKI_018 mit den Eingangsdaten gemäß der Tabelle Tab_eRPFD_018 prüfen und im Fehlerfall den Aufbau der HTTPS-Verbindung abbrechen. Tabelle #: Tab_eRPFD_018 – Eingangsdaten für die Prüfung des ePA-Aktensystem Server-Zertifikats

<table>
<thead>
<tr>
<th>TUC_PKI_018 Eingangsdaten</th>
<th>Zulässiger Wert bzw. Beschreibung</th>
</tr>
</thead>
<tbody>
<tr>
<td>TSL</td>
<td>die entsprechende TSL für Infrastrukturkomponenten</td>
</tr>
<tr>
<td>Zertifikat</td>
<td>das zu prüfende Zertifikat vom Kommunikationspartner</td>
</tr>
<tr>
<td>Referenzzeitpunkt</td>
<td>aktuelle Systemzeit</td>
</tr>
<tr>
<td>Prüfmodus</td>
<td>OCSP</td>
</tr>
<tr>
<td>PolicyList</td>
<td>oid_fd_tls_s</td>
</tr>
<tr>
<td>Vorgesehene KeyUsage</td>
<td>digitalSignature</td>
</tr>
<tr>
<td>Vorgesehene ExtendedKeyUsage</td>
<td>id-kp-serverAuth</td>
</tr>
<tr>
<td>GracePeriod</td>
<td>der Wert muss konfigurierbar sein</td>
</tr>
<tr>
<td>Offline-Modus</td>
<td>nein</td>
</tr>
<tr>
<td>Timeout</td>
<td>Default-Wert (siehe [gemSpec_PKI])</td>
</tr>
<tr>
<td>TOLERATE_OCSP_FAILURE</td>
<td>Default-Wert (siehe [gemSpec_PKI])</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Eingangsdaten für die Prüfung des ePA-Aktensystem Server-Zertifikats</figcaption></div>

</requirement>

Der TUC gibt neben dem Status der Zertifikatsprüfung auch die im Zertifikat enthaltene Rolle (Admission) zurück. Diese muss geprüft werden.

<!-- A_25972 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-338" title="E-Rezept-Fachdienst - ePA - TLS-Server X.509-Zertifikat des ePA-Aktensystems Rolle prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS prüfen, dass die im Zertifikat enthaltene Rolle (Admission) gleich oid_epa_dvw ist und im Fehlerfall den Aufbau der HTTPS-Verbindung abbrechen.
</requirement>

#### VAU-Protokoll

Zusätzlich zu der Transportverschlüsselung mittels TLS werden die zu übermittelten Daten mit dem VAU-Protokoll gesichert. Es gelten die Vorgaben aus [gemSpec_Krypt]#7 VAU-Protokoll für ePA für alle.

<figure>
	<div class="gem-ig-img-container" style="--box-width: 800px; margin-bottom: 30px;">
		<img src="./epa-ms-abbildung-3-transport-durch-die-ti.png" alt="Transport durch die TI" style="width: 100%;">
	</div>
	<figcaption><strong>Abbildung: </strong>Transport durch die TI</figcaption>
</figure>

Für die Authentisierung erstellt der E-Rezept-Fachdienst einen self-signed Bearer-Token. Für die Signatur wird das AUT-Zertifikat der E-Rezept-VAU verwendet. Siehe [gemSpec_Krypt]#7.4 Authentisierung des E-Rezept-FD als ePA-Client und [gemSpec_Aktensystem_ePAfueralle]#3.16.3 Anforderungen an den Authorization Service für die Authentisierung des E-Rezept-Fachdienstes.

<!-- A_26066 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-339" title="E-Rezept-Fachdienst - ePA - JWT Bearer-Token Claims" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS für die Authentisierung gegenüber dem ePA-Aktensystem ein JWT Baerer-Token gemäß A_25165-* erstellen.
</requirement>

<!-- A_25935 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-340" title="E-Rezept-Fachdienst - ePA - JWT Bearer-Token Signatur" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS für die Authentisierung gegenüber dem ePA-Aktensystem das C.FD.AUT Zertifikat mit professionOID oid_erp-vau und der der Telematik-ID 9-E-Rezept-Fachdienst verwenden.
</requirement>

<!-- A_25936 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-341" title="E-Rezept-Fachdienst - ePA - Festlegung der ClientID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei allen Operationsaufrufen am Information Service, Authorization Service oder Medication Service die clientID "ERP-FD" verwenden, um den zu übermittelnden UserAgent zu erzeugen.
</requirement>

### ePA-Aktensysteme ermitteln

<!-- A_25937 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-342" title="E-Rezept-Fachdienst - ePA - Lokalisierung des ePA-Aktensysteme" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS zur Lokalisierung der ePA-Aktensysteme die durch die im DNS für die übergreifende ePA-Domäne epa4all.de eingestellten Informationen aufrufen.
</requirement>

Für die Bezeichnung der Ressourcen Records siehe "A_24592-* Anbieter ePA-Aktensystem - Registrierung an übergreifender ePA-Domäne". Die Informationen zu jedem ePA-Aktensystem enthalten den Endpunkt für den Authorization Service [I_Authorization_Service], Medication Service [I_Medication_Service] und Information Service [I_Information_Service].

<!-- A_25938 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-343" title="E-Rezept-Fachdienst - ePA - Aktualisierung Cache ePA-Aktensysteme" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst DARF NICHT Lokalisierungsinformationen zu ePA-Aktensystemen verwenden, welche länger als 24h lokal durch den E-Rezept-Fachdienst gecacht wurden.
</requirement>

### ePA-Aktensystem für KVNR ermitteln

<!-- A_25939 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-344" title="E-Rezept-Fachdienst - ePA - ePA-Aktensystem für KVNR ermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS für das Ermitteln des ePA-Aktensystem bei dem das Aktenkonto zu einer KVNR verwaltet wird, einmal den Endpunkt .../ehr/{insurantid}/consentdecisions des [I_Information_Service] jedes ePA-Aktensystem aufrufen und das Ermitteln abbrechen, wenn die Response den Statuscode 404 erhält.
</requirement>

<!-- A_25940 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-345" title="E-Rezept-Fachdienst - ePA - Aktualisierung Cache Zuordnung KVNR zu ePA-Aktensystem" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst DARF NICHT Informationen zur Zuordnung von KVNR und ePA-Aktensystem verwenden, welche länger als 180 Tage gecacht wurden.
</requirement>

<!-- A_25941 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-346" title="E-Rezept-Fachdienst - ePA - Aktualisierung Cache Zuordnung KVNR zu ePA-Aktensystem - Statuscode 404" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS gecachte Informationen zur Zuordnung von KVNR und ePA-Aktensystem invalidieren, wenn bei der Übermittlung die Response den Statuscode 404 erhält.
</requirement>

<!-- A_25942 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-347" title="E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Information Service - Fehler im Information Service" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS die Aufrufe zum Ermitteln des ePA-Aktensystem für mindestens eine Minute unterbrechen, wenn ein Operationsaufruf im Information Service mit einem Statuscode 500 scheitert, und anschließend für weitere Aufrufe einen exponentiellen Backoff-Mechanismus anwenden, der die Wartezeit zwischen den Versuchen sukzessive verdoppelt, um die Belastung des Zielsystems zu minimieren.
</requirement>

<!-- A_25943 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-348" title="E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Information Service - Struktureller Fehler" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS den Aufruf zum Ermitteln des ePA-Aktensystem als fehlerhaft kennzeichnen und eine detaillierte Fehlermeldung für interne Analysezwecke protokollieren, wenn der Information Service der ePA auf einen Operationsaufruf mit einem Statuscode 400 (malformed Request) reagiert.
</requirement>

### Übermittlung an den Medication Service

<!-- A_25944-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-349" title="E-Rezept-Fachdienst - ePA - Flowtype 160/166/169/200/209" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS sicherstellen, dass ausschließlich Daten zu Tasks mit dem Flowtype 160, 166, 169, 200 oder 209 für den ePA Medication Service bereitstellt werden.
</requirement>

<!-- A_25945 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-350" title="E-Rezept-Fachdienst - ePA - asynchrone Bereitstellung und Übermittlung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS das Übermitteln der Daten an den ePA Medication Service asynchron zur Bereitstellung der Daten durch die Clientsysteme umsetzen, damit für das bereitstellende Primärsystem der verordnenden oder abgebenden Leistungserbringerinstitution oder E-Rezept-FdV keine verlängerte Verarbeitungsdauer der auslösenden Operation auftritt.
</requirement>

#### Mappingregeln

<!-- A_25946 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-351" title="E-Rezept-Fachdienst - ePA - Mapping" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Bereitstellen der Daten für ePA Medication Service die durch Clientsysteme des E-Rezept-Fachdienst bereitgestellten Ressourcen (E-Rezept FHIR Ressource) in Ressourcen des ePA Medication Service (ePA Medication Service FHIR Ressourcen) gemäß der Tabelle Tab_eRPFD_019 unter Beachtung der Ausnahmeregelungen überführen.
    
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
Überschreiben/Setzen des "identifier:TelematikID" mit der idNummer aus dem ACCESS_TOKEN des verwendeten Operationsaufrufes
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-352" title="E-Rezept-Fachdienst - ePA - provide-dispensation-erp - Organisation-Ressource" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Bereitstellen der MedicationDispense für den ePA Medication Service eine Ressource des Profils https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory erstellen und Organization.identifier:TelematikID mit idNummer sowie Organization.name mit organizationName aus dem ACCESS_TOKEN belegen.
</requirement>

<!-- A_25948 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-353" title="E-Rezept-Fachdienst - ePA - Mapping - Übernahme von Werten zwischen Profilen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Bereitstellen der Daten für den ePA Medication Service sicherstellen, dass Datenwerte der E-Rezept FHIR Ressource übernommen werden, sofern das entsprechende Element in dem Ausgangs- und Zielprofilen vorhanden ist.
</requirement>

<!-- A_25949 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-354" title="E-Rezept-Fachdienst - ePA - Mapping - Handhabung von Extensions" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Bereitstellen der Daten für den ePA Medication Service sicherstellen, dass alle Extensions aus den E-Rezept FHIR-Ressourcen in die ePA Medication Service FHIR-Ressource übernommen werden, es sei denn, eine Ausnahmeregelung ist in der Tab_eRPFD_019 festgelegt.
</requirement>

*Hinweis: Falls in GEM_ERP_PR_MedicationDispense eine Extension MedicationDispense.medication[x].extension:dataAbsentReason vorhanden ist, wird diese in die EPA MedicationDispense übernommen. Der E-Rezept-Fachdienst loggt die Verwendung dieser Extension in den Betriebsdaten.*

#### Lokalisierung

Der E-Rezept-Fachdienst benötigt für das Übermitteln von Informationen zu Verordnungsdaten und Dispensierinformationen die Information, bei welchen ePA-Aktensystem das Aktenkonto des Versicherten verwaltet wird. Siehe Kapitel 6.10.3 ePA-Aktensystem für KVNR ermitteln.

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
	{% include seq-epa-ms-nichtauffinden-aktenkonto.svg %}
	</div>

	<figcaption><strong>Abbildung: </strong>Nichtauffinden des Aktenkontos in allen ePA-Aktensystemen</figcaption>
</figure>

<!-- A_25950 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-355" title="E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Nichtauffinden in allen ePA-Aktensystemen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS alle Übermittlungsaufträge für eine KVNR abbrechen, wenn bei dem Versuch, ein Aktenkonto für diese KVNR zu finden, die Information Services aller ePA-Aktensysteme eine Response mit dem Statuscode 404 zurückgeben.
</requirement>

#### Widerspruchsprüfung

Vor jedem Übermitteln prüft der E-Rezept-Fachdienst, ob der Versicherte in das Einstellen von Verordnungsdaten und Dispensierinformationen durch den E-Rezept-Fachdienst eingewilligt hat.

<!-- A_25951-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-356" title="E-Rezept-Fachdienst - ePA - Prüfung des Widerspruchs vor Übermittlung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS vor jedem Übermitteln von Informationen zu Verordnungsdaten oder Dispensierinformationen an den ePA Medication Service den Endpunkt /information/api/v1/ehr/consentdecisions des Information Service aufrufen, prüfen, ob für die Funktion "erp-submission" der Wert "permit" vorliegt und die Übermittlung final abbrechen, wenn die Prüfung fehlschlägt.
</requirement>

#### Verschlüsseln

Der E-Rezept-Fachdienst muss den Inhalt jedes Operationsaufrufes am Medication Service gemäß [gemSpec_Krypt]#A_24628-* VAU-Protokoll: VAU-Client: Request erzeugen/verschlüsseln verschlüsseln.

#### Übermitteln

<!-- A_25952 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-357" title="E-Rezept-Fachdienst - ePA - Übermittlung - Bereitstellung von Verordnungsdaten" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS zur Bereitstellung von Verordnungsdaten an den ePA Medication Service die Operation [base]/$provide-prescription-erp des Medication Service aufrufen.
</requirement>

<!-- A_25953 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-358" title="E-Rezept-Fachdienst - ePA - Übermittlung - Löschinformation von Verordnungsdaten" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS, um die Löschinformation für Verordnungsdaten an den ePA Medication Service zu übermitteln, die Operation [base]/$cancel-prescription-erp des Medication Service aufrufen.
</requirement>

<!-- A_25954-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-359" title="E-Rezept-Fachdienst - ePA - Übermittlung - Bereitstellung von Dispensierinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS zur Bereitstellung von Dispensierinformationen an den ePA Medication Service die Operation [base]/$provide-dispensation-erp des Medication Service mit rxDispensation.status gemäß dem bereitgestellten Status aufrufen.
</requirement>

<!-- A_25955 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-360" title="E-Rezept-Fachdienst - ePA - Übermittlung - Löschinformation von Dispensierinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS, um die Löschinformation für Dispensierinformationen an den ePA Medication Service zu übermitteln, die Operation [base]/$cancel-dispensation-erp des Medication Service aufrufen.
</requirement>

<!-- A_25956 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-361" title="E-Rezept-Fachdienst - ePA - Übermittlung - Bündelung von Übermittlungsaufträgen nach KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst KANN für die Übermittlung von Verordnungsdaten und Dispensierinformationen an den ePA Medication Service mehrere Instanzen von MedicationRequest oder mehrere Instanzen von MedicationDispense einer KVNR in einem einzigen Operationsaufruf bündeln.
</requirement>

#### Entschlüsseln

Der E-Rezept-Fachdienst muss den Response eines Operationsaufrufes am Medication Service gemäß der [gemSpec_Krypt]#A_24633-* VAU-Protokoll: VAU-Client: Response entschlüsseln/auswerten entschlüsseln. 


### Aktenumzug

Wenn ein Versicherter die Krankenkasse wechselt, dann wird sein Aktenkonto umgezogen. Für den Zeitraum des Umzuges ist das Aktenkonto für das Einstellen neuer Daten gesperrt. Der Information Service und der Medication Service antworten mit dem Http-Errorcode 409. Der E-Rezept-Fachdienst wiederholt die Übermittlung zu einem späteren Zeitpunkt.

Es wird unterschieden zwischen den Szenarien, dass ein Aktenkonto innerhalb eines ePA-Aktensystems oder zwischen zwei ePA-Aktensystemen umziehen kann.


<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
	{% include seq-epa-ms-aktenumzug-innerhalb.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>Aktenkonto Umzug innerhalb eines ePA-Aktensystems</figcaption>
</figure>


<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
	{% include seq-epa-ms-aktenumzug-anderes-system.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>Aktenkonto Umzug zu einem anderen ePA-Aktensystem</figcaption>
</figure>


<!-- A_25957 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-362" title="E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Aktenkonto-Umzug" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS alle Übermittlungsaufträge für eine KVNR für 24 Stunden pausieren, wenn das Aktenkonto aufgrund eines Umzugs nicht erreichbar ist und der Medication Service oder der Information Service eine Response mit dem Statuscode 409 zurückgibt, und nach dieser Pause einen erneuten Übermittlungsversuch starten.
</requirement>


### Fehlerbehandlung

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
	{% include seq-epa-ms-aktensystem-nicht-verfuegbar.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>ePA-Aktensystem nicht verfügbar</figcaption>
</figure>

<!-- A_25958 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-363" title="E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Reaktion auf Scheitern des Operationaufrufs" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS die Datenübermittlung an ein Aktenkonto für mindestens eine Minute unterbrechen, wenn ein Aufruf im Medication Service mit dem Statuscode 500 scheitert, anschließend den Endpunkt zum Auffinden des Aktenkonto für diese KVNR bei allen weiteren Information Services abrufen, die Anfrage am gefundenen Medication Service wiederholen und bei anhaltenden Problemen einen exponentiellen Backoff-Mechanismus anwenden, der die Wartezeit zwischen den Versuchen sukzessive verdoppelt, um die Systembelastung zu minimieren.
</requirement>

<!-- A_25959 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-364" title="E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Probleme bei der Entschlüsselung durch den Medication Service" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei einem Statuscode 400 in der Response des Medication Service, der auf operationelle Probleme wie Entschlüsselungsprobleme hindeutet, den Übermittlungsversuch abbrechen, einen neuen VAU-Kanal aufbauen und anschließend einen neuen Übermittlungsversuch starten.
</requirement>

<!-- A_25960 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-365" title="E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Probleme bei der Entschlüsselung durch den E-Rezept-Fachdienst" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS, wenn er eine verschlüsselte Antwort des Medication Service nicht entschlüsseln kann und Unklarheit über den Erfolg der Übermittlung besteht, den Übermittlungsversuch abbrechen, einen neuen VAU-Kanal aufbauen und einen neuen Übermittlungsversuch starten.
</requirement>

<!-- A_25961 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-366" title="E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Reaktion auf Nichtverfügbarkeit des Medication Service" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS den Übermittlungsversuch abbrechen, wenn kein VAU-Kanal zum Medication Service aufgebaut werden kann, weil dieser nicht verfügbar ist, und nach Wiederverfügbarkeit einen neuen Übermittlungsversuch starten.
</requirement>


