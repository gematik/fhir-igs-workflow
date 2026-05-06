# Handhabung der Rückgabe von mehreren FHIR-Objekten - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Handhabung der Rückgabe von mehreren FHIR-Objekten**

## Handhabung der Rückgabe von mehreren FHIR-Objekten

Für Endpunkte, die eine Menge an FHIR-Objekten abfragen gelten einheitliche Vorgaben dazu, wie die Elemente in einem FHIR-Bundle aufbereitet werden können.

Zu unterscheiden sind drei verschiedene Mechanismen: Sortierung, Filterung und Pagination. Die angefragten Funktionen sind jeweils auf einen Konkreten Endpunkt anzuwenden. Es ist möglich diese Funktionen miteinander zu kombinieren, sodass z.B. eine Anfrage sortiert und gefiltert wird.

Der TI-Flow-Fachdienst MUSS das Konzept zur Handhabung der Rückgabe von mehreren FHIR-Objekten auf folgende Endpunkte anwenden: Tabelle #: TAB_eRPFD_021 Endpunkte des TI-Flow-Fachdienst, die das Konzept zur Handhabung der Rückgabe von mehreren FHIR-Objekten bereitstellen müssen

| | | |
| :--- | :--- | :--- |
| GET /Task | Versicherte, Abgebende LEI | Liste von verfügbaren Tasks im TI-Flow-Fachdienst |
| GET /Communication | Versicherte, Abgebende LEI | Liste von verfügbaren Communications |
| GET /MedicationDispense | Versicherte | Liste von eingestellten MedicationDispenses von Verordnungen |
| GET /ChargeItem | Versicherte | Liste von Abrechnungsinformationen von Verordnungen |
| GET /AuditEvent | Versicherte | Liste von Protokolleinträgen des Versicherten |

**Tabelle: **Endpunkte des TI-Flow-Fachdienst, die das Konzept zur Handhabung der Rückgabe von mehreren FHIR-Objekten bereitstellen müssen

### Sortieren und Filtern von FHIR-Objekten

Clients erhalten die Möglichkeit die Rückgabe der Elemente im FHIR-Bundle zu sortieren und zu filtern. Mit einem URL-Parameter “_sort” kann eine Sortierung der Ressourcen angefragt werden. Die Angabe eines Filterkriteriums als URL-Parameter schränkt die Ergebnismenge auf die angegebenen Kriterien ein.

Für jeden dieser Ressourcen gelten dann Kriterien, nach denen sortiert und gefiltert werden kann.

Der TI-Flow-Fachdienst MUSS für die Sortierung bei der Handhabung der Rückgabe von mehreren FHIR-Objekten den FHIR-Suchparameter "_sort" unterstützen und für die folgenden Ressourcen entsprechende Such- und Sortierkriterien bereitstellen:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| GET /Task | authored-on | Ja (default) | Task.authoredOn | date |
| status | Nein | Task.status | token | |
| expiry-date | Ja | Task.extension:expiryDate.valueDate | date | |
| accept-date | Ja | Task.extension:acceptDate.valueDate | date | |
| modified | Ja | Task.lastModified | date | |
| GET /AuditEvent | date | Ja (default) | AuditEvent.recorded | date |
| entity | Nein | AuditEvent.entity.what.identifier.value | string | |
| GET /Communication | sent | Ja (default) | Communication.sent | date |
| received | Ja | Communication.received | date | |
| recipient | Nein | Communication.recipient.identifier.value | string | |
| sender | Nein | Communication.sender.identifier.value | string | |
| GET /MedicationDispense | whenhandedover | Ja (default) | MedicationDispense.whenHandedOver | date |
| whenprepared | Ja | MedicationDispense.whenPrepared | date | |
| performer | Nein | MedicationDispense.performer.actor.identifier.value | string | |
| GET /ChargeItem | entered-date | Ja (default) | ChargeItem.enteredDate | date |
| _lastUpdated |  | ChargeItem.meta.lastUpdated | date | |

**Tabelle: **Filter- und Sortierkriterien der Endpunkte für die Handhabung der Rückgabe von mehreren FHIR-Objekten

Hinweis: für die Handhabung mit den FHIR-Datentypen zu Suche und Sortierung siehe https://hl7.org/fhir/R4/search.html#Summary

Hinweis: Standard Such- und Sortierparametern in FHIR ist ein “_” vorangestellt werden. Der Aufruf sieht dann bspw. so aus: GET `[base]/ChargeItem?_lastUpdated=le2023-10-01&_sort=-_lastUpdated`

Es können mehrere Sortierkriterien angegeben werden. Bei der Sortierung sortiert der TI-Flow-Fachdienst dann zuerst nach dem ersten, dann zweiten, usw. Kriterium.

Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten die Sortierung nach mehreren Kriterien ermöglichen, indem entsprechend der Reihenfolge der angegebenen Kriterien sortiert wird.

Der TI-Flow-Fachdienst MUSS für die Sortierung bei der Handhabung der Rückgabe von mehreren FHIR-Objekten folgende Ressourcen nach folgenden Kriterien aufsteigend sortieren, wenn der Client keine Sortierung im Request angefragt hat:

| | |
| :--- | :--- |
| GET /Task | authored-on |
| GET /Communication | sent |
| GET /MedicationDispense | whenhandedover |
| GET /ChargeItem | entered-date |
| GET /AuditEvent | date |

**Tabelle: **Default Sortierparameter für die Handhabung der Rückgabe von mehreren FHIR-Objekten

Standardmäßig werden die Einträge aufsteigend sortiert. Wenn diese Reihenfolge umgekehrt werden soll, kann ein “-“ vor das Sortierkriterium gestellt werden.

Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten die Sortierreihenfolge umkehren, wenn der Client das Präfix "-" am Sortierkriterium angibt.
Clients können am TI-Flow-Fachdienst Anfragen stellen, dessen Ergebnismenge nach bestimmten Kriterien reduziert (gefiltert) werden soll.

Für den Datentyp “date” sollen folgende Filterkriterien als URL-Parameter unterstützt werden:

Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten folgende Filteroperatoren für Suchkriterien anbieten, deren Datentyp "date" ist:

| | | |
| :--- | :--- | :--- |
| eq | equals | ist gleich (=) |
| ne | not equals | ist nicht gleich (!=) |
| gt | greater than | größer als (>) |
| lt | less than | kleiner als (<) |
| ge | greater equals | größer gleich (>=) |
| le | less equals | kleiner gleich (<=) |

**Tabelle: **Filteroperatoren für Datumsabfragen

### Paginierung von FHIR-Objekten

Ziel der Paginierung ist es, eine Ausgabe von mehreren Instanzen in Seiten zu unterteilen, damit der Datenverkehr je Aufruf minimiert wird und der Client dem Nutzer schneller Informationen darstellen kann.

Der Client kann unter Angabe der Einträge je Seite und dem Index des Elements an dem die Anzeige zu beginnenden soll steuern, welche ‘Seite’ dem Client zu übermitteln ist.

Mit “_count” kann der Client angeben, wie viele Elemente maximal auf einer “Seite” der Antwort enthalten sein sollen. D.h. der TI-Flow-Fachdienst beschränkt die Ergebnismenge auf diese maximal angegebene Anzahl.

Der URL-Parameter “__offset” gibt den nullbasierten Versatz des ersten zurückgegebenen Elements in der Sammlung an.

Der TI-Flow-Fachdienst gibt immer die Gesamtanzahl der Suchtreffer zurück. Diese Information wird im Feld “Bundle.total” des FHIR-Bundles angegeben.

Zusätzlich zur Rückgabe der Elemente bietet der TI-Flow-Fachdienst dem Client Link-Relations nach http://www.iana.org/assignments/link-relations/link-relations.xhtml#link-relations-1 an, damit der Client einfacher durch die Ergebnismenge navigieren kann.

Falls die Link Relations nicht zu plausiblen Ergebnissen führen (z.B. wenn es keine vorherige Seite gibt, kann keine “prev” Seite angegeben werden), dann darf diese Link Relation nicht übermittelt werden.

Neben Angaben zur Paginierung übermittelt der Client auch Angaben zur Filterung und Sortierung, diese müssen bei der Erzeugung der Link Relations erhalten bleiben.

Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten die Paginierung nach FHIR ermöglichen und folgende URL-Parameter unterstützen:

| | |
| :--- | :--- |
| _count | Anzahl der Elemente (Bundle.entry) im Bundle. Maximum ist 50. |
| __offset | Nullbasierter Index der Ergebnismenge ab welchem die Elemente angezeigt werden. Default ist 0. |

**Tabelle: **Paginierungsparameter für die Handhabung der Rückgabe von mehreren FHIR-Objekten

Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten folgende Link Relations unter Bundle.link generieren, sofern diese erzeugt werden können:

| | |
| :--- | :--- |
| _count | Anzahl der Elemente (Bundle.entry) im Bundle. Maximum ist 50. |
| __offset | Nullbasierter Index der Ergebnismenge ab welchem die Elemente angezeigt werden. Default ist 0. |

**Tabelle: **Link Relations für die Handhabung der Rückgabe von mehreren FHIR-Objekten

Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten die Paginierung nach FHIR für folgende Endpunkte mit den jeweiligen Parametern unterstützen

| | | | |
| :--- | :--- | :--- | :--- |
| GET /Task | Ja | Ja | self, next, prev, first, last |
| GET /Communication | Ja | Ja | self, next, prev, first, last |
| GET /MedicationDispense | Nein | immer "0" | - |
| GET /ChargeItem | Ja | Ja | self, next, prev, first, last |
| GET /AuditEvent | Ja | immer "0" | self, next, first |

**Tabelle: **Endpunkte mit Paginierung

Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten und Generierung von URLs der Link Relations die vom Client angegebenen Filter- und Sortierkriterien verwerten und erhalten.

