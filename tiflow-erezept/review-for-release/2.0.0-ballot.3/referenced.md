# Referenzen - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* **Referenzen**

## Referenzen

Die nachfolgenden Tabellen enthalten die Bezeichnung der in diesem Implementation Guide referenzierten Dokumente, externe Quellen oder verwendeten Abkürzungen.

### Abkürzungen

| Kürzel | Erläuterung | | — | — | | API | Application Programming Interface | | CS | Clientsystem | | DVKA | Deutsche Verbindungsstelle Krankenversicherung - Ausland | | eHDSI | eHealth Digital Service Infrastructure | | FD | Fachdienst | | FdV | Frontend des Versicherten | | GUI | Graphical User Interface | | ID | Identifikation(nummer) | | KBV | Kassenärztliche Bundesvereinigung | | KVNR | Krankenversichertennummer | | LE‑EU | Leistungserbringer im europäischen Ausland | | LEI‑EU | Leistungserbringerinstitution im europäischen Ausland | | NCPeH | National Contact Point eHealth | | NCPeH‑FD | National Contact Point eHealth in Deutschland, NCPeH‑Fachdienst | | PKV | Private Krankenversicherung | | PS | Primärsystem | | PZN | Pharmazentralnummer | | TI | Telematikinfrastruktur | | UC | Use Case, Anwendungsfall |

**Tabelle:**Abkürzungen

### Dokumente & Verweise der gematik

| | |
| :--- | :--- |
| [gemIG_eRp_ChargeInformation] | gematik: E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte.https://gemspec.gematik.de/ig/fhir/de-gematik-erezept-patientenrechnung-r4/ |
| [gemIG_eRp_EU] | gematik: EU Schnittstelle des E-Rezept-Fachdienst zum NCPeH Deutschland.https://gemspec.gematik.de/ig/fhir/erezept-eu/1.0.0 |
| [gemSpec_DM_eRp] | gematik: Spezifikation Datenmodell E-Rezept.https://gemspec.gematik.de/docs/gemSpec/gemSpec_DM_eRp/latest/ |
| [gemSpec_eRp_FdV] | gematik: Spezifikation E-Rezept Frontend des Versicherten.https://gemspec.gematik.de/docs/gemSpec/gemSpec_eRp_FdV/latest/ |
| [gemSpec_FD_eRp] | gematik: Spezifikation E-Rezept-Fachdienst.https://gemspec.gematik.de/docs/gemSpec/gemSpec_FD_eRp/latest/ |
| [gemSpec_Perf] | gematik: Übergreifende Spezifikation Performance und Mengengerüst TI-Plattform.https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/ |
| [gemKPT_Betr] | gematik: Betriebskonzept Online-Produktivbetrieb.https://gemspec.gematik.de/docs/gemSpec/gemKPT_Betr/latest/ |
| [gemSysL_eRp] | gematik: Systemlösung E-Rezept.https://gemspec.gematik.de/docs/gemSpec/gemSysL_eRp/latest/ |
| [gemIG_TIFlow_bfarm] | gematik: Übertragung digitaler Durchschlag zum E-T-Rezept.https://gemspec.gematik.de/ig/fhir/erp-t-prescription/1.1.0 |
| [gemIG_TIFlow_core] | gematik: Implementation Guide TIFlow-Core.https://gemspec.gematik.de/ig/fhir/ |
| [gemF_ePres-eDisp] | gematik: Feature ePrescription/eDispensation Land A.https://gemspec.gematik.de/downloads/gemF/gemF_eRp_EU |
| [gemSpec_VZD_FHIR_Directory] | gematik: Spezifikation Verzeichnisdienst FHIR-Directory.https://gemspec.gematik.de/docs/gemSpec/gemSpec_VZD_FHIR_Directory |
| [gemSpec_NCPeH_FD] | gematik: Spezifikation NCPeH-Fachdienst.https://gemspec.gematik.de/docs/gemSpec/gemSpec_NCPeH_FD |

**Tabelle:**Dokumente & Verweise der gematik

### Weitere Dokumente & Verweise

| | |
| :--- | :--- |
| [eRezept-Profile] | KBV: E-Rezept Verordnungsprofile.https://simplifier.net/eRezept |
| [Medication IG DE] | HL7 Deutschland: FHIR Implementation Guide für medikationsbezogene Anwendungsfälle im deutschen Gesundheitswesen.https://ig.fhir.de/igs/medication/1.0.3/ |
| [dgMP-DosageTextgenerierung-Skript] | HL7 Deutschland: dgMP-DosageTextgenerierung-Skript.https://github.com/hl7germany/dgMP-DosageTextgenerierung-Skript |
| [KBV_ITA_VGEX_Technische_Anlage_ERP] | KBV: TECHNISCHE ANLAGE ZUR ELEKTRONISCHEN ARZNEIMITTELVERORDNUNG (E16A).https://update.kbv.de/ita-update/DigitaleMuster/ERP/KBV_ITA_VGEX_Technische_Anlage_ERP.pdf |

**Tabelle:**Weitere Dokumente & Verweise

