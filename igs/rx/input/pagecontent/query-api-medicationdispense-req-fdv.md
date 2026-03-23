Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-medicationdispense-req-fdv.md %}

### Modulspezifische Anforderungen

Wenn die abgebende LEI ein E-Rezept beliefert, dann stellt sie dem Versicherten Informationen zur Abgabe auf dem E-Rezept-Fachdienst ein. Das ist insbesondere relevant, wenn ein Arzneimittel substituiert wird.

Die abgebende LEI stellt die Abgabeinformationen entweder vor dem Abschluss oder beim Abschluss des Workflows zum E-Rezept ein.

Werden die Abgabeinformationen vor dem Abschluss der Workflows eingestellt, dann ändert sich der Status des Workflows nicht (Task.status=in-progress). Im Task ist der Zeitpunkt des Einstellens unter Task.extension:lastMedicationDispense gespeichert. Solange der Workflow nicht abgeschlossen ist, können die Abgabeinformationen gelöscht oder geändert werden. Hierbei wird der Zeitpunkt des Einstellens jeweils gelöscht bzw. neu gesetzt.

Mit dem Abschluss des Workflows ist Task.status=complete. Ein Ändern der Abgabeinformationen ist danach nicht mehr möglich.

Hinweis: Die Information, dass eine Abgabeinformation eingestellt wurde (Task.status = "in-progress" und Task.extension:lastMedicationDispense existiert) kann dafür genutzt werden den Status des E-Rezepts als Abgegeben darzustellen.

Falls auf dem E-Rezept-Fachdienst Informationen zur Abgabe durch die abgebende LEI hinterlegt wurden, liefert der Response ein MedicationDispense Ressource. Zur Spezifikation der MedicationDispense Ressource siehe [gemSpec_DM_eRp]. Diese beinhaltet u.a. die folgenden fachlichen Informationen zum abgegebenen Arzneimittel:
- Pharmazentralnummer
- Beschreibung des Arzneimittels
Der Abruf aller MedicationDispense-Objekte zu einer Verordnung erfolgt über die Abfrage GET /MedicationDispense?identifer=&lt;PrescriptionID&gt;. Dieser Aufruf liefert ein FHIR-Bundle von MedicationDispense-Objekten. Enthalten sind alle (ein oder mehrere) MedicationDispense-Objekte die für die Verordnung mit PrescriptionID eingestellt wurden.