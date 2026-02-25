<!--A_22124-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-175" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Rollenprüfung Versicherter oder Apotheker" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass ausschließlich Versicherte oder Apotheken in den Rollen oid_versicherter, oid_oeffentliche_apotheke oder oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<!--A_22125-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-176" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Versicherter – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation abrufen kann.
</requirement>

<!--A_22126-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-177" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende Leistungserbringerinstitution, die LEI anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.enterer.identifier hinterlegte Telematik-ID der einstellenden LEI prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die LEI eine Abrechnungsinformation abrufen kann, welche die Abrechnungsinformation bereitgestellt hat.
</requirement>

<!--A_22611-02-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-178" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkreten über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende Leistungserbringerinstitution, den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCode ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!--A_22127-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-179" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Versicherte – Signieren" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /ChargeItem/&#60;id&#62; durch einen Versicherten zusätzlich zum ChargeItem die folgenden Datensätze im JSON-Format in einem Responsebundle zurück liefern und dafür in jedem Aufruf den Verordnungsdatensatz, den PKV-Abgabedatensatz und die Quittung im XML-Format mit der Signaturidentität des E-Rezept-Fachdienstes gemäß RFC5652 im Profil CAdES-BES (Enveloping) signieren und in jede Fachdienstsignatur die letzte OCSP-Antwort der Statusprüfung des Signaturzertifikats C.FD.OSIG einbetten, damit der Versicherte die Daten für die Abrechnung an Kostenträger weiterleiten kann.
</requirement>

<!--A_22128-01-->
<requirement conformance="SHALL NOT" key="IG-ERP-CHRG-180" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – kein AccessCode und Quittung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst DARF beim Aufruf der Operation GET /ChargeItem/&#60;id&#62; durch eine abgebende Leistungserbringerinstitution das in ChargeItem.supportingInformation referenzierte Element ChargeItem.supportingInformation:receiptBundle und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nur den Verordnungsdatensatz und durch sie änderbaren PKV-Abgabedatensatz erhält.
</requirement>