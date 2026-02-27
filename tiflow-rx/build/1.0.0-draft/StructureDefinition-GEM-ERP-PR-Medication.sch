<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile EPAMedication
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Medication</sch:title>
    <sch:rule context="f:Medication">
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/rx-prescription-process-identifier-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/rx-prescription-process-identifier-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.de/StructureDefinition/normgroesse']) &lt;= 1">extension with URL = 'http://fhir.de/StructureDefinition/normgroesse': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-type-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-type-extension': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Medication/f:code/f:coding</sch:title>
    <sch:rule context="f:Medication/f:code/f:coding">
      <sch:assert test="count(f:version) &gt;= 1">version: minimum cardinality of 'version' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Medication/f:amount/f:numerator</sch:title>
    <sch:rule context="f:Medication/f:amount/f:numerator">
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-total-quantity-formulation-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-total-quantity-formulation-extension': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Medication/f:ingredient</sch:title>
    <sch:rule context="f:Medication/f:ingredient">
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-darreichungsform-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-darreichungsform-extension': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Medication/f:ingredient/f:strength</sch:title>
    <sch:rule context="f:Medication/f:ingredient/f:strength">
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-amount-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-amount-extension': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
