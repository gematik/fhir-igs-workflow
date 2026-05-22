<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile TICapabilityStatement
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:CapabilityStatement</sch:title>
    <sch:rule context="f:CapabilityStatement">
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/ti/StructureDefinition/extension-base-url']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/ti/StructureDefinition/extension-base-url': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration']) &lt;= 1">extension with URL = 'https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:CapabilityStatement/f:rest/f:resource/f:interaction</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:resource/f:interaction">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation|4.0.1']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation|4.0.1': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:CapabilityStatement/f:rest/f:resource/f:operation</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:resource/f:operation">
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/ti/StructureDefinition/extension-http-method']) &lt;= 2">extension with URL = 'https://gematik.de/fhir/ti/StructureDefinition/extension-http-method': maximum cardinality of 'extension' is 2</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation|4.0.1']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation|4.0.1': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:CapabilityStatement/f:rest/f:operation</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:operation">
      <sch:assert test="count(f:extension[@url = 'https://gematik.de/fhir/ti/StructureDefinition/extension-http-method']) &lt;= 2">extension with URL = 'https://gematik.de/fhir/ti/StructureDefinition/extension-http-method': maximum cardinality of 'extension' is 2</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation|4.0.1']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation|4.0.1': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
