
**Titel:** E-T-Rezept Structure Map for Organization

**Beschreibung:** Mapping-Anweisungen zur Erstellung einer BfArM Organization aus dem VZD SearchSet

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `vzdSearchSet.entry` | *(wird bestimmt durch Kontext)* | Mappt Organization-Einträge aus dem VZD SearchSet |
| `vzdSearchSet.entry.resource [Typ: Organization]` | *(wird bestimmt durch Kontext)* | Verarbeitet jeden Eintrag im SearchSet |
| `vzdSearchSet.entry.resource [Typ: Organization].name` | `bfarmOrganization.name` | Übernimmt den Namen der Organisation aus dem VZD in die BfArM Organization<br>→ übernimmt Wert aus Quellvariable |
| `vzdSearchSet.entry.resource [Typ: Organization].identifier [Bedingung: $this.system='https://gematik.de/fhir/sid/telematik-id']` | `bfarmOrganization.identifier` | Mappt die Telematik-ID der Organisation |
| `vzdSearchSet.entry.resource [Typ: Organization].identifier [Bedingung: $this.system='https://gematik.de/fhir/sid/telematik-id'].value` | `bfarmOrganization.identifier.system` | Kopiert die Telematik-ID mit korrektem System-Identifier in die Ziel-Organisation<br>→ setzt URL 'https://gematik.de/fhir/sid/telematik-id' |
| `vzdSearchSet.entry.resource [Typ: Organization].identifier [Bedingung: $this.system='https://gematik.de/fhir/sid/telematik-id'].value` | `bfarmOrganization.identifier.value` | Kopiert die Telematik-ID mit korrektem System-Identifier in die Ziel-Organisation<br>→ übernimmt Wert aus Quellvariable |
| `vzdSearchSet.entry.resource [Typ: Organization].identifier [Bedingung: $this.system='https://gematik.de/fhir/sid/telematik-id'].value` | `bfarmOrganization.id` | Kopiert die Telematik-ID mit korrektem System-Identifier in die Ziel-Organisation<br>→ übernimmt Wert aus Quellvariable |
| `vzdSearchSet.entry` | *(wird bestimmt durch Kontext)* | Mappt HealthcareService-Informationen für Kontaktdaten |
| `vzdSearchSet.entry.resource [Typ: HealthcareService]` | *(wird bestimmt durch Kontext)* | Verarbeitet HealthcareService-Einträge aus dem SearchSet |
| `vzdSearchSet.entry.resource [Typ: HealthcareService].telecom` | `bfarmOrganization.telecom` | Übernimmt Kontaktinformationen (Telefon, E-Mail) aus dem HealthcareService in die Organisation<br>→ übernimmt Wert aus Quellvariable |
| `vzdSearchSet.entry` | *(wird bestimmt durch Kontext)* | Mappt Location-Informationen für Adressdaten |
| `vzdSearchSet.entry.resource [Typ: Location]` | *(wird bestimmt durch Kontext)* | Verarbeitet Location-Einträge aus dem SearchSet |
| `vzdSearchSet.entry.resource [Typ: Location].address` | `bfarmOrganization.address` | Übernimmt die Adressinformationen aus der Location in die Organisation<br>→ übernimmt Wert aus Quellvariable |
