### Anforderungen der Schnittstelle aus diesem Modul

<!-- A_27059 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-41" title="E-Rezept-Fachdienst - eu-prescription abfragen - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions sicherstellen, dass ausschließlich Nutzer in der Rolle: oid_ncpeh, die Operation am Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader Authorization feststellen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden können.
</requirement>

<!-- A_27060 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-42" title="E-Rezept-Fachdienst - eu-prescription abfragen - Schemaprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD das im http-Body des Requests enthaltene Parameter-Objekt gegen das Profil [GEM_ERP_PR_PAR_EU_GET_Prescription_EU_Input] prüfen und im Fehlerfall die Operation mit HTTP-Fehlercode 400 abbrechen.
</requirement>

<!-- A_27061 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-43" title="E-Rezept-Fachdienst - eu-prescription abfragen - Prüfung Einwilligung für KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass für die in Parameters.parameter:requestData.part:kvnr übermittelte KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = EUDISPCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur Verordnungsdaten für Versicherte übermittelt werden, die eine Einwilligung erteilt haben.
</requirement>

<!-- A_27062 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-44" title="E-Rezept-Fachdienst - eu-prescription abfragen - Prüfung Zugriffsberechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass zu dem in Parameters.parameter:requestData.part:kvnr, Parameters.parameter:requestData.part:accessCode und Parameters.parameter:requestData.part:countryCode übermittelte Tripple von KVNR, Zugriffs- und Ländercode eine zeitliche gültige Zugriffsberechtigung im E-Rezept-Fachdienst existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur Verordnungsdaten für Versicherte übermittelt werden, wenn eine gültige Zugriffsberechtigung vorliegt.
</requirement>

<!-- A_27063-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-45" title="E-Rezept-Fachdienst - eu-prescription abfragen - Filter einlösbarer E-Rezepte" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass nur Ressourcen eines Tasks bereitgestellt werden, die folgende Kriterien erfüllen: Task.for = KVNR für die KVNR aus Parameters.parameter:requestData.part:kvnr Task.ExpiryDate nicht vor dem aktuellen Datum Falls MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true, dann MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start nicht nach dem aktuellen Datum Task.extension:eu-isRedeemableByProperties = true Task.extension:eu-isRedeemableByPatientAuthorization = true damit eine Apotheke im europäischen Ausland nur einlösbare E-Rezepte abrufen kann.
</requirement>

<!-- A_27587 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-46" title="E-Rezept-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage der aktuellsten Verordnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions?_count=1 durch den NCPeH-FD sicherstellen, dass nur eine Ressource eines Tasks bereitgestellt wird, die folgendes Kriterium erfüllt: Task.status = ready.
</requirement>

<!-- A_27588 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-47" title="E-Rezept-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage aller einlösbaren Verordnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass wenn Parameters.parameter:requestData.part:prescription-id leer ist, nur Ressourcen eines Tasks bereitgestellt werden, die folgendes Kriterium erfüllen: Task.status = ready.
</requirement>

<!-- A_27589 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-48" title="E-Rezept-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage nach Liste Rezept-Ids" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, nur Ressourcen eines Tasks bereitgestellt werden, die folgendes Kriterium erfüllen: Task.status = ready ODER (Task.status = in-progress UND Task.owner = Telematik-ID aus dem ACCESS_TOKEN).
</requirement>

<!-- A_27064 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-49" title="E-Rezept-Fachdienst - eu-prescription abfragen - Schema des Response" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass die FHIR-Ressourcen zu einlösbaren Verordnungen in einem übergreifenden FHIR-Bundle gruppiert werden, absteigend sortiert nach dem medicationrequest.authored-on Datum, wobei das Bundle pro Verordnung ein FHIR-Bundle vom Typ https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle enthält, mit der unter https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId abgelegten Task-ID sowie den im MedicationRequest referenzierten Ressourcen MedicationRequest, Medication, Patient, Practitioner und Coverage.
</requirement>

<!-- A_27065 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-50" title="E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage der aktuellsten Verordnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions?_count=1 durch den NCPeH-FD sicherstellen, dass die Ressourcen der zuletzt ausgestellten einlösbaren Verordnung zurückgegeben werden und falls keine Verordnung vorliegt, mit dem HTTP-Statuscode 404 antworten.
</requirement>

<!-- A_27066 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-51" title="E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage aller einlösbaren Verordnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass wenn Parameters.parameter:requestData.part:prescription-id leer ist, die Ressourcen aller einlösbaren Verordnung zurückgegeben werden und falls keine Verordnung vorliegt, mit dem HTTP-Statuscode 404 antworten.
</requirement>

<!-- A_27067 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-52" title="E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, die Ressourcen aller einlösbaren Verordnung zurückgegeben werden, deren Task-IDs in Parameters.parameter:requestData.part:prescription-id enthalten sind, und falls keine Verordnung vorliegt, mit dem HTTP-Statuscode 404 antworten.
</requirement>

<!-- A_27580 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-53" title="E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Statuswechsel Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD, wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, für alle Tasks deren Task-IDs in Parameters.parameter:requestData.part:prescription-id enthalten sind, den Status auf Task.status = in-progress setzen.
</requirement>

<!-- A_27581 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-54" title="E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Secret" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD, wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, für alle Tasks deren Task-IDs in Parameters.parameter:requestData.part:prescription-id enthalten sind, eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:Secret als [Identifier Profile for Secret (GEM_ERP_PR_Secret)] hinzufügen.
</requirement>

<!-- A_27582 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-55" title="E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Task Owner" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD, wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, für alle Tasks deren Task-IDs in Parameters.parameter:requestData.part:prescription-id enthalten sind, die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern.
</requirement>

<!-- A_28204 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-53" title="E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage aller einlösbaren Verordnungsinformationen - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD bei erfolgreichem Abschluss der Operation, wenn Parameters.parameter:requestData.part:prescription-id leer ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.eu.prescription.get" und den Versicherten mit der KVNR = Task.for für jeden Task initiieren.
</requirement>

<!-- A_28205 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-53" title="E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD bei erfolgreichem Abschluss der Operation, wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.eu.prescription.redeem" und den Versicherten mit der KVNR = Task.for für jeden Task initiieren.
</requirement>