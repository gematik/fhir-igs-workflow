Diese Seite beschreibt Anforderungen am TI-Flow-Fachdienst zur Nutzung der `ChargeItem`-Query-Endpunkte.

### Allgemeine Regeln
<!--A_22111-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-44" title="TI-Flow-Fachdienst – ChargeItem – unzulässige Operationen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource ChargeItem mittels der HTTP-Operationen HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zu Abrechnungsinformationen ausgeführt werden können.
</requirement>

<!-- A_22141 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-45" title="TI-Flow-Fachdienst – Signaturzertifikat SMC-B prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS ein Signatur-Zertifikat einer nonQES-Signatur eine Leistungserbringerinstitution gemäß [gemSpec_PKI#TUC_PKI_018] mit folgenden Parametern auf Gültigkeit prüfen: Tabelle # : TAB_eRPFD_013 Parameter Prüfung Signaturzertifikat SMC-B Parameter Zertifikat Signaturzertifikat aus nonQES PolicyList oid_smc_b_osig intendedKeyUsage nonRepudiation intendedExtendedKeyUsage (leer) OCSP-Graceperiod 12 Stunden Offline-Modus nein Prüfmodus OCSP Der TI-Flow-Fachdienst darf die OCSP-Response für die Abfrage des Zertifikatsstatus für 12 Stunden zwischenspeichern.
</requirement>

### GET /ChargeItem
<!--A_22118-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-46" title="TI-Flow-Fachdienst – Abrechnungsinformationen abrufen – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<!--A_22119-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-47" title="TI-Flow-Fachdienst – Abrechnungsinformationen abrufen – Versicherter – Filter KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und die ChargeItems danach filtern, damit der Versicherte nur Abrechnungsinformationen abruft, bei denen er der Begünstigte ist.
</requirement>

<!--A_22121-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-48" title="TI-Flow-Fachdienst – Abrechnungsinformationen abrufen – Suchkriterien" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS das Eingrenzen einer Suchanfrage auf /ChargeItem über die URL-Parameter gemäß https://www.hl7.org/fhir/chargeitem.html#search mindestens für die Attribute ChargeItem.enteredDate und ChargeItem.meta.__lastUpdated erlauben, damit Versicherte und Apotheken eine Suche nach neuen Abrechnungsinformationseinträgen durchführen können.
</requirement>

<!--A_22122-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-49" title="TI-Flow-Fachdienst – Abrechnungsinformationen abrufen – Response" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem eine Liste von ChargeItem Ressourcen ohne die in supportingInformation referenzierten Datensätze entsprechend der Filterung und Suchkriterien übermitteln.
</requirement>

### GET /ChargeItem/&#60;id&#62;
<!--A_22124-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-50" title="TI-Flow-Fachdienst – Abrechnungsinformation abrufen – Rollenprüfung Versicherter oder Apotheker" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass ausschließlich Versicherte oder Apotheken in den Rollen 
    <ul>
        <li>oid_versicherter</li>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li> 
    </ul>
    die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<!--A_22125-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-51" title="TI-Flow-Fachdienst – Abrechnungsinformation abrufen – Versicherter – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation abrufen kann.
</requirement>

<!--A_22126-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-52" title="TI-Flow-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende Leistungserbringerinstitution, die LEI anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.enterer.identifier hinterlegte Telematik-ID der einstellenden LEI prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die LEI eine Abrechnungsinformation abrufen kann, welche die Abrechnungsinformation bereitgestellt hat.
</requirement>

<!--A_22611-02-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-53" title="TI-Flow-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkreten über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende Leistungserbringerinstitution, den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCode ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!--A_22127-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-54" title="TI-Flow-Fachdienst – Abrechnungsinformation abrufen – Versicherte – Signieren" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /ChargeItem/&#60;id&#62; durch einen Versicherten zusätzlich zum ChargeItem die folgenden Datensätze im JSON-Format in einem Responsebundle zurück liefern und dafür in jedem Aufruf den Verordnungsdatensatz, den PKV-Abgabedatensatz und die Quittung im XML-Format mit der Signaturidentität des TI-Flow-Fachdienstes gemäß RFC5652 im Profil CAdES-BES (Enveloping) signieren und in jede Fachdienstsignatur die letzte OCSP-Antwort der Statusprüfung des Signaturzertifikats C.FD.OSIG einbetten, damit der Versicherte die Daten für die Abrechnung an Kostenträger weiterleiten kann.
</requirement>

<!--A_22128-01-->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CHRG-55" title="TI-Flow-Fachdienst – Abrechnungsinformation abrufen – Apotheke – kein AccessCode und Quittung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst DARF beim Aufruf der Operation GET /ChargeItem/&#60;id&#62; durch eine abgebende Leistungserbringerinstitution das in ChargeItem.supportingInformation referenzierte Element ChargeItem.supportingInformation:receiptBundle und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nur den Verordnungsdatensatz und durch sie änderbaren PKV-Abgabedatensatz erhält.
</requirement>

### POST /ChargeItem
<!--A_22129-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-56" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in einer der Rollen 
    <ul>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
    </ul>
    die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte eingestellt werden kann.
</requirement>

<!--A_22130-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-57" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Parameter Task" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ein URL-Parameter "task=..." übermittelt wurde und bei Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 400 abbrechen.
</requirement>

<!--A_22131-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-58" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Existenz Task" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der im URL-Parameter "task=..." übertragene Task-ID eine Task-Ressource mit dem Status Task.status = completed existiert und bei fehlgeschlagener Prüfung mit dem HTTP-Fehlercode 409 abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit dem Status „quittiert“ angelegt wird.
</requirement>

<!--A_22132-02-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-59" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Secret Task" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das im URL-Parameter "secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch die berechtigten Apotheke in Kenntnis des Secrets erfolgt.
</requirement>

<!--A_22731-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-60" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Flowtype Task" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass der zum Task zugehörige Verordnungsdatensatz unter Coverage.type.coding.code den Wert "PKV" enthält und bei fehlgeschlagener Prüfung mit dem HTTP-Fehlercode 400 abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit zulässigen Kostenträger angelegt wird.
</requirement>

<!--A_22133-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-61" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.
</requirement>

<!--A_24471-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-62" title="TI-Flow-Fachdienst - Abrechnungsinformation bereitstellen - ChargeItem-ID=Rezept-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem die Rezept-ID, welche über den URL-Parameter task übergeben wird, als ChargeItem-ID (ChargeItem.id) verwenden.
</requirement>

<!--A_22136-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-63" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – FHIR-Validierung ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen und die Korrektheit der Rezept-ID (GEM_ERP_PR_PrescriptionId) im referenzierten Task als ChargeItem.identifier, die Korrektheit der Versicherten-ID des Versicherten im referenzierten Task (Task.for) gegen ChargeItem.subject.identifier sowie die Korrektheit der Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in ChargeItem.enterer.identifier prüfen und bei Nicht-Konformität das Anlegen der Ressource im TI-Flow-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.
</requirement>

<!--A_22137-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-64" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – PKV-Abgabedatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.
</requirement>

<!--A_22138-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-65" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – FHIR-Validierung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil DAV-PKV-PR-ERP-AbgabedatenBundle prüfen und bei Nicht-Konformität das Anlegen der Ressource im TI-Flow-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.
</requirement>

<!--A_22139-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-66" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Signaturprüfung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 abbrechen, um ausschließlich authentische Daten zu verwalten.
</requirement>

<!--A_22140-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-67" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Signaturzertifikat PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Signaturzertifikats des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig] befunden werden und der Aufruf anderenfalls mit Status 400 abgebrochen werden, um ausschließlich authentische Daten zu verwalten.<br>
    Wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, muss der HTTP-Request mit dem HTTP-Status-Code 512 abgelehnt werden.
</requirement>

<!--A_22134-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-68" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Verordnungsdatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das E-Rezept-Bundle vom Profil KBV_PR_ERP_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:prescriptionItem die Referenz hinzufügen.
</requirement>

<!--A_22135-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-69" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Quittung übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Quittung-Bundle vom Profil GEM_ERP_PR_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:receipt die Referenz hinzufügen.
</requirement>

<!--A_22614-02-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-70" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Generierung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode hinzufügen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!-- A_22143 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-71" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – ChargeItem befüllen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Erzeugen eines ChargeItem mittels HTTP-POST-Operation die folgenden Elemente schreiben: 
    <ul>
        <li>ChargeItem.enteredDate (aktueller Zeitstempel).</li>
    </ul>
</requirement>

<!-- A_23704 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-72" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – kein AccessCode und Quittung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst DARF beim Aufruf der HTTP-POST-Operation auf den Endpunkt /ChargeItem das in "ChargeItem.supportingInformation" referenzierte Element "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nicht die Quittung und AccessCode erhält.
</requirement>

<!-- A_28133 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-73" title="TI-Flow-Fachdienst – Abrechnungsinformation bereitstellen – Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /ChargeItem bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.chargeitem.create" und den Versicherten mit der KVNR = ChargeItem.subject initiieren.
</requirement>


### PATCH /ChargeItem/&#60;id&#62;

<!--A_22879-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-74" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern (PATCH) – alles Ändern verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /ChargeItem ohne Angabe einer &#60;id&#62; für eine konkrete Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Ändern mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<!--A_22875-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-75" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern (PATCH) – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-PATCH-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.
</requirement>

<!--A_22877-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-76" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern (PATCH) – Versicherter – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation ändert.
</requirement>

<!--A_27566-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-77" title="TI-Flow-Fachdienst - Abrechnungsinformation ändern (PATCH) - FHIR-Validierung Parameters" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS die in der HTTP-PATCH-Operation auf die Ressource Chargeltem übertragene Parameters Ressource gegen das FHIR-Profil GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input prüfen und bei Nicht-Konformität das Verarbeiten der Ressource im TI-Flow-Fachdienst mit dem http-Status-Code 400 ablehnen.
</requirement>

### PUT /ChargeItem/&#60;id&#62;
<!--A_22144-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-78" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass ausschließlich Nutzer in einer der Rollen 
    <ul>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
    </ul>
    die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.
</requirement>

<!--A_22215-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-79" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Prüfung Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.
</requirement>

<!--A_22146-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-80" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke), diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.enterer.identifier hinterlegte Telematik-ID prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die Apotheke, welche die Abrechnungsinformation bereitgestellt hat, diese ändert.
</requirement>

<!--A_22616-03-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-81" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke) den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCodeChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!--A_22148-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-82" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Apotheke – PKV-Abgabedatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.
</requirement>

<!--A_22149-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-83" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Apotheke – FHIR-Validierung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil PKV-Abgabedatensatz prüfen und bei Nicht-Konformität das Anlegen der Ressource im TI-Flow-Fachdienst mit dem http-Status-Code 400 und einem Hinweis auf die FHIR-Invalidität in OperationOutcome ablehnen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.
</requirement>

<!--A_22150-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-84" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Apotheke – Signaturprüfung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 und einem Hinweis auf die ungültige Signatur in OperationOutcome abbrechen, um ausschließlich authentische Daten zu verwalten.
</requirement>

<!--A_22151-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-85" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Signaturzertifikat PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI, das Signaturzertifikats des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig] befunden werden und der Aufruf anderenfalls mit Status 400 und einem Hinweis auf das abgelaufene/gesperrte Signaturzertifikat in OperationOutcome abgebrochen werden, um ausschließlich authentische Daten zu verwalten.
Wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, muss der HTTP-Request mit dem HTTP-Status-Code 512 abgelehnt werden.
</requirement>

<!--A_22152-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-86" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – FHIR-Validierung ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen, auf die Zulässigkeit der änderbaren Felder prüfen: 
<ul>
    <li>abgebende LEI: darf nur PKV-Abgabedatensatz ändern </li>
</ul>
und bei fehlerhafter Prüfung die Operation mit dem http-Status-Code 400 und einem Hinweis auf unzulässige Änderung gesperrter Attribute in OperationOutcome abbrechen, damit kein Schadcode und keine fachfremden Daten in den TI-Flow-Fachdienst hochgeladen werden.
</requirement>

<!--A_22615-02-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-87" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Apotheke – Generierung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode überschreiben, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!--A_23624-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-88" title="TI-Flow-Fachdienst – Abrechnungsinformation ändern – Apotheke – kein AccessCode und Quittung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst DARF beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI das in "ChargeItem.supportingInformation" referenzierte Element "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nicht die Quittung und AccessCode erhält. 
</requirement>

<!--A_28134-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-89" title="TI-Flow-Fachdienst - Abrechnungsinformation ändern - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.chargeitem.update" und den Versicherten mit der KVNR = ChargeItem.subject initiieren. 
</requirement>

### DELETE /ChargeItem/&#60;id&#62;
<!--A_22112-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-90" title="TI-Flow-Fachdienst – Abrechnungsinformation löschen – alles Löschen verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS den Aufruf der Operation DELETE /ChargeItem ohne Angabe einer konkreten über &#60;id&#62; adressierte ChargeItem Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<!--A_22113-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-91" title="TI-Flow-Fachdienst – Abrechnungsinformation löschen – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle 
    <ul>
        <li>oid_versicherter</li>
    </ul>
    die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<!--A_22114-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-92" title="TI-Flow-Fachdienst – Abrechnungsinformation löschen – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation löscht.
</requirement>

<!--A_22117-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-93" title="TI-Flow-Fachdienst – Abrechnungsinformation löschen – zu löschende Ressourcen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Löschen einer ChargeItem-Ressource auch 
    <ul>
        <li>die in ChargeItem.supportingInformation referenzierten Ressourcen des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung,</li>
        <li>alle Communication mit Communication.basedOn = ChargeItem.id</li>
    </ul>
    löschen.
</requirement>
