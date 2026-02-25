<!--A_22144-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-201" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass ausschließlich Nutzer in den Rollen oid_oeffentliche_apotheke oder oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.
</requirement>

<!--A_22215-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-202" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Prüfung Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.
</requirement>

<!--A_22146-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-203" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke), diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.enterer.identifier hinterlegte Telematik-ID prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die Apotheke, welche die Abrechnungsinformation bereitgestellt hat, diese ändert.
</requirement>

<!--A_22616-03-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-204" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke) den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCodeChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!--A_22148-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-205" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – PKV-Abgabedatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.
</requirement>

<!--A_22149-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-206" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – FHIR-Validierung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil PKV-Abgabedatensatz prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 und einem Hinweis auf die FHIR-Invalidität in OperationOutcome ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<!--A_22150-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-207" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Signaturprüfung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 und einem Hinweis auf die ungültige Signatur in OperationOutcome abbrechen, um ausschließlich authentische Daten zu verwalten.
</requirement>

<!--A_22151-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-208" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Signaturzertifikat PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI, das Signaturzertifikats des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig] befunden werden und der Aufruf anderenfalls mit Status 400 und einem Hinweis auf das abgelaufene/gesperrte Signaturzertifikat in OperationOutcome abgebrochen werden, um ausschließlich authentische Daten zu verwalten.
Wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, muss der HTTP-Request mit dem HTTP-Status-Code 512 abgelehnt werden.
</requirement>

<!--A_22152-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-209" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – FHIR-Validierung ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen, auf die Zulässigkeit der änderbaren Felder prüfen: 
<ul>
    <li>abgebende LEI: darf nur PKV-Abgabedatensatz ändern </li>
</ul>
und bei fehlerhafter Prüfung die Operation mit dem http-Status-Code 400 und einem Hinweis auf unzulässige Änderung gesperrter Attribute in OperationOutcome abbrechen, damit kein Schadcode und keine fachfremden Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<!--A_22615-02-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-210" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Generierung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode überschreiben, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!--A_23624-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-05021N7A" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – kein AccessCode und Quittung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst DARF beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI das in "ChargeItem.supportingInformation" referenzierte Element "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" und den Identifier ChargeItem.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nicht die Quittung und AccessCode erhält. 
</requirement>

<!--A_28134-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-81332X7U" title="E-Rezept-Fachdienst - Abrechnungsinformation ändern - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch eine abgebende LEI bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.chargeitem.update" und den Versicherten mit der KVNR = ChargeItem.subject initiieren. 
</requirement>