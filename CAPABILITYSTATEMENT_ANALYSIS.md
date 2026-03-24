# CapabilityStatement Structure Analysis - All IGs

**Date**: March 24, 2026  
**Scope**: Core, rx, diga, erp-chrg, erp-eu, bfarm IGs

---

## Executive Summary

The CapabilityStatement structure is **organized hierarchically** across IGs:
- **Core IG**: Defines base CapabilityStatement and reusable RuleSets for all error codes
- **diga, erp-chrg**: Extend/import core CapabilityStatement
- **rx, erp-eu**: Standalone CapabilityStatements with their own rulesets
- **bfarm**: No dedicated CapabilityStatement in capabilitystatement folder

**Key Gap Identified**: RuleSets define HTTP status codes and generic error codes, but requirements files document detailed **operation-specific error codes** (e.g., `TIFLOW_SECRET_MISMATCH`, `TIFLOW_INVALID_TASK_STATUS`) that are **NOT consistently mapped** in CapabilityStatement RuleSets.

---

## 1. CORE IG CapabilityStatement

### Location
`igs/core/input/fsh/capabilitystatement/`

### Files Structure
```
ERPCapabilityStatementServer.fsh           # Main instance definition
rulesets/
  ├── ERPCapabilityStatementRulsetsHeader.fsh        # HTTP headers (x-erp-user, x-erp-resource, etc.)
  ├── ERPCapabilityStatementRulesetsResponse.fsh     # Success/error response codes (HTTP 200, 400, 403, etc.)
  ├── ERPCapabilityStatementRulesetsResponseDefinition.fsh  # Interaction-level status codes
  └── ERPCapabilityStatementRulesetsMisc.fsh         # Helper/structural rulesets
```

### Main Instance: ERPFachdienstServer
- **Type**: `GEM_ERP_PR_CapabilityStatement`
- **Kind**: `#requirements`
- **Base URL**: `http://tiflow`
- **FHIR Version**: 4.0.1

### Resources & Interactions Defined

| Resource | Interactions | Operations |
|----------|--------------|-----------|
| **Task** | search-type, read, patch | create, activate, accept, reject, close, abort, dispense |
| **ChargeItem** | search-type, read, create, update, patch, delete | - |
| **Consent** | search-type, create, delete | - |
| **Communication** | search-type, read, create, delete | - |
| **AuditEvent** | search-type, read | - |
| **MedicationDispense** | search-type | - |
| **Device** | search-type | - |
| **Subscription** | search-type, create | - |

### HTTP Headers Defined
- `x-erp-user` (required) - User group for routing
- `x-erp-resource` (required) - Resource for routing context
- `content-type` (required) - HTTP body Content-Type
- `authorization` (required) - Bearer Token

### RuleSet Patterns

#### 1. **Success Response RuleSets** (ERPCapabilityStatementRulesetsResponse.fsh)

| RuleSet | HTTP Code | Error Code | Response Type |
|---------|-----------|-----------|---|
| `Successful` | 200 | - | - |
| `SuccessfulCreated` | 201 | - | - |
| `SuccessfulNoContent` | 204 | - | - |
| `SuccessfulWithBundle` | 200 | - | Bundle |
| `SuccessfulWithParameters` | 200 | - | Parameters |

#### 2. **Error Response RuleSets** (ERPCapabilityStatementRulesetsResponse.fsh)

| RuleSet | HTTP Code | Error Code | Description |
|---------|-----------|-----------|---|
| `UnknownSearchParameter` | 400 | MSG_PARAM_UNKNOWN | Unknown search parameter |
| `InvalidQueryParameters` | 400 | MSG_BAD_SYNTAX | Invalid query parameter(s) |
| `InvalidRequest` | 400 | MSG_BAD_FORMAT | Invalid request |
| `UnknownResourceType` | 404 | MSG_UNKNOWN_TYPE | Unknown resource type |
| `Unauthorized` | 401 | MSG_AUTH_REQUIRED | Authentication required |
| `IDTokenCheck` | 403 | SVC_IDENTITY_MISMATCH | ID-Token/Insurant-ID mismatch |
| `MethodNotAllowed` | 405 | MSG_OP_NOT_ALLOWED | Method not allowed |
| `RequestTimeout` | 408 | MSG_TIMEOUT | Request timeout |
| `TooManyRequests` | 429 | MSG_RATE_LIMIT | Too many requests |
| `InternalServerError` | 500 | MSG_INTERNAL_ERROR | Internal server error |
| `ResourceIsNotKnown` | 404 | MSG_RESOURCE_ID_FAIL | Resource not known |
| `ResourceWasDeleted` | 410 | MSG_DELETED | Resource was deleted |
| `EmptyList` | 404 | MSG_NO_MATCH | No resource found |
| `DosageInvalid` | 400 | TIFLOW_DOSAGE_INVALID | Invalid dosage structure |
| `OpNotAllowed` | 405 | MSG_OP_NOT_ALLOWED | Operation not allowed |

#### 3. **Interaction Status Code Collections** (ERPCapabilityStatementRulesetsResponseDefinition.fsh)

| RuleSet | Composition |
|---------|---|
| `SearchTypeInteractionStatusCodes` | Successful + Unauthorized + UnknownSearchParameter + InvalidQueryParameters + MethodNotAllowed + RequestTimeout + TooManyRequests + InternalServerError + UnknownResourceType |
| `ReadInteractionStatusCodes` | Successful + Unauthorized + InvalidRequest + MethodNotAllowed + RequestTimeout + UnknownResourceType + ResourceIsNotKnown + ResourceWasDeleted + TooManyRequests + InternalServerError |
| `CreateInteractionStatusCodes` | SuccessfulCreated + InvalidRequest + UnknownResourceType |
| `DeleteInteractionStatusCodes` | SuccessfulNoContent + InvalidRequest + UnknownResourceType + ResourceIsNotKnown + ResourceWasDeleted |
| `UpdateInteractionStatusCodes` | Successful + InvalidRequest + UnknownResourceType + ResourceIsNotKnown + ResourceWasDeleted |
| `PatchInteractionStatusCodes` | Successful + InvalidRequest + UnknownResourceType + ResourceIsNotKnown + ResourceWasDeleted |

#### 4. **Operation Status Code Collections** (ERPCapabilityStatementRulesetsResponseDefinition.fsh)

| RuleSet | Used For | Composition |
|---------|----------|---|
| `TaskCreateOperationStatusCodes` | Task $create | SuccessfulCreated + InvalidRequest + ResourceIsNotKnown + ResourceWasDeleted |
| `TaskPostOperationStatusCodes` | Task $activate, $accept, $close, $dispense | Successful + InvalidRequest + ResourceIsNotKnown + ResourceWasDeleted |
| `TaskNoContentOperationStatusCodes` | Task $reject, $abort | SuccessfulNoContent + InvalidRequest + ResourceIsNotKnown + ResourceWasDeleted |

#### 5. **System-Level Operations** (ERPCapabilityStatementRulesetsResponseDefinition.fsh)

| RuleSet | Composition |
|---------|---|
| `SystemLevelOperationStatusCodes` | Unauthorized + UnknownSearchParameter + InvalidQueryParameters + InvalidRequest + MethodNotAllowed + RequestTimeout + TooManyRequests + InternalServerError |
| `SystemLevelOperationStatusCodesWithBundle` | SuccessfulWithBundle + SystemLevelOperationStatusCodes |
| `SystemLevelOperationStatusCodesWithParameters` | SuccessfulWithParameters + SystemLevelOperationStatusCodes |
| `SystemLevelQueryOperationStatusCodesWithNormalSuccess` | Successful + SystemLevelOperationStatusCodes |
| `SystemLevelPostOperation` | SuccessfulWithParameters + IDTokenCheck |

### Operation Definitions Location
`igs/core/input/fsh/operationdefinitions/`
- GEM_ERP_OP_Create.fsh
- GEM_ERP_OP_Activate.fsh
- GEM_ERP_OP_Accept.fsh
- GEM_ERP_OP_Reject.fsh
- GEM_ERP_OP_Close.fsh
- GEM_ERP_OP_Abort.fsh
- GEM_ERP_OP_Dispense.fsh

### CodeSystems for Error Codes
**Location**: `igs/core/input/fsh/codesystems/`

#### GEM_ERP_CS_OperationOutcomeDetails
Only 3 codes defined (incomplete):
- `ERPFD_NO_VALID_STRUCTURE` - Invalid data structure
- `ERPFD_PRESCRIPTION_NO_EXIST` - Prescription not found
- `ERPFD_PRESCRIPTION_STATUS` - Invalid status for operation

#### TIFLOW_CS_OperationOutcomeDetails
(Content not fully reviewed - likely contains TIFLOW_* codes)

---

## 2. RX IG CapabilityStatement

### Location
`igs/rx/input/fsh/capabilitystatement/`

### Main Instance: ERPFachdienstServerRx
- **Type**: `TICapabilityStatement` (different base from core!)
- **ID**: `erp-fachdienst-server-rx`
- **Title**: ERP Rx CapabilityStatement
- **Status**: #draft

### Relationship to Core
- **Standalone** (does NOT import core)
- Defines its own local RuleSets

### Resources & Interactions
| Resource | Interactions |
|----------|--------------|
| **Task** | search-type, read |
| **Communication** | search-type, read, create, delete |
| **MedicationDispense** | search-type, read |

### Operations on Task
```
- create ($op-create)
- activate ($op-activate) 
- accept ($op-accept)
- reject ($op-reject)
- close ($op-close)
- abort ($op-abort)
- dispense ($op-dispense)
```

**Note**: Operations reference `$op-*` identifiers (canonicals) rather than the core `*Operation` definitions.

### RuleSets
- Replicates all core response RuleSets
- Removes system-level operations
- Simplified interaction patterns

---

## 3. DIGA IG CapabilityStatement

### Location
`igs/diga/input/fsh/capabilitystatement/`

### Main Instance: ERPFachdienstServerDiGA
- **Type**: `TICapabilityStatement`
- **ID**: `erp-fachdienst-server-diga`
- **Title**: ERP DiGA CapabilityStatement

### Relationship to Core
- **IMPORTS core** CapabilityStatement:
  ```fsh
  * imports[+] = $cap-erp-fd  # Maps to core's CapabilityStatement
  * imports[=].extension[0].url = $capabilitystatement-expectation
  * imports[=].extension[0].valueCode = #SHALL
  ```
- Minimal additional definitions

### Resources & Interactions
| Resource | Interactions | Operation Profile |
|----------|--------------|---|
| **Task** | search-type, read, patch | GEM_ERP_PR_Task (via URL reference) |
| **Communication** | search-type, read, create, delete | GEM_ERP_PR_Communication_DiGA |
| **MedicationDispense** | search-type, read | GEM_ERP_PR_MedicationDispense_DiGA |

### Operations on Task
```
- create ($op-create)
- activate ($op-activate)
- accept ($op-accept)
- reject ($op-reject)
- close ($op-close)
- abort ($op-abort)
- (NO dispense operation)
```

### RuleSets
- Replicates core RuleSets (search, read, patch, create, delete, task operations)
- Simplified compared to core

---

## 4. ERP-CHRG IG CapabilityStatement

### Location
`igs/erp-chrg/input/fsh/capabilitystatement/`

### Main Instance: ERPFachdienstServerErpChrg
- **Type**: `TICapabilityStatement`
- **ID**: `erp-fachdienst-server-erpchrg`
- **Title**: ERPCHRG CapabilityStatement

### Relationship to Core
- **IMPORTS core** CapabilityStatement:
  ```fsh
  * imports[+] = $cap-erp-fd
  * imports[=].extension[0].url = $capabilitystatement-expectation
  * imports[=].extension[0].valueCode = #SHALL
  ```

### Resources & Interactions
| Resource | Interactions | Profile Reference |
|----------|--------------|---|
| **Task** | search-type, read | $erp-task (URL reference) |
| **ChargeItem** | search-type, read | GEM_ERPCHRG_PR_ChargeItem |
| **Communication** | search-type, read | GEM_ERPCHRG_PR_Communication_ChargChangeReq/Reply |
| **Consent** | search-type, read | GEM_ERPCHRG_PR_Consent |

### Key Differences from Core
1. **No operations** on Task (only search-type and read)
2. **No write interactions** (no create, update, patch, delete)
3. **Special RuleSet**: `SystemLevelOperationStatusCodesGeteMP`
   - Adds: `EMPNoExist` error
   - References organization header mismatch

### Additional RuleSets (erp-chrg specific)
- `OrgHeaderProfileMismatch` (403) - For organization-specific access control
- `EMPNoExist` (404) - EMP (Gesundheitskarte) not found

---

## 5. ERP-EU IG CapabilityStatement

### Location
`igs/erp-eu/input/fsh/capabilitystatement/`

### Main Instance: ERPFachdienstServerErpEu
- **Type**: `TICapabilityStatement`
- **ID**: `erp-fachdienst-server-erpeu`
- **Title**: ERPEU CapabilityStatement

### Relationship to Core
- **Standalone** (does NOT import core)
- Defines unique EU-specific functionality

### Resources & Interactions
| Resource | Interactions |
|----------|--------------|
| **Task** | search-type, read, patch |
| **Consent** | search-type, create, delete |

### EU-Specific System Operations (unique to erp-eu)
1. `grant-eu-access-permission` - Register access code for EU access
2. `read-eu-access-permission` - Read registered EU access code
3. `revoke-eu-access-permission` - Revoke EU access registration
4. `get-eu-prescriptions` - Retrieve EU prescription information
5. `eu-close` (instance-level Task operation) - Finishes EU workflow

### RuleSets
- Similar to core for basic operations
- Different response types for EU-specific operations
- Uses `EPAMSOperationOutcome` for EU operations

### Additional RuleSet: Conflict (409)
- HTTP Code 409
- Error Code `MSG_CONFLICT`
- Specific to EU workflows

---

## 6. BFARM IG CapabilityStatement

### Location
**No dedicated capabilitystatement directory found**

### Available Structure
- No `igs/bfarm/input/fsh/capabilitystatement/` directory
- `igs/bfarm/input/fsh/rulesets/` exists but contains only:
  - metadata.fsh
  - rs_structuremap.fsh
  - versioning.fsh

### Conclusion
- **BFARM does NOT define its own CapabilityStatement**
- Likely inherits from or references core via imports (not verified in this analysis)

---

## 3. ERROR CODE GAP ANALYSIS

### 3.1 Generic HTTP Error Codes in RuleSets (Covered ✓)

| HTTP Code | Error Code | Where Defined |
|-----------|-----------|---|
| 200 | - | Successful |
| 201 | - | SuccessfulCreated |
| 204 | - | SuccessfulNoContent |
| 400 | MSG_BAD_FORMAT, MSG_BAD_SYNTAX, MSG_PARAM_UNKNOWN | InvalidRequest, InvalidQueryParameters, UnknownSearchParameter |
| 401 | MSG_AUTH_REQUIRED | Unauthorized |
| 403 | SVC_IDENTITY_MISMATCH | IDTokenCheck |
| 404 | MSG_UNKNOWN_TYPE, MSG_RESOURCE_ID_FAIL, MSG_NO_MATCH | UnknownResourceType, ResourceIsNotKnown, EmptyList |
| 405 | MSG_OP_NOT_ALLOWED | MethodNotAllowed, OpNotAllowed |
| 408 | MSG_TIMEOUT | RequestTimeout |
| 410 | MSG_DELETED | ResourceWasDeleted |
| 429 | MSG_RATE_LIMIT | TooManyRequests |
| 500 | MSG_INTERNAL_ERROR | InternalServerError |

### 3.2 Operation-Specific Error Codes (Found in Requirements ⚠️)

**Source**: `igs/core/input/pagecontent/op-*-req-fd.md` files

These error codes are documented in **requirement files** but NOT systematically mapped in CapabilityStatement RuleSets:

| Error Code | HTTP Code | Operation | Purpose | RuleSet Defined? |
|-----------|-----------|-----------|---------|---|
| `TIFLOW_SECRET_MISMATCH` | 403 | $reject, $accept | Secret parameter mismatch | ❌ No |
| `TIFLOW_INVALID_TASK_STATUS` | 412 | $reject, $activate, etc. | Invalid Task status for operation | ❌ No |
| `TIFLOW_SIGNATURE_NO_OCSP_RESPONSE` | - | $close | OCSP response missing/expired | ❌ No |
| `TIFLOW_DOSAGE_INVALID` | 400 | $dispense | Invalid dosage structure | ⚠️ Partial (DosageInvalid RuleSet exists) |

### 3.3 CapabilityStatement Limitations

**Current Pattern**:
```fsh
RuleSet: TaskPostOperationStatusCodes
* rest.resource[=].operation[=] insert Successful
* rest.resource[=].operation[=] insert InvalidRequest
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
```

**Gap**: All Task POST operations use the same RuleSet, but each operation has unique error conditions:
- `$create`: Requires flow type validation
- `$activate`: Requires OCSP response validation, ANR/ZANR checks
- `$accept`: Requires expiry date check
- `$reject`: Requires secret validation
- `$close`: Requires OCSP response, signature validation
- `$abort`: Basic validation only
- `$dispense`: Requires dosage validation

---

## 4. CURRENT RULESETS USAGE BY OPERATION

### Task Operations
```
$create      → TaskCreateOperationStatusCodes
               (SuccessfulCreated + InvalidRequest + ResourceIsNotKnown + ResourceWasDeleted)

$activate    → TaskPostOperationStatusCodes
               (Successful + InvalidRequest + ResourceIsNotKnown + ResourceWasDeleted)

$accept      → TaskPostOperationStatusCodes
               (Same as activate)

$reject      → TaskNoContentOperationStatusCodes
               (SuccessfulNoContent + InvalidRequest + ResourceIsNotKnown + ResourceWasDeleted)

$close       → TaskPostOperationStatusCodes
               (Same as activate)

$abort       → TaskNoContentOperationStatusCodes
               (Same as reject)

$dispense    → TaskPostOperationStatusCodes
               (Same as activate)
```

### ChargeItem Interactions
```
search-type  → SearchTypeInteractionStatusCodes
read         → ReadInteractionStatusCodes
create       → CreateInteractionStatusCodes
update       → UpdateInteractionStatusCodes
patch        → PatchInteractionStatusCodes
delete       → DeleteInteractionStatusCodes
```

---

## 5. IG-SPECIFIC PATTERNS

### inheritance Hierarchy
```
Core IG (base)
├── diga IG (imports core)
├── erp-chrg IG (imports core, adds EMPNoExist, OrgHeaderProfileMismatch)
├── rx IG (standalone, minimal)
├── erp-eu IG (standalone, EU-specific)
└── bfarm IG (no dedicated CapabilityStatement)
```

### RuleSet Replication Pattern
- **core**: Complete, 14 response RuleSets + composition RuleSets
- **rx**: Replicates all core response RuleSets
- **diga**: Replicates core + imports core
- **erp-chrg**: Extends core with 2 new RuleSets (EMPNoExist, OrgHeaderProfileMismatch)
- **erp-eu**: Similar to core, adds Conflict (409)

---

## 6. KEY FINDINGS & RECOMMENDATIONS

### ✅ Well-Defined
1. **HTTP Status Codes**: Comprehensive coverage of standard HTTP codes
2. **Generic Error Codes**: MSG_* codes well-organized in RuleSets
3. **Resource Interactions**: Clear patterns for search, read, create, update, delete, patch
4. **Structure**: Modular RuleSet approach enables reuse

### ⚠️ Gaps Identified
1. **Operation-Specific Error Codes**: 
   - `TIFLOW_SECRET_MISMATCH`, `TIFLOW_INVALID_TASK_STATUS`, `TIFLOW_SIGNATURE_NO_OCSP_RESPONSE` not in RuleSets
   - Requirements documented in `op-*-req-fd.md` but not mapped to CapabilityStatement

2. **Operation Differentiation**:
   - All Task POST operations share `TaskPostOperationStatusCodes`
   - No operation-specific error code definitions
   - Can't distinguish which HTTP codes apply to which operations

3. **Missing CodeSystem Entries**:
   - `GEM_ERP_CS_OperationOutcomeDetails` only has 3 entries
   - TIFLOW-specific codes missing from CodeSystem
   - EU-specific codes not documented

4. **HTTP Code 412 (Precondition Failed)**:
   - Used for status validation errors
   - Not defined in any RuleSet
   - Only found in requirements documentation

5. **Extension for HTTP Status Code in OperationDefinition**:
   - CapabilityStatement uses `extension[responseInfo][statusCode]`
   - OperationDefinition should also support this pattern
   - Not consistently applied

### 📋 Recommendations

1. **Expand GEM_ERP_CS_OperationOutcomeDetails** with all operation-specific error codes:
   - ADD: TIFLOW_SECRET_MISMATCH, TIFLOW_INVALID_TASK_STATUS, TIFLOW_SIGNATURE_NO_OCSP_RESPONSE, TIFLOW_OCSP_REQUEST_FAILED
   - ADD: EU-specific codes (eu-*)
   - ADD: erp-chrg specific codes (EMPNoExist, OrgHeaderProfileMismatch)

2. **Create Operation-Specific RuleSets**:
   ```fsh
   RuleSet: CreateOperationStatusCodes
   RuleSet: ActivateOperationStatusCodes
   RuleSet: AcceptOperationStatusCodes
   RuleSet: RejectOperationStatusCodes
   RuleSet: CloseOperationStatusCodes
   RuleSet: AbortOperationStatusCodes
   RuleSet: DispenseOperationStatusCodes
   ```

3. **Add HTTP 412 RuleSet**:
   - Define `PreconditionFailed` for status validation errors
   - Use in $reject, $accept, $activate operations

4. **Map OperationDefinitions** to document possible error codes explicitly

5. **Enhance ValueSet**: `GEM_ERP_VS_OperationOutcomeDetails` should reference all codes from CodeSystem

---

## 7. FILE REFERENCE MATRIX

### Core IG
- ✅ Main: [igs/core/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh](igs/core/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh)
- ✅ RuleSets: [igs/core/input/fsh/capabilitystatement/rulesets/](igs/core/input/fsh/capabilitystatement/rulesets/)
- ✅ Operations: [igs/core/input/fsh/operationdefinitions/](igs/core/input/fsh/operationdefinitions/)
- ✅ CodeSystems: [igs/core/input/fsh/codesystems/GEM_ERP_CS_OperationOutcomeDetails.fsh](igs/core/input/fsh/codesystems/GEM_ERP_CS_OperationOutcomeDetails.fsh)
- ✅ Requirements: [igs/core/input/pagecontent/op-*-req-*.md](igs/core/input/pagecontent/)

### RX IG
- ✅ Main: [igs/rx/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh](igs/rx/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh)
- ✅ RuleSets: [igs/rx/input/fsh/capabilitystatement/rulesets/](igs/rx/input/fsh/capabilitystatement/rulesets/)

### DiGA IG
- ✅ Main: [igs/diga/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh](igs/diga/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh)
- ✅ RuleSets: [igs/diga/input/fsh/capabilitystatement/rulesets/](igs/diga/input/fsh/capabilitystatement/rulesets/)

### ERP-CHRG IG
- ✅ Main: [igs/erp-chrg/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh](igs/erp-chrg/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh)
- ✅ RuleSets: [igs/erp-chrg/input/fsh/capabilitystatement/rulesets/](igs/erp-chrg/input/fsh/capabilitystatement/rulesets/)

### ERP-EU IG
- ✅ Main: [igs/erp-eu/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh](igs/erp-eu/input/fsh/capabilitystatement/ERPCapabilityStatementServer.fsh)
- ✅ RuleSets: [igs/erp-eu/input/fsh/capabilitystatement/rulesets/](igs/erp-eu/input/fsh/capabilitystatement/rulesets/)

### BFARM IG
- ❌ No capabilitystatement folder

---

**Document generated**: March 24, 2026  
**Analysis tool**: Workspace exploration & file analysis  
**Status**: Complete
