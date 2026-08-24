<!-- TI-Flow-26_2 BSI_21 -->
Der TI-Flow-Fachdienst verwaltet Verordnungen (bspw. E-Rezepte) in der Telematikinfrastruktur als ein zentraler Ressourcenserver auf Basis des FHIR-Standards mit einer RESTful API. Die Rezepte werden dabei über eine eindeutige Ressourcen-ID (Rezept-ID) adressiert. Zusätzlich protokolliert der TI-Flow-Fachdienst alle Zugriffe auf ein E-Rezept für den Versicherten und verwaltet die Statusübergänge eines E-Rezepts. Für einen Nachrichtenaustausch zwischen Apotheken und Versichertezur Belieferung von E-Rezepten ist eine Kommunikation über den TI-Flow-Fachdienst möglich.

Der TI-Flow-Fachdienst wird auf einem TI-Flow-Cluster betrieben, das als Healthcare Confidential Computing (HCC) Plattform dient. Diese HCC-Umgebung stellt sichere Ausführungsumgebungen in Form von Confidential Virtual Machines (CVMs) bereit, die das Konzept der vertrauenswürdigen Ausführungsumgebung (VAU) implementieren. Die VAU sichert eine durchgängige Verschlüsselung der Verordnungen und zugehörigen Daten – während des Transports über den ZETA Guard, der verarbeitenden CVMs und der verschlüsselten Persistierung in den Datenbanken der HCC-Infrastruktur – durch eine Kombination kryptografischer Verfahren.

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
        <img src="./systemueberblick_TI-Flow-Fachdienst.drawio.png" alt="Systemkontext" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Systemkontext TI-Flow-Fachdienst</figcaption>
</figure>

<br>

<!-- TI-Flow-26_2 BSI_21 -->
#### Betriebsumgebung: HCC-Infrastruktur

Der TI-Flow-Fachdienst wird auf einer gemeinsamen Healthcare Confidential Computing (HCC) Plattform betrieben, die auch weitere TI-Anwendungen bedient. Die HCC-Plattform stellt folgende Kernkomponenten bereit:

- **Confidential Virtual Machines (CVMs)**: Sichere, isolierte Ausführungsumgebungen, in denen alle TI-Flow-Prozesse laufen
- **Verschlüsselte Datenspeicherung**: Dedizierte, verschlüsselte Datenbanken für die Persistierung von Verordnungsdaten
- **Interner Netzwerkverkehr**: Sichere Kommunikation zwischen CVMs unter der Maßgabe des Betreiberausschlusses (keine Betreiberinsicht auf Fachlogik)

#### Nachbarsysteme
Die Schnittstellen des TI-Flow-Fachdienstes werden durch die Praxisverwaltungs- und Krankenhausinformationssysteme der verordnenden Leistungserbringer im Verordnungsprozess genutzt. Die Apothekenverwaltungssysteme nutzen die Schnittstellen des TI-Flow-Fachdienstes im Rahmen der Abgabe von Arzneimitteln. Außerdem werden sie vom E-Rezept-Frontend des Versicherten (E-Rezept-FdV) aufgerufen. Als Fachdienst der Telematikinfrastruktur bedient sich der TI-Flow-Fachdienst der weiteren Infrastrukturdienste.

#### Akteure und Rollen
Leistungserbringerinstitutionen und Versicherte weisen sich gegenüber dem TI-Flow-Fachdienst mit einer Identität aus. Die Identität beihaltet ihre Rollen-OID (bspw. Arztpraxis, Apotheke, Versicherter) sowie ihr Identitätskennzeichen in Form der Versicherten-ID (10-stelliger unveränderlicher Anteil der KVNR) bzw. Telematik-ID enthalten. Anhand der jeweiligen Rolle wird die Zulässigkeit einer aufgerufenen Operation geprüft. Das Identitätskennzeichen wird für die Protokollierung von Zugriffen sowie die Zuordnung von Datensätzen, insbesondere bei Verordnungen zu Versicherten, genutzt.
### Zerlegung des Produkttyps
Der TI-Flow-Fachdienst verwaltet Verordnungen über einen Workflows. Dabei muss er die Vertraulichkeit und Integrität der verarbeiteten Daten sicherstellen. Daraus ergeben sich Sicherheitsanforderungen an die Betriebsumgebung, an die Fachlogik der Prozessverarbeitung sowie an die Ausführungsumgebung des Programmcodes.
