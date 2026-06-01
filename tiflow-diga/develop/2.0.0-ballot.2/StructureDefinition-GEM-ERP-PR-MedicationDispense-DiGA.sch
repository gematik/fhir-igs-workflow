<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile EPAMedicationDispense
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:MedicationDispense</sch:title>
    <sch:rule context="f:MedicationDispense">
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/rx-prescription-process-identifier-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/rx-prescription-process-identifier-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta']) &lt;= 1">extension with URL = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_RedeemCode']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_RedeemCode': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_DeepLink']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_DeepLink': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:substitution) &lt;= 0">substitution: maximum cardinality of 'substitution' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:extension/f:value[x] 1</sch:title>
    <sch:rule context="f:MedicationDispense/f:extension/f:value[x]">
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:extension</sch:title>
    <sch:rule context="f:MedicationDispense/f:extension">
      <sch:assert test="count(f:value[x]) &gt;= 1">value[x]: minimum cardinality of 'value[x]' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'language']) &gt;= 1">extension with URL = 'language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'language']) &lt;= 1">extension with URL = 'language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'algorithmVersion']) &gt;= 1">extension with URL = 'algorithmVersion': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'algorithmVersion']) &lt;= 1">extension with URL = 'algorithmVersion': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:performer/f:actor</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor">
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:dosageInstruction/f:doseAndRate/f:dose[x] 1</sch:title>
    <sch:rule context="f:MedicationDispense/f:dosageInstruction/f:doseAndRate/f:dose[x]">
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &gt;= 1">unit: minimum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
