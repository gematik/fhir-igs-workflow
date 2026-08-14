Der TI-Flow-Fachdienst bettet sich in eine HCC-Cloud Umgebung ein. Der TI-Flow-Fachdienst erhält Anfragen von Clients und Diensten und stellt selbst Anfragen an andere Dienste.

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

### Adressierung der Anwendungen

Für die Kommunikation mit den Diensten des TI-Flow-Fachdienst muss das ASL-Protokoll des ZETA Guards verwendet werden. Siehe hierzu [gemSpec_Krypt]#7 ZETA/ASL (VAU-Protokoll). Dadurch wird ein äußerer Request erstellt, der einen inneren ASL-verschlüsselten Request an den ZETA Guard enthält. Im inneren Request sind die fachlichen Informationen des Aufrufs enthalten.

Im Folgenden wird beschrieben, wie das Zusammenspiel dieser Requests genutzt wird, um die Anwendungen des TI-Flow-Fachdienst zu adressieren.

#### Authentifizierung am TI-Flow-Fachdienst

Clients, die mit einer Anwendung des TI-Flow-Fachdienst kommunizieren möchten, müssen zunächst die Authentifizierung und Autorisierung am ZETA Guard durchlaufen. Um sicherzustellen, dass nur einmal der Login-Prozess durchlaufen wird, werden alle Anwendungen des TI-Flow-Fachdienst im äußeren und inneren Request über denselben Host angesprochen, z. B. `https://prod.tiflow.de`.

Der Request wird an den ZETA Guard des TI-Flow-Fachdienst geleitet, der dann die Autorisierungsprüfung nach [gemSpec_ZETA] durchführt. Weitere Informationen hierzu sind unter [Zero Trust Access (ZETA)](./menu-technische-umsetzung-zeta.html) zu finden.

#### Adressierung einer Anwendung vom TI-Flow-Fachdienst

Das Adressieren eines Anwendungsmoduls (z.B. E-Rezept, DiGA) erfolgt im ersten Abschnitt des Pfades des inneren ASL-Requests:

```http
GET /rx/fhir/v1/Task HTTP/1.1
Host: prod.tiflow.de
Content-Type: application/fhir+json
```

Die Angabe von `rx` leitet den Request an die E-Rezept-Anwendung des TI-Flow-Fachdienst. Die jeweiligen Pfade können den API-Beschreibungen der Anwendungsmodul-IGs entnommen werden.

Der HTTP-Proxy des ZETA Guard kann so konfiguriert werden, dass die Anfragen an einen entsprechenden Container weitergeleitet werden.

<figure>
    <div class="gem-ig-svg-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./address-tif-application.svg" alt="Adressierung von Anwendungen im TI-Flow-Fachdienst" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Adressierung von Anwendungen im TI-Flow-Fachdienst</figcaption>
</figure>

<br>