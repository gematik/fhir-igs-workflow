Dieser IG beschreibt die zentralen, IG-übergreifenden Anforderungen an den TI-Flow-Fachdienst. Er fasst grundlegende Sicherheits-, Protokollierungs- und Validierungsvorgaben zusammen, die in allen nachgelagerten IGs wiederverwendet werden.

### Systemübersicht

Der TI-Flow-Fachdienst ist ein zentraler Ressourcenserver der Telematikinfrastruktur, der anwendungsübergreifende Workflows auf Basis des FHIR-Standards über eine RESTful API verwaltet.

Jeder Workflow wird über eine eindeutige Ressourcen-ID (Task-ID) adressiert und durchläuft ein definiertes Statusmodell. Der Fachdienst steuert die Statusübergänge und stellt sicher, dass nur zulässige, durch Nutzer initiierte Übergänge ausgeführt werden.

Alle Zugriffe auf einen Workflow werden für den zugeordneten Versicherten protokolliert. Die Datenhaltung erfolgt ausschließlich im Rahmen der gesetzlich zulässigen Speicherdauer.

Nach außen bietet der TI-Flow-Fachdienst seine Schnittstellen im Internet an und setzt für die Authentisierung und Autorisierung von Clientsystemen Zero Trust Access (ZETA) Mechanismen um. Ergänzend unterstützt er die asynchrone Übermittlung von Daten an Drittsysteme, etwa den ePA Medication Service.

Die Vertraulichkeit und Integrität der verarbeiteten Daten gewährleistet der Fachdienst durch das Konzept der vertrauenswürdigen Ausführungsumgebung (VAU). Diese sichert eine durchgängige Verschlüsselung der Verordnungen und zugehörigen Daten – während des Transports, der Verarbeitung und der persistierten Speicherung – durch eine Kombination kryptographischer Verfahren. Die VAU wird dabei nicht vom TI-Flow-Fachdienst selbst implementiert, sondern durch seinen Betrieb auf einem TI-Flow-Cluster, das als Healthcare Confidential Computing (HCC) Plattform dient und auch weiteren TI-Anwendungen zur Verfügung steht.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 800px; margin-bottom: 30px;">
        <img src="./systemueberblick_TI-Flow-Fachdienst.drawio.png" alt="Systemüberblick TI-Flow-Fachdienst" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Systemüberblick TI-Flow-Fachdienst</figcaption>
</figure>

<br>

### Zweck und Geltungsbereich

Um die Funktionalität des TI-Flow-Fachdienst verständlich und adressatengerecht zu beschreiben wurden mehrere FHIR-Implementation Guides angelegt.

Dieser "IG TIFlow Kernfunktionalitäten" fokussiert auf die technische Basisschicht und Kernfunktionalitäten des Fachdienstes und beschreibt mehrfach verwendete Funktionalitäten sowie übergreifendes Verhalten:

- Verbindungsaufbau der Clientsysteme zum TI-Flow-Fachdienst
- Validierung von FHIR-Ressourcen und Bundles
- Modulübergreifende Operationen auf Task ($create, $activate, $abort, ...)
- Zugriffs- und Systemprotokollierung (AuditEvent)
- Löschfristen und automatisches Löschen

Inhalte aus diesem IG werden dann in zwei weiteren Arten von IG's in der TI-Flow Landschaft weiterverwendet:

| Art des IG | Beschreibung |
| --- | --- |
| Modul IG | Diese Implementation Guides enthalten Inhalte zu einem Modul, bzw. Anwendung innerhalb des TI-Flow-Fachdienst. Diese werden über eine eigenen eigenen URL-Pfad adressiert und sind durch eine eigene Domäne und Akteure gekennzeichnet. Jede Workflow-Anwendung im TI-Flow-Fachdienst wird durch einen eigenen IG beschrieben, der auf Beschreibungen und Verhalten der Kernfunktionalitäten basiert. |
| Funktions IG | Diese Implementation Guides enthalten Beschreibungen zu Endpunkten und Funktionalitäten, die als Bausteine wiederverwendet werden können und daher zentral beschrieben werden. Sie existieren nicht als eigene Anwendung in der TI-Flow-Fachdienst landschaft. |

<div><figcaption><strong>Tabelle: </strong>Beschreibung der IG Arten im TI-Flow-Fachdienst</figcaption></div>

<br>

<figure>
    <div class="gem-ig-svg-container" style="--box-width: 500px; margin-bottom: 30px;">
        <object
            data="./ig-landscape.svg"
            type="image/svg+xml"
            aria-label="Übersicht der FHIR-IGs des TI-Flow-Fachdienst"
            style="width: 100%;"
            >
            <img src="./ig-landscape.svg" alt="Übersicht der FHIR-IGs des TI-Flow-Fachdienst" style="width: 100%;">
            </object>
    </div>
    <figcaption><strong>Abbildung: </strong>Übersicht der FHIR-IGs des TI-Flow-Fachdienst</figcaption>
</figure>

<br>

### Aufbau

- [FHIR-Artefakte](./artifacts.html)
- [FHIR-Validierung](./fhir-validate.html)
- [Query API (modulübergreifend)](./menu-schnittstellen-query-api.html)
- [Operation API (modulübergreifend)](./menu-schnittstellen-operation-api.html)
- [Zugriffsprotokollierung](./audit-service.html)
- [Löschfristen](./ttl.html)

## Bezug zu weiteren IGs

Dieser IG enthält nur die gemeinsamen Vorgaben. Fachliche und prozessspezifische Details werden in den jeweiligen IGs dokumentiert.
