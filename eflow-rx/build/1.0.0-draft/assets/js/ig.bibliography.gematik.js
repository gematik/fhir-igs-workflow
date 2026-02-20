const literatureData = [
    
    {
        key: "gemIG_eRp_ChargeInformation",
        link: "https://gemspec.gematik.de/ig/fhir/de-gematik-erezept-patientenrechnung-r4/",
        title: "E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte",
        author: "gematik"
    },
    
    {
        key: "gemIG_eRp_EU",
        link: "https://gemspec.gematik.de/ig/fhir/erezept-eu/1.0.0",
        title: "EU Schnittstelle des E-Rezept-Fachdienst zum NCPeH Deutschland",
        author: "gematik"
    },
    
    {
        key: "gemSpec_DM_eRp",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_DM_eRp/latest/",
        title: "Spezifikation Datenmodell E-Rezept",
        author: "gematik"
    },
    
    {
        key: "gemSpec_eRp_FdV",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_eRp_FdV/latest/",
        title: "Spezifikation E-Rezept Frontend des Versicherten",
        author: "gematik"
    },
    
    {
        key: "gemSpec_FD_eRp",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_FD_eRp/latest/",
        title: "Spezifikation E-Rezept-Fachdienst",
        author: "gematik"
    },
    
    {
        key: "gemSpec_Perf",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/",
        title: "Übergreifende Spezifikation Performance und Mengengerüst TI-Plattform",
        author: "gematik"
    },
    
    {
        key: "gemKPT_Betr",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemKPT_Betr/latest/",
        title: "Betriebskonzept Online-Produktivbetrieb",
        author: "gematik"
    },
    
    {
        key: "eRezept-Profile",
        link: "https://simplifier.net/eRezept",
        title: "E-Rezept Verordnungsprofile",
        author: "KBV"
    },
    
    {
        key: "gemSysL_eRp",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSysL_eRp/latest/",
        title: "Systemlösung E-Rezept",
        author: "gematik"
    },
    
    {
        key: "Medication IG DE",
        link: "https://ig.fhir.de/igs/medication/1.0.3/",
        title: "FHIR Implementation Guide für medikationsbezogene Anwendungsfälle im deutschen Gesundheitswesen",
        author: "HL7 Deutschland"
    },
    
    {
        key: "dgMP-DosageTextgenerierung-Skript",
        link: "https://github.com/hl7germany/dgMP-DosageTextgenerierung-Skript",
        title: "dgMP-DosageTextgenerierung-Skript",
        author: "HL7 Deutschland"
    },
    
    {
        key: "gemIG_TIFlow_t-register",
        link: "https://gemspec.gematik.de/ig/fhir/erp-t-prescription/1.1.0",
        title: "Übertragung digitaler Durchschlag zum E-T-Rezept",
        author: "gematik"
    }
    
];

document.addEventListener("DOMContentLoaded", function () {
    igtools.convertBibliographyToLink(literatureData);
});