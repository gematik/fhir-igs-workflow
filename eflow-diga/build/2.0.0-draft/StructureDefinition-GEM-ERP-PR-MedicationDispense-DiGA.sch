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
      <sch:assert test="count(f:meta) &gt;= 1">meta: minimum cardinality of 'meta' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/epa-medication/StructureDefinition/rx-prescription-process-identifier-extension']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/rx-prescription-process-identifier-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta']) &lt;= 1">extension with URL = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_DeepLink']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_DeepLink': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:substitution) &lt;= 0">substitution: maximum cardinality of 'substitution' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:MedicationDispense/f:performer/f:actor</sch:title>
    <sch:rule context="f:MedicationDispense/f:performer/f:actor">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:type) &lt;= 1">type: maximum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
