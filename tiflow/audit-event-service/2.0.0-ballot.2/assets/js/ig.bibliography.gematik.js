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
        key: "gemILF_PS",
        link: "https://gemspec.gematik.de/docs/gemILF/gemILF_PS/latest/",
        title: "Implementierungsleitfaden Primärsysteme - Telematikinfrastruktur (TI)",
        author: "gematik"
    },
    
    {
        key: "gemSpec_ZETA",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_ZETA/latest/",
        title: "Spezifikation Zero Trust Access (ZETA)",
        author: "gematik"
    },
    
    {
        key: "gemSpec_PoPP_Service",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_PoPP_Service/latest/",
        title: "Spezifikation Proof of Patient Presence (PoPP)-Service",
        author: "gematik"
    },
    
    {
        key: "gemSpec_VZD_FHIR_Directory",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_VZD_FHIR_Directory/latest/",
        title: "Spezifikation Verzeichnisdienst FHIR-Directory",
        author: "gematik"
    },
    
    {
        key: "gemSpec_NCPeH_FD",
        link: "https://gemspec.gematik.de/docs/gemSpec/gemSpec_NCPeH_FD/latest/",
        title: "Spezifikation NCPeH-Fachdienst",
        author: "gematik"
    },
    
    {
        key: "gemIG_TIFlow_erezept",
        link: "https://gemspec.gematik.de/ig/fhir/tiflow-erezept/2.0.0-ballot.1",
        title: "TIFlow - Verordnungen für Arzneimittel",
        author: "gematik"
    }
    
];

document.addEventListener("DOMContentLoaded", function () {
    igtools.convertBibliographyToLink(literatureData);
});