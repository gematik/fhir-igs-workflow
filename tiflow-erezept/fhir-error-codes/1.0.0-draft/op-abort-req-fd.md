# FdV-Anforderungen $abort - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **FdV-Anforderungen $abort**

## FdV-Anforderungen $abort

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$abort`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$abort`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts durch einen Versicherten, wenn der HTTP-Request keinen HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." enthält, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in Task.for hinterlegte KVNR des begünstigten Patienten prüfen und bei Missmatch den Aufruf mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)

abweisen, damit ausschließlich der begünstigte Versicherte als Berechtigter ohne Kenntnis des AccessCodes ein E-Rezept löscht.

Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten/Task/<id>/$abort durch verordnende Leistungserbringer den im HTTP-Header "X-AccessCode" gegen den im referenzierten Task enthaltenen AccessCode prüfen und bei Missmatch oder Fehlen im HTTP-Header, den Aufruf mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_ACCESSCODE_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abweisen, damit ausschließlich die verordnende Leistungserbringerinstitution in Kenntnis des AccessCodes als Berechtigte ein E-Rezept löschen.

Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten/Task/<id>/$abort durch verordnende Leistungserbringer den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 412 - Precondition Failed: error
* HTTP-Code: Code
  * 412 - Precondition Failed: invalid
* HTTP-Code: Details Code
  * 412 - Precondition Failed: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 412 - Precondition Failed: Task has invalid status.

abbrechen, wenn Task.status ungleich "ready" ist, damit die verordnende Leistungserbringerinstitution eine Verordnung nur löschen kann, wenn sie sich noch nicht in Belieferung befindet oder beliefert wurde.

Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort alle personenbezogenen medizinischen Daten, außer der KVNR in Task.for, aus dem referenzierten Task entfernen. Dies gilt insbesondere für:
* Task.input --> löschen (inkl. aller referenzierten Elemente)
* Task.output --> löschen (inkl. aller referenzierten Elemente)
* Task.identifier (AccessCode) --> löschen
* Task.identifier (Secret, falls vorhanden) --> löschen
* Task.extension:lastMedicationDispense (Zeitstempel, falls vorhanden) --> löschen
* Task.owner --> löschen
* Medication --> die in MedicationDispense.medication referenzierte Medication löschen
* MedicationDispense --> die in MedicationDispense.supportingInformation auf Task.id verweist löschen
* Communication --> die in Communication.basedOn auf Task.id verweist
damit dem Betroffenenrecht auf Löschen durch den Versicherten entsprochen wird und beim Löschen durch den Verordnenden dem Versicherten eine aussagekräftige Fehlermeldung durch einen Apotheker vermittelt werden kann.
Hinweis: Die KVNR in Task.for wird nicht gelöscht, damit der Versicherte den Status des Task mit dem E-Rezept-FdV abrufen kann.

Bestehende Übermittlungsaufträge in den ePA Medication Service für das zu löschende E-Rezept werden nicht gelöscht.

Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort den Status des Tasks Task.status auf den Wert "cancelled" setzen, damit der Task nicht weiter bearbeitet werden kann.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$abort bei erfolgreichem Abschluss der Operation, wenn die Rolle des aufrufenden Nutzers ungleich oid_versicherter ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.abort" und den Versicherten mit der KVNR = Task.for initiieren.
### Modulspezifische Anforderungen

Der TI-Flow-Fachdienst MUSS beim Löschen eines Tasks für eine Verordnung mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$abort-Operation auf den in der URL referenzierten/Task/<id> die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
* oid_versicherter
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_krankenhaus
* oid_institution-vorsorge-reha
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am Fachdienst aufrufen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abrechen, damit die Verordnung nicht durch einen Unberechtigten gelöscht werden kann.

Der TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort verhindern und die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abweisen, wenn der Status des adressierten Tasks gleich "in-progress" ist und die Rolle des aufrufenden Nutzers nicht einer der folgenden Rollen entspricht:
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
damit Nutzer außerhalb der Apotheke keine Rezepte löschen, die sich aktuell in Belieferung befinden.

Der TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort verhindern und die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abweisen, wenn der Status des adressierten Tasks ungleich "in-progress" ist und die Rolle des aufrufenden Nutzers einer der folgenden Rollen entspricht:
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
damit kein Apotheker ein Rezept löscht, das ihm nicht ausdrücklich zugewiesen wurde.

Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort durch abgebende Leistungserbringer (Apotheken) das im URL-Parameter "?secret=..." übertragene Geheimnis gegen das im referenzierten Task enthaltene Secret in Task.identifier prüfen und bei Missmatch oder Fehlen des URL-Parameters den Aufruf mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_SECRET_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abweisen, damit ausschließlich Apotheker in Kenntnis des Secret als Berechtigte ein E-Rezept löschen.

Der TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts mit dem Flowtype 169 oder 209 über den mittels der <id> adressierten /Task/<id>/$abort verhindern und die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abweisen, wenn der Status des adressierten Tasks ungleich "completed" ist und die Rolle des aufrufenden Nutzers der folgenden Rollen entspricht: oid_versicherter damit kein Versicherter ein E-Rezept aus einem Workflow mit Workflowsteuerung durch Leistungserbringer (169, 209) löscht, das nicht bereits beliefert wurde.

Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/<id>/$abort durch eine verordnende oder abgebende Leistungserbringerinstitution die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.

Der TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/$abort durch einen Versicherten, wenn Task.status = ready, die Daten für die Löschinformation des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.

