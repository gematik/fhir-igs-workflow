# Technische Umsetzung - Systemüberblick - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* **Technische Umsetzung - Systemüberblick**

## Technische Umsetzung - Systemüberblick

TODO: Review

Der TI-Flow-Fachdienst verwaltet Verordnungen (bspw. E-Rezepte) in der Telematikinfrastruktur als ein zentraler Ressourcenserver auf Basis des FHIR-Standards mit einer RESTful API. Die Rezepte werden dabei über eine eindeutige Ressourcen-ID (Rezept-ID) adressiert. Zusätzlich protokolliert der TI-Flow-Fachdienst alle Zugriffe auf ein E-Rezept für den Versicherten und verwaltet die Statusübergänge eines E-Rezepts. Für einen Nachrichtenaustausch zwischen Apotheken und Versichertezur Belieferung von E-Rezepten ist eine Kommunikation über den TI-Flow-Fachdienst möglich.

Der TI-Flow-Fachdienst realisiert die Vertraulichkeit und Integrität der verarbeiteten Daten über das Konzept der vertrauenswürdigen Ausführungsumgebung (VAU), die eine durchgängige Verschlüsselung der E-Rezepte und der dazu gehörigen Daten aus einer Kombination kryptografischer Verfahren während des Transports, der vertrauenswürdigen Verarbeitung und in der verschlüsselten Persistierung der Daten sicherstellt.

**Abbildung: **Systemüberblick


### Systemkontext

Der TI-Flow-Fachdienst stellt Schnittstellen für die Verwaltung von E-Rezepten und für den Nachrichtenaustausch bereit. Diese werden von Leistungserbringerinstitutionen, Kostenträger und Versicherten genutzt, die über ihre jeweiligen Clientsysteme auf den TI-Flow-Fachdienst zugreifen.

**Abbildung: **Systemkontext TI-Flow-Fachdienst


#### Nachbarsysteme

Die Schnittstellen des TI-Flow-Fachdienstes werden durch die Praxisverwaltungs- und Krankenhausinformationssysteme der verordnenden Leistungserbringer im Verordnungsprozess genutzt. Die Apothekenverwaltungssysteme nutzen die Schnittstellen des TI-Flow-Fachdienstes im Rahmen der Abgabe von Arzneimitteln. Außerdem werden sie vom E-Rezept-Frontend des Versicherten (E-Rezept-FdV) aufgerufen. Als Fachdienst der Telematikinfrastruktur bedient sich der TI-Flow-Fachdienst der weiteren Infrastrukturdienste wie bspw. OCSP-Responder für die Gültigkeitsabfrage für Signaturzertifikate des HBAs (für QES-Prüfung) und dem FHIR-VZD für die Ermittlung von Informationen zu Apotheken.

#### Akteure und Rollen

Leistungserbringerinstitutionen und Versicherte weisen sich gegenüber dem TI-Flow-Fachdienst mit einer Identität aus. Die Identität beihaltet ihre Rollen-OID (bspw. Arztpraxis, Apotheke, Versicherter) sowie ihr Identitätskennzeichen in Form der Versicherten-ID (10-stelliger unveränderlicher Anteil der KVNR) bzw. Telematik-ID enthalten. Anhand der jeweiligen Rolle wird die Zulässigkeit einer aufgerufenen Operation geprüft. Das Identitätskennzeichen wird für die Protokollierung von Zugriffen sowie die Zuordnung von Datensätzen, insbesondere bei Verordnungen zu Versicherten, genutzt.

### Zerlegung des Produkttyps

Der TI-Flow-Fachdienst verwaltet Verordnungen über einen Workflows. Dabei muss er die Vertraulichkeit und Integrität der verarbeiteten Daten sicherstellen. Daraus ergeben sich Sicherheitsanforderungen an die Betriebsumgebung, an die Fachlogik der Prozessverarbeitung sowie an die Ausführungsumgebung des Programmcodes.

