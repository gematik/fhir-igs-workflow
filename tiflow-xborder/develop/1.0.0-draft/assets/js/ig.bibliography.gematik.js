const literatureData = [
    
    {
        key: "gemF_ePres-eDisp",
        link: "https://gemspec.gematik.de/downloads/gemF/gemF_eRp_EU/latest",
        title: "Feature ePrescription/eDispensation Land A",
        author: "gematik"
    },
    
    {
        key: "gemSpec_VZD_FHIR_Directory",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_VZD_FHIR_Directory/latest/",
        title: "Spezifikation Verzeichnisdienst FHIR-Directory",
        author: "gematik"
    }
    
];

document.addEventListener("DOMContentLoaded", function () {
    igtools.convertBibliographyToLink(literatureData);
});