Dieser IG beschreibt die zentralen, IG-übergreifenden Anforderungen an den TI-Flow-Fachdienst. Er fasst grundlegende Sicherheits-, Protokollierungs- und Validierungsvorgaben zusammen, die in allen nachgelagerten IGs wiederverwendet werden.

## Systemübersicht

Der TI-Flow-Fachdienst verwaltet verschiedene Workflows von Anwendungen der Telematikinfrastruktur als ein zentraler Ressourcenserver auf Basis des FHIR-Standards mit einer RESTful API. 

Die Workflows werden dabei über eine eindeutige Ressourcen-ID (Task-ID) adressiert. Für jeden Workflow ist ein Statusmodell spezifiziert. Der TI-Flow-Fachdienst verwaltet die Statusübergänge und stellte die Zulässigkeit der durch Nutzer initiierten Statusübergänge sicher.

Der TI-Flow-Fachdienst protokolliert alle Zugriffe auf einen Workflow für den dem Workflow zugeordneten Versicherten.

Der TI-Flow-Fachdienst stellt sicher, dass die Daten nur entsprechend der gesetzlich zulässigen Speicherdauer vorgehalten werden.

Der TI-Flow-Fachdienst bietet seine Aussenschnittstellen im Internet an und setzt für die Authentisierung und Autorisierung von Clientsystemen Zero Trust Access (ZETA) Mechanismen um.

Der TI-Flow-Fachdienst unterstützt eine asynchrone Übermittlung von Daten an Drittsysteme (bspw. ePA Medication Service).

Der TI-Flow-Fachdienst realisiert die Vertraulichkeit und Integrität der verarbeiteten Daten über das Konzept der vertrauenswürdigen Ausführungsumgebung (VAU), die eine durchgängige Verschlüsselung der Verordnungen und der dazu gehörigen Daten aus einer Kombination kryptographischer Verfahren während des Transports, der vertrauenswürdigen Verarbeitung und in der verschlüsselten Persistierung der Daten sicherstellt. Dabei realisiert der TI-Flow-Fachdienst die VAU nicht selbst, sondern dadurch, dass der TI-Flow-Fachdienst auf einem TI-Flow-Cluster läuft, das als Healthcare Confidential Computing (HCC) Plattform dient und auch für weitere Anwendungen der TI genutzt werden kann.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./systemüberblick_TI-Flow-Fachdienst.drawio.png" alt="Systemüberblick TI-Flow-Fachdienst" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Systemüberblick TI-Flow-Fachdienst</figcaption>
</figure>

<br>

## Zweck und Geltungsbereich

Der Core-IG fokussiert auf die technische Basisschicht des Fachdienstes:

- Verbindungsaufbau der Clientsysteme zum TI-Flow-Fachdienst
- Validierung von FHIR-Ressourcen und Bundles
- Modulübergreifende Operationen auf Task ($create, $activate, $abort, ...)
- Zugriffs- und Systemprotokollierung (AuditEvent)
- Löschfristen und automatisches Löschen


### Anforderungen zur Umsetzung des IGs

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-261" title="TI-Flow-Fachdienst: Anwendung des IG 'E-Rezept-Workflow Core'" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS den Implementation Guide "E-Rezept-Workflow Core" umsetzen.
</requirement>

<!-- A_20745-01, A_19299-02, A_19298-01, A_22483-01, A_19324-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-262" title="TI-Flow-Fachdienst: Umsetzung 'Implementation Guide E-Rezept-Workflow Core'" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS zur Umsetzung des Implementation Guides "E-Rezept-Workflow Core" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind.
</requirement>

## Aufbau

- [FHIR-Artefakte](./artifacts.html)
- [FHIR-Validierung](./fhir-validate.html)
- [Query API (modulübergreifend)](./menu-schnittstellen-query-api.html)
- [Operation API (modulübergreifend)](./menu-schnittstellen-operation-api.html)
- [Zugriffsprotokollierung](./audit-service.html)
- [Löschfristen](./ttl.html)

## Bezug zu weiteren IGs

Dieser IG enthält nur die gemeinsamen Vorgaben. Fachliche und prozessspezifische Details werden in den jeweiligen IGs dokumentiert.
