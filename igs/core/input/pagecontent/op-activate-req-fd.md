Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$activate`.



<!-- A_19022-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-173" title="TI-Flow-Fachdienst - Task aktivieren - Rollenprüfung" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aktivieren eines Tasks für ein E-Rezept mittels HTTP-POST/$activate-Operation auf den in der URL referenzierten /Task/&#60;id&#62; sicherstellen, dass ausschließlich verordnende Leistungserbringer in der Rolle
  <ul>
    <li>oid_praxis_arzt</li>
    <li>oid_zahnarztpraxis</li>
    <li>oid_praxis_psychotherapeut</li>
    <li>oid_krankenhaus</li>
    <li>oid_institution-vorsorge-reha</li> 
  </ul>
  die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte eingestellt werden können.
</requirement>

<!-- A_19024-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-174" title="TI-Flow-Fachdienst - Task aktivieren - Prüfung AccessCode" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den im HTTP-RequestHeader "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode und bei Ungleichheit oder Fehlen des HTTP-Headers die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!-- A_19024-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-175" title="TI-Flow-Fachdienst - Task aktivieren - Prüfung Status" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "draft" ist.
</requirement>


<!-- A_19020 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-176" title="TI-Flow-Fachdienst - Task aktivieren - Schemavalidierung" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den im Aufrufparameter übergebenen FHIR-Operationsparameter des QES-Datensatzes als PKCS#7-Datei einer Enveloping CAdES-Signatur entgegennehmen und verarbeiten und bei Fehlen oder ungültiger ASN.1 Datenstruktur die Weiterverarbeitung im Fachdienst mit dem http-Status-Code 400 beantworten, damit kein Schadcode und keine "fachfremden" Daten in den TI-Flow-Fachdienst hochgeladen werden.
</requirement>

<!-- A_20159-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-177" title="TI-Flow-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS das QES-Signaturzertifikat C.HP.QES in der Signatur des übergebenen QES-Datensatzes gemäß [gemSpec_PKI#TUC_PKI_030] mit folgenden Parametern auf Gültigkeit prüfen:
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
    Ist keine OCSP-Response eingebettet oder die eingebettete OCSP Response nicht gültig, MUSS der TI-Flow-Fachdienst die gecachte OCSP-Response verwenden oder eine OCSP-Response beim benannten TSP anfragen und die genutzte OCSP-Response nachträglich in den QES-Datensatz einbetten.
    Das Signaturzertifikat muss anhand der Zertifikatsprüfung für [mathematisch gültig UND zeitlich gültig UND online gültig ] befunden werden und der HTTP-Request andernfalls mit dem HTTP-Status-Code 400 abgelehnt werden, damit sichergestellt wird, dass ausschließlich E-Rezepte verwaltet werden, die von einer gültigen, nicht gesperrten Heilberufsidentität eines HBA signiert wurden.
    Wenn die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, muss der HTTP-Request mit dem HTTP-Status-Code 512 abgelehnt werden.
</requirement>
<!-- ToDo: können HBA-Vorläuferkarten entfernt werden? ME ja -->

<!-- A_19025-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-178" title="TI-Flow-Fachdienst - Task aktivieren - QES prüfen Rezept aktualisieren" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate 
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

<!-- Diese Afo wurde nicht zugewiesen, da die Konnektoren sich nicht so verhalten. -->
<!-- A_23172 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-179" title="TI-Flow-Fachdienst - Task aktivieren - Mimetype Signatur" version="0">
    <meta lockversion="true"/>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate die Angabe zum Mimetype des signierten Dokumentes prüfen und mit dem Fehler 400 abbrechen, wenn dieser ungleich "text/plain; charset=utf-8" ist.
</requirement>

<!-- A_21370 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-180" title="TI-Flow-Fachdienst - Task aktivieren - Prüfung Rezept-ID und Präfix gegen Flowtype" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim berechtigten Aufruf der Operation POST /Task/&#60;id&#62;/$activate prüfen, dass die PrescriptionID des Tasks mit der PrescriptionID im übergebenen QES-Datensatz übereinstimmt und der Präfix der PrescriptionID gleich dem Flowtype des zu aktivierenden Tasks ist und andernfalls die Operation mit dem http-Fehlercode 400 abbrechen.
</requirement>

<!-- A_23936-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-181" title="TI-Flow-Fachdienst - Task aktivieren - Versicherten-ID als Identifikator von Versicherten" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, dass Patient.identifier.system gleich "http://fhir.de/sid/gkv/kvid-10" ist und andernfalls die Operation mit dem http-Fehlercode 400 und dem Hinweis im OperationOutcome "Als Identifier für den Patienten muss eine VersichertenID (KVNR) angegeben werden." abbrechen.
</requirement>

<!-- A_22487 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-182" title="TI-Flow-Fachdienst - Task aktivieren - Prüfregel Ausstellungsdatum" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS den Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate mit einem Fehlercode 400 und Hinweis im OperationOutcome auf "Ausstellungsdatum und Signaturzeitpunkt weichen voneinander ab, müssen aber taggleich sein" als ungültig abweisen, wenn das Datum authoredOn zur Gültigkeitsberechnung des E-Rezepts nicht dem Datum in QES.Erstellung im Signaturobjekt entspricht.
</requirement>

<!-- A_19127-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-183" title="TI-Flow-Fachdienst - Task aktivieren - Übernahme der Versicherten-ID" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS im Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate die KVNR des Patienten dem Identifier http://fhir.de/sid/gkv/kvid-10 der Patient-Ressource im E-Rezept-Bundle entnehmen und diesen als Identifier in Task.for mit system http://fhir.de/sid/gkv/kvid-10 hinzufügen, damit ausschließlich eine gültige, vom Arzt signierte Patientenreferenz im Workflow verwendet wird.
</requirement>
<!-- ToDo: Grammatik -->

<!-- A_28126 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-184" title="TI-Flow-Fachdienst - Task aktivieren - Push Notification Versicherter" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.activate" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

<!-- A_19128 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-185" title="TI-Flow-Fachdienst - Task aktivieren - Status ready" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS die zulässige Aktivierung eines Tasks mittels /Task/&#60;id&#62;/$activate-Operation im Status Task.status = ready vollziehen und bei erfolgreichem Abschluss der Operation die Ressource Task im HTTP-Body der HTTP-Response zurückgeben, damit die verordnende Leistungserbringerinstitution über den erfolgreichen Abschluss der Operation in Kenntnis gesetzt wird.
</requirement>

<!-- A_19029-06 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-186" title="TI-Flow-Fachdienst - Task aktivieren - Serversignatur" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das bei der Operation /Task/&#60;id&#62;/$activate im QES-Datensatz enthaltene Verordnung in ein Bundle gleichen Typs in JSON-Repräsentation beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/&#60;id&#62; zurück liefern.Dies gilt für folgende Bundles: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundlehttps://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle <br>
    Der TI-Flow-Fachdienst MUSS für diese Bundles 
    <ul>
        <li>einen neuen, eindeutigen Identifier für die Bundle.id als UUID generieren,</li>
        <li>das Bundle entsprechend der Kanonisierungsregeln http://hl7.org/fhir/canonicalization/json#static normalisieren (Bundle.text und Bundle.meta im "root-Element" entfernen),</li>
        <li>mit der Signaturidentität des Fachdienstes ID.FD.OSIG gemäß [FHIR-Sig] signieren und</li>
        <li>das signierte Bundle mit Referenz in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 zurück liefern,</li>
    </ul>
    damit der Versicherte einen Nachweis über die Integrität der gespeicherten Daten einsehen kann.
</requirement>

Die Festlegungen in [FHIR-Sig] sind in Teilen unspezifisch, konkrete Beispiele finden sich in der gematik-API-Beschreibung für das E-Rezept auf https://github.com/gematik/api-erp .<br>
Die Signatur soll als JSON Web Signature [JWS] detached erstellt werden, dementsprechend bleibt das data-Feld der JWS-Struktur leer. Im JWS-Header muss das Zertifikat C.FD.SIG eingebettet werden, mit dessen zugehörigen privaten Signaturschlüssel signiert wurde. Als Wert für targetFormat ist der MimeType application/fhir+json und für sigFormat ist der MimeType application/jose zu verwenden.

### Verifizieren von Prüfziffern

<!-- A_23888 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-187" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der IK Nummer im Profil KBV_PR_FOR_Coverage" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate einen im FHIR Profil KBV_PR_FOR_Coverage gespeicherten Wert für payor.identifier.value gemäß dem im "Gemeinsames Rundschreiben Institutionskennzeichen (IK)" vom 01.06.2020 unter Kapitel 1.2.5 "Prüfziffer" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung den Prozess mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültiges Institutionskennzeichen (IKNR): Das übergebene Institutionskennzeichen im Versicherungsstatus entspricht nicht den Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.
</requirement>

<!-- A_24030 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-188" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der IK Nummer im Profil KBV_PR_FOR_Coverage - AlternativeID" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate die im FHIR Profil KBV_PR_FOR_Coverage gespeicherten Werte für payor.identifier.extension:alternativeID.value[x]:valueIdentifier gemäß dem "Gemeinsames Rundschreiben Institutionskennzeichen (IK)" vom 01.06.2020 unter Kapitel 1.2.5 "Prüfziffer" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültiges Institutionskennzeichen (IKNR): Das übergebene Institutionskennzeichen des Kostenträgers entspricht nicht den Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.
</requirement>

<!-- A_23890-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-189" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung KVNR im Profil KBV_PR_FOR_Patient" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate einen im FHIR Profil KBV_PR_FOR_Patient gespeicherten Wert für Patient.identifier:versichertenId.value gemäß der Anlage 1 der "Prüfziffernberechnung für die Krankenversichertennummer nach § 290 SGB V" vom 26.02.2019 beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültige Versichertennummer (KVNR): Die übergebene Versichertennummer des Patienten entspricht nicht den Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.
</requirement>

<!-- A_23891-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-190" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR im Profil KBV_PR_FOR_Practitioner" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate einen im FHIR Profil KBV_PR_FOR_Practitioner hinterlegten Wert für identifier:ANR.value bzw. identifier:ZANR.value gemäß der Anlage 6 BMV-Ä der "Technischen Anlage zum Vertrag über den Datenaustausch zwischen dem GKV-Spitzenverband (Spitzenverband Bund der Krankenkassen) und der Kassenärztlichen Bundesvereinigung" unter "Aufbau der lebenslangen Arztnummer – LANR" beschriebenen Prüfalgorithmus unter Beachtung der folgenden zulässigen Ausnahmen validieren, und bei einer fehlerhaften Prüfung auf diese Auffälligkeit gemäß der Konfiguration reagieren.
    <table>
        <tr> 
            <th>ANR/ZANR</th>
            <th>Ursache</th>
        </tr>
        <tr> 
            <td>555555 plus Ordnungsnummer für die Reihenfolge in der Anzeige an die ASV-Verzeichnisstelle (KH-Zähler) plus Fachgruppencode</td>
            <td>Verordnungen im Rahmen der Versorgung nach § 116b Abs. 1 SGB</td>
        </tr>
    </table>
    <div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_016 Zulässige Ausnahmen in Form von Pseudoarztnummern</figcaption></div>
</requirement>

Hinweis: Folgende weitere Pseudoarztnummern werden genutzt. Sie sind Prüfziffernkonform:
<table>
    <tr> 
        <th>ANR/ZANR</th>
        <th>Ursache</th>
    </tr>
    <tr> 
        <td>4444444 plus Fachgruppencode</td>
        <td>Pseudoarztnummer im Rahmen des Reha-Entlassmanagements</td>
    </tr>
    <tr> 
        <td>999999900</td>
        <td>Ambulanzen in Krankenhäusern gemäß §§ 115b, 116, 116a, 117, 118, 118a, 119, 119c und 140a SGB V - insbesondere Hochschulambulanzen sowie psychiatrische und psychosomatische Institutsambulanzen; Privatärzte ohne LANR, Ärzte in Weiterbildung, Leistungserbringung im Rahmen der gesetzlichen Unfallversicherung - insbesondere gemäß § 33 und 34 SGB VII</td>
    </tr>
    <tr> 
        <td>000000000</td>
        <td>Ausnahme der Verordnungen im Rahmen der Versorgung nach § 116b Abs. 1 SGB V</td>
    </tr>
    <tr> 
        <td>999999991</td>
        <td>Zahnärzte z.B. in zahnärztlichen Hochschulambulanzen</td>
    </tr>
    <tr> 
        <td>333333300</td>
        <td>Verordnungen von Arznei, Heil- und Hilfsmitteln im Rahmen der spezialisierten ambulanten Palliativversorgung (SAPV)</td>
    </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_017 Zulässige Ausnahmen in Form von Pseudoarztnummern (Prüfzifferkonform)</figcaption></div>

Hinweis: Im Rahmen der ambulanten spezialfachärztlichen Versorgung (ASV) nach § 116b SGB V wird gemäß der ASV-Vereinbarung von Krankenhausärzten die sog. Fachgruppennummer statt der LANR verwendet. Die Fachgruppennummer wird ein einem separaten Element hinterlegt. In diesem Fall muss keine ANR angegeben werden.

<!-- A_24031 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-191" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration bei Auffälligkeiten" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR eine Möglichkeit der Konfiguration vorsehen und bei der Durchführung einer Vergleichsoperation je nach Konfiguration bei Auffälligkeit die Operation mit einer Warnung fortführen oder mit einer Fehlermeldung abbrechen.
</requirement>

<!-- A_24032 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-192" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration Fehler" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR, wenn bei der Prüfung eine Auffälligkeit auftritt und die Konfiguration Fehler aktiv ist, mit dem Http-Fehlercode 400 abbrechen und die Fehlermeldung "Ungültige Arztnummer (LANR oder ZANR): Die übergebene Arztnummer entspricht nicht den Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.
</requirement>

<!-- A_24033 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-193" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration Warning" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR, wenn bei der Prüfung eine Auffälligkeit auftritt und die Konfiguration Warning aktiv ist, mit dem Http-Responsecode 252 antworten und den Response für die Auffälligkeit mit einem Http-Header "Warning" mit
    <ul>
        <li>warning-code: 252</li>
        <li>warning-agent: "erp-server"</li>
        <li>warning-text: "Ungültige Arztnummer (LANR oder ZANR): Die übergebene Arztnummer entspricht nicht den Prüfziffer-Validierungsregeln."</li>
    </ul>
    erweitern.
</requirement>

<!-- A_23892 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-194" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der PZN im Profil KBV_PR_ERP_Medication_PZN" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate den im FHIR Profil KBV_PR_ERP_Medication_PZN gespeicherten Wert für code.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.
</requirement>
<!-- ToDo: ggf. nach IG rx verschieben -->

<!-- A_24034 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-195" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der PZN im Profil KBV_PR_ERP_Medication_Compounding" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate den im FHIR Profil KBV_PR_ERP_Medication_Compounding gespeicherten Wert für ingredient.item[x]:itemCodeableConcept.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen sowie die Fehlermeldung "Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln." in Form einer OperationOutcome ausliefern.
</requirement>
<!-- ToDo: ggf. nach IG rx verschieben -->

<!-- A_22925 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-196" title="TI-Flow-Fachdienst - Task aktivieren - Längenprüfung PZN" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf die Längenprüfung der PZN ("Länge PZN unzulässig (muss 8-stellig sein))" im OperationOutcome) abbrechen, wenn die PZN einer übergebenen PZN-Verordnung in KBV_PR_ERP_Medication_PZN.code.coding.code nicht 8-stellig ist.
</requirement>
<!-- ToDo: ggf. nach IG rx verschieben -->
