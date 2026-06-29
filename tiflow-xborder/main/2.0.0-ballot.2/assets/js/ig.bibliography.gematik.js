const literatureData = [
    
    {
        key: "gemF_ePres-eDisp",
        link: "https://gemspec.gematik.de/downloads/gemF/gemF_eRp_EU",
        title: "Feature ePrescription/eDispensation Land A",
        author: "gematik"
    },
    
    {
        key: "gemSpec_VZD_FHIR_Directory",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_VZD_FHIR_Directory",
        title: "Spezifikation Verzeichnisdienst FHIR-Directory",
        author: "gematik"
    },
    
    {
        key: "gemSpec_NCPeH_FD",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_NCPeH_FD",
        title: "Spezifikation NCPeH-Fachdienst",
        author: "gematik"
    }
    
];

document.addEventListener("DOMContentLoaded", function () {
    igtools.convertBibliographyToLink(literatureData);
});