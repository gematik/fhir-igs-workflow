# Mapping von Dispensierinformationen - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Vorgaben zum Mapping von FHIR-Instanzen**](mapping.md)
* **Mapping von Dispensierinformationen**

## Mapping von Dispensierinformationen

Nach Abschluss eines E-Rezept Workflows durch das Aufrufen der $close-Operation am E-Rezept-Fachdienst wird nachgelagert die Übermittlung der Dispensierinformationen an den ePA Medication Service durchgeführt.

Die Dispensierinformationen werden als [GEM ERP PR CloseOperation Input](./StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Input.md) übertragen und enthalten [GEM ERP PR MedicationDispense](./StructureDefinition-GEM-ERP-PR-MedicationDispense.md) und [GEM ERP PR Medication](./StructureDefinition-GEM-ERP-PR-Medication.md) Ressourcen. Diese sind von den Profilen der ePA abgeleitet und sind damit kompatibel.

Für die erfolgreiche Übertragung an den ePA Medication Service müssen allerdings Daten angeriechert oder angepasst werden.

Hierbei werden verschiedene Quellen benötigt, um die Daten vollständig zu überführen:

* Die Dispensierinformationen aus GEM ERP PR CloseOperation Input
* Der ACCESS_TOKEN der Anfrage zur $close-Operation

## Übersicht des Mappingvorgehens

Für dieses Mapping muss für die Parameters Struktur keine Transformation der Struktur vorgenommen werden, da die übergebenen Ressourcen bereits den Profilen der ePA entsprechen. Allerdings sind einige Anpassungen und Anreicherungen der Daten notwendig.

| | | |
| :--- | :--- | :--- |
| prescriptionId | Task.identifier | Wird aus dem Task auf den sich die Dispensierinformationen beziehen, entnommen |
| authoredOn | MedicationRequest.authoredOn | Wird aus dem MedicationRequest der urspünglichen Verordnung bezogen |
| medicationDispense | MedicationDispense | Wird aus den close-Operation-Parameters extrahiert und übertragen |
| medication | Medication | Wird aus den close-Operation-Parameters extrahiert und übertragen |
| organization | - | Organization wird neu erzeugt und nach Transformationsregeln befüllt |

## Transformationsregeln für Dispensierinformationen

Einige Daten müssen zusätzlich durch Transformationsregeln angepasst oder ergänzt werden. Die folgenden Transformationsregeln werden für das Mapping von **Dispensierinformationen** verwendet:

#### Organization für provide Dispensation

* ID: Beschreibung
  * `F_006a`: Bei provide Dispensation ist die Organization neu zu erstellen, mit den Daten aus dem ACCESS_TOKEN.Siehe A_25947 - E-Rezept-Fachdienst - ePA - provide-dispensation-erp - Organisation-RessourceOrganization.identifier:TelematikID idNummer → aus dem ACCESS_TOKEN der Anfrage Organization.name organizationName → aus dem ACCESS_TOKEN der Anfrage Organization.type:profession professionOID → aus dem ACCESS_TOKEN der Anfrage
* ID: Profile
  * `F_006a`: * [OrganizationDirectory](https://simplifier.net/vzd-fhir-directory/organizationdirectorystrict)

* ID: Referenzen
  * `F_006a`: * [A_25947 - E-Rezept-Fachdienst - ePA - provide-dispensation-erp - Organisation-Ressource](https://gemspec.gematik.de/docs/gemF/gemF_eRp_ePA/gemF_eRp_ePA_V1.2.1/#A_25947)


#### Befüllung von MedicationDispense.subject.identifier

* ID: Beschreibung
  * `F_014`: Beim Mapping von MedicationDispense.subject.identifier muss der Wert aus .value übernommen werden. Als system für jeden KVNR-Identifier eines Patienten “http://fhir.de/sid/gkv/kvid-10” gesetzt werden.Eine Unterscheidung nach GKV und PKV im System findet beim Mapping nicht mehr statt. Durch A_19248-03> “die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier (prüfen) und” kann man sich darauf verlassen, dass die KVNR im value gesetzt ist.
* ID: Profile
  * `F_014`: * [EPA MedicationDispense](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication-dispense.md)

* ID: Referenzen
  * `F_014`: * [ANFERP-2779](https://service.gematik.de/browse/ANFERP-2779)


#### Mapping von Medication.code.coding

* ID: Beschreibung
  * `F_015`: 
| | |
| :--- | :--- |
| Beim Mapping von Medication.code.coding müssen alle Codings entfernt werden welche nicht explizit unter coding im EPA Medication Profil profiliert sind de.gematik.epa.medication | EPA Medication - SIMPLIFIER.NET auch wenn es sich bei Medication.code.coding um ein open Slizing handelt. |
Im E-Rezept-Fachdienst ist jetzt “hart” konfiguriert welche erlaubt sind. D.h. wenn im ePA Medication FHIR Profil neue hinzkommen, muss das explizit im eRP Fachdienst umgesetzt werden. ![](./medication-codings.png) **Abbildung: **Erlaubte Medication Codings 
* ID: Profile
  * `F_015`: * [EPA Medication](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/StructureDefinition-epa-medication.md)

* ID: Referenzen
  * `F_015`: * [EML Testdaten - B714.1 eRp FD](https://wiki.gematik.de/display/B714ERPFD/EML+Testdaten)


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


