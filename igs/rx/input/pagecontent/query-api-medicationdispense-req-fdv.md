Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

Wenn eine Apotheke ein E-Rezept beliefert, dann stellt sie dem Versicherten Informationen zur Abgabe auf dem TI-Flow-Fachdienst ein. Das ist insbesondere relevant, wenn ein Arzneimittel substituiert wird.

Die Apotheke stellt die Abgabeinformationen entweder vor dem Abschluss oder beim Abschluss des Workflows zum E-Rezept ein.

Werden die Abgabeinformationen vor dem Abschluss der Workflows eingestellt, dann ändert sich der Status des Workflows nicht (Task.status="in-progress"). Im Task ist der Zeitpunkt des Einstellens unter Task.extension:lastMedicationDispense gespeichert. Solange der Workflow nicht abgeschlossen ist, kann die Apotheke die Abgabeinformationen löschen oder ändern. Hierbei wird der Zeitpunkt des Einstellens jeweils gelöscht bzw. neu gesetzt.

Mit dem Abschluss des Workflows ist Task.status="complete". Ein Ändern der Abgabeinformationen durch die Apotheke ist danach nicht mehr möglich.

Hinweis: Die Information, dass eine Abgabeinformation eingestellt wurde (Task.status = "in-progress" und Task.extension:lastMedicationDispense existiert) kann dafür genutzt werden, den Status des E-Rezepts als Abgegeben darzustellen.

Falls auf dem TI-Flow-Fachdienst Informationen zur Abgabe durch die abgebende LEI hinterlegt wurden, liefert der Response eine MedicationDispense Ressource. Diese beinhaltet u.a. die folgenden fachlichen Informationen zum abgegebenen Arzneimittel:
- Pharmazentralnummer
- Beschreibung des Arzneimittels

Der Abruf aller MedicationDispense-Objekte zu einer Verordnung erfolgt über die Abfrage GET /MedicationDispense?identifer=&lt;PrescriptionID&gt;. Dieser Aufruf liefert ein FHIR-Bundle von MedicationDispense-Objekten. Enthalten sind alle (ein oder mehrere) MedicationDispense-Objekte die für die Verordnung mit PrescriptionID eingestellt wurden.
