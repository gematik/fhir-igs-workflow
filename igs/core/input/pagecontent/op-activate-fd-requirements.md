Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.






<!-- A_19024-03 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - Prüfung AccessCode Prüfung Status" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den im HTTP-RequestHeader "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode und den Status des Tasks auf Task.status = draft prüfen und bei Ungleichheit oder Fehlen des HTTP-Headers die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>
<!-- ToDo: Prüfung in 2 Afos separieren -->

<!-- A_19020 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - Schemavalidierung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den im Aufrufparameter übergebenen FHIR-Operationsparameter des QES-Datensatzes als PKCS#7-Datei einer Enveloping CAdES-Signatur entgegennehmen und verarbeiten und bei Fehlen oder ungültiger ASN.1 Datenstruktur die Weiterverarbeitung im Fachdienst mit dem http-Status-Code 400 beantworten, damit kein Schadcode und keine "fachfremden" Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<!-- A_20159-04 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produktgutachten"/>
  </actor>
    Der E-Rezept-Fachdienst MUSS das QES-Signaturzertifikat C.HP.QES in der Signatur des übergebenen QES-Datensatzes gemäß [gemSpec_PKI#TUC_PKI_030] mit folgenden Parametern auf Gültigkeit prüfen:
    <table>
        <tr>
            <th>Parameter</th>
            <th>Wert</th>
        </tr>
        <tr>
            <td>Zertifikat</td>
            <td>
                Signaturzertifikat des HBA (eingebettet in Signatur-Objekt des QES-Datensatzes):
                <ul>
                    <li>C.HP.QES (oid_hba_qes = 1.2.276.0.76.4.72 gemäß gemSpec_OID)</li>
                    <li>bzw. für HBA-Vorläuferkarten C.HP.ENC (oid_vk_eaa_enc = 1.3.6.1.4.1.24796.1.10 gemäß gemSpec_OID) 
                    Hinweis: die OID dieses Profil wird für Ärzte- und Zahnärzteschaft gleichermaßen genutzt</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Referenzzeitpunkt</td>
            <td>Zeitpunkt der QES-Erstellung gemäß signingTime im QES-Datensatz</td>
        </tr>
        <tr>
            <td>Offline-Modus</td>
            <td>nein</td>
        </tr>
        <tr>
            <td>OCSP-Response</td>
            <td>eingebettet in QES-Datensatz</td>
        </tr>
    </table>
    <div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_006 Parameter Prüfung Signaturzertifikat QES des HBA</figcaption></div>

    und darf die OCSP-Response für die Abfrage des Zertifikatsstatus für 12 Stunden zwischenspeichern.
    Ist keine OCSP-Response eingebettet oder die eingebettete OCSP Response nicht gültig, MUSS der E-Rezept-Fachdienst die gecachte OCSP-Response verwenden oder eine OCSP-Response beim benannten TSP anfragen und die genutzte OCSP-Response nachträglich in den QES-Datensatz einbetten.
    Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig ] befunden werden und der HTTP-Request andernfalls mit dem HTTP-Status-Code 400 abgelehnt werden, damit sichergestellt wird, dass ausschließlich E-Rezepte verwaltet werden, die von einer gültigen, nicht gesperrten Heilberufsidentität eines HBA signiert wurden.
    Wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, muss der HTTP-Request mit dem HTTP-Status-Code 512 abgelehnt werden.
</requirement>
<!-- ToDo: können HBA-Vorläuferkarten entfernt werden? ME ja -->

<!-- A_19025-03 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - QES prüfen Rezept aktualisieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate 
    <ul>
        <li>
            die qualifizierte Signatur des QES-Datensatzes gemäß [ETSI_QES] prüfen und bei nicht gültiger qualifizierter Signatur die Operation mit Status 400 abbrechen 
        </li>
        <li>
            bzw. bei gültiger Signatur das innerhalb des PKCS#7-Datensatz enveloping-enthaltene FHIR-Bundle einer umfänglichen FHIR-Validierung gegen die eRezept-Schema-Definition der KBV kbv.ita.erp oder kbv.itv.evdga unterziehen und bei Invalidität die Operation mit Status 400 abbrechen
        </li>
        <li>
            bzw. bei gültiger Signatur und validem FHIR den Datensatz als PKCS#7-Datei sicher speichern und in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 über eine interne, eindeutige UUID referenzieren,
        </li>
    </ul>
    damit der nachfolgende Workflow ausschließlich auf Basis medizinisch korrekter und vom Leistungserbringer mittels Signatur freigegebener Daten erfolgt.
</requirement>

<!-- A_23172 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - Mimetype Signatur" version="0">
    <meta lockversion="false"/>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate die Angabe zum Mimetype des signierten Dokumentes prüfen und mit dem Fehler 400 abbrechen, wenn dieser ungleich "text/plain; charset=utf-8" ist.
</requirement>

<!-- A_21370 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - Prüfung Rezept-ID und Präfix gegen Flowtype" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim berechtigten Aufruf der Operation POST /Task/&#60;id&#62;/$activate prüfen, dass die PrescriptionID des Tasks mit der PrescriptionID im übergebenen QES-Datensatz übereinstimmt und der Präfix der PrescriptionID gleich dem Flowtype des zu aktivierenden Tasks ist und andernfalls die Operation mit dem http-Fehlercode 400 abbrechen.
</requirement>

<!-- A_23936-01 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - Versicherten-ID als Identifikator von Versicherten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, dass Patient.identifier.system gleich "http://fhir.de/sid/gkv/kvid-10" ist und andernfalls die Operation mit dem http-Fehlercode 400 und dem Hinweis im OperationOutcome "Als Identifier für den Patienten muss eine VersichertenID (KVNR) angegeben werden." abbrechen.
</requirement>

<!-- A_22487 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - Prüfregel Ausstellungsdatum" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS den Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate mit einem Fehlercode 400 und Hinweis im OperationOutcome auf "Ausstellungsdatum und Signaturzeitpunkt weichen voneinander ab, müssen aber taggleich sein" als ungültig abweisen, wenn das Datum authoredOn zur Gültigkeitsberechnung des E-Rezepts nicht dem Datum in QES.Erstellung im Signaturobjekt entspricht.
</requirement>