# Operation `$activate` (Task aktivieren)

Diese Seite enthaelt die moduluebergreifenden Basisanforderungen fuer `$activate`.
Fachmodulspezifische Regeln (z. B. Flowtype-spezifische Payload-Pruefungen, MVO-Fachregeln) werden in den Modul-IGs ergaenzt.

<requirement conformance="SHALL" key="IG-WF-CORE-OP-101" title="E-Rezept-Fachdienst - Task aktivieren - Rollenpruefung (A_19022-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks fuer ein E-Rezept mittels HTTP-POST/$activate-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschliesslich verordnende Leistungserbringer in der Rolle oid_praxis_arzt, oid_zahnarztpraxis, oid_praxis_psychotherapeut, oid_krankenhaus, oid_institution-vorsorge-reha die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte eingestellt werden koennen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-102" title="E-Rezept-Fachdienst - Task aktivieren - Pruefung AccessCode Rezept aktualisieren (A_19024-03)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$activate den im HTTP-RequestHeader "X-AccessCode" oder URL-Parameter "?ac=..." uebertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode und den Status des Tasks auf Task.status = draft pruefen und bei Ungleichheit oder Fehlen des HTTP-Headers die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-103" title="E-Rezept-Fachdienst - Schemavalidierung Rezept aktivieren (A_19020)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS den im Aufrufparameter der HTTP-POST-Operation /Task/&lt;id&gt;/$activate uebergebenen FHIR-Operationsparameter des QES-Datensatzes als PKCS#7-Datei einer Enveloping CAdES-Signatur entgegennehmen und verarbeiten und bei Fehlen oder ungueltiger ASN.1 Datenstruktur die Weiterverarbeitung im Fachdienst mit dem http-Status-Code 400 beantworten, damit kein Schadcode und keine "fachfremden" Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-104" title="E-Rezept-Fachdienst - Task aktivieren - QES pruefen Rezept aktualisieren (A_19025-03)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$activate die qualifizierte Signatur des QES-Datensatzes gemaess [ETSI_QES] pruefen und bei nicht gueltiger qualifizierter Signatur die Operation mit Status 400 abbrechen; bei gueltiger Signatur das innerhalb des PKCS#7-Datensatz enveloping-enthaltene FHIR-Bundle einer umfaenglichen FHIR-Validierung gegen die eRezept-Schema-Definition der KBV kbv.ita.erp oder kbv.itv.evdga unterziehen und bei Invaliditaet die Operation mit Status 400 abbrechen; und bei gueltiger Signatur und validem FHIR den Datensatz als PKCS#7-Datei sicher speichern und in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 ueber eine interne, eindeutige UUID referenzieren, damit der nachfolgende Workflow ausschliesslich auf Basis medizinisch korrekter und vom Leistungserbringer mittels Signatur freigegebener Daten erfolgt.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-105" title="E-Rezept-Fachdienst - Task aktivieren - Mimetype Signatur (A_23172)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$activate die Angabe zum Mimetype des signierten Dokumentes pruefen und mit dem Fehler 400 abbrechen, wenn dieser ungleich "text/plain; charset=utf-8" ist.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-106" title="E-Rezept-Fachdienst - Pruefung Rezept-ID und Praefix gegen Flowtype (A_21370)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim berechtigten Aufruf der Operation POST /Task/&lt;id&gt;/$activate pruefen, dass die PrescriptionID des Tasks mit der PrescriptionID im uebergebenen QES-Datensatz uebereinstimmt und der Praefix der PrescriptionID gleich dem Flowtype des zu aktivierenden Tasks ist und andernfalls die Operation mit dem http-Fehlercode 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-107" title="E-Rezept-Fachdienst - Task aktivieren - Versicherten-ID als Identifikator von Versicherten (A_23936-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$activate pruefen, dass Patient.identifier.system gleich "http://fhir.de/sid/gkv/kvid-10" ist und andernfalls die Operation mit dem http-Fehlercode 400 und dem Hinweis im OperationOutcome "Als Identifier fuer den Patienten muss eine VersichertenID (KVNR) angegeben werden." abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-108" title="E-Rezept-Fachdienst - Task aktivieren - Pruefregel Ausstellungsdatum (A_22487)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS den Aufruf der http-POST-Operation /Task/&lt;id&gt;/$activate mit einem Fehlercode 400 und Hinweis im OperationOutcome auf "Ausstellungsdatum und Signaturzeitpunkt weichen voneinander ab, muessen aber taggleich sein" als ungueltig abweisen, wenn das Datum authoredOn zur Gueltigkeitsberechnung des E-Rezepts nicht dem Datum in QES.Erstellung im Signaturobjekt entspricht.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-109" title="E-Rezept-Fachdienst - Task aktivieren - Laengenpruefung PZN (A_22925)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf die Laengenpruefung der PZN ("Laenge PZN unzulaessig (muss 8-stellig sein)") im OperationOutcome abbrechen, wenn die PZN einer uebergebenen PZN-Verordnung in KBV_PR_ERP_Medication_PZN.code.coding.code nicht 8-stellig ist.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-110" title="E-Rezept-Fachdienst - Status aktivieren (A_19128)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS die zulaessige Aktivierung eines Tasks mittels /Task/&lt;id&gt;/$activate-Operation im Status Task.status = ready vollziehen und bei erfolgreichem Abschluss der Operation die Ressource Task im HTTP-Body der HTTP-Response zurueckgeben, damit der verordnende Leistungserbringer ueber den erfolgreichen Abschluss der Operation in Kenntnis gesetzt wird.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-111" title="E-Rezept-Fachdienst - Task aktivieren - Serversignatur Rezept aktivieren (A_19029-06)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS das bei der Operation /Task/&lt;id&gt;/$activate im QES-Datensatz enthaltene Verordnung in ein Bundle gleichen Typs in JSON-Repraesentation beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/&lt;id&gt; zurueck liefern. Dies gilt fuer die Bundles https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle und https://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle. Der E-Rezept-Fachdienst MUSS fuer diese Bundles einen neuen, eindeutigen Identifier fuer die Bundle.id als UUID generieren, das Bundle entsprechend der Kanonisierungsregeln http://hl7.org/fhir/canonicalization/json#static normalisieren (Bundle.text und Bundle.meta im root-Element entfernen), mit der Signaturidentitaet des Fachdienstes ID.FD.OSIG gemaess [FHIR-Sig] signieren und das signierte Bundle mit Referenz in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 zurueck liefern, damit der Versicherte einen Nachweis ueber die Integritaet der gespeicherten Daten einsehen kann.
</requirement>
