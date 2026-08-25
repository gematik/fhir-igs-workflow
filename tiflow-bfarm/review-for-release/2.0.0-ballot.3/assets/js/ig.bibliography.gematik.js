const literatureData = [
    
    {
        key: "gemF_eRp_T-Rezept",
        link: "https://gemspec.gematik.de/docs/gemF/gemF_eRp_T-Rezept/latest/",
        title: "Feature Dokument Verordnung von E-T-Rezepten",
        author: "gematik"
    },
    
    {
        key: "API-ERP: BfArM Webdienst",
        link: "https://github.com/gematik/api-erp/blob/master/docs/erp_bfarm.adoc",
        title: "E-Rezept API Dokumentation zum BfArM",
        author: "gematik"
    },
    
    {
        key: "gemSpec_FD_eRp",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_FD_eRp/latest/",
        title: "Spezifikation E-Rezept-Fachdienst",
        author: "gematik"
    },
    
    {
        key: "gemF_eRp_PKV",
        link: "https://gemspec.gematik.de/docs/gemF/gemF_eRp_PKV/latest/",
        title: "E-Rezepte für PKV-Versicherte: apothekenpflichtige Arzneimittel",
        author: "gematik"
    },
    
    {
        key: "gemSysL_eRp",
        link: "https://gemspec.gematik.de/",
        title: "Systemspezifisches Konzept E-Rezept",
        author: "gematik"
    },
    
    {
        key: "gemF_eRp_ePA",
        link: "https://gemspec.gematik.de/prereleases/Draft_eRp_ePA_1_2_0/gemF_eRp_ePA_V1.2.0_RC/",
        title: "E-Rezept: Übermitteln von Rezeptdaten in die ePA",
        author: "gematik"
    },
    
    {
        key: "gemIG_TIFlow_rx",
        link: "https://gemspec.gematik.de/ig/fhir/ti-flow-rx/1.0.0",
        title: "E-Rezept für Arzneimittel",
        author: "gematik"
    }
    
];

document.addEventListener("DOMContentLoaded", function () {
    igtools.convertBibliographyToLink(literatureData);
});