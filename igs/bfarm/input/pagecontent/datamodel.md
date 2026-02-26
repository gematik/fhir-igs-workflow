## Informationen zum Datenmodell

Dieses Projekt listet diverse Artefakte auf, die helfen sollen den Anwendungsfall der Übertragung des digitalen Durchschlags E-T-Rezept umzusetzen. 

### Fachliches Modell

Das fachliche Modell dafür, welche Informationen übertragen werden, sind in [Logisches Modell digitaler Durchschlag E-T-Rezept](./StructureDefinition-erp-tprescription-carbon-copy-logical.html) abgebildet. Die zu übertragenden Informationen sind ebenfalls im von der gematik veröffentlichten Feature Dokument [gemF_eRp_T-Rezept](https://gemspec.gematik.de/docs/gemF/gemF_eRp_T-Rezept/latest/#5.7.2) angegeben.

Dieses Logical Model soll dafür Verständnis schaffen, welche Informationen vom E-Rezept-Fachdienst an den BfArM Webdienst übertragen werden.

Im Laufe der Durchführung eines E-Rezept Workflows erhält der E-Rezept-Fachdienst diverse Artefakte die als Grundlage für die Erstellung des digitalen Durchschlags notwendig sind:

- [Die Verordnung des Arztes](https://simplifier.net/erezept/kbv_pr_erp_bundle)
- [Die Dispensierinformationen der Apotheke](https://simplifier.net/erezept-workflow/gem_erp_pr_par_closeoperation_input)

Aus diesen grundlegenden Daten wird dann ein Artefakt, der digitale Durchschlag E-T-Rezept, erstellt und an das BfArM übermittelt.

### Profile

Darüber hinaus definiert dieses Projekt FHIR-Profile, die die Datenstrukturen beschreiben, die an den Schnittstellen übertragen werden.

Der [digitale Durchschlag E-T-Rezept](./StructureDefinition-erp-tprescription-carbon-copy.html) ist die klammernde Ressource, die an das BfArM übertragen wird. Darin enthalten sind die folgenden Strukturen:

{% capture profiles %}
StructureDefinition/erp-tprescription-medication-dispense,
StructureDefinition/erp-tprescription-medication-request,
StructureDefinition/erp-tprescription-medication,
StructureDefinition/erp-tprescription-organization,
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}

#### Designentscheidung zur restriktiven Datenmodellierung

Entgegen der Best Practice zur FHIR Modellierung der [HL7 International](https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html) und [HL7 Deutschland](https://ig.fhir.de/best-practice/1.0.0/Home.html) sind die Profile in diesem Projekt sehr restriktiv designed.

Der Hintergrund sind die gesetzlichen Vorgaben und Abstimmungen zwischen Bundesministerium für Gesundheit (BMG), BfArM und gematik, die konkret definieren, welche Informationen zu übertragen sind. Alle anderen Daten sind verboten zu übertragen und damit auch aus den Profilen via 0..0 Kardinalität gestrichen, s. hierzu [§3a Abs. 7 AMVV](https://www.gesetze-im-internet.de/amvv/__3a.html).