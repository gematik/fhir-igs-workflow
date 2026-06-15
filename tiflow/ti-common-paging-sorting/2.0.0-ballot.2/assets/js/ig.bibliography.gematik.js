const literatureData = [
    
    {
        key: "OpenAPI_PushGateway",
        link: "https://github.com/gematik/gem-push-notifications-concept/blob/main/docs_sources/push_gateway_openapi.yaml",
        title: "Open API Dokumentation Push Gateway",
        author: "gematik"
    },
    
    {
        key: "gemSpec_DM_eRp",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_DM_eRp/latest/",
        title: "Spezifikation Datenmodell E-Rezept",
        author: "gematik"
    },
    
    {
        key: "gemSpec_Krypt",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_Krypt/latest/",
        title: "Verwendung kryptographischer Algorithmen in der Telematikinfrastruktur",
        author: "gematik"
    },
    
    {
        key: "gemSpec_PKI",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_PKI/latest/",
        title: "Spezifikation PKI",
        author: "gematik"
    },
    
    {
        key: "gemSpec_Aktensystem_ePAfueralle",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_Aktensystem_ePAfueralle/latest/",
        title: "Spezifikation PKI",
        author: "gematik"
    },
    
    {
        key: "gemIG_TIFlow_erezept",
        link: "https://gemspec.gematik.de/ig/fhir/tiflow-erezept/1.0.0/index.html",
        title: "TIFlow - Verordnungen für Arzneimittel",
        author: "gematik"
    }
    
];

document.addEventListener("DOMContentLoaded", function () {
    igtools.convertBibliographyToLink(literatureData);
});