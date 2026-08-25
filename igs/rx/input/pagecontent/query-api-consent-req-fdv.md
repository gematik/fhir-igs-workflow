Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung der `Consent`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

Für die Verwaltung der Einwilligung zum Einlösen von E-Rezepten im europäischen Ausland wird Consent.category.coding.code mit dem Codesystem https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType verwendet.
