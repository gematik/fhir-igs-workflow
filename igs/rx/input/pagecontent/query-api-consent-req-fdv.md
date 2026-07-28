Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung der `Consent`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-consent-req-fdv.md %}

### Modulspezifische Anforderungen

Für die Verwaltung der Einwilligung zum Einlösen von E-Rezepten im europäischen Ausland wird Consent.category.coding.code mit dem Codesystem https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType verwendet.
