# Example for a Bundle with a Consent - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example for a Bundle with a Consent**

## Example Bundle: Example for a Bundle with a Consent



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleGetConsent",
  "type" : "searchset",
  "timestamp" : "2025-10-01T12:03:23Z",
  "total" : 1,
  "entry" : [{
    "fullUrl" : "https://erp-dev.zentral.erp.splitdns.ti-dienste.de/Consent/f97a0772-c99f-4159-90c6-2a41c7d96779",
    "resource" : {
      "resourceType" : "Consent",
      "id" : "f97a0772-c99f-4159-90c6-2a41c7d96779",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Consent"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Consent_f97a0772-c99f-4159-90c6-2a41c7d96779\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Consent f97a0772-c99f-4159-90c6-2a41c7d96779</b></p><a name=\"f97a0772-c99f-4159-90c6-2a41c7d96779\"> </a><a name=\"hcf97a0772-c99f-4159-90c6-2a41c7d96779\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-GEM-ERPEU-PR-Consent.html\">Consent for ePrescriptions</a></p></div><h2>Participants</h2><table class=\"grid\"><tr><td><b>Role</b></td><td><b>Details</b></td></tr><tr><td title=\"Who the consent applies to\">Patient</td><td>Identifier: NamingSystemKVID/X123456789</td></tr></table><p>This consent is made under the regulation <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/v3-ActCode OPTIN}\">opt-in</span> .</p><p>The subject has given their consent.</p></div>"
      },
      "status" : "active",
      "scope" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/consentscope",
          "code" : "patient-privacy",
          "display" : "Privacy Consent"
        }]
      },
      "category" : [{
        "coding" : [{
          "system" : "https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType",
          "code" : "EUDISPCONS",
          "display" : "Consent for redeeming e-prescriptions in EU countries"
        }]
      }],
      "patient" : {
        "identifier" : {
          "system" : "http://fhir.de/sid/gkv/kvid-10",
          "value" : "X123456789",
          "assigner" : {
            "identifier" : {
              "system" : "http://fhir.de/sid/arge-ik/iknr",
              "value" : "98765543"
            }
          }
        }
      },
      "dateTime" : "2025-10-01T12:03:23Z",
      "policyRule" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
          "code" : "OPTIN"
        }]
      }
    }
  }]
}

```
