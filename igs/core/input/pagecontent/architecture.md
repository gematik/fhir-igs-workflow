Der TI-Flow-Fachdienst bettet sich in eine HCC-Cloud Umgebung ein. Von dort aus erhält der Dienst Anfragen von Clients und Diensten und stellt selbst anfragen an andere Dienste.

Diese Seite dient der beispielhaften Darstellung möglicher Architekturen, die im Rahmen dieser Spezifikation möglich sein sollen. Dem Hersteller sollen so viele Freiheiten wie möglich gegeben werden, um eine geeignete Architektur zu finden, die die Sicherheits- und Leistungsansprüche erfüllt.

### Schnittstellen zu Externen Diensten

Die folgenden Schnittstellen und Interaktionen sind vom TI-Flow-Fachdienst zu erfüllen. Es soll die Anzahl an Diensten und Schnittstellen bereitstellen. Der TI-Flow-Fachdienst ist im Internet erreichbar und wird über einen ZETA Guard abgesichert.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 800px; margin-bottom: 30px;">
        <img src="./systemueberblick_TI-Flow-Fachdienst.drawio.png" alt="Systemüberblick TI-Flow-Fachdienst" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Systemüberblick TI-Flow-Fachdienst</figcaption>
</figure>


**Hinweis:** Die Anbindung des TI-Flow-Fachdienst an die ePA Aktensysteme erfolgt bis zu deren Unterstütztung von ZETA auf Basis der aktuellen Lösung.
<br>

### Möglicher Aufbau der inneren Komponenten des TI-Flow-Fachdienst

Für den inneren Aufbau der Komponenten des TI-Flow-Fachdienst sollen Potentiale der Cloud (bspw. Skalierung) genutzt werden, um eine möglichst hohe Effizienz in der Nutzung der Cloud Ressourcen zu erreichen. Innerhalb von Software Architekturen gibt es in der Spanne von Mikroservices bis zum Monolithen viele Möglichkeiten eine Anwendung optimal abzubilden.

Die folgenden Beispielhaften Architekturen bilden daher **Möglichkeiten** ab, wie der TI-Flow-Fachdienst in der Cloud genutzt und aufgebaut werden könnte. Den Architekturen liegt jeweils zu Grunde, dass sie immer in einer sicheren Ausführungsumgebung (CVM) ausgeführt werden und Daten in Datenbanken verschlüsselt abgelegt werden. Der Transportkanal ASL terminiert im ZETA Guard. Die Kommunikation von Diensten nach dem ZETA Guard muss unter der Maßgabe des Betreiberausschluss abgesichert werden.

#### Serviceorientierte Architektur

<figure>
    <div class="gem-ig-svg-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./inner-architecture-services.svg" alt="Serviceorientierte Architektur des TI-Flow-Fachdienst" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Serviceorientierte Architektur des TI-Flow-Fachdienst</figcaption>
</figure>

<br>

#### Monolithische Architektur

<figure>
    <div class="gem-ig-svg-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./inner-architecture-monolith.svg" alt="Monolithische Architektur des TI-Flow-Fachdienst" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Monolithische Architektur des TI-Flow-Fachdienst</figcaption>
</figure>

<br>

