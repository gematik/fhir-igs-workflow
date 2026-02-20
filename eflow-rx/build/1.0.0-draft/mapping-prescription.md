# Mapping von Verordnungsdaten - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Vorgaben zum Mapping von FHIR-Instanzen**](menu-technische-umsetzung-mapping.md)
* **Mapping von Verordnungsdaten**

## Mapping von Verordnungsdaten

Nach Einstellen eines E-Rezepts durch ein verordnendes System müssen die Verordnungsdaten an den ePA Medication Service übermittelt werden.

Die Verordnung wird technisch als ein [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle) eingestellt und muss an den ePA Medication Service in die [EPAOpProvidePrescriptionERPInputParameters](https://gemspec.gematik.de/ig/fhir/epa-medication/1.3.0/profiles-provide-prescription-parameters.html) Struktur überführt werden.

**Abbildung: **Transformation des KBV_PR_ERP_Bundle in EPAOpProvidePrescriptionERPInputParameters


Hierbei werden verschiedene Quellen benötigt, um die Daten vollständig zu überführen:

* Der Verordnungsdatensatz als KBV_PR_ERP_Bundle
* Der ACCESS_TOKEN der Anfrage zur $activate-Operation

## Übersicht des Mappingvorgehens

Für dieses Mapping wird ein FHIR-Bundle in eine FHIR-Parameters Struktur überführt. Ein FHIR Bundle enthält eine Liste von FHIR-Ressourcen (entries). Dort ist tabellarisch beschrieben, wie die einzelnen Elemente des KBV_PR_ERP_Bundle in die entsprechenden Elemente der Provide_Prescription_Parameters Struktur überführt werden und welche Mappings für die enthaltenen Ressourcen verwendet werden.

Die folgende Seite beschreibt das generelle Mapping des Bundles:

* [Mapping der Bundle Ressource](./mapping-prescription-bundle-parameters.md)

Diese Structuremap kann in Kombination mit den StructureMaps aus diesem Projekt verwendet werden, um die Verordnungsdaten in die von der ePA geforderten Formate zu überführen.

Die folgenden Seiten beschreiben die Mappings der einzelnen Ressourcen im Detail:

* [Mapping der Practitioner Ressource](./mapping-prescription-practitioner.md)
* [Mapping der Organization Ressource](./mapping-prescription-organization.md)
* [Mapping der MedicationRequest Ressource](./mapping-prescription-medicationrequest.md)
* [Mapping der Medication Ressource](./mapping-prescription-medication.md)

## Transformationsregeln für Verordnungsdaten

Einige Daten müssen zusätzlich durch Transformationsregeln angepasst oder ergänzt werden. Die folgenden Transformationsregeln werden für das Mapping von **Verordnungsdaten** verwendet:

#### Organization für provide Prescription

* ID: Beschreibung
  * `F_006b`: Bei provide Prescription ist die Organization aus der KBV_PR_FOR_Organization zu mappen.Der Transformator muss sicherstellen, dass bei Organization.identifier mindestens die TelematikID der Organisation enthalten, die auch im ACCESS_TOKEN der Anfrage angegeben ist. Dazu muss nach der A_25946 die TelematikId bei “identifier:TelematikID” durch die idNummer aus dem ACCESS_TOKEN des verwendeten Operationsaufrufes ersetzt werden bzw. erzeugt werden, wenn diese nicht vorhanden ist.Folgende Operationen sind zusätzlich zum Mapping der StructureMaps durchzuführen:Organization.identifier:TelematikID idNummer → aus dem ACCESS_TOKEN der AnfrageOrganization.name organizationName → aus dem ACCESS_TOKEN der AnfrageOrganization.type:profession professionOID → aus dem ACCESS_TOKEN der Anfrage
* ID: Profile
  * `F_006b`: * [OrganizationDirectory](https://simplifier.net/vzd-fhir-directory/organizationdirectorystrict)

* ID: Referenzen
  * `F_006b`: * [A_25946 - E-Rezept-Fachdienst - ePA - Mapping](https://gemspec.gematik.de/docs/gemF/gemF_eRp_ePA/gemF_eRp_ePA_V1.2.1/#A_25946)


#### Address Slices in Organization

* ID: Beschreibung
  * `F_007`: Beim Mapping der Organization bei providePrescription (siehe 006b) sollen die Extensions der Adresse:* Organization.address:Strassenanschrift.line.extension:Adresszusatz
* Organization.address:Strassenanschrift.line.extension:Hausnummer
* Organization.address:Strassenanschrift.line.extension:Strasse in das OpenSlicing des Organization-Profils des VZD übernommen werden, auch wenn diese nicht explizit dort modelliert sind.

* ID: Profile
  * `F_007`: * [KBV_PR_FOR_Organization](https://simplifier.net/for/kbv_pr_for_organization)
* [OrganizationDirectory](https://simplifier.net/vzd-fhir-directory/organizationdirectorystrict)

* ID: Referenzen
  * `F_007`: * [2024.05.28 - ePa Medikationsliste: Austausch IBM und PT Medical](https://wiki.gematik.de/display/ERPCHANGES/2024.05.28+-+ePa+Medikationsliste%3A+Austausch+IBM+und+PT+Medical)


#### Eintrag für MedicationRequest.subject

* ID: Beschreibung
  * `F_010`: Das Befüllen des MedicationRequest.subject muss erfolgen, indem die Werte von* Patient.identifier.system
* Patient.identifier.value
aus dem KbvBundle.patient.identifier übernommen werden und in der folgenden Form im ePA MedicationRequest angegeben werden:```
  <subject>
    <identifier>
      <system value="http://fhir.de/sid/gkv/kvid-10" />
      <value value="X110411319" />
    </identifier>
  </subject>

```

* ID: Profile
  * `F_010`: * [KBV_PR_FOR_Patient](https://simplifier.net/for/kbv_pr_for_patient)
* [EPA MedicationRequest](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication-request.md)

* ID: Referenzen
  * `F_010`: * [ANFERP-2638](https://service.gematik.de/browse/ANFERP-2638)


#### Befüllung von Practitioner.name

* ID: Beschreibung
  * `F_011`: Der Practitioner.name.text ist ein Pflichtfeld und muss aus den Namensinformationen erzeugt werden.Dabei ist folgende Bildungsregel anzuwenden:```
def build_practitioner_name(practitioner):
  # Verknüpft Elemente einer Liste zu einem String, getrennt durch Leerzeichen
  def join_with_space(elements):
    return " ".join(elements)

  # Hilfsfunktion zum Abrufen des Werts einer Extension
  def get_extension_value(extensions, url):
    for ext in extensions:
      if ext.get("url") == url:
        return ext.get("valueString") or ext.get("valueCode", "")
    return ""

  # Namenszusätze und Präfix-Qualifier URLs
  namenszusatz_url = "http://hl7.org/fhir/StructureDefinition/humanname-namenszusatz"
  nachname_url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
  vorsatzwort_url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
  prefix_qualifier_url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"

  # Zusätzliche Namenskomponenten aus den Extensions abrufen
  family_extensions = practitioner["name"][0]["family"]["extension"]
  namenszusatz = get_extension_value(family_extensions, namenszusatz_url)
  nachname = get_extension_value(family_extensions, nachname_url)
  vorsatzwort = get_extension_value(family_extensions, vorsatzwort_url)
  prefix_extensions = practitioner["name"][0].get("prefix", [{}])[0].get("extension", [])
  prefix_qualifier = get_extension_value(prefix_extensions, prefix_qualifier_url)

  # Zusammensetzung des Namens
  prefix = join_with_space([practitioner["name"][0].get("prefix", {}).get("value", "")])
  given_name = practitioner["name"][0].get("given", "")
  family_name = f"{vorsatzwort} {nachname} {namenszusatz}".strip()

  # Zusammensetzen des vollständigen Namens mit Leerzeichen dazwischen
  full_name = f"{prefix_qualifier} {prefix} {given_name} {family_name}".strip()

  return full_name


# Beispielhafte Verwendung
practitioner_example = {
  "name": [
    {
      "use": "official",
      "family": {
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/humanname-namenszusatz",
            "valueString": "von",
          },
          {
            "url": "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
            "valueString": "Müller",
          },
          {
            "url": "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix",
            "valueString": "Dr.",
          },
        ],
        "family": "Müller",
      },
      "given": "Hans",
      "prefix": [
        {
          "extension": [
            {
              "url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier",
              "valueCode": "AC",
            }
          ],
          "value": "Prof.",
        }
      ],
    }
  ]
}

print(build_practitioner_name(practitioner_example))

```

* ID: Profile
  * `F_011`: * [KBV_PR_FOR_Practitioner](https://simplifier.net/for/kbv_pr_for_practitioner)
* [PractitionerDirectory](https://simplifier.net/vzd-fhir-directory/practitionerdirectorystrict)

* ID: Referenzen
  * `F_011`: * [ANFERP-2639](https://service.gematik.de/browse/ANFERP-2639)


#### Befüllung der Telematik-ID des Arztes

* ID: Beschreibung
  * `F_013-01`: Die Telematik-ID des Arztes wird wie folgt ermittelt und gesetzt:* Primär: Aus der QES-Signatur des Zertifikats.
* Fallback: Wenn keine Telematik-ID in der QES-Signatur vorhanden ist, wird die Seriennummer des Zertifikats (Subject Serial Number) ausgelesen und die zugehörige Telematik-ID über die Nachschlagetabelle ermittelt.
* Fehlerfall: Kann die Telematik-ID nicht ermittelt werden, wird die Verordnung nicht übertragen

* ID: Profile
  * `F_013-01`: * [PractitionerDirectory](https://simplifier.net/vzd-fhir-directory/practitionerdirectorystrict)

* ID: Referenzen
  * `F_013-01`: * [A_25946 - E-Rezept-Fachdienst - ePA Mapping](https://gemspec.gematik.de/docs/gemF/gemF_eRp_ePA/gemF_eRp_ePA_V1.2.1/#A_25946)


#### Mapping des korrekten Practitioners

* ID: Beschreibung
  * `F_016`: Im https://simplifier.net/erezept/kbv_pr_erp_bundle sind zwei Practitioner erlaubt (AusstellendeVerschreibendeVerantwortlichePerson). Beim Mapping für provide-prescription muss der Practitioner übernommen werden, welcher in der Composition (https://simplifier.net/erezept/kbvprerpcomposition) unter “author” referenziert wird:```
  <author> 
    <reference value="Practitioner/667ffd79-42a3-4002-b7ca-6b9098f20ccb"/> 
    <type value="Practitioner"/> 
  </author> 
  <attester> 
    <mode value="legal"/> 
    <party> 
      <reference value="Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c"/> 
    </party> 
  </attester>

```

* ID: Profile
  * `F_016`: * [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle)
* [EPAOpProvidePrescriptionERPInputParameters](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-op-provide-prescription-erp-input-parameters.md)
* [KBV_PR_FOR_Practitioner](https://simplifier.net/for/kbv_pr_for_practitioner)
* [PractitionerDirectory](https://simplifier.net/vzd-fhir-directory/practitionerdirectorystrict)

* ID: Referenzen
  * `F_016`: * [ANFERP-2780](https://service.gematik.de/browse/ANFERP-2780)


#### Mapping von KBV_PR_ERP_Medication_Compounding

* ID: Beschreibung
  * `F_017`: Handelt es sich bei der ingredient des QuellProfils um einen PZN Codierten Wirkstoff muss eine contained Medication vom Typ “EPA Medication Ingredient” hinzugefügt werden**Hinweis**: F_009 findet hier auch AnwendungDaher muss wenn Medication eine KBV_PR_ERP_Medication_Compounding ist:Für jedes ingredient:1. Wenn ingredient.itemCodeableConcept.coding.system=`http://fhir.de/CodeSystem/ifa/pzn`dann weiter zu 2.
1. Füge eine Medication (contained) hinzu vom Typ “EPA Medication Ingredient”:
```
  <Medication>
      <id value="MedicationHydrocortison-FD" />
      <meta>
          <profile value="https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-pzn-ingredient" />
      </meta>
      <!-- "EPA Medication Ingredients" haben haben immer diese Extension -->
      <extension url="https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-type-extension">
          <valueCoding>
              <system value="http://snomed.info/sct" />
              <version value="http://snomed.info/sct/900000000000207008/version/20240201" />
              <code value="781405001" />    
              <display value="Medicinal product package (product)" />
          </valueCoding>
      </extension>
      <code>
          <coding>
              <system value="http://fhir.de/CodeSystem/ifa/pzn" />
              <code value="03424249" />                       <!-- Wert von ingredient.itemCodeableConcept.coding.code -->
              <display value="Hydrocortison 1% Creme" />      <!-- Wert von ingredient.itemCodeableConcept.text -->
          </coding>
          <text value="Hydrocortison 1% Creme" />             <!-- Wert von ingredient.itemCodeableConcept.text -->
      </code>
  </Medication>

```
1. In der Ziel Medication.ingredient setze die itemReference:
```
<itemReference>
    <reference value="#MedicationHydrocortison-FD" />
</itemReference>

```
**Hinweise:**“EPA Medication Ingredients” haben haben immer die Extension:```
  <extension url="https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-type-extension">
    <valueCoding>
        <system value="http://snomed.info/sct" />
        <version value="http://snomed.info/sct/900000000000207008/version/20240201" />
        <code value="781405001" />    
        <display value="Medicinal product package (product)" />            
    </valueCoding>
  </extension>

```
Die Werte in der EPA Medication Ingredients für `<code>` werden wie folgt gesetzt* code: Wert von ingredient.itemCodeableConcept.coding.code
* display: Wert von ingredient.itemCodeableConcept.text
* text: Wert von ingredient.itemCodeableConcept.text

* ID: Profile
  * `F_017`: * [EPA Medication](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication.md)
* [EPA Medication Ingredient](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication-pzn-ingredient.md)
* [EPA Pharmaceutical Product Medication](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication-pharmaceutical-product.md)

* ID: Referenzen
  * `F_017`: * [ANFERP-2911](https://service.gematik.de/browse/ANFERP-2911)


#### Erzeugen von Medication.extension:type

* ID: Beschreibung
  * `F_020`: Bei der Erzeugung von* EPA Medication
* EPA Medication Ingredient
* EPA Pharmaceutical Product Medication
soll nach Möglichkeit `Medication.extension:type` erzeugt und mit dem korrekten Wert belegt werden.Folgende Optionen stehen für ePA 3.0 zur Verfügung (s. EPAMedicationTypeVS):
| | | |
| :--- | :--- | :--- |
| 781405001 | Medicinal product package (product) | Fertigarzneimittel |
| 1208954007 | Extemporaneous preparation (product) | Rezeptur |
| 373873005 | Pharmaceutical / biologic product (product) | Komponente einer Kombipackung |
Für folgende Konstellationen sind die Codes entsprechend zu setzen:
| | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | PZN Verordnung | `KBV_PR_ERP_Medication_PZN` | `.form.code != KPG` | **Fertigarzneimittel**(`781405001`,**Medicinal product package (product)**) | n/a | n/a |
| 2 | PZN Verordnung einer Kombipackung | `KBV_PR_ERP_Medication_PZN` | `.form.code = KPG` | Extension nicht setzen (wird über`.form.code`erkannt) | n/a | n/a |
| 3 | Wirkstoffverordnung | `KBV_PR_ERP_Medication_Ingredient` | — | **Fertigarzneimittel**(`781405001`,**Medicinal product package (product)**) | n/a | n/a |
| 4 | Freitextverordnung | `KBV_PR_ERP_Medication_FreeText` | — | Extension nicht setzen | n/a | n/a |
| 5 | Rezeptur ohne PZNs in Rezepturbestandteilen | `KBV_PR_ERP_Medication_Compounding` | `.ingredient.itemCodeableConcept.text` | **Rezeptur**(`1208954007`,**Extemporaneous preparation (product)**) | n/a | n/a |
| 6 | Rezeptur mit PZNs in Rezepturbestandteilen | `KBV_PR_ERP_Medication_Compounding` | `.ingredient.itemCodeableConcept.coding.code:pzn` | **Rezeptur**(`1208954007`,**Extemporaneous preparation (product)**) | **Fertigarzneimittel**(`781405001`,**Medicinal product package (product)**) | n/a |

* ID: Profile
  * `F_020`: * [EPA Medication](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication.md)
* [EPA Medication Ingredient](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication-pzn-ingredient.md)
* [EPA Pharmaceutical Product Medication](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication-pharmaceutical-product.md)


