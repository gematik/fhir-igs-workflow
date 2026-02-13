### Verarbeitungsregeln fuer den E-Rezept-Fachdienst

Die RX-Verarbeitung folgt einer sequenziellen Regelkette:

1. Authentisierung und Rollenpruefung
2. Berechtigungspruefung (AccessCode/Secret je Endpunkt)
3. Schemavalidierung und fachliche Plausibilisierung
4. Statusuebergaenge im Task-Workflow
5. Folgeverarbeitung (z. B. ePA Medication Service, Push)

Die konkreten Anforderungen sind auf den jeweiligen Operations- und Query-Seiten dokumentiert.
