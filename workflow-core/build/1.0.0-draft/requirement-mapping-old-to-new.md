# Mapping alter Anforderungen auf FHIR-IG Anforderungen - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Mapping alter Anforderungen auf FHIR-IG Anforderungen**

## Mapping alter Anforderungen auf FHIR-IG Anforderungen

Diese Seite hilft beim Auffinden von alten Anforderungen (PDF-Welt) in den neuen FHIR-IG Anforderungen.

Dargestellt werden je Quelldokument nur übernommene Anforderungen (gemappte Anforderungen) sowie nicht übernommene Anforderungen aus `req-ignore.csv`.

Hinweis: Links auf neue Anforderungen verwenden aktuell den Platzhalter ``.

### Unbekannte Quelle

#### Übernommene Anforderungen

| | | | |
| :--- | :--- | :--- | :--- |
| [A_22121](https://gemspec.gematik.de/search/index.html?A_22121) | - | [IG-TIFLOW-CHRG-49](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_28500](https://gemspec.gematik.de/search/index.html?A_28500) | - | [IG-TIFLOW-EU-22](/erp-eu/query-api-task-req-fd.md) | erp-eu |
| [A_28530](https://gemspec.gematik.de/search/index.html?A_28530) | - | [IG-TIFLOW-CORE-204](/core/query-api-pushers-req-fd.md) | core |
| [A_28540](https://gemspec.gematik.de/search/index.html?A_28540) | - | [IG-TIFLOW-DIGA-2](/diga/query-api-communication-req-ktr.md) | diga |
| [A_28570](https://gemspec.gematik.de/search/index.html?A_28570) | - | [IG-TIFLOW-RX-59](/rx/op-activate-req-fd.md) | rx |

### gemF_eRp_PKV

#### Übernommene Anforderungen

| | | | |
| :--- | :--- | :--- | :--- |
| [A_19299-02](https://gemspec.gematik.de/search/index.html?A_19299-02) | FHIR-Ressource Communication | [IG-TIFLOW-CORE-200](/core/index.md)[IG-TIFLOW-RX-98](/rx/index.md) | corerx |
| [A_22109](https://gemspec.gematik.de/search/index.html?A_22109) | E-Rezept-Fachdienst – Löschfrist ChargeItem | [IG-TIFLOW-CHRG-7](/erp-chrg/menu-technische-umsetzung-verarbeitungsregeln.md)[IG-TIFLOW-CORE-89](/core/ttl.md) | coreerp-chrg |
| [A_22111](https://gemspec.gematik.de/search/index.html?A_22111) | E-Rezept-Fachdienst – ChargeItem - unzulässige Operationen | [IG-TIFLOW-CHRG-46](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22112](https://gemspec.gematik.de/search/index.html?A_22112) | E-Rezept-Fachdienst – Abrechnungsinformation löschen - alles Löschen verbieten | [IG-TIFLOW-CHRG-91](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22113](https://gemspec.gematik.de/search/index.html?A_22113) | E-Rezept-Fachdienst – Abrechnungsinformation löschen - Rollenprüfung | [IG-TIFLOW-CHRG-92](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22114](https://gemspec.gematik.de/search/index.html?A_22114) | E-Rezept-Fachdienst – Abrechnungsinformation löschen – Prüfung KVNR | [IG-TIFLOW-CHRG-93](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22118](https://gemspec.gematik.de/search/index.html?A_22118) | E-Rezept-Fachdienst – Abrechnungsinformationen abrufen - Rollenprüfung Versicherter | [IG-TIFLOW-CHRG-47](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22119](https://gemspec.gematik.de/search/index.html?A_22119) | E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Versicherter – Filter KVNR | [IG-TIFLOW-CHRG-48](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22122](https://gemspec.gematik.de/search/index.html?A_22122) | E-Rezept-Fachdienst – Abrechnungsinformationen abrufen– Response | [IG-TIFLOW-CHRG-50](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22124](https://gemspec.gematik.de/search/index.html?A_22124) | E-Rezept-Fachdienst – Abrechnungsinformation abrufen - Rollenprüfung Versicherter oder Apotheker | [IG-TIFLOW-CHRG-51](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22125](https://gemspec.gematik.de/search/index.html?A_22125) | E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Versicherter – Prüfung KVNR | [IG-TIFLOW-CHRG-52](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22126](https://gemspec.gematik.de/search/index.html?A_22126) | E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung Telematik-ID | [IG-TIFLOW-CHRG-53](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22127-01](https://gemspec.gematik.de/search/index.html?A_22127-01) | E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Versicherte – Signieren | [IG-TIFLOW-CHRG-55](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22129](https://gemspec.gematik.de/search/index.html?A_22129) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen - Rollenprüfung | [IG-TIFLOW-CHRG-57](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22130](https://gemspec.gematik.de/search/index.html?A_22130) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen - Prüfung Parameter Task | [IG-TIFLOW-CHRG-58](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22131](https://gemspec.gematik.de/search/index.html?A_22131) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen - Prüfung Existenz Task | [IG-TIFLOW-CHRG-59](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22133](https://gemspec.gematik.de/search/index.html?A_22133) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Einwilligung | [IG-TIFLOW-CHRG-62](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22134](https://gemspec.gematik.de/search/index.html?A_22134) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Verordnungsdatensatz übernehmen | [IG-TIFLOW-CHRG-69](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22135-01](https://gemspec.gematik.de/search/index.html?A_22135-01) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Quittung übernehmen | [IG-TIFLOW-CHRG-70](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22136-01](https://gemspec.gematik.de/search/index.html?A_22136-01) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – FHIR-Validierung ChargeItem | [IG-TIFLOW-CHRG-64](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22137](https://gemspec.gematik.de/search/index.html?A_22137) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – PKV-Abgabedatensatz übernehmen | [IG-TIFLOW-CHRG-65](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22138](https://gemspec.gematik.de/search/index.html?A_22138) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – FHIR-Validierung PKV-Abgabedatensatz | [IG-TIFLOW-CHRG-66](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22139](https://gemspec.gematik.de/search/index.html?A_22139) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Signaturprüfung PKV-Abgabedatensatz | [IG-TIFLOW-CHRG-67](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22141](https://gemspec.gematik.de/search/index.html?A_22141) | E-Rezept-Fachdienst – Signaturzertifikat SMC-B prüfen | [IG-TIFLOW-CHRG-165](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22143](https://gemspec.gematik.de/search/index.html?A_22143) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – ChargeItem befüllen | [IG-TIFLOW-CHRG-72](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22144](https://gemspec.gematik.de/search/index.html?A_22144) | E-Rezept-Fachdienst – Abrechnungsinformation ändern – Rollenprüfung | [IG-TIFLOW-CHRG-79](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22146](https://gemspec.gematik.de/search/index.html?A_22146) | E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke - Prüfung Telematik-ID | [IG-TIFLOW-CHRG-81](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22148](https://gemspec.gematik.de/search/index.html?A_22148) | E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – PKV-Abgabedatensatz übernehmen | [IG-TIFLOW-CHRG-83](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22149](https://gemspec.gematik.de/search/index.html?A_22149) | E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – FHIR-Validierung PKV-Abgabedatensatz | [IG-TIFLOW-CHRG-84](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22150](https://gemspec.gematik.de/search/index.html?A_22150) | E-Rezept-Fachdienst – Abrechnungsinformation ändern - Apotheke – Signaturprüfung PKV-Abgabedatensatz | [IG-TIFLOW-CHRG-85](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22152](https://gemspec.gematik.de/search/index.html?A_22152) | E-Rezept-Fachdienst - Abrechnungsinformation ändern – FHIR-Validierung ChargeItem | [IG-TIFLOW-CHRG-87](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22153](https://gemspec.gematik.de/search/index.html?A_22153) | E-Rezept-Fachdienst - unzulässige Operationen Consent | [IG-TIFLOW-CORE-158](/core/query-api-consent-req-fd.md) | core |
| [A_22154](https://gemspec.gematik.de/search/index.html?A_22154) | E-Rezept-Fachdienst – Consent löschen - alles Löschen verbieten | [IG-TIFLOW-CORE-167](/core/query-api-consent-req-fd.md) | core |
| [A_22155](https://gemspec.gematik.de/search/index.html?A_22155) | E-Rezept-Fachdienst - Consent löschen - Rollenprüfung Versicherter | [IG-TIFLOW-CORE-168](/core/query-api-consent-req-fd.md) | core |
| [A_22157](https://gemspec.gematik.de/search/index.html?A_22157) | E-Rezept-Fachdienst - Consent löschen - Löschen der bestehenden Abrechnungsinformationen | [IG-TIFLOW-CHRG-45](/erp-chrg/query-api-consent-req-fd.md)[IG-TIFLOW-CORE-170](/core/query-api-consent-req-fd.md) | coreerp-chrg |
| [A_22158](https://gemspec.gematik.de/search/index.html?A_22158) | E-Rezept-Fachdienst - Consent löschen - Löschen der Consent | [IG-TIFLOW-CORE-170](/core/query-api-consent-req-fd.md) | core |
| [A_22159](https://gemspec.gematik.de/search/index.html?A_22159) | E-Rezept-Fachdienst - Consent lesen - Rollenprüfung Versicherter | [IG-TIFLOW-CORE-165](/core/query-api-consent-req-fd.md) | core |
| [A_22160](https://gemspec.gematik.de/search/index.html?A_22160) | E-Rezept-Fachdienst - Consent lesen - Filter Consent auf KVNR des Versicherten | [IG-TIFLOW-CORE-166](/core/query-api-consent-req-fd.md) | core |
| [A_22161](https://gemspec.gematik.de/search/index.html?A_22161) | E-Rezept-Fachdienst - Consent schreiben - Rollenprüfung Versicherter | [IG-TIFLOW-CORE-159](/core/query-api-consent-req-fd.md) | core |
| [A_22173](https://gemspec.gematik.de/search/index.html?A_22173) | E-Rezept-FdV: Liste Abrechnungsinformationen abrufen - Abfragerequest | [IG-TIFLOW-CHRG-16](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_22175](https://gemspec.gematik.de/search/index.html?A_22175) | E-Rezept-FdV: Abrechnungsinformation abrufen - Abfragerequest einzelner Datensatz | [IG-TIFLOW-CHRG-18](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_22183](https://gemspec.gematik.de/search/index.html?A_22183) | E-Rezept-FdV: Abrechnungsinformation löschen - Löschrequest | [IG-TIFLOW-CHRG-25](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_22186](https://gemspec.gematik.de/search/index.html?A_22186) | PS abgebende LEI: Abrechnungsinformation bereitstellen – E-Rezept auswählen | [IG-TIFLOW-CHRG-28](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22188](https://gemspec.gematik.de/search/index.html?A_22188) | PS abgebende LEI: Abrechnungsinformation bereitstellen – PKV-Abgabedatensatz erstellen | [IG-TIFLOW-CHRG-29](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22189](https://gemspec.gematik.de/search/index.html?A_22189) | PS abgebende LEI: Abrechnungsinformation bereitstellen – ChargeItem erstellen | [IG-TIFLOW-CHRG-30](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22190](https://gemspec.gematik.de/search/index.html?A_22190) | PS abgebende LEI: Abrechnungsinformation bereitstellen - Speicherrequest | [IG-TIFLOW-CHRG-31](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22191](https://gemspec.gematik.de/search/index.html?A_22191) | PS abgebende LEI: PKV-Abgabedatensatz ändern - PKV-Abgabedatensatz zum Ändern auswählen | [IG-TIFLOW-CHRG-32](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22193](https://gemspec.gematik.de/search/index.html?A_22193) | PS abgebende LEI: PKV-Abgabedatensatz ändern – PKV-Abgabedatensatz erstellen | [IG-TIFLOW-CHRG-33](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22194](https://gemspec.gematik.de/search/index.html?A_22194) | PS abgebende LEI: PKV-Abgabedatensatz ändern – ChargeItem erstellen | [IG-TIFLOW-CHRG-34](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22195](https://gemspec.gematik.de/search/index.html?A_22195) | PS abgebende LEI: PKV-Abgabedatensatz ändern - Speicherrequest | [IG-TIFLOW-CHRG-35](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22203](https://gemspec.gematik.de/search/index.html?A_22203) | PS abgebende LEI: Abrechnungsinformation abrufen - Leserequest | [IG-TIFLOW-CHRG-36](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22204](https://gemspec.gematik.de/search/index.html?A_22204) | FHIR-Ressource PKV-Abgabedatensatz | [IG-TIFLOW-CHRG-162](/erp-chrg/index.md) | erp-chrg |
| [A_22205-0](https://gemspec.gematik.de/search/index.html?A_22205-0) | FHIR-Ressource ChargeItem | [IG-TIFLOW-CHRG-162](/erp-chrg/index.md) | erp-chrg |
| [A_22205-01](https://gemspec.gematik.de/search/index.html?A_22205-01) | FHIR-Ressource ChargeItem | [IG-TIFLOW-CHRG-162](/erp-chrg/index.md) | erp-chrg |
| [A_22206-01](https://gemspec.gematik.de/search/index.html?A_22206-01) | FHIR-Ressource Consent | [IG-TIFLOW-CHRG-162](/erp-chrg/index.md)[IG-TIFLOW-EU-47](/erp-eu/index.md) | erp-chrgerp-eu |
| [A_22207](https://gemspec.gematik.de/search/index.html?A_22207) | Einwilligung in Verarbeitung von Abrechnungsinformationen nur für PKV-Versicherte | [IG-TIFLOW-CHRG-37](/erp-chrg/menu-technische-umsetzung-datenschutz-und-sicherheit.md) | erp-chrg |
| [A_22208](https://gemspec.gematik.de/search/index.html?A_22208) | Verarbeitung von Abrechnungsinformationen nur nach Einwilligung | [IG-TIFLOW-CHRG-38](/erp-chrg/menu-technische-umsetzung-datenschutz-und-sicherheit.md) | erp-chrg |
| [A_22209](https://gemspec.gematik.de/search/index.html?A_22209) | Verarbeitung von Abrechnungsinformationen im E-Rezept-Fachdienst nur nach Einwilligung | [IG-TIFLOW-CHRG-39](/erp-chrg/menu-technische-umsetzung-datenschutz-und-sicherheit.md) | erp-chrg |
| [A_22210](https://gemspec.gematik.de/search/index.html?A_22210) | Nichtabstreitbarkeit der Einwilligung | [IG-TIFLOW-CHRG-40](/erp-chrg/menu-technische-umsetzung-datenschutz-und-sicherheit.md) | erp-chrg |
| [A_22211](https://gemspec.gematik.de/search/index.html?A_22211) | Löschen von Abrechnungsinformationen nach zehn Jahren | [IG-TIFLOW-CHRG-41](/erp-chrg/menu-technische-umsetzung-datenschutz-und-sicherheit.md) | erp-chrg |
| [A_22212](https://gemspec.gematik.de/search/index.html?A_22212) | Information über Möglichkeit des Speicherns der Abrechnungsinformationen nur für konkretes E-Rezept | [IG-TIFLOW-CHRG-42](/erp-chrg/menu-technische-umsetzung-datenschutz-und-sicherheit.md) | erp-chrg |
| [A_22213](https://gemspec.gematik.de/search/index.html?A_22213) | Schutz der Abrechnungsinformationen | [IG-TIFLOW-CHRG-43](/erp-chrg/menu-technische-umsetzung-datenschutz-und-sicherheit.md) | erp-chrg |
| [A_22214](https://gemspec.gematik.de/search/index.html?A_22214) | Protokollierung der Einwilligung bzw. des Widerrufs | [IG-TIFLOW-CHRG-44](/erp-chrg/menu-technische-umsetzung-datenschutz-und-sicherheit.md) | erp-chrg |
| [A_22215](https://gemspec.gematik.de/search/index.html?A_22215) | E-Rezept-Fachdienst – Abrechnungsinformation ändern – Prüfung Einwilligung | [IG-TIFLOW-CHRG-80](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22289](https://gemspec.gematik.de/search/index.html?A_22289) | E-Rezept-Fachdienst - Consent schreiben - Prüfung KVNR | [IG-TIFLOW-CORE-160](/core/query-api-consent-req-fd.md) | core |
| [A_22347-01](https://gemspec.gematik.de/search/index.html?A_22347-01) | E-Rezept-Fachdienst – Task aktivieren – Flowtype 200/209 - Prüfung Coverage Type | [IG-TIFLOW-RX-61](/rx/op-activate-req-fd.md) | rx |
| [A_22350](https://gemspec.gematik.de/search/index.html?A_22350) | E-Rezept-Fachdienst - Consent schreiben – Persistieren | [IG-TIFLOW-CORE-351](/core/query-api-consent-req-fd.md) | core |
| [A_22351](https://gemspec.gematik.de/search/index.html?A_22351) | E-Rezept-Fachdienst - Consent schreiben - FHIR-Validierung | [IG-TIFLOW-CORE-161](/core/query-api-consent-req-fd.md) | core |
| [A_22367-02](https://gemspec.gematik.de/search/index.html?A_22367-02) | E-Rezept-Fachdienst - Nachricht einstellen - Notification Apotheke | [IG-TIFLOW-CHRG-164](/erp-chrg/query-api-communication-req-fd.md) | erp-chrg |
| [A_22367-03](https://gemspec.gematik.de/search/index.html?A_22367-03) | E-Rezept-Fachdienst - Nachricht einstellen - Notification Apotheke | [IG-TIFLOW-CORE-275](/core/query-api-communication-req-fd.md) | core |
| [A_22541-01](https://gemspec.gematik.de/search/index.html?A_22541-01) | PS verordnende LEI: E-Rezept erstellen – Flowtype 200/209 – KVNR als Identifier | [IG-TIFLOW-RX-41](/rx/op-activate-req-pvs.md) | rx |
| [A_22542-01](https://gemspec.gematik.de/search/index.html?A_22542-01) | PS verordnende LEI: E-Rezept erstellen – Flowtype 200/209 – Versicherungstyp PKV | [IG-TIFLOW-RX-42](/rx/op-activate-req-pvs.md) | rx |
| [A_22708](https://gemspec.gematik.de/search/index.html?A_22708) | PS abgebende LEI: Abrechnungsinformation bereitstellen – Einwilligung muss vorliegen | [IG-TIFLOW-CHRG-27](/erp-chrg/query-api-chargeitem-req-avs.md) | erp-chrg |
| [A_22734-01](https://gemspec.gematik.de/search/index.html?A_22734-01) | E-Rezept-Fachdienst - Nachricht einstellen - Prüfung Existenz ChargeItem | [IG-TIFLOW-CHRG-163](/erp-chrg/query-api-communication-req-fd.md)[IG-TIFLOW-CORE-274](/core/query-api-communication-req-fd.md) | coreerp-chrg |
| [A_22736](https://gemspec.gematik.de/search/index.html?A_22736) | E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Apotheke auswählen | [IG-TIFLOW-CHRG-3](/erp-chrg/query-api-communication-req-fdv.md) | erp-chrg |
| [A_22739-01](https://gemspec.gematik.de/search/index.html?A_22739-01) | E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Nachricht erstellen | [IG-TIFLOW-CHRG-5](/erp-chrg/query-api-communication-req-fdv.md) | erp-chrg |
| [A_22740](https://gemspec.gematik.de/search/index.html?A_22740) | E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - Nachricht auf E-Rezept-Fachdienst einstellen | [IG-TIFLOW-CHRG-6](/erp-chrg/query-api-communication-req-fdv.md) | erp-chrg |
| [A_22875](https://gemspec.gematik.de/search/index.html?A_22875) | E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Rollenprüfung | [IG-TIFLOW-CHRG-76](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22877](https://gemspec.gematik.de/search/index.html?A_22877) | E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Versicherter - Prüfung KVNR | [IG-TIFLOW-CHRG-77](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22879](https://gemspec.gematik.de/search/index.html?A_22879) | E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) - alles Ändern verbieten | [IG-TIFLOW-CHRG-75](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |

### gemILF_PS_eRp

#### Übernommene Anforderungen

| | | | |
| :--- | :--- | :--- | :--- |
| [A_19236](https://gemspec.gematik.de/search/index.html?A_19236) | PS verordnende LEI: E-Rezepte löschen - E-Rezept zum Löschen auswählen | [IG-TIFLOW-CORE-250](/core/op-abort-req-pvs.md) | core |
| [A_19237](https://gemspec.gematik.de/search/index.html?A_19237) | PS verordnende LEI: E-Rezept löschen - Bestätigung | [IG-TIFLOW-CORE-251](/core/op-abort-req-pvs.md) | core |
| [A_19238](https://gemspec.gematik.de/search/index.html?A_19238) | PS verordnende LEI: E-Rezept durch Verordnenden löschen | [IG-TIFLOW-CORE-252](/core/op-abort-req-pvs.md) | core |
| [A_19239-01](https://gemspec.gematik.de/search/index.html?A_19239-01) | PS verordnende LEI: E-Rezept löschen - Löschrequest | [IG-TIFLOW-CORE-253](/core/op-abort-req-pvs.md) | core |
| [A_19240](https://gemspec.gematik.de/search/index.html?A_19240) | PS verordnende LEI: E-Rezept löschen - E-Rezept-Token löschen | [IG-TIFLOW-CORE-254](/core/op-abort-req-pvs.md) | core |
| [A_19241](https://gemspec.gematik.de/search/index.html?A_19241) | PS abgebende LEI: E-Rezepte löschen - E-Rezept auswählen | [IG-TIFLOW-CORE-121](/core/op-abort-req-avs.md) | core |
| [A_19242](https://gemspec.gematik.de/search/index.html?A_19242) | PS abgebende LEI: E-Rezept löschen - Bestätigung | [IG-TIFLOW-CORE-122](/core/op-abort-req-avs.md) | core |
| [A_19243](https://gemspec.gematik.de/search/index.html?A_19243) | PS abgebende LEI: E-Rezept durch Abgebenden löschen | [IG-TIFLOW-CORE-123](/core/op-abort-req-avs.md) | core |
| [A_19244](https://gemspec.gematik.de/search/index.html?A_19244) | PS abgebende LEI: E-Rezept löschen - Löschrequest | [IG-TIFLOW-CORE-124](/core/op-abort-req-avs.md) | core |
| [A_19245](https://gemspec.gematik.de/search/index.html?A_19245) | PS abgebende LEI: E-Rezept löschen - E-Rezept-Token löschen | [IG-TIFLOW-CORE-125](/core/op-abort-req-avs.md) | core |
| [A_19249](https://gemspec.gematik.de/search/index.html?A_19249) | PS abgebende LEI: E-Rezept durch Abgebenden zurückgeben | [IG-TIFLOW-CORE-193](/core/op-reject-req-avs.md)[IG-TIFLOW-CORE-282](/core/op-reject-req-ktr.md) | core |
| [A_19250](https://gemspec.gematik.de/search/index.html?A_19250) | PS abgebende LEI: E-Rezept zurückgeben - Statusrequest | [IG-TIFLOW-CORE-194](/core/op-reject-req-avs.md)[IG-TIFLOW-CORE-283](/core/op-reject-req-ktr.md) | core |
| [A_19251](https://gemspec.gematik.de/search/index.html?A_19251) | PS abgebende LEI: E-Rezept zurückgeben - E-Rezept löschen | [IG-TIFLOW-CORE-195](/core/op-reject-req-avs.md)[IG-TIFLOW-CORE-284](/core/op-reject-req-ktr.md) | core |
| [A_19272](https://gemspec.gematik.de/search/index.html?A_19272) | PS verordnende LEI: E-Rezept durch Verordnenden einstellen | [IG-TIFLOW-CORE-111](/core/op-activate-req-pvs.md) | core |
| [A_19273-01](https://gemspec.gematik.de/search/index.html?A_19273-01) | PS verordnende LEI: E-Rezept einstellen - Task auf Fachdienst aktivieren | [IG-TIFLOW-CORE-112](/core/op-activate-req-pvs.md) | core |
| [A_19275](https://gemspec.gematik.de/search/index.html?A_19275) | PS verordnende LEI: E-Rezept erstellen - E-Rezept-Bundle erstellen | [IG-TIFLOW-RX-40](/rx/op-activate-req-pvs.md) | rx |
| [A_19276](https://gemspec.gematik.de/search/index.html?A_19276) | PS verordnende LEI: E-Rezept erstellen - E-Rezept-ID abrufen | [IG-TIFLOW-CORE-197](/core/op-create-req-pvs.md) | core |
| [A_19279](https://gemspec.gematik.de/search/index.html?A_19279) | PS verordnende LEI: E-Rezept einstellen - E-Rezept-Token erstellen | [IG-TIFLOW-CORE-114](/core/op-activate-req-pvs.md) | core |
| [A_19280](https://gemspec.gematik.de/search/index.html?A_19280) | PS verordnende LEI: E-Rezept einstellen - E-Rezept ausdrucken | [IG-TIFLOW-CORE-115](/core/op-activate-req-pvs.md) | core |
| [A_19288-03](https://gemspec.gematik.de/search/index.html?A_19288-03) | PS abgebende LEI: Quittung abrufen - Dispensierinformationen erstellen | [IG-TIFLOW-RX-99](/rx/op-close-req-avs.md) | rx |
| [A_19292](https://gemspec.gematik.de/search/index.html?A_19292) | PS abgebende LEI: Quittung erneut abrufen - Statusrequest | [IG-TIFLOW-CORE-16](/core/query-api-task-req-avs.md)[IG-TIFLOW-CORE-172](/core/query-api-task-req-ktr.md) | core |
| [A_19329-01](https://gemspec.gematik.de/search/index.html?A_19329-01) | PS abgebende LEI: Nachrichten empfangen - Abfragerequest | [IG-TIFLOW-CORE-108](/core/query-api-communication-req-avs.md)[IG-TIFLOW-CORE-30](/core/query-api-communication-req-ktr.md) | core |
| [A_19334](https://gemspec.gematik.de/search/index.html?A_19334) | PS abgebende LEI: Nachricht versenden - Nachricht auf Fachdienst einstellen | [IG-TIFLOW-CORE-109](/core/query-api-communication-req-avs.md)[IG-TIFLOW-CORE-31](/core/query-api-communication-req-ktr.md) | core |
| [A_19558-01](https://gemspec.gematik.de/search/index.html?A_19558-01) | PS abgebende LEI: E-Rezept abrufen - Task herunterladen | [IG-TIFLOW-CORE-196](/core/op-accept-req-avs.md)[IG-TIFLOW-CORE-334](/core/op-accept-req-ktr.md) | core |
| [A_20654-01](https://gemspec.gematik.de/search/index.html?A_20654-01) | CS: Registrierung des Clientsystems des E-Rezept-Fachdienstes | [IG-TIFLOW-CORE-221](/core/verbindungsaufbau-client.md) | core |
| [A_20656-02](https://gemspec.gematik.de/search/index.html?A_20656-02) | CS: Prüfung der Signatur des Discovery Document | [IG-TIFLOW-CORE-222](/core/verbindungsaufbau-client.md) | core |
| [A_20657-01](https://gemspec.gematik.de/search/index.html?A_20657-01) | CS: Prüfung Typ und Rolle des Signaturzertifikats des Discovery Document | [IG-TIFLOW-CORE-223](/core/verbindungsaufbau-client.md) | core |
| [A_20658-01](https://gemspec.gematik.de/search/index.html?A_20658-01) | CS: Sicheres Löschen der Token | [IG-TIFLOW-CORE-224](/core/verbindungsaufbau-client.md) | core |
| [A_20659-01](https://gemspec.gematik.de/search/index.html?A_20659-01) | CS: Erzeugen des CODE_VERIFIER | [IG-TIFLOW-CORE-227](/core/verbindungsaufbau-client.md) | core |
| [A_20660-01](https://gemspec.gematik.de/search/index.html?A_20660-01) | Erzeugen des Hash-Werts des CODE_VERIFIER | [IG-TIFLOW-CORE-228](/core/verbindungsaufbau-client.md) | core |
| [A_20661-01](https://gemspec.gematik.de/search/index.html?A_20661-01) | CS: Anfrage des AUTHORIZATION_CODE für ein ACCESS_TOKEN | [IG-TIFLOW-CORE-229](/core/verbindungsaufbau-client.md) | core |
| [A_20662-01](https://gemspec.gematik.de/search/index.html?A_20662-01) | CS: Annahme des “user_consent” und des CHALLENGE_TOKEN | [IG-TIFLOW-CORE-230](/core/verbindungsaufbau-client.md) | core |
| [A_20663-02](https://gemspec.gematik.de/search/index.html?A_20663-02) | CS: Prüfung der Signatur des CHALLENGE_TOKEN | [IG-TIFLOW-CORE-231](/core/verbindungsaufbau-client.md) | core |
| [A_20664](https://gemspec.gematik.de/search/index.html?A_20664) | Bestätigung des Consent | [IG-TIFLOW-CORE-232](/core/verbindungsaufbau-client.md) | core |
| [A_20665-02](https://gemspec.gematik.de/search/index.html?A_20665-02) | CS: Signatur der Challenge des IdP-Dienstes | [IG-TIFLOW-CORE-233](/core/verbindungsaufbau-client.md) | core |
| [A_20666-02](https://gemspec.gematik.de/search/index.html?A_20666-02) | Auslesen des Authentisierungszertifikates | [IG-TIFLOW-CORE-234](/core/verbindungsaufbau-client.md) | core |
| [A_20667-03](https://gemspec.gematik.de/search/index.html?A_20667-03) | CS: Response auf die Challenge des Authorization-Endpunktes | [IG-TIFLOW-CORE-235](/core/verbindungsaufbau-client.md) | core |
| [A_20668-01](https://gemspec.gematik.de/search/index.html?A_20668-01) | CS: Annahme des AUTHORIZATION_CODE | [IG-TIFLOW-CORE-236](/core/verbindungsaufbau-client.md) | core |
| [A_20671-02](https://gemspec.gematik.de/search/index.html?A_20671-02) | CS: Einreichen des AUTHORIZATION_CODE beim Token-Endpunkt | [IG-TIFLOW-CORE-239](/core/verbindungsaufbau-client.md) | core |
| [A_20672-02](https://gemspec.gematik.de/search/index.html?A_20672-02) | CS: Annahme des ID_TOKEN | [IG-TIFLOW-CORE-240](/core/verbindungsaufbau-client.md) | core |
| [A_20673-02](https://gemspec.gematik.de/search/index.html?A_20673-02) | CS: Annahme des ACCESS_TOKEN | [IG-TIFLOW-CORE-241](/core/verbindungsaufbau-client.md) | core |
| [A_20674-01](https://gemspec.gematik.de/search/index.html?A_20674-01) | CS: Formale Prüfung der Signatur des ID_TOKEN und des ACCESS_TOKEN | [IG-TIFLOW-CORE-242](/core/verbindungsaufbau-client.md) | core |
| [A_20675-01](https://gemspec.gematik.de/search/index.html?A_20675-01) | CS: Gültigkeitsprüfung des Signaturzertifikats des ACCESS_TOKEN innerhalb der TI | [IG-TIFLOW-CORE-243](/core/verbindungsaufbau-client.md) | core |
| [A_21105-01](https://gemspec.gematik.de/search/index.html?A_21105-01) | PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Fertigarzneimittel: Chargeninfo | [IG-TIFLOW-RX-195](/rx/menu-technische-umsetzung-dispensierinformationen.md) | rx |
| [A_21244-01](https://gemspec.gematik.de/search/index.html?A_21244-01) | PS abgebende LEI: Abgabedatensatz signieren - Signaturverfahren | [IG-TIFLOW-RX-2](/rx/menu-technische-umsetzung-abgabedatensatz.md) | rx |
| [A_21333-01](https://gemspec.gematik.de/search/index.html?A_21333-01) | CS: Erzeugung des “Token-Key” | [IG-TIFLOW-CORE-237](/core/verbindungsaufbau-client.md) | core |
| [A_21334-01](https://gemspec.gematik.de/search/index.html?A_21334-01) | CS: Erzeugung des KEY_VERIFIER | [IG-TIFLOW-CORE-238](/core/verbindungsaufbau-client.md) | core |
| [A_21337-01](https://gemspec.gematik.de/search/index.html?A_21337-01) | CS: Löschung von TOKEN bei zeitlichem Ablauf | [IG-TIFLOW-CORE-225](/core/verbindungsaufbau-client.md) | core |
| [A_21338-01](https://gemspec.gematik.de/search/index.html?A_21338-01) | CS: Sichere Speicherung der Token | [IG-TIFLOW-CORE-226](/core/verbindungsaufbau-client.md) | core |
| [A_21349](https://gemspec.gematik.de/search/index.html?A_21349) | PS: Schutz des E-Rezept-Tokens bei Übertragung | [IG-TIFLOW-RX-49](/rx/op-activate-req-pvs.md) | rx |
| [A_21400](https://gemspec.gematik.de/search/index.html?A_21400) | PS verordnende LEI: Übergabe E-Rezept-Token an Apotheke | [IG-TIFLOW-RX-48](/rx/op-activate-req-pvs.md) | rx |
| [A_21453](https://gemspec.gematik.de/search/index.html?A_21453) | PS verordnende LEI: Herstellende Apotheke für Übermittlungsverfahren | [IG-TIFLOW-RX-50](/rx/op-activate-req-pvs.md) | rx |
| [A_21489](https://gemspec.gematik.de/search/index.html?A_21489) | PS abgebende LEI: Nachricht löschen - Löschrequest | [IG-TIFLOW-CORE-110](/core/query-api-communication-req-avs.md)[IG-TIFLOW-CORE-32](/core/query-api-communication-req-ktr.md) | core |
| [A_21556](https://gemspec.gematik.de/search/index.html?A_21556) | PS abgebende LEI: Häufigkeit des Abrufen von Nachrichten | [IG-TIFLOW-CORE-107](/core/query-api-communication-req-avs.md)[IG-TIFLOW-CORE-29](/core/query-api-communication-req-ktr.md) | core |
| [A_21619-01](https://gemspec.gematik.de/search/index.html?A_21619-01) | PS abgebende LEI: Abgabedatensatz mit QES: OCSP Response einbetten | [IG-TIFLOW-RX-1](/rx/menu-technische-umsetzung-abgabedatensatz.md) | rx |
| [A_21870](https://gemspec.gematik.de/search/index.html?A_21870) | E-Rezept - X-KIM-Dienstkennung - Zuweisung | [IG-TIFLOW-RX-91](/rx/menu-technische-umsetzung-kim.md) | rx |
| [A_21871](https://gemspec.gematik.de/search/index.html?A_21871) | E-Rezept - X-KIM-Dienstkennung - Kommunikation | [IG-TIFLOW-RX-92](/rx/menu-technische-umsetzung-kim.md) | rx |
| [A_21873](https://gemspec.gematik.de/search/index.html?A_21873) | E-Rezept - Struktur Zuweisungs-Message | [IG-TIFLOW-RX-93](/rx/menu-technische-umsetzung-kim.md) | rx |
| [A_21874](https://gemspec.gematik.de/search/index.html?A_21874) | E-Rezept - Zuweisungs-Message - CRLF | [IG-TIFLOW-RX-94](/rx/menu-technische-umsetzung-kim.md) | rx |
| [A_21875](https://gemspec.gematik.de/search/index.html?A_21875) | E-Rezept - Struktur Kommunikation-Message | [IG-TIFLOW-RX-95](/rx/menu-technische-umsetzung-kim.md) | rx |
| [A_22071-01](https://gemspec.gematik.de/search/index.html?A_22071-01) | PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Mehrere MedicationDispense | [IG-TIFLOW-RX-193](/rx/menu-technische-umsetzung-dispensierinformationen.md) | rx |
| [A_22372](https://gemspec.gematik.de/search/index.html?A_22372) | PS abgebende LEI: Subscription für neue Communication | [IG-TIFLOW-CORE-245](/core/query-api-subscription-req-avs.md) | core |
| [A_22373](https://gemspec.gematik.de/search/index.html?A_22373) | PS abgebende LEI: Subscription für neue Communication - Subscription Ressource erstellen | [IG-TIFLOW-CORE-246](/core/query-api-subscription-req-avs.md) | core |
| [A_22374](https://gemspec.gematik.de/search/index.html?A_22374) | PS abgebende LEI: Subscription für neue Communication - Subscription registrieren | [IG-TIFLOW-CORE-247](/core/query-api-subscription-req-avs.md) | core |
| [A_22375](https://gemspec.gematik.de/search/index.html?A_22375) | PS abgebende LEI: Subscription für neue Communication - Subscription | [IG-TIFLOW-CORE-248](/core/query-api-subscription-req-avs.md) | core |
| [A_22379](https://gemspec.gematik.de/search/index.html?A_22379) | PS abgebende LEI: Subscription für neue Communication - Wartezeit | [IG-TIFLOW-CORE-249](/core/query-api-subscription-req-avs.md) | core |
| [A_22426](https://gemspec.gematik.de/search/index.html?A_22426) | PS abgebende LEI: Subscription für neue Communication - eine Subscription pro Telematik-ID | [IG-TIFLOW-CORE-244](/core/query-api-subscription-req-avs.md) | core |
| [A_22503](https://gemspec.gematik.de/search/index.html?A_22503) | PS verordnende LEI: E-Rezept einstellen - kein Ausdruck bei Fehler beim Aktivieren | [IG-TIFLOW-CORE-113](/core/op-activate-req-pvs.md) | core |
| [A_22636](https://gemspec.gematik.de/search/index.html?A_22636) | PS verordnende LEI: E-Rezept erstellen - Mehrfachverordnung - Beginn Einlösefrist | [IG-TIFLOW-RX-43](/rx/op-activate-req-pvs.md) | rx |
| [A_22893](https://gemspec.gematik.de/search/index.html?A_22893) | PS verordnende LEI: E-Rezept erstellen - Gleichheit Ausstellungsdatum und QES Erstellung | [IG-TIFLOW-CORE-198](/core/op-create-req-pvs.md) | core |
| [A_23560](https://gemspec.gematik.de/search/index.html?A_23560) | PS verordnende LEI: UX - E-Rezept im Verordnungsvorgang erstellen | [IG-TIFLOW-RX-137](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23561](https://gemspec.gematik.de/search/index.html?A_23561) | PS verordnende LEI: UX - Verarbeitungsvorgänge im Hintergrund | [IG-TIFLOW-RX-138](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23562](https://gemspec.gematik.de/search/index.html?A_23562) | PS verordnende LEI: UX - Ergebnismeldung von Verarbeitungsvorgängen im Hintergrund | [IG-TIFLOW-RX-139](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23563](https://gemspec.gematik.de/search/index.html?A_23563) | PS verordnende LEI: UX - Konfigurationsparameter E-Rezept | [IG-TIFLOW-RX-140](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23564](https://gemspec.gematik.de/search/index.html?A_23564) | PS verordnende LEI: UX - Defaulteinstellung E-Rezept-Ausdruck | [IG-TIFLOW-RX-141](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23565](https://gemspec.gematik.de/search/index.html?A_23565) | PS verordnende LEI: UX – Stammdaten für Arzt und Einrichtung übernehmen | [IG-TIFLOW-RX-142](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23566](https://gemspec.gematik.de/search/index.html?A_23566) | PS verordnende LEI: UX - Optimaler Klickpfad | [IG-TIFLOW-RX-143](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23567](https://gemspec.gematik.de/search/index.html?A_23567) | PS verordnende LEI: UX - Optimaler Klickpfad - Erzeugung einer neuen Verordnung | [IG-TIFLOW-RX-144](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23568](https://gemspec.gematik.de/search/index.html?A_23568) | PS verordnende LEI: UX - Optimaler Klickpfad - Vorbelegung bekannter Informationen | [IG-TIFLOW-RX-145](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23569](https://gemspec.gematik.de/search/index.html?A_23569) | PS verordnende LEI: UX - Optimaler Klickpfad - Suche nach gewünschtem Präparat | [IG-TIFLOW-RX-146](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23570](https://gemspec.gematik.de/search/index.html?A_23570) | PS verordnende LEI: UX - Optimaler Klickpfad - Auswahl und Anpassung des Verordnungsinhalts und Signaturvorbereitung | [IG-TIFLOW-RX-147](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23571](https://gemspec.gematik.de/search/index.html?A_23571) | PS verordnende LEI: UX - Optimaler Klickpfad - Vorbereitung mehrerer Verordnungen zum späteren Signieren | [IG-TIFLOW-RX-148](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23572](https://gemspec.gematik.de/search/index.html?A_23572) | PS verordnende LEI: UX - Optimaler Klickpfad - Signieren aller vorbereiteten Verordnungen auf einmal | [IG-TIFLOW-RX-149](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23573](https://gemspec.gematik.de/search/index.html?A_23573) | PS verordnende LEI: UX - Optimaler Klickpfad - Hintergrund-Signaturprozess und Fehleranzeigen | [IG-TIFLOW-RX-150](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23574](https://gemspec.gematik.de/search/index.html?A_23574) | PS verordnende LEI: UX - Optimaler Klickpfad - Hinweistext bei erfolgreichem Signieren | [IG-TIFLOW-RX-151](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23575](https://gemspec.gematik.de/search/index.html?A_23575) | PS verordnende LEI: UX - Optimaler Klickpfad - Automatischer Ausdruck bei entsprechender Konfiguration | [IG-TIFLOW-RX-152](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23576](https://gemspec.gematik.de/search/index.html?A_23576) | PS verordnende LEI: UX – Anwendbarkeit E-Rezept | [IG-TIFLOW-RX-153](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23577](https://gemspec.gematik.de/search/index.html?A_23577) | PS verordnende LEI: UX – Hinweis bei Freitextverordnungen | [IG-TIFLOW-RX-154](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23578](https://gemspec.gematik.de/search/index.html?A_23578) | PS verordnende LEI: UX - Abgabehinweise für den Apotheker | [IG-TIFLOW-RX-155](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23579](https://gemspec.gematik.de/search/index.html?A_23579) | PS verordnende LEI: E-Rezept erstellen - author Practitioner gemäß signierendem HBA | [IG-TIFLOW-RX-156](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23580](https://gemspec.gematik.de/search/index.html?A_23580) | PS verordnende LEI: UX - Vertretungssituation - Möglichkeit zur Entscheidung über Vertretungsfall | [IG-TIFLOW-RX-157](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23581](https://gemspec.gematik.de/search/index.html?A_23581) | PS verordnende LEI: UX - Vertretungssituation - Signatur eines E-Rezeptes | [IG-TIFLOW-RX-158](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23582](https://gemspec.gematik.de/search/index.html?A_23582) | PS verordnende LEI: UX - Vertretungssituation - Persönliche Vertretung | [IG-TIFLOW-RX-160](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23583](https://gemspec.gematik.de/search/index.html?A_23583) | PS verordnende LEI: UX – Weiterbildungsassistent - Möglichkeit zur Entscheidung über Weiterbildungsassistent | [IG-TIFLOW-RX-161](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23584](https://gemspec.gematik.de/search/index.html?A_23584) | PS verordnende LEI: UX – Weiterbildungsassistent – Konfiguration ausbildende Person | [IG-TIFLOW-RX-162](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23585](https://gemspec.gematik.de/search/index.html?A_23585) | PS verordnende LEI: UX – Weiterbildungsassistent – E-Rezept erstellen | [IG-TIFLOW-RX-163](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23586](https://gemspec.gematik.de/search/index.html?A_23586) | PS verordnende LEI: UX – Anlegen eines E-Rezeptes durch MFA | [IG-TIFLOW-RX-178](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23587](https://gemspec.gematik.de/search/index.html?A_23587) | PS verordnende LEI: UX – Keine Signatur von Nutzern ohne HBA | [IG-TIFLOW-RX-179](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23588](https://gemspec.gematik.de/search/index.html?A_23588) | PS verordnende LEI: UX - Mehrfachverordnungen als Option | [IG-TIFLOW-RX-168](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23589](https://gemspec.gematik.de/search/index.html?A_23589) | PS verordnende LEI: UX - MVO - Generierung von Mehrfachverordnungen | [IG-TIFLOW-RX-169](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23590](https://gemspec.gematik.de/search/index.html?A_23590) | PS verordnende LEI: UX - MVO- Automatische Befüllung von Teilverordnungen | [IG-TIFLOW-RX-170](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23591](https://gemspec.gematik.de/search/index.html?A_23591) | PS verordnende LEI: UX - MVO - Auswahl der Anzahl von Teilverordnungen | [IG-TIFLOW-RX-171](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23592](https://gemspec.gematik.de/search/index.html?A_23592) | PS verordnende LEI: UX - MVO - Unterstützung bei Einlösefristen | [IG-TIFLOW-RX-172](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23593](https://gemspec.gematik.de/search/index.html?A_23593) | PS verordnende LEI: UX - MVO - Löschen von zusammengehörenden Teilverordnungen | [IG-TIFLOW-RX-173](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23594](https://gemspec.gematik.de/search/index.html?A_23594) | PS verordnende LEI: UX - MVO - Signieren von Teilverordnungen | [IG-TIFLOW-RX-174](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23595](https://gemspec.gematik.de/search/index.html?A_23595) | PS verordnende LEI: UX – Aufgabenliste | [IG-TIFLOW-RX-176](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23596](https://gemspec.gematik.de/search/index.html?A_23596) | PS verordnende LEI: UX – Aufgabenliste - Filtern und Sortieren | [IG-TIFLOW-RX-177](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23597](https://gemspec.gematik.de/search/index.html?A_23597) | PS verordnende LEI: UX – Aufgabenliste – Benachrichtigungen für neue Aufgaben | [IG-TIFLOW-RX-180](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23598](https://gemspec.gematik.de/search/index.html?A_23598) | PS verordnende LEI: UX – Aufgabenliste - Mehrfachauswahl zur Signatur | [IG-TIFLOW-RX-184](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23599](https://gemspec.gematik.de/search/index.html?A_23599) | PS verordnende LEI: UX – Aufgabenliste - Bearbeiten einzelner Einträge | [IG-TIFLOW-RX-181](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23600](https://gemspec.gematik.de/search/index.html?A_23600) | PS verordnende LEI: UX – Aufgabenliste - Zugriff auf Patientendaten | [IG-TIFLOW-RX-182](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23601](https://gemspec.gematik.de/search/index.html?A_23601) | PS verordnende LEI: UX – Aufgabenliste - Grafische Anzeige E-Rezepte | [IG-TIFLOW-RX-183](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23602](https://gemspec.gematik.de/search/index.html?A_23602) | PS verordnende LEI: Benachrichtigungssystem - Information über Rezeptausstellung | [IG-TIFLOW-RX-185](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23603](https://gemspec.gematik.de/search/index.html?A_23603) | PS verordnende LEI: Benachrichtigungssystem - Schützenswerte Informationen | [IG-TIFLOW-RX-186](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23604](https://gemspec.gematik.de/search/index.html?A_23604) | PS verordnende LEI: UX - Verhalten bei Ausfall von TI Komponenten des E-Rezepts | [IG-TIFLOW-RX-187](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23605](https://gemspec.gematik.de/search/index.html?A_23605) | PS verordnende LEI: UX - Verständliche Fehlermeldungen - technische Fehler | [IG-TIFLOW-RX-188](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23606](https://gemspec.gematik.de/search/index.html?A_23606) | PS verordnende LEI: UX - Verständliche Fehlermeldungen - Handlungsempfehlung | [IG-TIFLOW-RX-189](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23607-01](https://gemspec.gematik.de/search/index.html?A_23607-01) | PS verordnende LEI: UX - Fehlerbenachrichtigung bei Löschversuch eines E-Rezepts | [IG-TIFLOW-RX-190](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23622](https://gemspec.gematik.de/search/index.html?A_23622) | PS verordnende LEI: UX - Vertretungssituation - Kollegiale Vertretung | [IG-TIFLOW-RX-159](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23639](https://gemspec.gematik.de/search/index.html?A_23639) | PS verordnende LEI: UX - MVO - Vorbereitung durch MFA | [IG-TIFLOW-RX-175](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_23786](https://gemspec.gematik.de/search/index.html?A_23786) | PS abgebende LEI: UX - Zuweisung - Hinweis | [IG-TIFLOW-RX-101](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23787](https://gemspec.gematik.de/search/index.html?A_23787) | PS abgebende LEI: UX - Zuweisung - Übernahme E-Rezept aus Nachricht in einen Vorgang | [IG-TIFLOW-RX-102](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23788](https://gemspec.gematik.de/search/index.html?A_23788) | PS abgebende LEI: UX - Nachrichtenkonfiguration | [IG-TIFLOW-RX-103](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23789](https://gemspec.gematik.de/search/index.html?A_23789) | PS abgebende LEI: UX - Komposition einer Nachricht an einen Kunden mit Textvorlagen | [IG-TIFLOW-RX-104](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23790](https://gemspec.gematik.de/search/index.html?A_23790) | PS abgebende LEI: UX - Nachrichtenkonfiguration - automatischer Versand der Empfangsbestätigung | [IG-TIFLOW-RX-105](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23791](https://gemspec.gematik.de/search/index.html?A_23791) | PS abgebende LEI: UX - Zuweisung - Empfangsbestätigung | [IG-TIFLOW-RX-106](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23792](https://gemspec.gematik.de/search/index.html?A_23792) | PS abgebende LEI: UX - Zuweisung - Abholbenachrichtigung | [IG-TIFLOW-RX-107](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23793](https://gemspec.gematik.de/search/index.html?A_23793) | PS abgebende LEI: UX - Zuweisung - Nachricht bei Nicht-Verfügbarkeit eines Medikaments | [IG-TIFLOW-RX-108](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23794](https://gemspec.gematik.de/search/index.html?A_23794) | PS abgebende LEI: UX - Zuweisung - Nachrichten an Sender | [IG-TIFLOW-RX-109](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23795](https://gemspec.gematik.de/search/index.html?A_23795) | PS abgebende LEI: UX - Zuweisung - Nachrichten an Sender - ohne Medienbruch | [IG-TIFLOW-RX-110](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23796](https://gemspec.gematik.de/search/index.html?A_23796) | PS abgebende LEI: UX - Zuweisung - Nachrichten eines Vorgangs | [IG-TIFLOW-RX-111](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23797](https://gemspec.gematik.de/search/index.html?A_23797) | PS abgebende LEI: UX - Fristen eines Rezeptes - Anzeigen | [IG-TIFLOW-RX-112](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23798](https://gemspec.gematik.de/search/index.html?A_23798) | PS abgebende LEI: UX - Fristen eines Rezeptes - Hinweis bei überschrittener Frist | [IG-TIFLOW-RX-113](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23799](https://gemspec.gematik.de/search/index.html?A_23799) | PS abgebende LEI: UX - Fristen eines Rezeptes - Überschreiten der Belieferungsfrist | [IG-TIFLOW-RX-114](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23800](https://gemspec.gematik.de/search/index.html?A_23800) | PS abgebende LEI: UX - Fristen eines Rezeptes - Überschreiten der Einlösefrist | [IG-TIFLOW-RX-115](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23801](https://gemspec.gematik.de/search/index.html?A_23801) | PS abgebende LEI: UX - Suche nach Vorgang mittels E-Rezept-Token | [IG-TIFLOW-RX-116](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23802](https://gemspec.gematik.de/search/index.html?A_23802) | PS abgebende LEI: UX - Freitextverordnung - Arzneimittelsuche | [IG-TIFLOW-RX-117](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23803](https://gemspec.gematik.de/search/index.html?A_23803) | PS abgebende LEI: UX - Freitextverordnung - Hinweis zur manuellen Prüfung | [IG-TIFLOW-RX-118](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23804](https://gemspec.gematik.de/search/index.html?A_23804) | PS abgebende LEI: UX - Prüfung mittels ABDA-Referenzvalidators | [IG-TIFLOW-RX-119](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23805](https://gemspec.gematik.de/search/index.html?A_23805) | PS abgebende LEI: UX - Zuordnung eines E-Rezepts zu einem bestehenden Vorgang | [IG-TIFLOW-RX-120](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23806](https://gemspec.gematik.de/search/index.html?A_23806) | PS abgebende LEI: UX - Weiterleitung eines E-Rezepts | [IG-TIFLOW-RX-121](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23807](https://gemspec.gematik.de/search/index.html?A_23807) | PS abgebende LEI: UX - Empfang eines weitergeleiteten eines E-Rezepts | [IG-TIFLOW-RX-122](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23808](https://gemspec.gematik.de/search/index.html?A_23808) | PS abgebende LEI: UX – Quittung automatisch abrufen | [IG-TIFLOW-RX-125](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23809](https://gemspec.gematik.de/search/index.html?A_23809) | PS abgebende LEI: UX - Abgabedatensatz signieren - QES Signatur in notwendigen Fällen | [IG-TIFLOW-RX-127](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23810](https://gemspec.gematik.de/search/index.html?A_23810) | PS abgebende LEI: UX - Abgabedatensatz signieren - QES Signatur | [IG-TIFLOW-RX-128](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23811](https://gemspec.gematik.de/search/index.html?A_23811) | PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte | [IG-TIFLOW-RX-129](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23812](https://gemspec.gematik.de/search/index.html?A_23812) | PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte - Hinweisen zu Abrechnungsfehlern | [IG-TIFLOW-RX-130](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23813](https://gemspec.gematik.de/search/index.html?A_23813) | PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte - Verweis zur Korrektur | [IG-TIFLOW-RX-131](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23814](https://gemspec.gematik.de/search/index.html?A_23814) | PS abgebende LEI: UX - Nicht-Erreichbarkeit des E-Rezept-Fachdienstes - Automatische Behebung | [IG-TIFLOW-RX-132](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23815](https://gemspec.gematik.de/search/index.html?A_23815) | PS abgebende LEI: UX - Hinweis bei Nicht-Erreichbarkeit des E-Rezept-Fachdienstes | [IG-TIFLOW-RX-133](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23816](https://gemspec.gematik.de/search/index.html?A_23816) | PS abgebende LEI: UX - Hinweis bei Nicht-Erreichbarkeit des E-Rezept-Fachdienstes - Operabilität des AVS | [IG-TIFLOW-RX-134](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23817](https://gemspec.gematik.de/search/index.html?A_23817) | PS abgebende LEI: UX - Verständliche Fehlermeldungen - technische Fehler | [IG-TIFLOW-RX-135](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_23818](https://gemspec.gematik.de/search/index.html?A_23818) | PS abgebende LEI: UX - Verständliche Fehlermeldungen - Handlungsempfehlung | [IG-TIFLOW-RX-136](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_24289](https://gemspec.gematik.de/search/index.html?A_24289) | PS abgebende LEI: Dispensierinformationen bereitstellen - E-Rezept auswählen | [IG-TIFLOW-RX-87](/rx/op-dispense-req-avs.md) | rx |
| [A_24290](https://gemspec.gematik.de/search/index.html?A_24290) | PS abgebende LEI: Dispensierinformationen bereitstellen | [IG-TIFLOW-RX-88](/rx/op-dispense-req-avs.md) | rx |
| [A_24291-01](https://gemspec.gematik.de/search/index.html?A_24291-01) | PS abgebende LEI: Dispensierinformationen bereitstellen - Dispensierinformationen erstellen | [IG-TIFLOW-RX-89](/rx/op-dispense-req-avs.md) | rx |
| [A_25643](https://gemspec.gematik.de/search/index.html?A_25643) | PS abgebende LEI: UX – Workflow von E-Rezepten abschließen | [IG-TIFLOW-RX-126](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_26004-01](https://gemspec.gematik.de/search/index.html?A_26004-01) | CS Kostenträger: Dispensierinformationen – Flowtype 162 – MedicationDispense erstellen | [IG-TIFLOW-DIGA-23](/diga/op-close-req-ktr.md)[IG-TIFLOW-RX-192](/rx/menu-technische-umsetzung-dispensierinformationen.md) | digarx |
| [A_26346](https://gemspec.gematik.de/search/index.html?A_26346) | PS abgebende LEI: Dispensierinformationen bereitstellen - Dispensierinformation übermitteln | [IG-TIFLOW-RX-90](/rx/op-dispense-req-avs.md) | rx |
| [A_26373](https://gemspec.gematik.de/search/index.html?A_26373) | PS verordnende LEI: keine elektronische Verordnung einer DiGA zu Lasten BG/UK | [IG-TIFLOW-DIGA-18](/diga/op-create-req-pvs.md) | diga |
| [A_27033](https://gemspec.gematik.de/search/index.html?A_27033) | PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Fertigarzneimittel: Wirkstoff, Wirkstärke und Handelsname | [IG-TIFLOW-RX-196](/rx/menu-technische-umsetzung-dispensierinformationen.md) | rx |
| [A_27034](https://gemspec.gematik.de/search/index.html?A_27034) | PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Rezeptur: Wirkstoff, Wirkstärke | [IG-TIFLOW-RX-197](/rx/menu-technische-umsetzung-dispensierinformationen.md) | rx |
| [A_27035](https://gemspec.gematik.de/search/index.html?A_27035) | PS abgebende LEI: Dispensierinformationen - Flowtype 160/169/200/209 - MedicationDispense erstellen | [IG-TIFLOW-RX-191](/rx/menu-technische-umsetzung-dispensierinformationen.md) | rx |
| [A_27036](https://gemspec.gematik.de/search/index.html?A_27036) | PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 - Dosieranweisung | [IG-TIFLOW-RX-198](/rx/menu-technische-umsetzung-dispensierinformationen.md) | rx |
| [A_27037](https://gemspec.gematik.de/search/index.html?A_27037) | PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 - Dosierangaben Freitext | [IG-TIFLOW-RX-199](/rx/menu-technische-umsetzung-dispensierinformationen.md) | rx |
| [A_27047](https://gemspec.gematik.de/search/index.html?A_27047) | PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Profilversion bei mehreren MedicationDispenses | [IG-TIFLOW-RX-194](/rx/menu-technische-umsetzung-dispensierinformationen.md) | rx |
| [A_27050](https://gemspec.gematik.de/search/index.html?A_27050) | PS abgebende LEI: Abgabedatensatz signieren - Gültigkeit SMC-B prüfen | [IG-TIFLOW-RX-3](/rx/menu-technische-umsetzung-abgabedatensatz.md) | rx |
| [A_27834](https://gemspec.gematik.de/search/index.html?A_27834) | PS verordnende LEI: E-Rezept erstellen – Flowtype 166 – zulässige Signatur Arzt | [IG-TIFLOW-RX-44](/rx/op-activate-req-pvs.md) | rx |
| [A_27835](https://gemspec.gematik.de/search/index.html?A_27835) | PS verordnende LEI: E-Rezept erstellen – Flowtype 166 – Reichdauer nach Vorgaben | [IG-TIFLOW-RX-45](/rx/op-activate-req-pvs.md) | rx |
| [A_27836](https://gemspec.gematik.de/search/index.html?A_27836) | PS verordnende LEI: E-Rezept erstellen – Flowtype 166 – Bestätigungen nach §3a Abs. 2, 5 AMVV | [IG-TIFLOW-RX-46](/rx/op-activate-req-pvs.md) | rx |
| [A_27837](https://gemspec.gematik.de/search/index.html?A_27837) | PS verordnende LEI: UX - E-T-Rezept – Hinweis T-Rezept | [IG-TIFLOW-RX-164](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_27838](https://gemspec.gematik.de/search/index.html?A_27838) | PS verordnende LEI: UX - E-T-Rezept – Manuelle Eingabe der Reichdauer | [IG-TIFLOW-RX-166](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_27839](https://gemspec.gematik.de/search/index.html?A_27839) | PS verordnende LEI: UX - E-T-Rezept – Warnung Reichdauer | [IG-TIFLOW-RX-167](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |
| [A_27840](https://gemspec.gematik.de/search/index.html?A_27840) | PS abgebende LEI: Quittung abrufen - Abruf der Quittung durchführen | [IG-TIFLOW-RX-100](/rx/op-close-req-avs.md) | rx |
| [A_27841](https://gemspec.gematik.de/search/index.html?A_27841) | PS abgebende LEI: UX - Bedienung T-Rezept – Hinweis T-Rezept | [IG-TIFLOW-RX-123](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_27842](https://gemspec.gematik.de/search/index.html?A_27842) | PS abgebende LEI: UX - Bedienung T-Rezept – Hinweis T-Rezept Belieferungsoption | [IG-TIFLOW-RX-124](/rx/menu-fachlichkeit-ux-abgebend.md) | rx |
| [A_27861](https://gemspec.gematik.de/search/index.html?A_27861) | PS verordnende LEI: UX - E-T-Rezept – Automatische Berechnung der Reichdauer | [IG-TIFLOW-RX-165](/rx/menu-fachlichkeit-ux-verordnend.md) | rx |

### gemSpec_DM_eRp

#### Übernommene Anforderungen

| | | | |
| :--- | :--- | :--- | :--- |
| [A_19217-01](https://gemspec.gematik.de/search/index.html?A_19217-01) | Aufbau E-Rezept-ID | [IG-TIFLOW-CORE-348](/core/menu-schnittstellen-generelle-prinzipien.md) | core |
| [A_19218](https://gemspec.gematik.de/search/index.html?A_19218) | Prüfung E-Rezept-ID | [IG-TIFLOW-CORE-349](/core/menu-schnittstellen-generelle-prinzipien.md) | core |
| [A_19295-01](https://gemspec.gematik.de/search/index.html?A_19295-01) | FHIR-Ressource Task | [IG-TIFLOW-DIGA-20](/diga/index.md)[IG-TIFLOW-RX-98](/rx/index.md) | digarx |
| [A_19296-04](https://gemspec.gematik.de/search/index.html?A_19296-04) | E-Rezept-Fachdienst - Inhalt Protokolleintrag | [IG-TIFLOW-CORE-1](/core/audit-service.md) | core |
| [A_19297-01](https://gemspec.gematik.de/search/index.html?A_19297-01) | FHIR-Ressource MedicationDispense | [IG-TIFLOW-RX-98](/rx/index.md) | rx |
| [A_19298-01](https://gemspec.gematik.de/search/index.html?A_19298-01) | FHIR-Ressource AuditEvent | [IG-TIFLOW-CORE-200](/core/index.md) | core |
| [A_19300-01](https://gemspec.gematik.de/search/index.html?A_19300-01) | FHIR-Ressource Bundle Quittung | [IG-TIFLOW-RX-98](/rx/index.md) | rx |
| [A_19324-01](https://gemspec.gematik.de/search/index.html?A_19324-01) | FHIR CodeSystem FLOWTYPE | [IG-TIFLOW-CORE-200](/core/index.md) | core |
| [A_19517-04](https://gemspec.gematik.de/search/index.html?A_19517-04) | FHIR FLOWTYPE für Prozessparameter - Abweichende Festlegung für Entlassrezept | [IG-TIFLOW-RX-70](/rx/op-activate-req-fd.md) | rx |
| [A_20213-01](https://gemspec.gematik.de/search/index.html?A_20213-01) | FHIR-Ressource Bundle Verordnungsdatensatz | [IG-TIFLOW-RX-98](/rx/index.md) | rx |
| [A_20745-01](https://gemspec.gematik.de/search/index.html?A_20745-01) | FHIR-Ressource Device | [IG-TIFLOW-CORE-200](/core/index.md) | core |
| [A_22216-01](https://gemspec.gematik.de/search/index.html?A_22216-01) | FHIR-Ressourcen Versionsangabe | [IG-TIFLOW-CORE-347](/core/fhir-validate.md) | core |
| [A_22483-01](https://gemspec.gematik.de/search/index.html?A_22483-01) | Version FHIR-Package de.gematik.erezept-workflow | [IG-TIFLOW-CORE-200](/core/index.md)[IG-TIFLOW-DIGA-20](/diga/index.md)[IG-TIFLOW-RX-98](/rx/index.md) | coredigarx |
| [A_22963](https://gemspec.gematik.de/search/index.html?A_22963) | Version FHIR-Package de.gematik.erezept-patientenrechnung | [IG-TIFLOW-CHRG-162](/erp-chrg/index.md) | erp-chrg |
| [A_23027](https://gemspec.gematik.de/search/index.html?A_23027) | FHIR-Ressource CloseOperationInputBundle | [IG-TIFLOW-DIGA-20](/diga/index.md)[IG-TIFLOW-RX-98](/rx/index.md) | digarx |
| [A_23028](https://gemspec.gematik.de/search/index.html?A_23028) | FHIR-Ressource Quittung | [IG-TIFLOW-RX-98](/rx/index.md) | rx |
| [A_23384-05](https://gemspec.gematik.de/search/index.html?A_23384-05) | E-Rezept-Fachdienst - Prüfung Gültigkeit FHIR Ressourcen | [IG-TIFLOW-CORE-335](/core/fhir-validate.md) | core |
| [A_23876-01](https://gemspec.gematik.de/search/index.html?A_23876-01) | E-Rezept - Nachrichtenaustausch - E-Rezept einer Apotheke zuweisen - Datenstruktur Nachricht | [IG-TIFLOW-RX-205](/rx/query-api-communication-req-fdv.md)[IG-TIFLOW-RX-206](/rx/query-api-communication-req-fd.md) | rx |
| [A_23877-01](https://gemspec.gematik.de/search/index.html?A_23877-01) | E-Rezept - Nachrichtenaustausch - Nachricht durch Abgebenden übermitteln - Datenstruktur Nachricht | [IG-TIFLOW-CORE-354](/core/query-api-communication-req-fdv.md)[IG-TIFLOW-CORE-357](/core/query-api-communication-req-avs.md)[IG-TIFLOW-CORE-359](/core/query-api-communication-req-fd.md) | core |
| [A_26060](https://gemspec.gematik.de/search/index.html?A_26060) | FHIR-Ressource Bundle DiGA-Verordnungsdatensatz | [IG-TIFLOW-DIGA-20](/diga/index.md) | diga |
| [A_26237-01](https://gemspec.gematik.de/search/index.html?A_26237-01) | FHIR-Ressourcen - Ressource-ID in fullUrl | [IG-TIFLOW-CORE-345](/core/fhir-validate.md) | core |
| [A_26238-01](https://gemspec.gematik.de/search/index.html?A_26238-01) | FHIR-Ressourcen - Format fullUrl | [IG-TIFLOW-CORE-346](/core/fhir-validate.md) | core |
| [A_27097](https://gemspec.gematik.de/search/index.html?A_27097) | Format Zugriffscode | [IG-TIFLOW-EU-1](/erp-eu/menu-technische-umsetzung-konzept.md) | erp-eu |
| [A_27189](https://gemspec.gematik.de/search/index.html?A_27189) | Version FHIR-Package de.gematik.erezept.eu | [IG-TIFLOW-EU-47](/erp-eu/index.md) | erp-eu |
| [A_27659](https://gemspec.gematik.de/search/index.html?A_27659) | FHIR-Ressourcen - Datumsangabe ohne Zeitzoneninformation | [IG-TIFLOW-CORE-341](/core/fhir-validate.md) | core |
| [A_27672](https://gemspec.gematik.de/search/index.html?A_27672) | FHIR Ressourcen - Ausschluss unspezifizierter Extensions | [IG-TIFLOW-CORE-343](/core/fhir-validate.md) | core |
| [A_27697](https://gemspec.gematik.de/search/index.html?A_27697) | FHIR-Ressourcen – Eindeutige Angabe meta.profile | [IG-TIFLOW-CORE-342](/core/fhir-validate.md) | core |
| [A_27843](https://gemspec.gematik.de/search/index.html?A_27843) | Version FHIR-Package de.gematik.erp-t-prescription | [IG-TIFLOW-BFARM-16](/bfarm/index.md) | bfarm |
| [A_27844](https://gemspec.gematik.de/search/index.html?A_27844) | FHIR FLOWTYPE für Prozessparameter - Flowtype 160 | [IG-TIFLOW-RX-65](/rx/op-activate-req-fd.md) | rx |
| [A_27845](https://gemspec.gematik.de/search/index.html?A_27845) | FHIR FLOWTYPE für Prozessparameter - Flowtype 162 | [IG-TIFLOW-DIGA-16](/diga/op-activate-req-fd.md) | diga |
| [A_27846](https://gemspec.gematik.de/search/index.html?A_27846) | FHIR FLOWTYPE für Prozessparameter - Flowtype 166 | [IG-TIFLOW-RX-66](/rx/op-activate-req-fd.md) | rx |
| [A_27847](https://gemspec.gematik.de/search/index.html?A_27847) | FHIR FLOWTYPE für Prozessparameter - Flowtype 169 | [IG-TIFLOW-RX-67](/rx/op-activate-req-fd.md) | rx |
| [A_27848](https://gemspec.gematik.de/search/index.html?A_27848) | FHIR FLOWTYPE für Prozessparameter - Flowtype 200 | [IG-TIFLOW-RX-68](/rx/op-activate-req-fd.md) | rx |
| [A_27849](https://gemspec.gematik.de/search/index.html?A_27849) | FHIR FLOWTYPE für Prozessparameter - Flowtype 209 | [IG-TIFLOW-RX-69](/rx/op-activate-req-fd.md) | rx |
| [A_28124](https://gemspec.gematik.de/search/index.html?A_28124) | E-Rezept - Push Notifications - Datenstruktur Nachrichteninhalte | [IG-TIFLOW-CORE-184](/core/menu-technische-umsetzung-push.md) | core |

#### Nicht übernommene Anforderungen

| | |
| :--- | :--- |
| [A_23333](https://gemspec.gematik.de/search/index.html?A_23333) | E-Rezept - Übergangszeit Packages “kbv.ita.erp 1.0.2” |

### gemSpec_FD_eRp

#### Übernommene Anforderungen

| | | | |
| :--- | :--- | :--- | :--- |
| [A_19018-01](https://gemspec.gematik.de/search/index.html?A_19018-01) | E-Rezept-Fachdienst - Task erzeugen - Rollenprüfung | [IG-TIFLOW-CORE-173](/core/op-create-req-fd.md) | core |
| [A_19019-01](https://gemspec.gematik.de/search/index.html?A_19019-01) | E-Rezept-Fachdienst - Task erzeugen - Generierung Rezept-ID | [IG-TIFLOW-CORE-177](/core/op-create-req-fd.md) | core |
| [A_19020](https://gemspec.gematik.de/search/index.html?A_19020) | E-Rezept-Fachdienst - Schemavalidierung Rezept aktivieren | [IG-TIFLOW-CORE-133](/core/op-activate-req-fd.md) | core |
| [A_19021-02](https://gemspec.gematik.de/search/index.html?A_19021-02) | E-Rezept-Fachdienst - Task erzeugen - Generierung AccessCode | [IG-TIFLOW-CORE-179](/core/op-create-req-fd.md) | core |
| [A_19022-01](https://gemspec.gematik.de/search/index.html?A_19022-01) | E-Rezept-Fachdienst - Task aktivieren - Rollenprüfung | [IG-TIFLOW-CORE-131](/core/op-activate-req-fd.md) | core |
| [A_19024-03](https://gemspec.gematik.de/search/index.html?A_19024-03) | E-Rezept-Fachdienst - Task aktivieren - Prüfung AccessCode Rezept aktualisieren | [IG-TIFLOW-CORE-132](/core/op-activate-req-fd.md) | core |
| [A_19025-03](https://gemspec.gematik.de/search/index.html?A_19025-03) | E-Rezept-Fachdienst - Task aktivieren - QES prüfen Rezept aktualisieren | [IG-TIFLOW-CORE-135](/core/op-activate-req-fd.md) | core |
| [A_19026-01](https://gemspec.gematik.de/search/index.html?A_19026-01) | E-Rezept-Fachdienst - E-Rezept löschen - Rollenprüfung | [IG-TIFLOW-DIGA-6](/diga/op-abort-req-fd.md)[IG-TIFLOW-RX-33](/rx/op-abort-req-fd.md) | digarx |
| [A_19027-06](https://gemspec.gematik.de/search/index.html?A_19027-06) | E-Rezept-Fachdienst - E-Rezept löschen - Medizinische und personenbezogene Daten löschen | [IG-TIFLOW-CORE-104](/core/op-abort-req-fd.md) | core |
| [A_19029-06](https://gemspec.gematik.de/search/index.html?A_19029-06) | E-Rezept-Fachdienst - Task aktivieren - Serversignatur Rezept aktivieren | [IG-TIFLOW-CORE-143](/core/op-activate-req-fd.md) | core |
| [A_19030](https://gemspec.gematik.de/search/index.html?A_19030) | E-Rezept-Fachdienst - unzulässige Operationen Task | [IG-TIFLOW-CORE-49](/core/query-api-task-req-fd.md) | core |
| [A_19112](https://gemspec.gematik.de/search/index.html?A_19112) | E-Rezept-Fachdienst - Parametrierung Task für Workflow-Typ | [IG-TIFLOW-CORE-175](/core/op-create-req-fd.md) | core |
| [A_19113-02](https://gemspec.gematik.de/search/index.html?A_19113-02) | E-Rezept-Fachdienst - Task abrufen - Rollenprüfung | [IG-TIFLOW-CORE-71](/core/query-api-task-req-fd.md) | core |
| [A_19114](https://gemspec.gematik.de/search/index.html?A_19114) | E-Rezept-Fachdienst - Status draft | [IG-TIFLOW-CORE-180](/core/op-create-req-fd.md) | core |
| [A_19115-01](https://gemspec.gematik.de/search/index.html?A_19115-01) | E-Rezept-Fachdienst - Task abrufen - Filter Tasks auf KVNR des Versicherten | [IG-TIFLOW-CORE-51](/core/query-api-task-req-fd.md) | core |
| [A_19116-01](https://gemspec.gematik.de/search/index.html?A_19116-01) | E-Rezept-Fachdienst - Task abrufen - Prüfung AccessCode bei KVNR-Missmatch | [IG-TIFLOW-CORE-72](/core/query-api-task-req-fd.md) | core |
| [A_19120-03](https://gemspec.gematik.de/search/index.html?A_19120-03) | E-Rezept-Fachdienst - E-Rezept löschen - Verordnender - Prüfung AccessCode und Status | [IG-TIFLOW-CORE-103](/core/op-abort-req-fd.md) | core |
| [A_19121](https://gemspec.gematik.de/search/index.html?A_19121) | E-Rezept-Fachdienst - Finaler Status cancelled | [IG-TIFLOW-CORE-105](/core/op-abort-req-fd.md) | core |
| [A_19127-03](https://gemspec.gematik.de/search/index.html?A_19127-03) | E-Rezept-Fachdienst - Task aktivieren - Übernahme der KVNR des Patienten | [IG-TIFLOW-CORE-140](/core/op-activate-req-fd.md) | core |
| [A_19128](https://gemspec.gematik.de/search/index.html?A_19128) | E-Rezept-Fachdienst - Status aktivieren | [IG-TIFLOW-CORE-142](/core/op-activate-req-fd.md) | core |
| [A_19129-01](https://gemspec.gematik.de/search/index.html?A_19129-01) | E-Rezept-Fachdienst - Rückgabe Tasks im Bundle Versicherter | [IG-TIFLOW-CORE-52](/core/query-api-task-req-fd.md) | core |
| [A_19145-01](https://gemspec.gematik.de/search/index.html?A_19145-01) | E-Rezept-Fachdienst - E-Rezept löschen - Statusprüfung in-progress | [IG-TIFLOW-RX-34](/rx/op-abort-req-fd.md) | rx |
| [A_19146](https://gemspec.gematik.de/search/index.html?A_19146) | E-Rezept-Fachdienst - Statusprüfung Nutzer (außerhalb Apotheke) löscht Rezept | [IG-TIFLOW-RX-35](/rx/op-abort-req-fd.md) | rx |
| [A_19149-02](https://gemspec.gematik.de/search/index.html?A_19149-02) | E-Rezept-Fachdienst - Task akzeptieren - Prüfung Datensatz zwischenzeitlich gelöscht | [IG-TIFLOW-CORE-185](/core/op-accept-req-fd.md) | core |
| [A_19166-02](https://gemspec.gematik.de/search/index.html?A_19166-02) | E-Rezept-Fachdienst - Task akzeptieren - Flowtype 160/166/169/200/209 - Rollenprüfung | [IG-TIFLOW-RX-84](/rx/op-accept-req-fd.md) | rx |
| [A_19167-04](https://gemspec.gematik.de/search/index.html?A_19167-04) | E-Rezept-Fachdienst - Task akzeptieren - Prüfung AccessCode | [IG-TIFLOW-CORE-186](/core/op-accept-req-fd.md) | core |
| [A_19168-01](https://gemspec.gematik.de/search/index.html?A_19168-01) | E-Rezept-Fachdienst - Task akzeptieren - Rezept bereits in Abgabe oder Bearbeitung | [IG-TIFLOW-CORE-187](/core/op-accept-req-fd.md) | core |
| [A_19169-01](https://gemspec.gematik.de/search/index.html?A_19169-01) | E-Rezept-Fachdienst - Task akzeptieren - Generierung Secret, Statuswechsel in Abgabe und Rückgabewert | [IG-TIFLOW-CORE-189](/core/op-accept-req-fd.md) | core |
| [A_19170-02](https://gemspec.gematik.de/search/index.html?A_19170-02) | E-Rezept-Fachdienst - Task zurückweisen - Rollenprüfung | [IG-TIFLOW-DIGA-1](/diga/op-reject-req-fd.md)[IG-TIFLOW-RX-4](/rx/op-reject-req-fd.md) | digarx |
| [A_19171-03](https://gemspec.gematik.de/search/index.html?A_19171-03) | E-Rezept-Fachdienst - Task zurückweisen - Prüfung Secret | [IG-TIFLOW-CORE-17](/core/op-reject-req-fd.md) | core |
| [A_19172-01](https://gemspec.gematik.de/search/index.html?A_19172-01) | E-Rezept-Fachdienst - Task zurückweisen - Secret löschen und Status setzen | [IG-TIFLOW-CORE-18](/core/op-reject-req-fd.md) | core |
| [A_19214](https://gemspec.gematik.de/search/index.html?A_19214) | E-Rezept-Fachdienst - Ergänzung Performer-Typ für Einlöseinstitutstyp | [IG-TIFLOW-CORE-176](/core/op-create-req-fd.md) | core |
| [A_19224](https://gemspec.gematik.de/search/index.html?A_19224) | E-Rezept-Fachdienst - Prüfung Secret, Apotheker löscht Rezept | [IG-TIFLOW-RX-36](/rx/op-abort-req-fd.md) | rx |
| [A_19225-02](https://gemspec.gematik.de/search/index.html?A_19225-02) | E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - QES durch berechtigte Berufsgruppe | [IG-TIFLOW-RX-55](/rx/op-activate-req-fd.md) | rx |
| [A_19226-02](https://gemspec.gematik.de/search/index.html?A_19226-02) | E-Rezept-Fachdienst - Task abrufen - Rückgabe Task inkl. Bundle im Bundle Apotheker | [IG-TIFLOW-CORE-80](/core/query-api-task-req-fd.md) | core |
| [A_19230-01](https://gemspec.gematik.de/search/index.html?A_19230-01) | E-Rezept-Fachdienst - Task schließen - Rollenprüfung | [IG-TIFLOW-DIGA-3](/diga/op-close-req-fd.md)[IG-TIFLOW-RX-8](/rx/op-close-req-fd.md) | digarx |
| [A_19231-02](https://gemspec.gematik.de/search/index.html?A_19231-02) | E-Rezept-Fachdienst - Task schließen - Prüfung Secret | [IG-TIFLOW-CORE-38](/core/op-close-req-fd.md) | core |
| [A_19232](https://gemspec.gematik.de/search/index.html?A_19232) | E-Rezept-Fachdienst - Status beenden | [IG-TIFLOW-CORE-43](/core/op-close-req-fd.md) | core |
| [A_19233-05](https://gemspec.gematik.de/search/index.html?A_19233-05) | E-Rezept-Fachdienst - Task schliessen - Quittung erstellen | [IG-TIFLOW-CORE-44](/core/op-close-req-fd.md) | core |
| [A_19248-05](https://gemspec.gematik.de/search/index.html?A_19248-05) | E-Rezept-Fachdienst - Task schließen - Schemaprüfung MedicationDispense | [IG-TIFLOW-CORE-39](/core/op-close-req-fd.md) | core |
| [A_19252-03](https://gemspec.gematik.de/search/index.html?A_19252-03) | E-Rezept-Fachdienst - Löschfrist abgelaufener Rezepte | [IG-TIFLOW-CORE-85](/core/ttl.md) | core |
| [A_19253-01](https://gemspec.gematik.de/search/index.html?A_19253-01) | E-Rezept-Fachdienst - Löschfrist veraltete Nachrichten | [IG-TIFLOW-CORE-90](/core/ttl.md) | core |
| [A_19254-01](https://gemspec.gematik.de/search/index.html?A_19254-01) | E-Rezept-Fachdienst - Löschen referenzierter Bundles | [IG-TIFLOW-CORE-87](/core/ttl.md) | core |
| [A_19255](https://gemspec.gematik.de/search/index.html?A_19255) | E-Rezept-Fachdienst Löschen veralteter MedicationDispense | [IG-TIFLOW-CORE-88](/core/ttl.md) | core |
| [A_19256-01](https://gemspec.gematik.de/search/index.html?A_19256-01) | E-Rezept-Fachdienst - Löschfrist veraltete Protokolleinträge | [IG-TIFLOW-CORE-91](/core/ttl.md) | core |
| [A_19257-01](https://gemspec.gematik.de/search/index.html?A_19257-01) | E-Rezept-Fachdienst - Task erzeugen - Schemavalidierung Rezept anlegen | [IG-TIFLOW-CORE-174](/core/op-create-req-fd.md) | core |
| [A_19284-13](https://gemspec.gematik.de/search/index.html?A_19284-13) | E-Rezept-Fachdienst - Versichertenprotokoll zu Operationen | [IG-TIFLOW-CORE-2](/core/audit-service.md)[IG-TIFLOW-CORE-3](/core/audit-service.md)[IG-TIFLOW-CORE-4](/core/audit-service.md) | core |
| [A_19302](https://gemspec.gematik.de/search/index.html?A_19302) | E-Rezept-Fachdienst -Protokolleintrag Versichertenprotokoll leicht verständlich | [IG-TIFLOW-CORE-5](/core/audit-service.md) | core |
| [A_19395](https://gemspec.gematik.de/search/index.html?A_19395) | E-Rezept-Fachdienst - Rollenprüfung Versicherter liest AuditEvent | [IG-TIFLOW-CORE-98](/core/query-api-auditevent-req-fd.md) | core |
| [A_19396](https://gemspec.gematik.de/search/index.html?A_19396) | E-Rezept-Fachdienst - Filter AuditEvent auf KVNR des Versicherten | [IG-TIFLOW-CORE-99](/core/query-api-auditevent-req-fd.md) | core |
| [A_19397](https://gemspec.gematik.de/search/index.html?A_19397) | E-Rezept-Fachdienst - Rückgabe AuditEvents im Bundle | [IG-TIFLOW-CORE-100](/core/query-api-auditevent-req-fd.md) | core |
| [A_19400](https://gemspec.gematik.de/search/index.html?A_19400) | E-Rezept-Fachdienst - unzulässige Operationen MedicationDispense | [IG-TIFLOW-CORE-92](/core/query-api-medicationdispense-req-fd.md) | core |
| [A_19401](https://gemspec.gematik.de/search/index.html?A_19401) | E-Rezept-Fachdienst - unzulässige Operationen Communication | [IG-TIFLOW-CORE-255](/core/query-api-communication-req-fd.md) | core |
| [A_19402](https://gemspec.gematik.de/search/index.html?A_19402) | E-Rezept-Fachdienst - unzulässige Operationen AuditEvent | [IG-TIFLOW-CORE-97](/core/query-api-auditevent-req-fd.md) | core |
| [A_19405-02](https://gemspec.gematik.de/search/index.html?A_19405-02) | E-Rezept-Fachdienst - MedicationDispense abrufen - Rollenprüfung | [IG-TIFLOW-CORE-93](/core/query-api-medicationdispense-req-fd.md) | core |
| [A_19406-01](https://gemspec.gematik.de/search/index.html?A_19406-01) | E-Rezept-Fachdienst - MedicationDispense abrufen - Filter MedicationDispense auf KVNR des Versicherten | [IG-TIFLOW-CORE-94](/core/query-api-medicationdispense-req-fd.md) | core |
| [A_19446-02](https://gemspec.gematik.de/search/index.html?A_19446-02) | E-Rezept-Fachdienst - Nachrichten - Rollenprüfung | [IG-TIFLOW-CORE-256](/core/query-api-communication-req-fd.md) | core |
| [A_19447-06](https://gemspec.gematik.de/search/index.html?A_19447-06) | E-Rezept-Fachdienst - Nachricht einstellen - Schemaprüfung | [IG-TIFLOW-CORE-259](/core/query-api-communication-req-fd.md) | core |
| [A_19448-04](https://gemspec.gematik.de/search/index.html?A_19448-04) | E-Rezept-Fachdienst - Nachricht einstellen - Absender und Sendedatum | [IG-TIFLOW-CORE-262](/core/query-api-communication-req-fd.md) | core |
| [A_19450-01](https://gemspec.gematik.de/search/index.html?A_19450-01) | E-Rezept-Fachdienst - Nachricht einstellen Schadcodeprüfung | [IG-TIFLOW-CORE-267](/core/query-api-communication-req-fd.md) | core |
| [A_19514-03](https://gemspec.gematik.de/search/index.html?A_19514-03) | E-Rezept-Fachdienst - Http-Status-Codes | [IG-TIFLOW-CORE-280](/core/error-codes.md) | core |
| [A_19520-02](https://gemspec.gematik.de/search/index.html?A_19520-02) | E-Rezept-Fachdienst - Nachrichten abrufen - für Empfänger filtern | [IG-TIFLOW-CORE-257](/core/query-api-communication-req-fd.md) | core |
| [A_19521](https://gemspec.gematik.de/search/index.html?A_19521) | E-Rezept-Fachdienst - Nachrichten als abgerufen markieren | [IG-TIFLOW-CORE-258](/core/query-api-communication-req-fd.md) | core |
| [A_19536](https://gemspec.gematik.de/search/index.html?A_19536) | E-Rezept-Fachdienst - RESTful API | [IG-TIFLOW-CORE-336](/core/menu-schnittstellen-generelle-prinzipien.md) | core |
| [A_19537](https://gemspec.gematik.de/search/index.html?A_19537) | E-Rezept-Fachdienst - RESTful API MimeType fhir+xml | [IG-TIFLOW-CORE-337](/core/menu-schnittstellen-generelle-prinzipien.md) | core |
| [A_19538](https://gemspec.gematik.de/search/index.html?A_19538) | E-Rezept-Fachdienst - RESTful API MimeType fhir+json | [IG-TIFLOW-CORE-338](/core/menu-schnittstellen-generelle-prinzipien.md) | core |
| [A_19539](https://gemspec.gematik.de/search/index.html?A_19539) | E-Rezept-Fachdienst - RESTful API MimeType Aufrufparameter | [IG-TIFLOW-CORE-339](/core/menu-schnittstellen-generelle-prinzipien.md) | core |
| [A_20159-04](https://gemspec.gematik.de/search/index.html?A_20159-04) | E-Rezept-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA | [IG-TIFLOW-CORE-134](/core/op-activate-req-fd.md) | core |
| [A_20171](https://gemspec.gematik.de/search/index.html?A_20171) | E-Rezept-Fachdienst - RESTful API CapabilityStatement | [IG-TIFLOW-CORE-340](/core/menu-schnittstellen-generelle-prinzipien.md) | core |
| [A_20229-01](https://gemspec.gematik.de/search/index.html?A_20229-01) | E-Rezept-Fachdienst - Nachricht einstellen - Nachrichtenzähler bei Versicherter-zu-Versichertem-Kommunikation | [IG-TIFLOW-CORE-263](/core/query-api-communication-req-fd.md) | core |
| [A_20230-01](https://gemspec.gematik.de/search/index.html?A_20230-01) | E-Rezept-Fachdienst - Nachricht einstellen - Einlösbare E-Rezepte für Versicherter-zu-Versichertem-Kommunikation | [IG-TIFLOW-CORE-265](/core/query-api-communication-req-fd.md) | core |
| [A_20231-01](https://gemspec.gematik.de/search/index.html?A_20231-01) | E-Rezept-Fachdienst - Nachricht einstellen - Ausschluss Nachrichten an Empfänger gleich Absender | [IG-TIFLOW-CORE-266](/core/query-api-communication-req-fd.md) | core |
| [A_20258](https://gemspec.gematik.de/search/index.html?A_20258) | E-Rezept-Fachdienst - Communication löschen auf Basis Absender-ID | [IG-TIFLOW-CORE-277](/core/query-api-communication-req-fd.md) | core |
| [A_20259](https://gemspec.gematik.de/search/index.html?A_20259) | E-Rezept-Fachdienst - Communication löschen mit Warnung wenn vom Empfänger bereits abgerufen | [IG-TIFLOW-CORE-278](/core/query-api-communication-req-fd.md) | core |
| [A_20511](https://gemspec.gematik.de/search/index.html?A_20511) | E-Rezept-Fachdienst - Nachrichtenzähler zweckgebunden | [IG-TIFLOW-CORE-264](/core/query-api-communication-req-fd.md) | core |
| [A_20546-03](https://gemspec.gematik.de/search/index.html?A_20546-03) | E-Rezept-Fachdienst - E-Rezept löschen - Prüfung KVNR, Versicherter löscht Rezept | [IG-TIFLOW-CORE-102](/core/op-abort-req-fd.md) | core |
| [A_20702-03](https://gemspec.gematik.de/search/index.html?A_20702-03) | E-Rezept-Fachdienst - Task abrufen - Keine Einlöseinformationen in unbekannten Clients | [IG-TIFLOW-CORE-75](/core/query-api-task-req-fd.md) | core |
| [A_20744](https://gemspec.gematik.de/search/index.html?A_20744) | E-Rezept-Fachdienst - Selbstauskunft Device-Informationen | [IG-TIFLOW-CORE-303](/core/query-api-device-req-fd.md) | core |
| [A_20885-04](https://gemspec.gematik.de/search/index.html?A_20885-04) | E-Rezept-Fachdienst - Nachricht einstellen - Versicherte - Prüfung Versichertenbezug und Berechtigung | [IG-TIFLOW-CORE-268](/core/query-api-communication-req-fd.md) | core |
| [A_21360-01](https://gemspec.gematik.de/search/index.html?A_21360-01) | E-Rezept-Fachdienst - Task abrufen - Flowtype 169 / 209 - keine Einlöseinformationen | [IG-TIFLOW-RX-20](/rx/query-api-task-req-fd.md)[IG-TIFLOW-RX-21](/rx/query-api-task-req-fd.md) | rx |
| [A_21370](https://gemspec.gematik.de/search/index.html?A_21370) | E-Rezept-Fachdienst - Prüfung Rezept-ID und Präfix gegen Flowtype | [IG-TIFLOW-CORE-137](/core/op-activate-req-fd.md) | core |
| [A_21371-03](https://gemspec.gematik.de/search/index.html?A_21371-03) | E-Rezept-Fachdienst - Nachricht einstellen - Prüfung Existenz Task | [IG-TIFLOW-CORE-270](/core/query-api-communication-req-fd.md) | core |
| [A_21375-02](https://gemspec.gematik.de/search/index.html?A_21375-02) | E-Rezept-Fachdienst - Task abrufen - Rückgabe Task inkl. Bundles Versicherter | [IG-TIFLOW-CORE-73](/core/query-api-task-req-fd.md) | core |
| [A_21532-02](https://gemspec.gematik.de/search/index.html?A_21532-02) | E-Rezept-Fachdienst - Task abrufen - Kein Secret für Versicherte | [IG-TIFLOW-CORE-74](/core/query-api-task-req-fd.md) | core |
| [A_21558-02](https://gemspec.gematik.de/search/index.html?A_21558-02) | E-Rezept-Fachdienst - Task abrufen - Rollenprüfung Versicherter oder Apotheke liest Rezepte | [IG-TIFLOW-CORE-50](/core/query-api-task-req-fd.md) | core |
| [A_22069-01](https://gemspec.gematik.de/search/index.html?A_22069-01) | E-Rezept-Fachdienst - Task schließen - Speicherung mehrerer MedicationDispenses | [IG-TIFLOW-RX-12](/rx/op-close-req-fd.md) | rx |
| [A_22070-03](https://gemspec.gematik.de/search/index.html?A_22070-03) | E-Rezept-Fachdienst - MedicationDispense abrufen - Rückgabe mehrerer MedicationDispenses | [IG-TIFLOW-CORE-96](/core/query-api-medicationdispense-req-fd.md) | core |
| [A_22102-01](https://gemspec.gematik.de/search/index.html?A_22102-01) | E-Rezept-Fachdienst - E-Rezept löschen - Flowtype 169 / 209 - Versicherter - Statusprüfung | [IG-TIFLOW-RX-37](/rx/op-abort-req-fd.md) | rx |
| [A_22103](https://gemspec.gematik.de/search/index.html?A_22103) | E-Rezept-Fachdienst - Fehlerdetails in OperationOutcome | [IG-TIFLOW-CORE-281](/core/error-codes.md) | core |
| [A_22110-01](https://gemspec.gematik.de/search/index.html?A_22110-01) | E-Rezept-Fachdienst – Task akzeptieren – Coverage PKV - Einwilligung Abrechnungsinformation ermitteln | [IG-TIFLOW-RX-86](/rx/op-accept-req-fd.md) | rx |
| [A_22117-01](https://gemspec.gematik.de/search/index.html?A_22117-01) | E-Rezept-Fachdienst - Abrechnungsinformation löschen - zu löschende Ressourcen | [IG-TIFLOW-CHRG-94](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22128-01](https://gemspec.gematik.de/search/index.html?A_22128-01) | E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – kein AccessCode und Quittung | [IG-TIFLOW-CHRG-56](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22132-02](https://gemspec.gematik.de/search/index.html?A_22132-02) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Secret Task | [IG-TIFLOW-CHRG-60](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22140-01](https://gemspec.gematik.de/search/index.html?A_22140-01) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Signaturzertifikat PKV-Abgabedatensatz | [IG-TIFLOW-CHRG-68](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22151-01](https://gemspec.gematik.de/search/index.html?A_22151-01) | E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Signaturzertifikat PKV-Abgabedatensatz | [IG-TIFLOW-CHRG-86](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22162-01](https://gemspec.gematik.de/search/index.html?A_22162-01) | E-Rezept-Fachdienst - Consent schreiben – nur eine Einwilligung pro KVNR und Einwilligungstyp | [IG-TIFLOW-CORE-162](/core/query-api-consent-req-fd.md) | core |
| [A_22217](https://gemspec.gematik.de/search/index.html?A_22217) | E-Rezept-Fachdienst - Protokollierung - keine Angabe zu organizationName | [IG-TIFLOW-CORE-6](/core/audit-service.md) | core |
| [A_22231-01](https://gemspec.gematik.de/search/index.html?A_22231-01) | E-Rezept-Fachdienst - Task aktivieren - Ausschluss Betäubungsmittel | [IG-TIFLOW-RX-62](/rx/op-activate-req-fd.md) | rx |
| [A_22362-01](https://gemspec.gematik.de/search/index.html?A_22362-01) | E-Rezept-Fachdienst – Subscription registrieren – Rollenprüfung | [IG-TIFLOW-CORE-285](/core/query-api-subscription-req-fd.md) | core |
| [A_22363](https://gemspec.gematik.de/search/index.html?A_22363) | E-Rezept-Fachdienst – Subscription registrieren – Prüfung Telematik-ID | [IG-TIFLOW-CORE-352](/core/query-api-subscription-req-fd.md) | core |
| [A_22364](https://gemspec.gematik.de/search/index.html?A_22364) | E-Rezept-Fachdienst – Subscription registrieren – Response | [IG-TIFLOW-CORE-287](/core/query-api-subscription-req-fd.md) | core |
| [A_22365](https://gemspec.gematik.de/search/index.html?A_22365) | E-Rezept-Fachdienst – Subscription registrieren – Pseudonym der Telematik-ID | [IG-TIFLOW-CORE-288](/core/query-api-subscription-req-fd.md) | core |
| [A_22366](https://gemspec.gematik.de/search/index.html?A_22366) | E-Rezept-Fachdienst – Subscription registrieren – Barrier-Token | [IG-TIFLOW-CORE-290](/core/query-api-subscription-req-fd.md) | core |
| [A_22368](https://gemspec.gematik.de/search/index.html?A_22368) | E-Rezept-Fachdienst - Subscription Service - Webschnittstelle | [IG-TIFLOW-CORE-116](/core/menu-technische-umsetzung-subscription.md) | core |
| [A_22369](https://gemspec.gematik.de/search/index.html?A_22369) | E-Rezept-Fachdienst - Subscription Service - Prüfung Bearer-Token | [IG-TIFLOW-CORE-117](/core/menu-technische-umsetzung-subscription.md) | core |
| [A_22370](https://gemspec.gematik.de/search/index.html?A_22370) | E-Rezept-Fachdienst - Subscription Service - Upgrade | [IG-TIFLOW-CORE-118](/core/menu-technische-umsetzung-subscription.md) | core |
| [A_22371](https://gemspec.gematik.de/search/index.html?A_22371) | E-Rezept-Fachdienst - Subscription Service - abgelaufene Verbindungen schließen | [IG-TIFLOW-CORE-119](/core/menu-technische-umsetzung-subscription.md) | core |
| [A_22378](https://gemspec.gematik.de/search/index.html?A_22378) | E-Rezept-Fachdienst - Subscription Service - Verbot Profilbildung | [IG-TIFLOW-CORE-120](/core/menu-technische-umsetzung-subscription.md) | core |
| [A_22383-01](https://gemspec.gematik.de/search/index.html?A_22383-01) | E-Rezept-Fachdienst – Generierungsschlüssel – Pseudonym der Telematik-ID | [IG-TIFLOW-CORE-289](/core/query-api-subscription-req-fd.md) | core |
| [A_22487](https://gemspec.gematik.de/search/index.html?A_22487) | E-Rezept-Fachdienst - Task aktivieren - Prüfregel Ausstellungsdatum | [IG-TIFLOW-CORE-139](/core/op-activate-req-fd.md) | core |
| [A_22611-02](https://gemspec.gematik.de/search/index.html?A_22611-02) | E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung AccessCode | [IG-TIFLOW-CHRG-54](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22614-02](https://gemspec.gematik.de/search/index.html?A_22614-02) | E-Rezept-Fachdienst - Abrechnungsinformation bereitstellen - Generierung AccessCode | [IG-TIFLOW-CHRG-71](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22615-02](https://gemspec.gematik.de/search/index.html?A_22615-02) | E-Rezept-Fachdienst - Abrechnungsinformation ändern - Apotheke - Generierung AccessCode | [IG-TIFLOW-CHRG-88](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22616-03](https://gemspec.gematik.de/search/index.html?A_22616-03) | E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung AccessCode | [IG-TIFLOW-CHRG-82](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22627-01](https://gemspec.gematik.de/search/index.html?A_22627-01) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - zulässige Flowtype | [IG-TIFLOW-RX-71](/rx/op-activate-req-fd.md) | rx |
| [A_22628](https://gemspec.gematik.de/search/index.html?A_22628) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator-Denominator kleiner 5 | [IG-TIFLOW-RX-72](/rx/op-activate-req-fd.md) | rx |
| [A_22629](https://gemspec.gematik.de/search/index.html?A_22629) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Denominator größer 1 | [IG-TIFLOW-RX-74](/rx/op-activate-req-fd.md) | rx |
| [A_22630](https://gemspec.gematik.de/search/index.html?A_22630) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator kleiner / gleich Denominator | [IG-TIFLOW-RX-75](/rx/op-activate-req-fd.md) | rx |
| [A_22631](https://gemspec.gematik.de/search/index.html?A_22631) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Unzulässige Angaben | [IG-TIFLOW-RX-76](/rx/op-activate-req-fd.md) | rx |
| [A_22632](https://gemspec.gematik.de/search/index.html?A_22632) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - kein Entlassrezept | [IG-TIFLOW-RX-77](/rx/op-activate-req-fd.md) | rx |
| [A_22633](https://gemspec.gematik.de/search/index.html?A_22633) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - keine Ersatzverordnung | [IG-TIFLOW-RX-78](/rx/op-activate-req-fd.md) | rx |
| [A_22634](https://gemspec.gematik.de/search/index.html?A_22634) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Beginn Einlösefrist-Pflicht | [IG-TIFLOW-RX-79](/rx/op-activate-req-fd.md) | rx |
| [A_22635-02](https://gemspec.gematik.de/search/index.html?A_22635-02) | E-Rezept-Fachdienst - Task akzeptieren - Mehrfachverordnung - Beginn Einlösefrist prüfen | [IG-TIFLOW-RX-85](/rx/op-accept-req-fd.md) | rx |
| [A_22704](https://gemspec.gematik.de/search/index.html?A_22704) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator größer 0 | [IG-TIFLOW-RX-73](/rx/op-activate-req-fd.md) | rx |
| [A_22731-01](https://gemspec.gematik.de/search/index.html?A_22731-01) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Coverage PKV | [IG-TIFLOW-CHRG-61](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_22874-02](https://gemspec.gematik.de/search/index.html?A_22874-02) | E-Rezept-Fachdienst - Consent löschen - Prüfung category | [IG-TIFLOW-CORE-169](/core/query-api-consent-req-fd.md) | core |
| [A_22919](https://gemspec.gematik.de/search/index.html?A_22919) | E-Rezept-Fachdienst - Task schließen - OCSP-Response nicht älter als 24 h | [IG-TIFLOW-CORE-45](/core/op-close-req-fd.md) | core |
| [A_22925](https://gemspec.gematik.de/search/index.html?A_22925) | E-Rezept-Fachdienst - Task aktivieren - Längenprüfung PZN | [IG-TIFLOW-CORE-350](/core/op-activate-req-fd.md) | core |
| [A_22927-03](https://gemspec.gematik.de/search/index.html?A_22927-03) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Ausschluss unspezifizierter Extensions | [IG-TIFLOW-CORE-212](/core/fhir-validate.md) | core |
| [A_23164](https://gemspec.gematik.de/search/index.html?A_23164) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Endedatum nicht vor Startdatum | [IG-TIFLOW-RX-81](/rx/op-activate-req-fd.md) | rx |
| [A_23172](https://gemspec.gematik.de/search/index.html?A_23172) | E-Rezept-Fachdienst - Task aktivieren - Mimetype Signatur | [IG-TIFLOW-CORE-136](/core/op-activate-req-fd.md) | core |
| [A_23227](https://gemspec.gematik.de/search/index.html?A_23227) | E-Rezept-Fachdienst - Task erzeugen - Task-ID=Rezept-ID | [IG-TIFLOW-CORE-178](/core/op-create-req-fd.md) | core |
| [A_23443-01](https://gemspec.gematik.de/search/index.html?A_23443-01) | E-Rezept-Fachdienst – Task aktivieren – Flowtype 160/162/169 - Prüfung Coverage Type | [IG-TIFLOW-DIGA-14](/diga/op-activate-req-fd.md)[IG-TIFLOW-RX-60](/rx/op-activate-req-fd.md) | digarx |
| [A_23450-01](https://gemspec.gematik.de/search/index.html?A_23450-01) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - Prüfung Prüfungsnachweis | [IG-TIFLOW-CORE-56](/core/query-api-task-req-fd.md) | core |
| [A_23451-01](https://gemspec.gematik.de/search/index.html?A_23451-01) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - Zeitraum Akzeptanz Prüfungsnachweis | [IG-TIFLOW-CORE-59](/core/query-api-task-req-fd.md) | core |
| [A_23452-04](https://gemspec.gematik.de/search/index.html?A_23452-04) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - Filter Status, KVNR und Workflowtype | [IG-TIFLOW-CORE-60](/core/query-api-task-req-fd.md) | core |
| [A_23454](https://gemspec.gematik.de/search/index.html?A_23454) | E-Rezept-Fachdienst - Prüfung Prüfziffer | [IG-TIFLOW-CORE-68](/core/query-api-task-req-fd.md) | core |
| [A_23456-01](https://gemspec.gematik.de/search/index.html?A_23456-01) | E-Rezept-Fachdienst - Prüfung Prüfziffer - Berechnung HMAC der Prüfziffer | [IG-TIFLOW-CORE-69](/core/query-api-task-req-fd.md) | core |
| [A_23537](https://gemspec.gematik.de/search/index.html?A_23537) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Startdatum nicht vor Ausstellungsdatum | [IG-TIFLOW-RX-80](/rx/op-activate-req-fd.md) | rx |
| [A_23539-01](https://gemspec.gematik.de/search/index.html?A_23539-01) | E-Rezept-Fachdienst - Task akzeptieren - Ende Einlösefrist prüfen | [IG-TIFLOW-CORE-188](/core/op-accept-req-fd.md) | core |
| [A_23624](https://gemspec.gematik.de/search/index.html?A_23624) | E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – kein AccessCode und Quittung | [IG-TIFLOW-CHRG-89](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_23704](https://gemspec.gematik.de/search/index.html?A_23704) | E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – kein AccessCode und Quittung | [IG-TIFLOW-CHRG-73](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_23878-02](https://gemspec.gematik.de/search/index.html?A_23878-02) | E-Rezept-Fachdienst - Nachricht einstellen - Validierung des Payload-Inhalt von GEM_ERP_PR_Communication_DispReq | [IG-TIFLOW-CORE-260](/core/query-api-communication-req-fd.md) | core |
| [A_23879-01](https://gemspec.gematik.de/search/index.html?A_23879-01) | E-Rezept-Fachdienst - Nachricht einstellen - Validierung des Payload-Inhalt von GEM_ERP_PR_Communication_Reply | [IG-TIFLOW-CORE-261](/core/query-api-communication-req-fd.md) | core |
| [A_23888](https://gemspec.gematik.de/search/index.html?A_23888) | E-Rezept-Fachdienst - Task aktivieren - Überprüfung der IK Nummer im Profil KBV_PR_FOR_Coverage | [IG-TIFLOW-CORE-144](/core/op-activate-req-fd.md) | core |
| [A_23890-01](https://gemspec.gematik.de/search/index.html?A_23890-01) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung KVNR im Profil KBV_PR_FOR_Patient | [IG-TIFLOW-CORE-146](/core/op-activate-req-fd.md) | core |
| [A_23891-01](https://gemspec.gematik.de/search/index.html?A_23891-01) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung der ANR und ZANR im Profil KBV_PR_FOR_Practitioner | [IG-TIFLOW-CORE-147](/core/op-activate-req-fd.md) | core |
| [A_23892](https://gemspec.gematik.de/search/index.html?A_23892) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung der PZN im Profil KBV_PR_ERP_Medication_PZN | [IG-TIFLOW-CORE-151](/core/op-activate-req-fd.md) | core |
| [A_23936-01](https://gemspec.gematik.de/search/index.html?A_23936-01) | E-Rezept-Fachdienst - Task aktivieren - Versicherten-ID als Identifikator von Versicherten | [IG-TIFLOW-CORE-138](/core/op-activate-req-fd.md) | core |
| [A_24030](https://gemspec.gematik.de/search/index.html?A_24030) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung der IK Nummer im Profil KBV_PR_FOR_Coverage | [IG-TIFLOW-CORE-145](/core/op-activate-req-fd.md) | core |
| [A_24031](https://gemspec.gematik.de/search/index.html?A_24031) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung der ANR und ZANR - Konfiguration bei Auffälligkeiten | [IG-TIFLOW-CORE-148](/core/op-activate-req-fd.md) | core |
| [A_24032](https://gemspec.gematik.de/search/index.html?A_24032) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung der ANR und ZANR - Konfiguration Fehler | [IG-TIFLOW-CORE-149](/core/op-activate-req-fd.md) | core |
| [A_24033](https://gemspec.gematik.de/search/index.html?A_24033) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung der ANR und ZANR - Konfiguration Warning | [IG-TIFLOW-CORE-150](/core/op-activate-req-fd.md) | core |
| [A_24034](https://gemspec.gematik.de/search/index.html?A_24034) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung der PZN im Profil KBV_PR_ERP_Medication_Compounding | [IG-TIFLOW-CORE-152](/core/op-activate-req-fd.md) | core |
| [A_24174](https://gemspec.gematik.de/search/index.html?A_24174) | E-Rezept-Fachdienst - Task akzeptieren - Telematik-ID der abgebenden LEI speichern | [IG-TIFLOW-CORE-190](/core/op-accept-req-fd.md)[IG-TIFLOW-CORE-191](/core/op-accept-req-fd.md) | core |
| [A_24175](https://gemspec.gematik.de/search/index.html?A_24175) | E-Rezept-Fachdienst - Task zurückweisen - Telematik-ID der abgebenden LEI löschen | [IG-TIFLOW-CORE-19](/core/op-reject-req-fd.md) | core |
| [A_24176-01](https://gemspec.gematik.de/search/index.html?A_24176-01) | E-Rezept-Fachdienst - Task abrufen - Apotheke - Verordnung abrufen - Prüfung Telematik-ID | [IG-TIFLOW-CORE-76](/core/query-api-task-req-fd.md) | core |
| [A_24177-01](https://gemspec.gematik.de/search/index.html?A_24177-01) | E-Rezept-Fachdienst - Task abrufen - Apotheke - Verordnung abrufen - Prüfung AccessCode | [IG-TIFLOW-CORE-77](/core/query-api-task-req-fd.md) | core |
| [A_24178-02](https://gemspec.gematik.de/search/index.html?A_24178-02) | E-Rezept-Fachdienst - Task abrufen - Apotheke - Verordnung abrufen - Prüfung Status in-progress | [IG-TIFLOW-CORE-78](/core/query-api-task-req-fd.md) | core |
| [A_24179-01](https://gemspec.gematik.de/search/index.html?A_24179-01) | E-Rezept-Fachdienst - Task abrufen - Apotheke - Verordnung abrufen - erneuter Abruf Verordnung | [IG-TIFLOW-CORE-79](/core/query-api-task-req-fd.md) | core |
| [A_24279](https://gemspec.gematik.de/search/index.html?A_24279) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Rollenprüfung Abgebender stellt Dispensierinformationen bereit | [IG-TIFLOW-RX-22](/rx/op-dispense-req-fd.md) | rx |
| [A_24280](https://gemspec.gematik.de/search/index.html?A_24280) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Prüfung Secret | [IG-TIFLOW-RX-23](/rx/op-dispense-req-fd.md) | rx |
| [A_24281-02](https://gemspec.gematik.de/search/index.html?A_24281-02) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Schemaprüfung MedicationDispense | [IG-TIFLOW-RX-25](/rx/op-dispense-req-fd.md) | rx |
| [A_24283-02](https://gemspec.gematik.de/search/index.html?A_24283-02) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Speicherung mehrerer MedicationDispenses | [IG-TIFLOW-RX-28](/rx/op-dispense-req-fd.md) | rx |
| [A_24284](https://gemspec.gematik.de/search/index.html?A_24284) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Keine Statusänderung | [IG-TIFLOW-RX-32](/rx/op-dispense-req-fd.md) | rx |
| [A_24285-01](https://gemspec.gematik.de/search/index.html?A_24285-01) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Zeitstempel MedicationDispense | [IG-TIFLOW-RX-30](/rx/op-dispense-req-fd.md) | rx |
| [A_24286-02](https://gemspec.gematik.de/search/index.html?A_24286-02) | E-Rezept-Fachdienst - Task zurückweisen - Dispensierinformationen löschen | [IG-TIFLOW-RX-5](/rx/op-reject-req-fd.md) | rx |
| [A_24287-01](https://gemspec.gematik.de/search/index.html?A_24287-01) | E-Rezept-Fachdienst - Task schließen - Aufruf ohne MedicationDispense | [IG-TIFLOW-RX-10](/rx/op-close-req-fd.md) | rx |
| [A_24298](https://gemspec.gematik.de/search/index.html?A_24298) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Prüfung Status | [IG-TIFLOW-RX-24](/rx/op-dispense-req-fd.md) | rx |
| [A_24434](https://gemspec.gematik.de/search/index.html?A_24434) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Betroffene Endpunkte | [IG-TIFLOW-CORE-292](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24436-01](https://gemspec.gematik.de/search/index.html?A_24436-01) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Filter- und Sortierkriterien | [IG-TIFLOW-CORE-293](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24437](https://gemspec.gematik.de/search/index.html?A_24437) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Sortieren von Einträgen | [IG-TIFLOW-CORE-294](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24438](https://gemspec.gematik.de/search/index.html?A_24438) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Sortieren von Einträgen | [IG-TIFLOW-CORE-295](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24440](https://gemspec.gematik.de/search/index.html?A_24440) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Sortierreihenfolge der Einträge | [IG-TIFLOW-CORE-296](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24441-01](https://gemspec.gematik.de/search/index.html?A_24441-01) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - URL-Parameter für Paginierung | [IG-TIFLOW-CORE-298](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24442-01](https://gemspec.gematik.de/search/index.html?A_24442-01) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Link Relations für Paginierung | [IG-TIFLOW-CORE-299](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24443-01](https://gemspec.gematik.de/search/index.html?A_24443-01) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Paginierung | [IG-TIFLOW-CORE-300](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24444](https://gemspec.gematik.de/search/index.html?A_24444) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Erhalten von URL-Parametern | [IG-TIFLOW-CORE-301](/core/menu-technische-umsetzung-paging.md) | core |
| [A_24471](https://gemspec.gematik.de/search/index.html?A_24471) | E-Rezept-Fachdienst - Abrechnungsinformation bereitstellen - ChargeItem-ID=Rezept-ID | [IG-TIFLOW-CHRG-63](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_24901](https://gemspec.gematik.de/search/index.html?A_24901) | E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Schema ID | [IG-TIFLOW-RX-82](/rx/op-activate-req-fd.md) | rx |
| [A_25206](https://gemspec.gematik.de/search/index.html?A_25206) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 | [IG-TIFLOW-CORE-61](/core/query-api-task-req-fd.md) | core |
| [A_25207](https://gemspec.gematik.de/search/index.html?A_25207) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 - AcceptPN3 false | [IG-TIFLOW-CORE-66](/core/query-api-task-req-fd.md) | core |
| [A_25208-01](https://gemspec.gematik.de/search/index.html?A_25208-01) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - URL kvnr | [IG-TIFLOW-CORE-62](/core/query-api-task-req-fd.md) | core |
| [A_25209-02](https://gemspec.gematik.de/search/index.html?A_25209-02) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 - AcceptPN3 true - Filter Status, KVNR und Workflowtype | [IG-TIFLOW-CORE-67](/core/query-api-task-req-fd.md) | core |
| [A_25515](https://gemspec.gematik.de/search/index.html?A_25515) | E-Rezept-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Filteroperatoren für Datumsabfragen | [IG-TIFLOW-CORE-297](/core/menu-technische-umsetzung-paging.md) | core |
| [A_25642](https://gemspec.gematik.de/search/index.html?A_25642) | E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - Prüfung Arzneimittelverordnung | [IG-TIFLOW-RX-57](/rx/op-activate-req-fd.md) | rx |
| [A_25925](https://gemspec.gematik.de/search/index.html?A_25925) | E-Rezept-Fachdienst - Task aktivieren - Daten ePA Medication Service bereitstellen (Verordnungsdatensatz) | [IG-TIFLOW-RX-64](/rx/op-activate-req-fd.md) | rx |
| [A_25926](https://gemspec.gematik.de/search/index.html?A_25926) | E-Rezept-Fachdienst - Task zurückweisen - Löschmarkierungen Medikationsliste bereitstellen (Dispensierinformationen) | [IG-TIFLOW-RX-6](/rx/op-reject-req-fd.md) | rx |
| [A_25928-01](https://gemspec.gematik.de/search/index.html?A_25928-01) | E-Rezept-Fachdienst - Task schließen - Daten ePA Medication Service bereitstellen (Dispensierinformationen) | [IG-TIFLOW-RX-13](/rx/op-close-req-fd.md) | rx |
| [A_25930](https://gemspec.gematik.de/search/index.html?A_25930) | E-Rezept-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Leistungserbringerinstitution | [IG-TIFLOW-RX-38](/rx/op-abort-req-fd.md) | rx |
| [A_25931](https://gemspec.gematik.de/search/index.html?A_25931) | E-Rezept-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Versicherter | [IG-TIFLOW-RX-39](/rx/op-abort-req-fd.md) | rx |
| [A_25933](https://gemspec.gematik.de/search/index.html?A_25933) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Daten Medikationsliste bereitstellen (Dispensierinformationen) | [IG-TIFLOW-RX-29](/rx/op-dispense-req-fd.md) | rx |
| [A_25935](https://gemspec.gematik.de/search/index.html?A_25935) | E-Rezept-Fachdienst - ePA - JWT Bearer-Token Signatur | [IG-TIFLOW-CORE-307](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25936](https://gemspec.gematik.de/search/index.html?A_25936) | E-Rezept-Fachdienst - ePA - Festlegung der ClientID | [IG-TIFLOW-CORE-308](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25937](https://gemspec.gematik.de/search/index.html?A_25937) | E-Rezept-Fachdienst - ePA - Lokalisierung des ePA-Aktensysteme | [IG-TIFLOW-CORE-309](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25938](https://gemspec.gematik.de/search/index.html?A_25938) | E-Rezept-Fachdienst - ePA - Aktualisierung Cache ePA-Aktensysteme | [IG-TIFLOW-CORE-310](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25939](https://gemspec.gematik.de/search/index.html?A_25939) | E-Rezept-Fachdienst - ePA - ePA-Aktensystem für KVNR ermitteln | [IG-TIFLOW-CORE-311](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25940](https://gemspec.gematik.de/search/index.html?A_25940) | E-Rezept-Fachdienst - ePA - Aktualisierung Cache Zuordnung KVNR zu ePA-Aktensystem | [IG-TIFLOW-CORE-312](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25941](https://gemspec.gematik.de/search/index.html?A_25941) | E-Rezept-Fachdienst - ePA - Aktualisierung Cache Zuordnung KVNR zu ePA-Aktensystem - Statuscode 404 | [IG-TIFLOW-CORE-313](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25942](https://gemspec.gematik.de/search/index.html?A_25942) | E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Information Service - Fehler im Information Service | [IG-TIFLOW-CORE-314](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25943](https://gemspec.gematik.de/search/index.html?A_25943) | E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Information Service - Struktureller Fehler | [IG-TIFLOW-CORE-315](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25944-01](https://gemspec.gematik.de/search/index.html?A_25944-01) | E-Rezept-Fachdienst - ePA - Flowtype 160/166/169/200/209 | [IG-TIFLOW-CORE-316](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25945](https://gemspec.gematik.de/search/index.html?A_25945) | E-Rezept-Fachdienst - ePA - asynchrone Bereitstellung und Übermittlung | [IG-TIFLOW-CORE-317](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25946](https://gemspec.gematik.de/search/index.html?A_25946) | E-Rezept-Fachdienst - ePA - Mapping | [IG-TIFLOW-CORE-318](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25947](https://gemspec.gematik.de/search/index.html?A_25947) | E-Rezept-Fachdienst - ePA - provide-dispensation-erp - Organisation-Ressource | [IG-TIFLOW-CORE-319](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25948](https://gemspec.gematik.de/search/index.html?A_25948) | E-Rezept-Fachdienst - ePA - Mapping - Übernahme von Werten zwischen Profilen | [IG-TIFLOW-CORE-320](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25949](https://gemspec.gematik.de/search/index.html?A_25949) | E-Rezept-Fachdienst - ePA - Mapping - Handhabung von Extensions | [IG-TIFLOW-CORE-321](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25950](https://gemspec.gematik.de/search/index.html?A_25950) | E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Nichtauffinden in allen ePA-Aktensystemen | [IG-TIFLOW-CORE-322](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25951-01](https://gemspec.gematik.de/search/index.html?A_25951-01) | E-Rezept-Fachdienst - ePA - Prüfung des Widerspruchs vor Übermittlung | [IG-TIFLOW-CORE-323](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25952](https://gemspec.gematik.de/search/index.html?A_25952) | E-Rezept-Fachdienst - ePA - Übermittlung - Bereitstellung von Verordnungsdaten | [IG-TIFLOW-CORE-324](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25953](https://gemspec.gematik.de/search/index.html?A_25953) | E-Rezept-Fachdienst - ePA - Übermittlung - Löschinformation von Verordnungsdaten | [IG-TIFLOW-CORE-325](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25954-01](https://gemspec.gematik.de/search/index.html?A_25954-01) | E-Rezept-Fachdienst - ePA - Übermittlung - Bereitstellung von Dispensierinformationen | [IG-TIFLOW-CORE-326](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25955](https://gemspec.gematik.de/search/index.html?A_25955) | E-Rezept-Fachdienst - ePA - Übermittlung - Löschinformation von Dispensierinformationen | [IG-TIFLOW-CORE-327](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25956](https://gemspec.gematik.de/search/index.html?A_25956) | E-Rezept-Fachdienst - ePA - Übermittlung - Bündelung von Übermittlungsaufträgen nach KVNR | [IG-TIFLOW-CORE-328](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25957](https://gemspec.gematik.de/search/index.html?A_25957) | E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Aktenkonto-Umzug | [IG-TIFLOW-CORE-329](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25958](https://gemspec.gematik.de/search/index.html?A_25958) | E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Reaktion auf Scheitern des Operationaufrufs | [IG-TIFLOW-CORE-330](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25959](https://gemspec.gematik.de/search/index.html?A_25959) | E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Probleme bei der Entschlüsselung durch den Medication Service | [IG-TIFLOW-CORE-331](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25960](https://gemspec.gematik.de/search/index.html?A_25960) | E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Probleme bei der Entschlüsselung durch den E-Rezept-Fachdienst | [IG-TIFLOW-CORE-332](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25961](https://gemspec.gematik.de/search/index.html?A_25961) | E-Rezept-Fachdienst - ePA - Fehlerbehandlung - Reaktion auf Nichtverfügbarkeit des Medication Service | [IG-TIFLOW-CORE-333](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25962](https://gemspec.gematik.de/search/index.html?A_25962) | E-Rezept-Fachdienst - ePA - Medication Service - Versichertenprotokoll | [IG-TIFLOW-CORE-7](/core/audit-service.md) | core |
| [A_25971](https://gemspec.gematik.de/search/index.html?A_25971) | E-Rezept-Fachdienst - ePA - TLS-Server X.509-Zertifikat des ePA-Aktensystems auf Gültigkeit prüfen | [IG-TIFLOW-CORE-304](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25972](https://gemspec.gematik.de/search/index.html?A_25972) | E-Rezept-Fachdienst - ePA - TLS-Server X.509-Zertifikat des ePA-Aktensystems Rolle prüfen | [IG-TIFLOW-CORE-305](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_25990](https://gemspec.gematik.de/search/index.html?A_25990) | E-Rezept-Fachdienst - Task aktivieren - Flowtype 162 - QES durch berechtigte Berufsgruppe | [IG-TIFLOW-DIGA-11](/diga/op-activate-req-fd.md) | diga |
| [A_25991](https://gemspec.gematik.de/search/index.html?A_25991) | E-Rezept-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Verordnung von DiGAs | [IG-TIFLOW-DIGA-12](/diga/op-activate-req-fd.md) | diga |
| [A_25992](https://gemspec.gematik.de/search/index.html?A_25992) | E-Rezept-Fachdienst - Task aktivieren – Überprüfung der PZN im Profil KBV_PR_EVDGA_HealthAppRequest | [IG-TIFLOW-DIGA-13](/diga/op-activate-req-fd.md) | diga |
| [A_25993](https://gemspec.gematik.de/search/index.html?A_25993) | E-Rezept-Fachdienst - Task akzeptieren - Flowtype 162 - Rollenprüfung | [IG-TIFLOW-DIGA-17](/diga/op-accept-req-fd.md) | diga |
| [A_25994](https://gemspec.gematik.de/search/index.html?A_25994) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 - Mappen von IKNR zu VSDM | [IG-TIFLOW-CORE-64](/core/query-api-task-req-fd.md) | core |
| [A_25995](https://gemspec.gematik.de/search/index.html?A_25995) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - PN3 - keine E-Rezepte | [IG-TIFLOW-CORE-65](/core/query-api-task-req-fd.md) | core |
| [A_26002-02](https://gemspec.gematik.de/search/index.html?A_26002-02) | E-Rezept-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Profilprüfung MedicationDispense | [IG-TIFLOW-RX-9](/rx/op-close-req-fd.md) | rx |
| [A_26003-01](https://gemspec.gematik.de/search/index.html?A_26003-01) | E-Rezept-Fachdienst - Task schließen - Flowtype 162 - Profilprüfung MedicationDispense | [IG-TIFLOW-DIGA-4](/diga/op-close-req-fd.md) | diga |
| [A_26066](https://gemspec.gematik.de/search/index.html?A_26066) | E-Rezept-Fachdienst - ePA - JWT Bearer-Token Claims | [IG-TIFLOW-CORE-306](/core/menu-technische-umsetzung-epa-ms.md) | core |
| [A_26148](https://gemspec.gematik.de/search/index.html?A_26148) | E-Rezept-Fachdienst - Task abrufen - Flowtype 169/209 - Nicht verfügbar bei KVNR-Mismatch | [IG-TIFLOW-RX-21](/rx/query-api-task-req-fd.md) | rx |
| [A_26229-01](https://gemspec.gematik.de/search/index.html?A_26229-01) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Konsistenz Ressource IDs | [IG-TIFLOW-CORE-344](/core/fhir-validate.md) | core |
| [A_26229-02](https://gemspec.gematik.de/search/index.html?A_26229-02) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Konsistenz Ressource IDs | [IG-TIFLOW-CORE-208](/core/fhir-validate.md) | core |
| [A_26233-01](https://gemspec.gematik.de/search/index.html?A_26233-01) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Format fullUrl | [IG-TIFLOW-CORE-209](/core/fhir-validate.md) | core |
| [A_26264](https://gemspec.gematik.de/search/index.html?A_26264) | E-Rezept-Fachdienst - Löschfrist - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) | [IG-TIFLOW-CORE-86](/core/ttl.md) | core |
| [A_26320](https://gemspec.gematik.de/search/index.html?A_26320) | E-Rezept-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Status Task | [IG-TIFLOW-CORE-271](/core/query-api-communication-req-fd.md) | core |
| [A_26321](https://gemspec.gematik.de/search/index.html?A_26321) | E-Rezept-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Ende Gültigkeit Task | [IG-TIFLOW-CORE-272](/core/query-api-communication-req-fd.md) | core |
| [A_26327](https://gemspec.gematik.de/search/index.html?A_26327) | E-Rezept-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Beginn Gültigkeit Task | [IG-TIFLOW-CORE-273](/core/query-api-communication-req-fd.md) | core |
| [A_26337](https://gemspec.gematik.de/search/index.html?A_26337) | E-Rezept-Fachdienst - Task schließen - Zeitstempel MedicationDispense | [IG-TIFLOW-CORE-41](/core/op-close-req-fd.md) | core |
| [A_26372](https://gemspec.gematik.de/search/index.html?A_26372) | E-Rezept-Fachdienst – Task aktivieren – Flowtype 162 - Prüfung Coverage Alternative IK | [IG-TIFLOW-DIGA-15](/diga/op-activate-req-fd.md) | diga |
| [A_26481](https://gemspec.gematik.de/search/index.html?A_26481) | E-Rezept-Fachdienst - Task schließen - Überschreiben vorheriger MedicationDispenses | [IG-TIFLOW-RX-11](/rx/op-close-req-fd.md) | rx |
| [A_26482](https://gemspec.gematik.de/search/index.html?A_26482) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Überschreiben vorheriger MedicationDispenses | [IG-TIFLOW-RX-26](/rx/op-dispense-req-fd.md) | rx |
| [A_26527](https://gemspec.gematik.de/search/index.html?A_26527) | E-Rezept-Fachdienst - MedicationDispense abrufen - Referenzierung MedicationDispense und Medication | [IG-TIFLOW-CORE-95](/core/query-api-medicationdispense-req-fd.md) | core |
| [A_27051](https://gemspec.gematik.de/search/index.html?A_27051) | E-Rezept-Fachdienst - Task schließen - MedicationDispense speichern | [IG-TIFLOW-CORE-40](/core/op-close-req-fd.md) | core |
| [A_27052](https://gemspec.gematik.de/search/index.html?A_27052) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - MedicationDispense speichern | [IG-TIFLOW-RX-27](/rx/op-dispense-req-fd.md) | rx |
| [A_27059](https://gemspec.gematik.de/search/index.html?A_27059) | E-Rezept-Fachdienst - eu-prescription abfragen - Rollenprüfung | [IG-TIFLOW-EU-4](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27060](https://gemspec.gematik.de/search/index.html?A_27060) | E-Rezept-Fachdienst - eu-prescription abfragen - Schemaprüfung | [IG-TIFLOW-EU-5](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27061](https://gemspec.gematik.de/search/index.html?A_27061) | E-Rezept-Fachdienst - eu-prescription abfragen - Prüfung Einwilligung für KVNR | [IG-TIFLOW-EU-6](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27062](https://gemspec.gematik.de/search/index.html?A_27062) | E-Rezept-Fachdienst - eu-prescription abfragen - Prüfung Zugriffsberechtigung | [IG-TIFLOW-EU-7](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27063-01](https://gemspec.gematik.de/search/index.html?A_27063-01) | E-Rezept-Fachdienst - eu-prescription abfragen - Filter einlösbarer E-Rezepte | [IG-TIFLOW-EU-8](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27064](https://gemspec.gematik.de/search/index.html?A_27064) | E-Rezept-Fachdienst - eu-prescription abfragen - Schema des Response | [IG-TIFLOW-EU-12](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27065](https://gemspec.gematik.de/search/index.html?A_27065) | E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage der aktuellsten Verordnungsinformationen | [IG-TIFLOW-EU-13](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27066](https://gemspec.gematik.de/search/index.html?A_27066) | E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage aller einlösbaren Verordnungsinformationen | [IG-TIFLOW-EU-14](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27067](https://gemspec.gematik.de/search/index.html?A_27067) | E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids | [IG-TIFLOW-EU-15](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27068](https://gemspec.gematik.de/search/index.html?A_27068) | E-Rezept-Fachdienst - Task schließen - EU - Rollenprüfung | [IG-TIFLOW-EU-37](/erp-eu/op-eu-close-req-fd.md) | erp-eu |
| [A_27069](https://gemspec.gematik.de/search/index.html?A_27069) | E-Rezept-Fachdienst - Task schließen - EU - Schemaprüfung | [IG-TIFLOW-EU-38](/erp-eu/op-eu-close-req-fd.md) | erp-eu |
| [A_27070](https://gemspec.gematik.de/search/index.html?A_27070) | E-Rezept-Fachdienst - Task schließen - EU - Prüfung Einwilligung für KVNR | [IG-TIFLOW-EU-39](/erp-eu/op-eu-close-req-fd.md) | erp-eu |
| [A_27071](https://gemspec.gematik.de/search/index.html?A_27071) | E-Rezept-Fachdienst - Task schließen - EU - Prüfung Zugriffsberechtigung | [IG-TIFLOW-EU-40](/erp-eu/op-eu-close-req-fd.md) | erp-eu |
| [A_27072](https://gemspec.gematik.de/search/index.html?A_27072) | E-Rezept-Fachdienst - Task schließen - EU - Statusprüfung | [IG-TIFLOW-EU-41](/erp-eu/op-eu-close-req-fd.md) | erp-eu |
| [A_27074](https://gemspec.gematik.de/search/index.html?A_27074) | E-Rezept-Fachdienst - Task schließen - EU - Zeitstempel MedicationDispense | [IG-TIFLOW-EU-42](/erp-eu/op-eu-close-req-fd.md) | erp-eu |
| [A_27075](https://gemspec.gematik.de/search/index.html?A_27075) | E-Rezept-Fachdienst - Task schließen - EU - Status beenden | [IG-TIFLOW-EU-43](/erp-eu/op-eu-close-req-fd.md) | erp-eu |
| [A_27083](https://gemspec.gematik.de/search/index.html?A_27083) | E-Rezept-Fachdienst - Zugriffsberechtigung - periodische Bereinigung | [IG-TIFLOW-EU-62](/erp-eu/op-grant-eu-access-permission-req-fd.md) | erp-eu |
| [A_27084](https://gemspec.gematik.de/search/index.html?A_27084) | E-Rezept-Fachdienst - Zugriffsberechtigung löschen - Rollenprüfung | [IG-TIFLOW-EU-53](/erp-eu/op-revoke-eu-access-permission-req-fd.md) | erp-eu |
| [A_27085](https://gemspec.gematik.de/search/index.html?A_27085) | E-Rezept-Fachdienst - Zugriffsberechtigung löschen - Löschen | [IG-TIFLOW-EU-54](/erp-eu/op-revoke-eu-access-permission-req-fd.md) | erp-eu |
| [A_27086](https://gemspec.gematik.de/search/index.html?A_27086) | E-Rezept-Fachdienst - Zugriffsberechtigung lesen - Rollenprüfung | [IG-TIFLOW-EU-35](/erp-eu/op-read-eu-access-permission-req-fd.md) | erp-eu |
| [A_27087](https://gemspec.gematik.de/search/index.html?A_27087) | E-Rezept-Fachdienst - Zugriffsberechtigung lesen - Response | [IG-TIFLOW-EU-36](/erp-eu/op-read-eu-access-permission-req-fd.md) | erp-eu |
| [A_27088](https://gemspec.gematik.de/search/index.html?A_27088) | E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Rollenprüfung | [IG-TIFLOW-EU-55](/erp-eu/op-grant-eu-access-permission-req-fd.md) | erp-eu |
| [A_27089](https://gemspec.gematik.de/search/index.html?A_27089) | E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Einwillung für KVNR | [IG-TIFLOW-EU-56](/erp-eu/op-grant-eu-access-permission-req-fd.md) | erp-eu |
| [A_27090](https://gemspec.gematik.de/search/index.html?A_27090) | E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Ländercode | [IG-TIFLOW-EU-57](/erp-eu/op-grant-eu-access-permission-req-fd.md) | erp-eu |
| [A_27091](https://gemspec.gematik.de/search/index.html?A_27091) | E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Zugriffscode | [IG-TIFLOW-EU-58](/erp-eu/op-grant-eu-access-permission-req-fd.md) | erp-eu |
| [A_27092](https://gemspec.gematik.de/search/index.html?A_27092) | E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Löschen bestehender Zugriffsberechtigung | [IG-TIFLOW-EU-59](/erp-eu/op-grant-eu-access-permission-req-fd.md) | erp-eu |
| [A_27093](https://gemspec.gematik.de/search/index.html?A_27093) | E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Neue Zugriffsberechtigung speichern | [IG-TIFLOW-EU-60](/erp-eu/op-grant-eu-access-permission-req-fd.md) | erp-eu |
| [A_27094](https://gemspec.gematik.de/search/index.html?A_27094) | E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Response | [IG-TIFLOW-EU-61](/erp-eu/op-grant-eu-access-permission-req-fd.md) | erp-eu |
| [A_27095](https://gemspec.gematik.de/search/index.html?A_27095) | E-Rezept-Fachdienst - Zugriffsberechtigung - Liste zulässiger Länder | [IG-TIFLOW-EU-2](/erp-eu/menu-technische-umsetzung-konzept.md) | erp-eu |
| [A_27096](https://gemspec.gematik.de/search/index.html?A_27096) | E-Rezept-Fachdienst - Zugriffsberechtigung - Caching Liste zulässiger Länder | [IG-TIFLOW-EU-3](/erp-eu/menu-technische-umsetzung-konzept.md) | erp-eu |
| [A_27131](https://gemspec.gematik.de/search/index.html?A_27131) | E-Rezept-Fachdienst - Consent löschen - EUDISPCONS - Löschen Zugriffsberechtigung | [IG-TIFLOW-CORE-170](/core/query-api-consent-req-fd.md)[IG-TIFLOW-EU-32](/erp-eu/query-api-consent-req-fd.md) | coreerp-eu |
| [A_27143](https://gemspec.gematik.de/search/index.html?A_27143) | E-Rezept-Fachdienst - Consent schreiben - Zeitstempel setzen | [IG-TIFLOW-CORE-163](/core/query-api-consent-req-fd.md)[IG-TIFLOW-CORE-164](/core/query-api-consent-req-fd.md) | core |
| [A_27287](https://gemspec.gematik.de/search/index.html?A_27287) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - Vergleich KVNR | [IG-TIFLOW-CORE-57](/core/query-api-task-req-fd.md) | core |
| [A_27301](https://gemspec.gematik.de/search/index.html?A_27301) | E-Rezept-Fachdienst - Prüfung und Entschlüsselung Prüfziffer Version 2 | [IG-TIFLOW-CORE-70](/core/query-api-task-req-fd.md) | core |
| [A_27346](https://gemspec.gematik.de/search/index.html?A_27346) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - URL hcv | [IG-TIFLOW-CORE-63](/core/query-api-task-req-fd.md) | core |
| [A_27347](https://gemspec.gematik.de/search/index.html?A_27347) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - VSDM - Vergleich hcv | [IG-TIFLOW-CORE-58](/core/query-api-task-req-fd.md) | core |
| [A_27444](https://gemspec.gematik.de/search/index.html?A_27444) | E-Rezept-Fachdienst – Rezepte lesen - Konfigurationsparameter RateLimit | [IG-TIFLOW-CORE-53](/core/query-api-task-req-fd.md) | core |
| [A_27445](https://gemspec.gematik.de/search/index.html?A_27445) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - Ratelimit pro Telematik-ID pro Tag | [IG-TIFLOW-CORE-54](/core/query-api-task-req-fd.md) | core |
| [A_27446](https://gemspec.gematik.de/search/index.html?A_27446) | E-Rezept-Fachdienst - Rezepte lesen - Apotheke - Ratelimit pro Telematik-ID prüfen | [IG-TIFLOW-CORE-55](/core/query-api-task-req-fd.md) | core |
| [A_27548](https://gemspec.gematik.de/search/index.html?A_27548) | E-Rezept-Fachdienst – Task markieren - alles Markieren verbieten | [IG-TIFLOW-CORE-82](/core/query-api-task-req-fd.md) | core |
| [A_27549](https://gemspec.gematik.de/search/index.html?A_27549) | E-Rezept-Fachdienst - Task markieren - Versicherter - Rollenprüfung Versicherter markiert Rezepte | [IG-TIFLOW-CORE-83](/core/query-api-task-req-fd.md) | core |
| [A_27550](https://gemspec.gematik.de/search/index.html?A_27550) | E-Rezept-Fachdienst -Task markieren -Versicherter - Prüfung KVNR | [IG-TIFLOW-CORE-84](/core/query-api-task-req-fd.md) | core |
| [A_27551](https://gemspec.gematik.de/search/index.html?A_27551) | E-Rezept-Fachdienst -Task markieren -Versicherter - FHIR-Validierung Parameters | [IG-TIFLOW-EU-21](/erp-eu/query-api-task-req-fd.md) | erp-eu |
| [A_27552](https://gemspec.gematik.de/search/index.html?A_27552) | E-Rezept-Fachdienst -Task markieren -Versicherter - Änderung Markierung Task Ressource | [IG-TIFLOW-EU-23](/erp-eu/query-api-task-req-fd.md) | erp-eu |
| [A_27566](https://gemspec.gematik.de/search/index.html?A_27566) | E-Rezept-Fachdienst - Abrechnungsinformation ändern (PATCH) - FHIR-Validierung Parameters | [IG-TIFLOW-CHRG-78](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_27580](https://gemspec.gematik.de/search/index.html?A_27580) | E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Statuswechsel Task | [IG-TIFLOW-EU-16](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27581](https://gemspec.gematik.de/search/index.html?A_27581) | E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Secret | [IG-TIFLOW-EU-17](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27582](https://gemspec.gematik.de/search/index.html?A_27582) | E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Task Owner | [IG-TIFLOW-EU-18](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27587](https://gemspec.gematik.de/search/index.html?A_27587) | E-Rezept-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage der aktuellsten Verordnungsinformationen | [IG-TIFLOW-EU-9](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27588](https://gemspec.gematik.de/search/index.html?A_27588) | E-Rezept-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage aller einlösbaren Verordnungsinformationen | [IG-TIFLOW-EU-10](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27589](https://gemspec.gematik.de/search/index.html?A_27589) | E-Rezept-Fachdienst - eu-prescription abfragen - Filter Status - Abfrage nach Liste Rezept-Ids | [IG-TIFLOW-EU-11](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_27648](https://gemspec.gematik.de/search/index.html?A_27648) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Existenz von Ressource.id | [IG-TIFLOW-CORE-210](/core/fhir-validate.md) | core |
| [A_27649](https://gemspec.gematik.de/search/index.html?A_27649) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Auflösbarkeit von Referenzen | [IG-TIFLOW-CORE-211](/core/fhir-validate.md) | core |
| [A_27658](https://gemspec.gematik.de/search/index.html?A_27658) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Datumsangabe ohne Zeitzoneninformation | [IG-TIFLOW-CORE-206](/core/fhir-validate.md) | core |
| [A_27698](https://gemspec.gematik.de/search/index.html?A_27698) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Eindeutige Angabe meta.profile | [IG-TIFLOW-CORE-207](/core/fhir-validate.md) | core |
| [A_27767-01](https://gemspec.gematik.de/search/index.html?A_27767-01) | E-Rezept-Fachdienst - Nachricht einstellen - Prüfung des Empfängers | [IG-TIFLOW-CORE-269](/core/query-api-communication-req-fd.md) | core |
| [A_27768](https://gemspec.gematik.de/search/index.html?A_27768) | E-Rezept-Fachdienst - Task aktivieren - Bestimmung der Einlösbarkeit im EU-Ausland | [IG-TIFLOW-RX-63](/rx/op-activate-req-fd.md) | rx |
| [A_27812](https://gemspec.gematik.de/search/index.html?A_27812) | E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - QES durch berechtigte Berufsgruppe | [IG-TIFLOW-RX-56](/rx/op-activate-req-fd.md) | rx |
| [A_27813](https://gemspec.gematik.de/search/index.html?A_27813) | E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - Prüfung Arzneimittelverordnung | [IG-TIFLOW-RX-58](/rx/op-activate-req-fd.md) | rx |
| [A_27814](https://gemspec.gematik.de/search/index.html?A_27814) | E-Rezept-Fachdienst - Task schließen - T-Rezept Daten an BfArM Webdienst bereitstellen | [IG-TIFLOW-RX-14](/rx/op-close-req-fd.md) | rx |
| [A_27817](https://gemspec.gematik.de/search/index.html?A_27817) | E-Rezept-Fachdienst - BfArM - Lokalisierung des BfArM Webdienstes | [IG-TIFLOW-BFARM-6](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27819](https://gemspec.gematik.de/search/index.html?A_27819) | Anbieter E-Rezept Fachdienst - BfArM - Registrierung für Client Credentials am BfArM Webdienst | [IG-TIFLOW-BFARM-1](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27820](https://gemspec.gematik.de/search/index.html?A_27820) | E-Rezept-Fachdienst - BfArM - Prüfung Gültigkeit AccessToken | [IG-TIFLOW-BFARM-2](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27821](https://gemspec.gematik.de/search/index.html?A_27821) | E-Rezept-Fachdienst - BfArM - Beziehen des AccessTokens | [IG-TIFLOW-BFARM-3](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27822](https://gemspec.gematik.de/search/index.html?A_27822) | E-Rezept-Fachdienst - BfArM - AccessToken für Zugriff auf den BfArM Webdienst | [IG-TIFLOW-BFARM-4](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27823](https://gemspec.gematik.de/search/index.html?A_27823) | E-Rezept-Fachdienst - BfArM - Flowtype 166 | [IG-TIFLOW-BFARM-7](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27824](https://gemspec.gematik.de/search/index.html?A_27824) | E-Rezept-Fachdienst - BfArM - asynchrone Bereitstellung und Übermittlung | [IG-TIFLOW-BFARM-8](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27825](https://gemspec.gematik.de/search/index.html?A_27825) | E-Rezept-Fachdienst - BfArM - Suche nach Apothekendaten | [IG-TIFLOW-BFARM-9](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27826](https://gemspec.gematik.de/search/index.html?A_27826) | E-Rezept-Fachdienst - BfArM - Erzeugen digitaler Durchschlag E-T-Rezept | [IG-TIFLOW-BFARM-10](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27827](https://gemspec.gematik.de/search/index.html?A_27827) | E-Rezept-Fachdienst - BfArM - Anwendungsfall Übertragen des digitalen Durchschlags | [IG-TIFLOW-BFARM-11](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27828](https://gemspec.gematik.de/search/index.html?A_27828) | E-Rezept-Fachdienst - BfArM - Übertragen des digitalen Durchschlags | [IG-TIFLOW-BFARM-12](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27830](https://gemspec.gematik.de/search/index.html?A_27830) | E-Rezept-Fachdienst - BfArM - Fehlerbehandlung - Reaktion auf Scheitern des Operationaufrufs | [IG-TIFLOW-BFARM-13](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27831](https://gemspec.gematik.de/search/index.html?A_27831) | E-Rezept-Fachdienst - BfArM - Fehlerbehandlung - Protokollierung struktureller Fehler | [IG-TIFLOW-BFARM-14](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_27882](https://gemspec.gematik.de/search/index.html?A_27882) | E-Rezept-Fachdienst - BfArM - Lokalisierung Konfigurationsparameter BfArM_Domain | [IG-TIFLOW-BFARM-5](/bfarm/query-api-t-register-req-fd.md) | bfarm |
| [A_28111](https://gemspec.gematik.de/search/index.html?A_28111) | E-Rezept-Fachdienst - Push Notifications - OpenApi_Notification_Fachdienst | [IG-TIFLOW-CORE-202](/core/query-api-pushers-req-fd.md) | core |
| [A_28112](https://gemspec.gematik.de/search/index.html?A_28112) | E-Rezept-Fachdienst - Push Notifcations - App-Registrierung - Rolle Versicherter | [IG-TIFLOW-CORE-205](/core/query-api-pushers-req-fd.md) | core |
| [A_28113](https://gemspec.gematik.de/search/index.html?A_28113) | E-Rezept-Fachdienst - Push Notifcations - App-Registrierungen abrufen - Rolle Versicherter | [IG-TIFLOW-CORE-203](/core/query-api-pushers-req-fd.md) | core |
| [A_28114](https://gemspec.gematik.de/search/index.html?A_28114) | E-Rezept-Fachdienst - unzulässige Operationen Pushers | [IG-TIFLOW-CORE-201](/core/query-api-pushers-req-fd.md) | core |
| [A_28115](https://gemspec.gematik.de/search/index.html?A_28115) | E-Rezept-Fachdienst - Push Notification senden - Nachrichteninhalt erzeugen | [IG-TIFLOW-CORE-181](/core/menu-technische-umsetzung-push.md) | core |
| [A_28116](https://gemspec.gematik.de/search/index.html?A_28116) | E-Rezept-Fachdienst - Push Notification senden - verpflichtende Verschlüsselung | [IG-TIFLOW-CORE-182](/core/menu-technische-umsetzung-push.md) | core |
| [A_28117](https://gemspec.gematik.de/search/index.html?A_28117) | E-Rezept-Fachdienst - Push Notifications - Channels - OpenApi_Notification_Fachdienst | [IG-TIFLOW-CORE-34](/core/query-api-channels-req-fd.md) | core |
| [A_28118](https://gemspec.gematik.de/search/index.html?A_28118) | E-Rezept-Fachdienst - Push Notifcations - Channels abrufen - Rolle Versicherter | [IG-TIFLOW-CORE-35](/core/query-api-channels-req-fd.md) | core |
| [A_28119](https://gemspec.gematik.de/search/index.html?A_28119) | E-Rezept-Fachdienst - Push Notifcations - Channels des Geräts abrufen - Rolle Versicherter | [IG-TIFLOW-CORE-36](/core/query-api-channels-req-fd.md) | core |
| [A_28120](https://gemspec.gematik.de/search/index.html?A_28120) | E-Rezept-Fachdienst - Push Notifcations - Channels konfigurieren - Rolle Versicherter | [IG-TIFLOW-CORE-37](/core/query-api-channels-req-fd.md) | core |
| [A_28121](https://gemspec.gematik.de/search/index.html?A_28121) | E-Rezept-Fachdienst - unzulässige Operationen Channels | [IG-TIFLOW-CORE-33](/core/query-api-channels-req-fd.md) | core |
| [A_28125](https://gemspec.gematik.de/search/index.html?A_28125) | E-Rezept-Fachdienst - Task abrufen - Vertreter - Push Notification Versicherter | [IG-TIFLOW-CORE-81](/core/query-api-task-req-fd.md) | core |
| [A_28126](https://gemspec.gematik.de/search/index.html?A_28126) | E-Rezept-Fachdienst - Task aktivieren - Push Notification Versicherter | [IG-TIFLOW-CORE-141](/core/op-activate-req-fd.md) | core |
| [A_28127](https://gemspec.gematik.de/search/index.html?A_28127) | E-Rezept-Fachdienst - Task akzeptieren - Push Notification Versicherter | [IG-TIFLOW-CORE-192](/core/op-accept-req-fd.md) | core |
| [A_28128](https://gemspec.gematik.de/search/index.html?A_28128) | E-Rezept-Fachdienst - Task zurückweisen - Push Notification Versicherter | [IG-TIFLOW-CORE-20](/core/op-reject-req-fd.md) | core |
| [A_28129](https://gemspec.gematik.de/search/index.html?A_28129) | E-Rezept-Fachdienst - Task schließen - Push Notification Versicherter | [IG-TIFLOW-CORE-42](/core/op-close-req-fd.md) | core |
| [A_28130](https://gemspec.gematik.de/search/index.html?A_28130) | E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Push Notification Versicherter | [IG-TIFLOW-RX-31](/rx/op-dispense-req-fd.md) | rx |
| [A_28131](https://gemspec.gematik.de/search/index.html?A_28131) | E-Rezept-Fachdienst - E-Rezept löschen - Push Notification Versicherter | [IG-TIFLOW-CORE-106](/core/op-abort-req-fd.md) | core |
| [A_28132](https://gemspec.gematik.de/search/index.html?A_28132) | E-Rezept-Fachdienst - Nachricht einstellen - Push Notification Versicherter | [IG-TIFLOW-CORE-276](/core/query-api-communication-req-fd.md) | core |
| [A_28133](https://gemspec.gematik.de/search/index.html?A_28133) | E-Rezept-Fachdienst - Abrechnungsinformation bereitstellen - Push Notification Versicherter | [IG-TIFLOW-CHRG-74](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_28134](https://gemspec.gematik.de/search/index.html?A_28134) | E-Rezept-Fachdienst - Abrechnungsinformation ändern - Push Notification Versicherter | [IG-TIFLOW-CHRG-90](/erp-chrg/query-api-chargeitem-req-fd.md) | erp-chrg |
| [A_28135](https://gemspec.gematik.de/search/index.html?A_28135) | E-Rezept-Fachdienst - Push Notification senden - Referenz auf Protokolleintrag | [IG-TIFLOW-CORE-183](/core/menu-technische-umsetzung-push.md) | core |
| [A_28204](https://gemspec.gematik.de/search/index.html?A_28204) | E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage aller einlösbaren Verordnungsinformationen - Push Notification Versicherter | [IG-TIFLOW-EU-19](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_28205](https://gemspec.gematik.de/search/index.html?A_28205) | E-Rezept-Fachdienst - eu-prescription abfragen - Abfrage nach Liste Rezept-Ids - Push Notification Versicherter | [IG-TIFLOW-EU-20](/erp-eu/op-get-eu-prescriptions-req-fd.md) | erp-eu |
| [A_28206](https://gemspec.gematik.de/search/index.html?A_28206) | E-Rezept-Fachdienst - Task schließen - EU - Push Notification Versicherter | [IG-TIFLOW-EU-44](/erp-eu/op-eu-close-req-fd.md) | erp-eu |

#### Nicht übernommene Anforderungen

| | |
| :--- | :--- |
| [A_19130](https://gemspec.gematik.de/search/index.html?A_19130) | E-Rezept-Fachdienst - Authentifizierung erforderlich LEI-Endpunkt |
| [A_19131](https://gemspec.gematik.de/search/index.html?A_19131) | E-Rezept-Fachdienst - Authentifizierung ungültig |
| [A_19260](https://gemspec.gematik.de/search/index.html?A_19260) | E-Rezept-Fachdienst – Ausschluss unbekannter FdV-Versionsnummern von der Kommunikation |
| [A_19261-01](https://gemspec.gematik.de/search/index.html?A_19261-01) | E-Rezept-Fachdienst – Ausschluss von Client-Versionen |
| [A_19262](https://gemspec.gematik.de/search/index.html?A_19262) | E-Rezept-Fachdienst - Transportverschlüsselte Übertragung von Daten mit PVS |
| [A_19263](https://gemspec.gematik.de/search/index.html?A_19263) | E-Rezept-Fachdienst - Transportverschlüsselte Übertragung von Daten mit AVS |
| [A_19264](https://gemspec.gematik.de/search/index.html?A_19264) | E-Rezept-Fachdienst - Transportverschlüsselte Übertragung von Daten mit FdV |
| [A_19265](https://gemspec.gematik.de/search/index.html?A_19265) | E-Rezept-Fachdienst – vertrauliche Kommunikation |
| [A_19266](https://gemspec.gematik.de/search/index.html?A_19266) | E-Rezept-Fachdienst - Berücksichtigung OWASP-Top-10-Risiken |
| [A_19267](https://gemspec.gematik.de/search/index.html?A_19267) | E-Rezept-Fachdienst - Authentisierung gegenüber Clients |
| [A_19282](https://gemspec.gematik.de/search/index.html?A_19282) | E-Rezept-Fachdienst - Systemprotokoll für Betriebszustand |
| [A_19283](https://gemspec.gematik.de/search/index.html?A_19283) | E-Rezept-Fachdienst - Systemprotokoll ohne personenbezogene und ohne medizinische Daten |
| [A_19389](https://gemspec.gematik.de/search/index.html?A_19389) | E-Rezept-Fachdienst - Authentifizierung erforderlich Vers-Endpunkt |
| [A_19390-01](https://gemspec.gematik.de/search/index.html?A_19390-01) | E-Rezept-Fachdienst - Authentifizierung Nutzerrolle |
| [A_19391-01](https://gemspec.gematik.de/search/index.html?A_19391-01) | E-Rezept-Fachdienst - Authentifizierung Nutzername |
| [A_19392-01](https://gemspec.gematik.de/search/index.html?A_19392-01) | E-Rezept-Fachdienst - Authentifizierung Nutzerkennung |
| [A_19412-05](https://gemspec.gematik.de/search/index.html?A_19412-05) | Anbieter E-Rezept-Fachdienst - Schnittstellenadressierung Primärsysteme |
| [A_19439-04](https://gemspec.gematik.de/search/index.html?A_19439-04) | E-Rezept-Fachdienst - Authentifizierung Authentifizierungsstärke |
| [A_19586](https://gemspec.gematik.de/search/index.html?A_19586) | Anbieter E-Rezept-Fachdienst Speicherung Schlüsselmaterial in HSM |
| [A_19678](https://gemspec.gematik.de/search/index.html?A_19678) | E-Rezept-Fachdienst -Systemprotokoll Verfügbarkeit interner Logdaten |
| [A_19683](https://gemspec.gematik.de/search/index.html?A_19683) | E-Rezept-Fachdienst – Umsetzung der fachlichen Operationen in einer Vertrauenswürdigen Ausführungsumgebung (VAU) |
| [A_19684](https://gemspec.gematik.de/search/index.html?A_19684) | E-Rezept-Fachdienst – Verarbeitungskontext der VAU |
| [A_19688](https://gemspec.gematik.de/search/index.html?A_19688) | E-Rezept-Fachdienst – Verschlüsselung von außerhalb des Verarbeitungskontextes der VAU gespeicherten Daten |
| [A_19694](https://gemspec.gematik.de/search/index.html?A_19694) | E-Rezept-Fachdienst – Geschützte Weitergabe von Daten an autorisierte Nutzer durch die VAU |
| [A_19695](https://gemspec.gematik.de/search/index.html?A_19695) | E-Rezept-Fachdienst - Android Digital Asset Link |
| [A_19699](https://gemspec.gematik.de/search/index.html?A_19699) | E-Rezept-Fachdienst – Ableitung der Persistenzschlüssel durch ein HSM |
| [A_19700](https://gemspec.gematik.de/search/index.html?A_19700) | E-Rezept-Fachdienst - Ableitung der Persistenzschlüssel aus Merkmal der E-Rezepte |
| [A_19702](https://gemspec.gematik.de/search/index.html?A_19702) | E-Rezept-Fachdienst – Isolation zwischen Datenverarbeitungsprozessen mehrerer Verarbeitungskontexte der VAU |
| [A_19704](https://gemspec.gematik.de/search/index.html?A_19704) | E-Rezept-Fachdienst – Isolation der VAU von Datenverarbeitungsprozessen des Anbieters |
| [A_19706](https://gemspec.gematik.de/search/index.html?A_19706) | vE-Rezept-Fachdienst – Ausschluss von Manipulationen an der Software der VAU |
| [A_19707](https://gemspec.gematik.de/search/index.html?A_19707) | E-Rezept-Fachdienst – Ausschluss von Manipulationen an der Hardware der VAU |
| [A_19708](https://gemspec.gematik.de/search/index.html?A_19708) | E-Rezept-Fachdienst – Kontinuierliche Wirksamkeit des Manipulationsschutzes der VAU |
| [A_19709](https://gemspec.gematik.de/search/index.html?A_19709) | E-Rezept-Fachdienst – Kein physischer Zugang des Anbieters zu Systemen der VAU |
| [A_19710](https://gemspec.gematik.de/search/index.html?A_19710) | E-Rezept-Fachdienst – Nutzdatenbereinigung vor physischem Zugang zu Systemen der VAU |
| [A_19711-01](https://gemspec.gematik.de/search/index.html?A_19711-01) | E-Rezept-Fachdienst – Private Schlüssel von Dienstzertifikaten im HSM |
| [A_19712](https://gemspec.gematik.de/search/index.html?A_19712) | E-Rezept-Fachdienst – Einsatz zertifizierter HSM |
| [A_19713](https://gemspec.gematik.de/search/index.html?A_19713) | E-Rezept-Fachdienst – HSM-Kryptographieschnittstelle verfügbar nur für Instanzen der VAU |
| [A_19714](https://gemspec.gematik.de/search/index.html?A_19714) | E-Rezept-Fachdienst – Sicherer Kanal vom Client zum Verarbeitungskontext der VAU |
| [A_19715](https://gemspec.gematik.de/search/index.html?A_19715) | E-Rezept-Fachdienst – Konsistenter Systemzustand des Verarbeitungskontextes der VAU |
| [A_19716](https://gemspec.gematik.de/search/index.html?A_19716) | E-Rezept-Fachdienst – Datenschutzkonformes Logging und Monitoring des Verarbeitungskontextes der VAU |
| [A_19719](https://gemspec.gematik.de/search/index.html?A_19719) | E-Rezept-Fachdienst – Verarbeitungskontexte der VAU über gemeinsame Host-Adressen erreichbar |
| [A_19720](https://gemspec.gematik.de/search/index.html?A_19720) | E-Rezept-Fachdienst – Verbindungen von Clients zu Verarbeitungskontexten der VAU über den Eingangspunkt |
| [A_19721](https://gemspec.gematik.de/search/index.html?A_19721) | E-Rezept-Fachdienst – Sicherer Kanal zum Verarbeitungskontext der VAU auf Inhaltsebene |
| [A_19722](https://gemspec.gematik.de/search/index.html?A_19722) | E-Rezept-Fachdienst – Automatisierter Abbau des sicheren Kanals |
| [A_19724](https://gemspec.gematik.de/search/index.html?A_19724) | E-Rezept-Fachdienst – Identität des Verarbeitungskontextes für Clients |
| [A_19726-01](https://gemspec.gematik.de/search/index.html?A_19726-01) | E-Rezept-Fachdienst – Unabhängige Skalierung der Dienst-Ressourcen für verschiedene Anwendergruppen |
| [A_19813](https://gemspec.gematik.de/search/index.html?A_19813) | E-Rezept-Fachdienst – Sicherung zum Transportnetz Internet durch Paketfilter |
| [A_19814](https://gemspec.gematik.de/search/index.html?A_19814) | E-Rezept-Fachdienst – Platzierung des Paketfilters Internet |
| [A_19815-03](https://gemspec.gematik.de/search/index.html?A_19815-03) | E-Rezept-Fachdienst – Richtlinien für den Paketfilter zum Internet |
| [A_19823](https://gemspec.gematik.de/search/index.html?A_19823) | E-Rezept-Fachdienst – Richtlinien zum TLS-Verbindungsaufbau |
| [A_19824](https://gemspec.gematik.de/search/index.html?A_19824) | E-Rezept-Fachdienst – Verhalten bei Vollauslastung |
| [A_19985-03](https://gemspec.gematik.de/search/index.html?A_19985-03) | Anbieter E-Rezept-Fachdienst - Registrierung beim IDP als Relying Party |
| [A_19986-01](https://gemspec.gematik.de/search/index.html?A_19986-01) | Anbieter E-Rezept-Fachdienst - E-Rezept-Sessiondauer im IDP |
| [A_19992-01](https://gemspec.gematik.de/search/index.html?A_19992-01) | E-Rezept-Fachdienst - Blocklisting zu häufig verwendeter ACCESS_TOKEN |
| [A_19993-01](https://gemspec.gematik.de/search/index.html?A_19993-01) | E-Rezept-Fachdienst - Prüfung eingehender ACCESS_TOKEN |
| [A_20001](https://gemspec.gematik.de/search/index.html?A_20001) | E-Rezept-Fachdienst -Systemprotokoll zu Ergebnis einer aufgerufenen Operation |
| [A_20013-01](https://gemspec.gematik.de/search/index.html?A_20013-01) | E-Rezept-Fachdienst - Erkennung Clientsystem User-Agent |
| [A_20022](https://gemspec.gematik.de/search/index.html?A_20022) | E-Rezept-Fachdienst - OCSP-Status für das OCSP-Stapling |
| [A_20023](https://gemspec.gematik.de/search/index.html?A_20023) | E-Rezept-Fachdienst - Bereitstellung TSL |
| [A_20024-01](https://gemspec.gematik.de/search/index.html?A_20024-01) | E-Rezept-Fachdienst - Bereitstellung OCSP-Forwarder |
| [A_20025](https://gemspec.gematik.de/search/index.html?A_20025) | E-Rezept-Fachdienst - Caching OCSP-Antworten |
| [A_20026](https://gemspec.gematik.de/search/index.html?A_20026) | E-Rezept-Fachdienst - OCSP-Stapling |
| [A_20158-02](https://gemspec.gematik.de/search/index.html?A_20158-02) | E-Rezept-Fachdienst - Prüfung Signaturzertifikat IDP |
| [A_20703](https://gemspec.gematik.de/search/index.html?A_20703) | E-Rezept-Fachdienst - Drosselung Brute-Force-Anfragen |
| [A_20704](https://gemspec.gematik.de/search/index.html?A_20704) | E-Rezept-Fachdienst - Drosselung Rezeptfälschungen |
| [A_20705](https://gemspec.gematik.de/search/index.html?A_20705) | Anbieter E-Rezept-Fachdienst - Konfiguration und Deaktivierung Drosselung |
| [A_20706-02](https://gemspec.gematik.de/search/index.html?A_20706-02) | Anbieter E-Rezept-Fachdienst - Claims für ID_TOKEN für FdV |
| [A_20710-01](https://gemspec.gematik.de/search/index.html?A_20710-01) | Anbieter E-Rezept-Fachdienst - E-Rezept-Lebensdauer ACCESS_TOKEN |
| [A_20751](https://gemspec.gematik.de/search/index.html?A_20751) | E-Rezept-Fachdienst - Erkennen der Prüfidentität |
| [A_20752](https://gemspec.gematik.de/search/index.html?A_20752) | E-Rezept-Fachdienst - Ausschluss Vertreterkommunikation von bzw. an Prüf-Identität |
| [A_20753](https://gemspec.gematik.de/search/index.html?A_20753) | E-Rezept-Fachdienst - Ausschluss Vertreterzugriff auf bzw. mittels Prüf-Identität |
| [A_20765-02](https://gemspec.gematik.de/search/index.html?A_20765-02) | E-Rezept-Fachdienst - Prüfung Signaturzertifikat E-Rezept-Fachdienst |
| [A_20974-01](https://gemspec.gematik.de/search/index.html?A_20974-01) | E-Rezept-Fachdienst - Prüfungsintervall Signaturzertifikat E-Rezept-Fachdienst |
| [A_21267-01](https://gemspec.gematik.de/search/index.html?A_21267-01) | Prozessparameter - Berechtigungen für Nutzer |
| [A_21551](https://gemspec.gematik.de/search/index.html?A_21551) | E-Rezept-Fachdienst - Prozess zur Verwaltung von API-KEYs |
| [A_21552](https://gemspec.gematik.de/search/index.html?A_21552) | E-Rezept-Fachdienst - Zuordnung Abfrageursprung Client |
| [A_21571](https://gemspec.gematik.de/search/index.html?A_21571) | E-Rezept-Fachdienst - Routing-Informationen X-erp-resource |
| [A_21572-01](https://gemspec.gematik.de/search/index.html?A_21572-01) | E-Rezept-Fachdienst - Routing-Informationen X-erp-user |
| [A_21782-02](https://gemspec.gematik.de/search/index.html?A_21782-02) | Anbieter E-Rezept-Fachdienst - Schnittstellenadressierung Internet |
| [A_22221](https://gemspec.gematik.de/search/index.html?A_22221) | Anbieter E-Rezept-Fachdienst - Erneuerung Signaturzertifikat |
| [A_22927-02](https://gemspec.gematik.de/search/index.html?A_22927-02) | E-Rezept-Fachdienst - FHIR-Ressource validieren - Ausschluss unspezifizierter Extensions |
| [A_23482](https://gemspec.gematik.de/search/index.html?A_23482) | Anbieter E-Rezept-Fachdienst - Bereitstellung Exportpaket VSDM HMAC-Schlüssel |
| [A_23483](https://gemspec.gematik.de/search/index.html?A_23483) | Anbieter E-Rezept-Fachdienst - Prüfung Exportpaket VSDM HMAC-Schlüssel |
| [A_23484](https://gemspec.gematik.de/search/index.html?A_23484) | Anbieter E-Rezept-Fachdienst - Prüfung Exportpaket VSDM HMAC-Schlüssel - Information Fachdienstbetreiber VSDM |
| [A_23485](https://gemspec.gematik.de/search/index.html?A_23485) | Anbieter E-Rezept-Fachdienst - Löschen VSDM HMAC-Schlüssel |
| [A_23486](https://gemspec.gematik.de/search/index.html?A_23486) | E-Rezept-Fachdienst - VSDM HMAC-Schlüssel - Ausgabe |
| [A_23492](https://gemspec.gematik.de/search/index.html?A_23492) | E-Rezept-Fachdienst - VSDM HMAC-Schlüssel - Exportpaket einbringen |
| [A_23493](https://gemspec.gematik.de/search/index.html?A_23493) | E-Rezept-Fachdienst - VSDM HMAC-Schlüssel - Prüfung |
| [A_23501](https://gemspec.gematik.de/search/index.html?A_23501) | E-Rezept-Fachdienst – VSDM HMAC-Schlüssel - Verarbeitung in VAU |
| [A_25200](https://gemspec.gematik.de/search/index.html?A_25200) | E-Rezept-Fachdienst - Status AcceptPN3 |
| [A_25201](https://gemspec.gematik.de/search/index.html?A_25201) | E-Rezept-Fachdienst - Status AcceptPN3Automatic |
| [A_25202](https://gemspec.gematik.de/search/index.html?A_25202) | E-Rezept-Fachdienst - Konfigurationsparameter NumberApothekenPN3 |
| [A_25203](https://gemspec.gematik.de/search/index.html?A_25203) | E-Rezept-Fachdienst - Betrieblicher Prozess Änderung AcceptPN3, AcceptPN3Automatic, NumberApothekenPN3 |
| [A_25204](https://gemspec.gematik.de/search/index.html?A_25204) | E-Rezept-Fachdienst - AcceptPN3 - automatisch Aktivieren |
| [A_25205](https://gemspec.gematik.de/search/index.html?A_25205) | E-Rezept-Fachdienst - AcceptPN3 - automatisch Deaktivieren |
| [A_25371](https://gemspec.gematik.de/search/index.html?A_25371) | E-Rezept-Fachdienst - Konfigurationsparameter AcceptPN3Interval |
| [A_25372](https://gemspec.gematik.de/search/index.html?A_25372) | E-Rezept-Fachdienst - AcceptPN3 - Anzahl Apotheken mit PN3 |
| [A_26577](https://gemspec.gematik.de/search/index.html?A_26577) | E-Rezept-Fachdienst - Blocklisting unlauterer Clientsysteme an der Internet-Schnittstelle |
| [A_26578](https://gemspec.gematik.de/search/index.html?A_26578) | E-Rezept-Fachdienst - Blocklisting unlauterer Clientsysteme an der TI-Schnittstelle |
| [A_26579](https://gemspec.gematik.de/search/index.html?A_26579) | E-Rezept Fachdienst - Drosselung User Agent Aufrufe |
| [A_27560](https://gemspec.gematik.de/search/index.html?A_27560) | E-Rezept-Fachdienst - Pseudonymisieren der gematik-Logdaten - Geheimer Schlüssel für nur in VAU |
| [A_27561](https://gemspec.gematik.de/search/index.html?A_27561) | E-Rezept-Fachdienst - Pseudonymisieren der gematik-Logdaten - Möglichkeit zum Einbringen des Schlüssels im 4-Augen-Prinzip |
| [A_27562](https://gemspec.gematik.de/search/index.html?A_27562) | Anbieter E-Rezept-Fachdienst - Pseudonymisieren der gematik-Logdaten - Einbringen des Schlüssels im 4-Augen-Prinzip |
| [A_27563](https://gemspec.gematik.de/search/index.html?A_27563) | Anbieter E-Rezept-Fachdienst - Pseudonymisieren der gematik-Logdaten - unverzüglicher Schlüsselwechsel |
| [A_27859](https://gemspec.gematik.de/search/index.html?A_27859) | E-Rezept-Fachdienst - Zugriff auf Webdienste - Deaktivieren von Übertragungen |
| [A_27860](https://gemspec.gematik.de/search/index.html?A_27860) | Anbieter E-Rezept-Fachdienst - Zugriff auf Webdienste - Betrieblicher Prozess Deaktivieren von Übertragungen |

### gemSpec_eRp_FdV

#### Übernommene Anforderungen

| | | | |
| :--- | :--- | :--- | :--- |
| [A_19203](https://gemspec.gematik.de/search/index.html?A_19203) | E-Rezept-FdV: E-Rezept zuweisen - Nachricht auf E-Rezept-Fachdienst einstellen | [IG-TIFLOW-CORE-47](/core/query-api-communication-req-fdv.md) | core |
| [A_19205](https://gemspec.gematik.de/search/index.html?A_19205) | E-Rezept-FdV: Nachrichten anzeigen - Nachrichten herunterladen | [IG-TIFLOW-CORE-46](/core/query-api-communication-req-fdv.md) | core |
| [A_19219-01](https://gemspec.gematik.de/search/index.html?A_19219-01) | E-Rezept-FdV: E-Rezept löschen - E-Rezept zum Löschen auswählen | [IG-TIFLOW-CORE-23](/core/op-abort-req-fdv.md) | core |
| [A_19220-01](https://gemspec.gematik.de/search/index.html?A_19220-01) | E-Rezept-FdV: E-Rezept löschen - Bestätigung | [IG-TIFLOW-CORE-25](/core/op-abort-req-fdv.md) | core |
| [A_19221-02](https://gemspec.gematik.de/search/index.html?A_19221-02) | E-Rezept-FdV: E-Rezept löschen | [IG-TIFLOW-CORE-26](/core/op-abort-req-fdv.md) | core |
| [A_19222-01](https://gemspec.gematik.de/search/index.html?A_19222-01) | E-Rezept-FdV: E-Rezept löschen - Löschrequest | [IG-TIFLOW-CORE-27](/core/op-abort-req-fdv.md) | core |
| [A_19223-01](https://gemspec.gematik.de/search/index.html?A_19223-01) | E-Rezept-FdV: E-Rezept löschen - E-Rezept-Token löschen | [IG-TIFLOW-CORE-28](/core/op-abort-req-fdv.md) | core |
| [A_19345](https://gemspec.gematik.de/search/index.html?A_19345) | E-Rezept-FdV: Abgabeinformationen abfragen - MedicationDispense abrufen | [IG-TIFLOW-CORE-279](/core/query-api-medicationdispense-req-fdv.md) | core |
| [A_19347-01](https://gemspec.gematik.de/search/index.html?A_19347-01) | E-Rezept-FdV: E-Rezepte abrufen - Liste E-Rezepte abrufen | [IG-TIFLOW-CORE-154](/core/query-api-task-req-fdv.md) | core |
| [A_19348-01](https://gemspec.gematik.de/search/index.html?A_19348-01) | E-Rezept-FdV: E-Rezept abrufen - E-Rezepte lokal speichern | [IG-TIFLOW-CORE-155](/core/query-api-task-req-fdv.md) | core |
| [A_19350-01](https://gemspec.gematik.de/search/index.html?A_19350-01) | E-Rezept-FdV: E-Rezepte abrufen -Spezifisches E-Rezept herunterladen | [IG-TIFLOW-CORE-156](/core/query-api-task-req-fdv.md) | core |
| [A_19351-01](https://gemspec.gematik.de/search/index.html?A_19351-01) | E-Rezept-FdV: E-Rezepte abrufen - E-Rezept mit AccessCode herunterladen | [IG-TIFLOW-CORE-157](/core/query-api-task-req-fdv.md) | core |
| [A_21361-02](https://gemspec.gematik.de/search/index.html?A_21361-02) | E-Rezept-FdV: Vertreterkommunikation - Flowtype 169 / 209 - Vertreterkommunikation nicht zulässig | [IG-TIFLOW-RX-19](/rx/query-api-communication-req-fdv.md) | rx |
| [A_21362-02](https://gemspec.gematik.de/search/index.html?A_21362-02) | E-Rezept-FdV: E-Rezept löschen - Flowtype 169 / 209 - nur wenn beliefert | [IG-TIFLOW-RX-7](/rx/op-abort-req-fdv.md) | rx |
| [A_21402-02](https://gemspec.gematik.de/search/index.html?A_21402-02) | E-Rezept-FdV: Anfrage Belieferung - Flowtype 162 / 169 / 209 - Anfrage nicht zulässig | [IG-TIFLOW-RX-15](/rx/query-api-communication-req-fdv.md)[IG-TIFLOW-RX-16](/rx/query-api-communication-req-fdv.md) | rx |
| [A_21403-02](https://gemspec.gematik.de/search/index.html?A_21403-02) | E-Rezept-FdV: E-Rezept zuweisen - Flowtype 169 / 209 - Zuweisen nicht zulässig | [IG-TIFLOW-RX-16](/rx/query-api-communication-req-fdv.md) | rx |
| [A_21526-01](https://gemspec.gematik.de/search/index.html?A_21526-01) | E-Rezept-FdV: Nachricht löschen - Löschrequest | [IG-TIFLOW-CORE-48](/core/query-api-communication-req-fdv.md) | core |
| [A_22163-02](https://gemspec.gematik.de/search/index.html?A_22163-02) | E-Rezept-FdV: Einwilligung erteilen - Einwilligung eingeben | [IG-TIFLOW-CORE-214](/core/query-api-consent-req-fdv.md) | core |
| [A_22165-01](https://gemspec.gematik.de/search/index.html?A_22165-01) | E-Rezept-FdV: Einwilligung erteilen - Consent Ressource erstellen | [IG-TIFLOW-CORE-215](/core/query-api-consent-req-fdv.md) | core |
| [A_22166-01](https://gemspec.gematik.de/search/index.html?A_22166-01) | E-Rezept-FdV: Einwilligung erteilen - Speicherrequest | [IG-TIFLOW-CORE-216](/core/query-api-consent-req-fdv.md) | core |
| [A_22168-02](https://gemspec.gematik.de/search/index.html?A_22168-02) | E-Rezept-FdV: Einwilligungsinformation abrufen - Abfragerequest | [IG-TIFLOW-CORE-217](/core/query-api-consent-req-fdv.md) | core |
| [A_22169-02](https://gemspec.gematik.de/search/index.html?A_22169-02) | E-Rezept-FdV: Einwilligung widerrufen - Widerruf eingeben | [IG-TIFLOW-CORE-218](/core/query-api-consent-req-fdv.md) | core |
| [A_22171-01](https://gemspec.gematik.de/search/index.html?A_22171-01) | E-Rezept-FdV: Einwilligung widerrufen - Löschrequest | [IG-TIFLOW-CORE-220](/core/query-api-consent-req-fdv.md) | core |
| [A_22176-01](https://gemspec.gematik.de/search/index.html?A_22176-01) | E-Rezept-FdV: Abrechnungsinformation markieren - Markierungen auswählen | [IG-TIFLOW-CHRG-20](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_22179-01](https://gemspec.gematik.de/search/index.html?A_22179-01) | E-Rezept-FdV: Abrechnungsinformation markieren - Speicherrequest | [IG-TIFLOW-CHRG-21](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_22180-01](https://gemspec.gematik.de/search/index.html?A_22180-01) | E-Rezept-FdV: Abrechnungsinformation löschen - Abrechnungsinformationen zum Löschen auswählen | [IG-TIFLOW-CHRG-23](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_22181-01](https://gemspec.gematik.de/search/index.html?A_22181-01) | E-Rezept-FdV: Abrechnungsinformation löschen - Bestätigung | [IG-TIFLOW-CHRG-24](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_22184-02](https://gemspec.gematik.de/search/index.html?A_22184-02) | E-Rezept-FdV: Abrechnungsinformation exportieren - PDF/A erstellen | [IG-TIFLOW-CHRG-13](/erp-chrg/menu-technische-umsetzung-verarbeitungsregeln.md) | erp-chrg |
| [A_22185-01](https://gemspec.gematik.de/search/index.html?A_22185-01) | E-Rezept-FdV: Abrechnungsinformation exportieren - PDF teilen | [IG-TIFLOW-CHRG-14](/erp-chrg/menu-technische-umsetzung-verarbeitungsregeln.md) | erp-chrg |
| [A_22330-02](https://gemspec.gematik.de/search/index.html?A_22330-02) | E-Rezept-FdV: Einwilligung widerrufen - Bestätigung | [IG-TIFLOW-CORE-219](/core/query-api-consent-req-fdv.md) | core |
| [A_22707-01](https://gemspec.gematik.de/search/index.html?A_22707-01) | E-Rezept-FdV: Hinweis automatisches Löschen Abrechnungsinformationen | [IG-TIFLOW-CHRG-26](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_22709-02](https://gemspec.gematik.de/search/index.html?A_22709-02) | E-Rezept-FdV: Einwilligung erteilen - Einwilligungstext | [IG-TIFLOW-CORE-213](/core/query-api-consent-req-fdv.md) | core |
| [A_22726-01](https://gemspec.gematik.de/search/index.html?A_22726-01) | E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen - E-Rezept auswählen | [IG-TIFLOW-CHRG-9](/erp-chrg/menu-technische-umsetzung-verarbeitungsregeln.md) | erp-chrg |
| [A_22727-01](https://gemspec.gematik.de/search/index.html?A_22727-01) | E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen - Abrechnungsinformation-Token erstellen | [IG-TIFLOW-CHRG-10](/erp-chrg/menu-technische-umsetzung-verarbeitungsregeln.md) | erp-chrg |
| [A_22728-01](https://gemspec.gematik.de/search/index.html?A_22728-01) | E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen | [IG-TIFLOW-CHRG-11](/erp-chrg/menu-technische-umsetzung-verarbeitungsregeln.md) | erp-chrg |
| [A_22735-01](https://gemspec.gematik.de/search/index.html?A_22735-01) | E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - E-Rezept auswählen | [IG-TIFLOW-CHRG-2](/erp-chrg/query-api-communication-req-fdv.md) | erp-chrg |
| [A_22737-01](https://gemspec.gematik.de/search/index.html?A_22737-01) | E-Rezept-FdV: Abrechnungsinformation-Token übermitteln - freie Textnachricht | [IG-TIFLOW-CHRG-4](/erp-chrg/query-api-communication-req-fdv.md) | erp-chrg |
| [A_24023-03](https://gemspec.gematik.de/search/index.html?A_24023-03) | E-Rezept-FdV: E-Rezepte löschen - Coverage PKV - Warnung Abgabeinformationen | [IG-TIFLOW-CORE-24](/core/op-abort-req-fdv.md) | core |
| [A_24544](https://gemspec.gematik.de/search/index.html?A_24544) | E-Rezept-FdV: optional: Abrechnungsinformation abrufen | [IG-TIFLOW-CHRG-17](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_24546](https://gemspec.gematik.de/search/index.html?A_24546) | E-Rezept-FdV: optional: Abrechnungsinformation löschen | [IG-TIFLOW-CHRG-22](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_24553](https://gemspec.gematik.de/search/index.html?A_24553) | E-Rezept-FdV: optional: Abrechnungsinformation markieren | [IG-TIFLOW-CHRG-19](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_24554](https://gemspec.gematik.de/search/index.html?A_24554) | E-Rezept-FdV: optional: Liste Abrechnungsinformationen abrufen | [IG-TIFLOW-CHRG-15](/erp-chrg/query-api-chargeitem-req-fdv.md) | erp-chrg |
| [A_24555](https://gemspec.gematik.de/search/index.html?A_24555) | E-Rezept-FdV: optional: Abrechnungsinformation exportieren | [IG-TIFLOW-CHRG-12](/erp-chrg/menu-technische-umsetzung-verarbeitungsregeln.md) | erp-chrg |
| [A_24563](https://gemspec.gematik.de/search/index.html?A_24563) | E-Rezept-FdV: optional: Abrechnungsinformation-Token übermitteln | [IG-TIFLOW-CHRG-1](/erp-chrg/query-api-communication-req-fdv.md) | erp-chrg |
| [A_24577](https://gemspec.gematik.de/search/index.html?A_24577) | E-Rezept-FdV: optional: 2D-Code Abrechnungsinformation anzeigen | [IG-TIFLOW-CHRG-8](/erp-chrg/menu-technische-umsetzung-verarbeitungsregeln.md) | erp-chrg |
| [A_26007](https://gemspec.gematik.de/search/index.html?A_26007) | E-Rezept-FdV: E-Rezept zuweisen - Flowtype 162 - Kostenträger auswählen | [IG-TIFLOW-DIGA-5](/diga/query-api-communication-req-fdv.md) | diga |
| [A_26009](https://gemspec.gematik.de/search/index.html?A_26009) | E-Rezept-FdV: optional: Kostenträger suchen | [IG-TIFLOW-DIGA-7](/diga/api-add-fhirvzd.md) | diga |
| [A_26010](https://gemspec.gematik.de/search/index.html?A_26010) | E-Rezept-FdV: Kostenträger suchen - IKNR aus ACCESS_TOKEN beziehen | [IG-TIFLOW-DIGA-8](/diga/api-add-fhirvzd.md) | diga |
| [A_26011](https://gemspec.gematik.de/search/index.html?A_26011) | E-Rezept-FdV: Kostenträger suchen - Telematik-ID im Verzeichnisdienst suchen | [IG-TIFLOW-DIGA-9](/diga/api-add-fhirvzd.md) | diga |
| [A_26012](https://gemspec.gematik.de/search/index.html?A_26012) | E-Rezept-FdV: Kostenträger Suchen - Liste verfügbarer Kostenträger ermitteln | [IG-TIFLOW-DIGA-10](/diga/api-add-fhirvzd.md) | diga |
| [A_26013](https://gemspec.gematik.de/search/index.html?A_26013) | E-Rezept-FdV: Abgabeinformationen abfragen - Flowtyp 162 - Anzeige des Freischaltcodes | [IG-TIFLOW-DIGA-21](/diga/query-api-medicationdispense-req-fdv.md) | diga |
| [A_26082](https://gemspec.gematik.de/search/index.html?A_26082) | E-Rezept-FdV: E-Rezept löschen - Hinweis zu Daten in ePA | [IG-TIFLOW-CORE-21](/core/op-abort-req-fdv.md) | core |
| [A_26326](https://gemspec.gematik.de/search/index.html?A_26326) | E-Rezept-FdV: E-Rezept zuweisen - Beginn Gültigkeit prüfen | [IG-TIFLOW-RX-18](/rx/query-api-communication-req-fdv.md) | rx |
| [A_26340](https://gemspec.gematik.de/search/index.html?A_26340) | E-Rezept-FdV: Abgabeinformationen abfragen - Flowtyp 162 - Supportinformationen für DiGA-App | [IG-TIFLOW-DIGA-22](/diga/query-api-medicationdispense-req-fdv.md) | diga |
| [A_27109](https://gemspec.gematik.de/search/index.html?A_27109) | E-Rezept-FdV: Zugriffsberechtigung - Liste zulässiger Länder | [IG-TIFLOW-EU-48](/erp-eu/op-grant-eu-access-permission-req-fdv.md) | erp-eu |
| [A_27110](https://gemspec.gematik.de/search/index.html?A_27110) | E-Rezept-FdV: Zugriffsberechtigung - Caching Liste zulässiger Länder | [IG-TIFLOW-EU-49](/erp-eu/op-grant-eu-access-permission-req-fdv.md) | erp-eu |
| [A_27111](https://gemspec.gematik.de/search/index.html?A_27111) | E-Rezept-FdV: Zugriffsberechtigung erteilen - Land auswählen | [IG-TIFLOW-EU-50](/erp-eu/op-grant-eu-access-permission-req-fdv.md) | erp-eu |
| [A_27113](https://gemspec.gematik.de/search/index.html?A_27113) | E-Rezept-FdV: Zugriffsberechtigung erteilen - Zugriffscode erzeugen | [IG-TIFLOW-EU-51](/erp-eu/op-grant-eu-access-permission-req-fdv.md) | erp-eu |
| [A_27114](https://gemspec.gematik.de/search/index.html?A_27114) | E-Rezept-FdV: Zugriffsberechtigung erteilen - Zugriffsberechtigung am E-Rezept-Fachdienst speichern | [IG-TIFLOW-EU-52](/erp-eu/op-grant-eu-access-permission-req-fdv.md) | erp-eu |
| [A_27121](https://gemspec.gematik.de/search/index.html?A_27121) | E-Rezept-FdV: Zugriffsberechtigung abrufen - Abfragerequest | [IG-TIFLOW-EU-45](/erp-eu/op-read-eu-access-permission-req-fdv.md) | erp-eu |
| [A_27125](https://gemspec.gematik.de/search/index.html?A_27125) | E-Rezept-FdV: Zugriffsberechtigung löschen - Abfragerequest | [IG-TIFLOW-EU-33](/erp-eu/op-revoke-eu-access-permission-req-fdv.md) | erp-eu |
| [A_27126](https://gemspec.gematik.de/search/index.html?A_27126) | E-Rezept-FdV: Zugriffsberechtigung löschen - lokale Zugriffsberechtigung löschen | [IG-TIFLOW-EU-34](/erp-eu/op-revoke-eu-access-permission-req-fdv.md) | erp-eu |
| [A_27488](https://gemspec.gematik.de/search/index.html?A_27488) | E-Rezept-FdV: E-Rezept zum Einlösen im EU-Ausland markieren | [IG-TIFLOW-EU-25](/erp-eu/query-api-task-req-fdv.md) | erp-eu |
| [A_27489](https://gemspec.gematik.de/search/index.html?A_27489) | E-Rezept-FdV: optional: E-Rezept markieren | [IG-TIFLOW-EU-27](/erp-eu/query-api-task-req-fdv.md) | erp-eu |
| [A_27490](https://gemspec.gematik.de/search/index.html?A_27490) | E-Rezept-FdV: E-Rezept markieren | [IG-TIFLOW-EU-29](/erp-eu/query-api-task-req-fdv.md) | erp-eu |
| [A_27491](https://gemspec.gematik.de/search/index.html?A_27491) | E-Rezept-FdV: E-Rezept markieren - Speicherrequest | [IG-TIFLOW-EU-31](/erp-eu/query-api-task-req-fdv.md) | erp-eu |
| [A_27545](https://gemspec.gematik.de/search/index.html?A_27545) | E-Rezept-FdV: E-Rezept markieren - FHIR Ressource erstellen | [IG-TIFLOW-EU-30](/erp-eu/query-api-task-req-fdv.md) | erp-eu |
| [A_27617](https://gemspec.gematik.de/search/index.html?A_27617) | E-Rezept-FdV: E-Rezept zum Einlösen im EU-Ausland markieren - Hinweis Belieferungsmöglichkeit | [IG-TIFLOW-EU-26](/erp-eu/query-api-task-req-fdv.md) | erp-eu |
| [A_27618](https://gemspec.gematik.de/search/index.html?A_27618) | E-Rezept-FdV: E-Rezept markieren - E-Rezepte auswählen | [IG-TIFLOW-EU-28](/erp-eu/query-api-task-req-fdv.md) | erp-eu |
| [A_27832](https://gemspec.gematik.de/search/index.html?A_27832) | E-Rezept-FdV: Flowtype 166 - Hinweis auf Workflow-Besonderheit | [IG-TIFLOW-RX-83](/rx/query-api-task-req-fdv.md) | rx |
| [A_27833](https://gemspec.gematik.de/search/index.html?A_27833) | E-Rezept-FdV: E-Rezept zuweisen- Flowtype 166 - Zuweisen als Versand nicht zulässig | [IG-TIFLOW-RX-17](/rx/query-api-communication-req-fdv.md) | rx |
| [A_28122](https://gemspec.gematik.de/search/index.html?A_28122) | E-Rezept-FdV: Push Notifications - Instanz registrieren - OpenAPI | [IG-TIFLOW-CORE-302](/core/query-api-pushers-req-fdv.md) | core |
| [A_28123](https://gemspec.gematik.de/search/index.html?A_28123) | E-Rezept-FdV: Push Notifications - Channelkonfiguration - OpenAPI | [IG-TIFLOW-CORE-101](/core/query-api-channels-req-fdv.md) | core |

