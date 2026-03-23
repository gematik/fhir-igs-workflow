# Anforderungen an den E-Rezept-Fachdienst für die $abort-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $abort**](op-abort.md)
* **Anforderungen an den E-Rezept-Fachdienst für die $abort-Operation**

## Anforderungen an den E-Rezept-Fachdienst für die $abort-Operation

Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$abort`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$abort`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts durch einen Versicherten, wenn der HTTP-Request keinen HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." enthält, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in Task.for hinterlegte KVNR des begünstigten Patienten prüfen und bei Missmatch den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte als Berechtigter ohne Kenntnis des AccessCodes ein E-Rezept löscht.

Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten/Task/<id>/$abort durch verordnende Leistungserbringer den im HTTP-Header "X-AccessCode" gegen den im referenzierten Task enthaltenen AccessCode prüfen und bei Missmatch oder Fehlen im HTTP-Header, den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die verordnende Leistungserbringerinstitution in Kenntnis des AccessCodes als Berechtigte ein E-Rezept löschen.

Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten/Task/<id>/$abort durch verordnende Leistungserbringer den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "ready" ist, damit die verordnende Leistungserbringerinstitution eine Verordnung nur löschen kann, wenn sie sich noch nicht in Belieferung befindet oder beliefert wurde.

Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort alle personenbezogenen medizinischen Daten, außer der KVNR in Task.for, aus dem referenzierten Task entfernen. Dies gilt insbesondere für:
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

Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort den Status des Tasks Task.status auf den Wert "cancelled" setzen, damit der Task nicht weiter bearbeitet werden kann.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$abort bei erfolgreichem Abschluss der Operation, wenn die Rolle des aufrufenden Nutzers ungleich oid_versicherter ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.abort" und den Versicherten mit der KVNR = Task.for initiieren.
### Modulspezifische Anforderungen

Der E-Rezept-Fachdienst MUSS beim Löschen eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$abort-Operation auf den in der URL referenzierten/Task/<id> die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
* oid_versicherter
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_krankenhaus
* oid_praxis_psychotherapeut
* oid_institution-vorsorge-reha
die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten gelöscht werden kann.

