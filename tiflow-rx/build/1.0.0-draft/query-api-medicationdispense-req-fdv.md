# FdV-Anforderungen: MedicationDispense-Query - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: MedicationDispense**](query-api-medicationdispense.md)
* **FdV-Anforderungen: MedicationDispense-Query**

## FdV-Anforderungen: MedicationDispense-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" die HTTP-Operation GET /MedicationDispense mit
* ACCESS_TOKEN im Authorization-Header
* optional: Suchparameter gemäß https://www.hl7.org/fhir/medicationdispense.html#search
ausführen.
### Modulspezifische Anforderungen

Wenn die abgebende LEI ein E-Rezept beliefert, dann stellt sie dem Versicherten Informationen zur Abgabe auf dem E-Rezept-Fachdienst ein. Das ist insbesondere relevant, wenn ein Arzneimittel substituiert wird.

Die abgebende LEI stellt die Abgabeinformationen entweder vor dem Abschluss oder beim Abschluss des Workflows zum E-Rezept ein.

Werden die Abgabeinformationen vor dem Abschluss der Workflows eingestellt, dann ändert sich der Status des Workflows nicht (Task.status=in-progress). Im Task ist der Zeitpunkt des Einstellens unter Task.extension:lastMedicationDispense gespeichert. Solange der Workflow nicht abgeschlossen ist, können die Abgabeinformationen gelöscht oder geändert werden. Hierbei wird der Zeitpunkt des Einstellens jeweils gelöscht bzw. neu gesetzt.

Mit dem Abschluss des Workflows ist Task.status=complete. Ein Ändern der Abgabeinformationen ist danach nicht mehr möglich.

Hinweis: Die Information, dass eine Abgabeinformation eingestellt wurde (Task.status = “in-progress” und Task.extension:lastMedicationDispense existiert) kann dafür genutzt werden den Status des E-Rezepts als Abgegeben darzustellen.

Falls auf dem E-Rezept-Fachdienst Informationen zur Abgabe durch die abgebende LEI hinterlegt wurden, liefert der Response ein MedicationDispense Ressource. Zur Spezifikation der MedicationDispense Ressource siehe [gemSpec_DM_eRp]. Diese beinhaltet u.a. die folgenden fachlichen Informationen zum abgegebenen Arzneimittel:

* Pharmazentralnummer
* Beschreibung des Arzneimittels Der Abruf aller MedicationDispense-Objekte zu einer Verordnung erfolgt über die Abfrage GET /MedicationDispense?identifer=<PrescriptionID>. Dieser Aufruf liefert ein FHIR-Bundle von MedicationDispense-Objekten. Enthalten sind alle (ein oder mehrere) MedicationDispense-Objekte die für die Verordnung mit PrescriptionID eingestellt wurden.

