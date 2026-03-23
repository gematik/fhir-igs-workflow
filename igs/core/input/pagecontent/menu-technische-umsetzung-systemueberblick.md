TODO: Review

Der TI-Flow-Fachdienst verwaltet E-Rezepte in der Telematikinfrastruktur als ein zentraler Ressourcenserver auf Basis des FHIR-Standards mit einer RESTful API. Die Rezepte werden dabei über eine eindeutige Ressourcen-ID (Rezept-ID) adressiert. Zusätzlich protokolliert der TI-Flow-Fachdienst alle Zugriffe auf ein E-Rezept für den Versicherten und verwaltet die Statusübergänge eines E-Rezepts. Für einen Nachrichtenaustausch zwischen Apotheken und Versichertezur Belieferung von E-Rezepten ist eine Kommunikation über den TI-Flow-Fachdienst möglich.

Der TI-Flow-Fachdienst realisiert die Vertraulichkeit und Integrität der verarbeiteten Daten über das Konzept der vertrauenswürdigen Ausführungsumgebung (VAU), die eine durchgängige Verschlüsselung der E-Rezepte und der dazu gehörigen Daten aus einer Kombination kryptografischer Verfahren während des Transports, der vertrauenswürdigen Verarbeitung und in der verschlüsselten Persistierung der Daten sicherstellt.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="./vau-erp-fd.png" alt="VAU des TI-Flow-Fachdienstes" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Systemüberblick</figcaption>
</figure>

<br>

### Systemkontext
Der TI-Flow-Fachdienst stellt Schnittstellen für die Verwaltung von E-Rezepten und für den Nachrichtenaustausch bereit. Diese werden von Leistungserbringerinstitutionen, Kostenträger und Versicherten genutzt, die über ihre jeweiligen Clientsysteme auf den TI-Flow-Fachdienst zugreifen.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="./systemkontext.png" alt="Systemkontext" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Systemkontext TI-Flow-Fachdienst</figcaption>
</figure>

<br>

#### Nachbarsysteme
Die Schnittstellen des TI-Flow-Fachdienstes werden durch die Praxisverwaltungs- und Krankenhausinformationssysteme der verordnenden Leistungserbringer im Verordnungsprozess genutzt. Die Apothekenverwaltungssysteme nutzen die Schnittstellen des TI-Flow-Fachdienstes im Rahmen der Dispensierung von Arzneimitteln. Außerdem werden sie vom E-Rezept-Frontend des Versicherten (E-Rezept-FdV) aufgerufen. Als Fachdienst der Telematikinfrastruktur bedient sich der TI-Flow-Fachdienst der weiteren Infrastrukturdienste wie TSPs für die Gültigkeitsabfrage für Signaturzertifikate, des HBA (für QES-Prüfung) und des IdentityManagements, bei dem der IDP-Dienst in seiner Rolle als Authorization-Server auf verschiedenen Wegen die Identitätsfeststellung für Nutzer übernimmt und deren Zugriffsberechtigungen dann in Form von ACCESS_TOKEN für den Zugriff auf den TI-Flow-Fachdienst bestätigt.

#### Akteure und Rollen
Leistungserbringerinstitutionen und Versicherte weisen sich gegenüber dem TI-Flow-Fachdienst mit einer Identitätsbestätigung (ACCESS_TOKEN) aus, die sie vom IDP-Dienst in seiner Rolle als Authorization-Server für den TI-Flow-Fachdienst, beziehen. In diesen ACCESS_TOKEN ist ihre Rollen-OID (bspw. Arztpraxis, Apotheke, Versicherter) sowie ihr Identitätskennzeichen in Form der Versicherten-ID (10-stelliger unveränderlicher Anteil der KVNR) bzw. Telematik-ID enthalten. Anhand der jeweiligen Rolle wird die Zulässigkeit einer aufgerufenen Operation geprüft. Das Identitätskennzeichen wird für die Protokollierung von Zugriffen sowie die Zuordnung von Datensätzen, insbesondere bei E-Rezepten zu Versicherten, genutzt.

### Zerlegung des Produkttyps
Der TI-Flow-Fachdienst verwaltet E-Rezepte über einen medizinischen Workflow. Dabei muss er die Vertraulichkeit und Integrität der verarbeiteten Daten sicherstellen. Daraus ergeben sich Sicherheitsanforderungen an die Betriebsumgebung, an die Fachlogik der Prozessverarbeitung sowie an die Ausführungsumgebung des Programmcodes.
