const literatureData = [
    
    {
        key: "gemIG_eRp_Prescription",
        link: "https://gemspec.gematik.de/ig/fhir/erezept-workflow-r4/",
        title: "FHIR-IG E-Rezept-Fachdienst",
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
    }
    
];

document.addEventListener("DOMContentLoaded", function () {
    igtools.convertBibliographyToLink(literatureData);
});