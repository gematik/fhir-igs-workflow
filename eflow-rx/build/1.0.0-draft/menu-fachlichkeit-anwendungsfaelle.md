# Anwendungsfälle für den Medikationsprozess - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Überblick zur Verordnung und Belieferung von Arzneimitteln**](menu-fachlichkeit-ueberblick.md)
* **Anwendungsfälle für den Medikationsprozess**

## Anwendungsfälle für den Medikationsprozess

### Fachliche Anwendungsfälle

Die folgenden fachlichen Anwendungsfälle beschreiben – aus Sicht des verordnenden Leistungserbringers – die Schritte zur Verordnung und Bereitstellung eines E-Rezepts.

#### Übergreifende Vorbedingungen

* Der Leistungserbringer ist gegenüber der TI authentisiert (Institutionsidentität via SMC-B über IdP/Konnektor).
* Für die QES steht ein freigeschalteter HBA zur Verfügung.
* Der Verordnungsdatensatz wird als KBV-konformes FHIR-Bundle im Primärsystem geführt.

#### E-Rezept erstellen

* Beschreibung: Vorbedingungen
  * Ein E-Rezept wird im Primärsystem (PVS/KIS) als Verordnungsdatensatz erstellt. Für die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, über den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.: * Der Leistungserbringer ist gegenüber der TI authentisiert (Institutionsidentität via SMC-B über IdP/Konnektor).
* Der Verordnungsdatensatz liegt lokal als KBV-konformes FHIR-Bundle vor.

* Beschreibung: Durchzuführende Aktionen
  * Ein E-Rezept wird im Primärsystem (PVS/KIS) als Verordnungsdatensatz erstellt. Für die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, über den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.: * Das Primärsystem legt im E-Rezept-Fachdienst einen Task an.
* Der E-Rezept-Fachdienst vergibt eine Rezept-ID (PrescriptionID) und generiert einen AccessCode.
* Das Primärsystem übernimmt die Rezept-ID in den lokalen Verordnungsdatensatz.

* Beschreibung: Nachbedingungen
  * Ein E-Rezept wird im Primärsystem (PVS/KIS) als Verordnungsdatensatz erstellt. Für die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, über den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.: * Task liegt im Status `draft` vor.
* Rezept-ID und AccessCode sind im Primärsystem verfügbar.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Ein E-Rezept wird im Primärsystem (PVS/KIS) als Verordnungsdatensatz erstellt. Für die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, über den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.: * [E-Rezept erstellen](./menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-erstellen)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein E-Rezept wird im Primärsystem (PVS/KIS) als Verordnungsdatensatz erstellt. Für die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, über den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept erstellen

#### E-Rezept qualifiziert signieren

* Beschreibung: Vorbedingungen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * Rezept-ID (PrescriptionID) ist im Verordnungsdatensatz enthalten.
* Ein freigeschalteter HBA steht zur Verfügung.
* Konsistenz: `authoredOn` im Verordnungsdatensatz entspricht dem Datum der QES.

* Beschreibung: Durchzuführende Aktionen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * Das Primärsystem startet die QES-Erstellung über den Konnektor.
* Der (Zahn-)Arzt signiert den Verordnungsdatensatz mit dem HBA.
* Das Primärsystem erhält den QES-signierten Datensatz zur weiteren Verarbeitung.

* Beschreibung: Nachbedingungen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * QES-signierter Verordnungsdatensatz liegt im Primärsystem vor.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * [E-Rezept qualifiziert signieren](./menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-qualifiziert-signieren)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept qualifiziert signieren

#### E-Rezept vervollständigen und Task aktivieren

* Beschreibung: Vorbedingungen
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert für den Versicherten bereit. Mit der Bereitstellung startet der Einlöse-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprüft und anschließend so veröffentlicht, dass sie im vorgesehenen Prozess (z. B. Einlösung in der Apotheke oder Bearbeitung durch den Kostenträger) genutzt werden kann.: * Das E-Rezept wurde zuvor erstellt und befindet sich noch in der Vorbereitungsphase.
* Der qualifiziert signierte Verordnungsdatensatz (QES) liegt im Primärsystem vor.
* Ein Berechtigungsmerkmal zur geschützten Bereitstellung liegt vor (z. B. AccessCode).

* Beschreibung: Durchzuführende Aktionen
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert für den Versicherten bereit. Mit der Bereitstellung startet der Einlöse-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprüft und anschließend so veröffentlicht, dass sie im vorgesehenen Prozess (z. B. Einlösung in der Apotheke oder Bearbeitung durch den Kostenträger) genutzt werden kann.: * Das Primärsystem stellt den qualifiziert signierten Verordnungsdatensatz beim E-Rezept-Fachdienst bereit.
* Der E-Rezept-Fachdienst prüft Berechtigung, Signatur und fachliche Konsistenz der Verordnung.
* Bei erfolgreicher Prüfung wird die Verordnung für die weitere Verarbeitung (Einlösung/Bearbeitung) freigeschaltet.

* Beschreibung: Nachbedingungen
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert für den Versicherten bereit. Mit der Bereitstellung startet der Einlöse-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprüft und anschließend so veröffentlicht, dass sie im vorgesehenen Prozess (z. B. Einlösung in der Apotheke oder Bearbeitung durch den Kostenträger) genutzt werden kann.: * Das E-Rezept ist bereitgestellt und kann im weiteren Prozess eingelöst bzw. bearbeitet werden.
* Der Status des Workflows entspricht der bereitgestellten Verordnung.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert für den Versicherten bereit. Mit der Bereitstellung startet der Einlöse-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprüft und anschließend so veröffentlicht, dass sie im vorgesehenen Prozess (z. B. Einlösung in der Apotheke oder Bearbeitung durch den Kostenträger) genutzt werden kann.: * [E-Rezept vervollständigen und Task aktivieren](./menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-vervollständigen-und-task-aktivieren)

* Beschreibung: Folgeaktionen des E-Rezept-Fachdienst
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert für den Versicherten bereit. Mit der Bereitstellung startet der Einlöse-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprüft und anschließend so veröffentlicht, dass sie im vorgesehenen Prozess (z. B. Einlösung in der Apotheke oder Bearbeitung durch den Kostenträger) genutzt werden kann.: * [Mapping von Verordnungsdaten](./mapping-prescription.md)
* [Übertragung von Verordnungsdaten an den ePA MedicationService](./menu-technische-umsetzung-anbindung-epa-ms.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert für den Versicherten bereit. Mit der Bereitstellung startet der Einlöse-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprüft und anschließend so veröffentlicht, dass sie im vorgesehenen Prozess (z. B. Einlösung in der Apotheke oder Bearbeitung durch den Kostenträger) genutzt werden kann.:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept vervollständigen und Task aktivieren

#### E-Rezept löschen

* Beschreibung: Vorbedingungen
  * Ein E-Rezept kann durch den verordnenden Leistungserbringer widerrufen/gelöscht werden, um den Patienten vor dem Bezug und der Einnahme eines fälschlich verordneten Medikaments zu schützen.: * AccessCode ist dem Primärsystem bekannt.
* Das E-Rezept befindet sich nicht bereits in Belieferung (ansonsten ist das Löschen nicht zulässig).

* Beschreibung: Durchzuführende Aktionen
  * Ein E-Rezept kann durch den verordnenden Leistungserbringer widerrufen/gelöscht werden, um den Patienten vor dem Bezug und der Einnahme eines fälschlich verordneten Medikaments zu schützen.: * Das Primärsystem fordert das Löschen/Widerrufen des E-Rezepts beim E-Rezept-Fachdienst an.
* Der E-Rezept-Fachdienst prüft die Berechtigung und löscht den referenzierten Task.

* Beschreibung: Nachbedingungen
  * Ein E-Rezept kann durch den verordnenden Leistungserbringer widerrufen/gelöscht werden, um den Patienten vor dem Bezug und der Einnahme eines fälschlich verordneten Medikaments zu schützen.: * Der referenzierte Task ist gelöscht; es werden keine Nutzdaten zurückgegeben.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Ein E-Rezept kann durch den verordnenden Leistungserbringer widerrufen/gelöscht werden, um den Patienten vor dem Bezug und der Einnahme eines fälschlich verordneten Medikaments zu schützen.: * [E-Rezept löschen](./menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-löschen)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein E-Rezept kann durch den verordnenden Leistungserbringer widerrufen/gelöscht werden, um den Patienten vor dem Bezug und der Einnahme eines fälschlich verordneten Medikaments zu schützen.:  (ZAHN-)ARZT  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept löschen

#### E-Rezept abrufen (Apotheke)

* Beschreibung: Vorbedingungen
  * Nach Übergabe von Task-ID und AccessCode durch den Versicherten ruft das Apothekenverwaltungssystem (AVS) das E-Rezept mittels FHIR-Operation $accept ab. Der E-Rezept-Fachdienst liefert den Task, das QES-signierte Verordnungsbundle und ein Secret zurück, das die Apotheke für weitere Schritte benötigt.: * Task-ID und AccessCode wurden durch den Versicherten bereitgestellt (z. B. 2D-Code, CardLink, Nachricht).
* Das AVS ist gegenüber der TI authentisiert und verfügt über ein gültiges Access Token.
* Der referenzierte Task befindet sich in einem abrufbaren Status (ready) und ist noch keiner anderen Apotheke zugeordnet.

* Beschreibung: Durchzuführende Aktionen
  * Nach Übergabe von Task-ID und AccessCode durch den Versicherten ruft das Apothekenverwaltungssystem (AVS) das E-Rezept mittels FHIR-Operation $accept ab. Der E-Rezept-Fachdienst liefert den Task, das QES-signierte Verordnungsbundle und ein Secret zurück, das die Apotheke für weitere Schritte benötigt.: * Das AVS sendet einen POST-Request auf /Task/{id}/$accept mit dem AccessCode.
* Der Fachdienst validiert Berechtigung und liefert Task, Binary (PKCS#7) und das Secret.
* Das AVS speichert Task, Secret, Binary und löst optional die lokale QES-Prüfung an.

* Beschreibung: Nachbedingungen
  * Nach Übergabe von Task-ID und AccessCode durch den Versicherten ruft das Apothekenverwaltungssystem (AVS) das E-Rezept mittels FHIR-Operation $accept ab. Der E-Rezept-Fachdienst liefert den Task, das QES-signierte Verordnungsbundle und ein Secret zurück, das die Apotheke für weitere Schritte benötigt.: * Das Secret ist bekannt und belegt die Apotheke als aktuelle Bearbeiterin.
* Task-Status wechselt auf `in-progress`; Verordnungsdaten liegen im AVS vor.
* Falls Flowtype 200/209 mit Consent, liegt zusätzlich ein Consent-Resource vor.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Nach Übergabe von Task-ID und AccessCode durch den Versicherten ruft das Apothekenverwaltungssystem (AVS) das E-Rezept mittels FHIR-Operation $accept ab. Der E-Rezept-Fachdienst liefert den Task, das QES-signierte Verordnungsbundle und ein Secret zurück, das die Apotheke für weitere Schritte benötigt.: * [E-Rezept abrufen](./menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-abrufen)

* Beschreibung: Relevante(r) Sektor(en)
  * Nach Übergabe von Task-ID und AccessCode durch den Versicherten ruft das Apothekenverwaltungssystem (AVS) das E-Rezept mittels FHIR-Operation $accept ab. Der E-Rezept-Fachdienst liefert den Task, das QES-signierte Verordnungsbundle und ein Secret zurück, das die Apotheke für weitere Schritte benötigt.: 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept abrufen (Apotheke)

#### E-Rezept erneut abrufen

* Beschreibung: Vorbedingungen
  * Geht das beim ersten Abruf erhaltene Secret verloren, kann die gleiche Apotheke das E-Rezept nochmals abrufen, um das Secret und den Verordnungsdatensatz erneut zu erhalten.: * Die Apotheke hat das E-Rezept zuvor erfolgreich abgerufen; der Task ist der Apotheke zugeordnet.
* Task-ID und AccessCode liegen weiterhin vor.
* Gleiches AVS / gleiche Telematik-ID wie beim Erstabruf (sonst HTTP 412 Precondition Failed).

* Beschreibung: Durchzuführende Aktionen
  * Geht das beim ersten Abruf erhaltene Secret verloren, kann die gleiche Apotheke das E-Rezept nochmals abrufen, um das Secret und den Verordnungsdatensatz erneut zu erhalten.: * Das AVS ruft /Task/{id}?ac=… mit HTTP GET auf.
* Der Fachdienst stellt Task, Binary und Secret erneut bereit.
* Das AVS ersetzt das verlorene Secret und setzt die Bearbeitung fort.

* Beschreibung: Nachbedingungen
  * Geht das beim ersten Abruf erhaltene Secret verloren, kann die gleiche Apotheke das E-Rezept nochmals abrufen, um das Secret und den Verordnungsdatensatz erneut zu erhalten.: * Secret und Verordnungsdaten stehen wieder zur Verfügung.
* Task-Status verbleibt bei `in-progress` und bleibt der Apotheke zugeordnet.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Geht das beim ersten Abruf erhaltene Secret verloren, kann die gleiche Apotheke das E-Rezept nochmals abrufen, um das Secret und den Verordnungsdatensatz erneut zu erhalten.: * [E-Rezept erneut abrufen](./menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-erneut-abrufen)

* Beschreibung: Relevante(r) Sektor(en)
  * Geht das beim ersten Abruf erhaltene Secret verloren, kann die gleiche Apotheke das E-Rezept nochmals abrufen, um das Secret und den Verordnungsdatensatz erneut zu erhalten.: 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept erneut abrufen

#### E-Rezept-Abgabe zeitnah dokumentieren

* Beschreibung: Vorbedingungen
  * Vor Abschluss des Workflows kann die Apotheke über $dispense Dispensierinformationen einstellen, damit Versicherte und FdV zeitnah über die erfolgte Abgabe informiert werden, ohne eine Quittung auszulösen.: * Die Apotheke besitzt das Secret aus dem vorherigen Abruf.
* Das Rezept wurde beliefert, aber der Workflow ist noch nicht abgeschlossen.
* Dispensierdaten (MedicationDispense + Medication) liegen im AVS vor und bleiben unterhalb der Größenlimits.

* Beschreibung: Durchzuführende Aktionen
  * Vor Abschluss des Workflows kann die Apotheke über $dispense Dispensierinformationen einstellen, damit Versicherte und FdV zeitnah über die erfolgte Abgabe informiert werden, ohne eine Quittung auszulösen.: * Das AVS ruft /Task/{id}/$dispense?secret=… via POST auf und übermittelt die Abgabeinformationen in einer Parameters-Ressource.
* Der Fachdienst plausibilisiert die Daten und speichert sie ohne Statuswechsel des Tasks.

* Beschreibung: Nachbedingungen
  * Vor Abschluss des Workflows kann die Apotheke über $dispense Dispensierinformationen einstellen, damit Versicherte und FdV zeitnah über die erfolgte Abgabe informiert werden, ohne eine Quittung auszulösen.: * Dispensierinformationen stehen dem Versicherten im E-Rezept-FdV zur Verfügung.
* Task behält Status `in-progress`; keine Quittung wurde erzeugt.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Vor Abschluss des Workflows kann die Apotheke über $dispense Dispensierinformationen einstellen, damit Versicherte und FdV zeitnah über die erfolgte Abgabe informiert werden, ohne eine Quittung auszulösen.: * [$dispense nutzen](./menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-dispense)

* Beschreibung: Relevante(r) Sektor(en)
  * Vor Abschluss des Workflows kann die Apotheke über $dispense Dispensierinformationen einstellen, damit Versicherte und FdV zeitnah über die erfolgte Abgabe informiert werden, ohne eine Quittung auszulösen.: 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept-Abgabe zeitnah dokumentieren

#### E-Rezept-Abgabe vollziehen

* Beschreibung: Vorbedingungen
  * Nach erfolgter Belieferung schließt die Apotheke den Workflow mit $close ab, übermittelt die finalen Dispensierinformationen (oder verweist auf zuvor gesendete Daten) und erhält ein serverseitig signiertes Quittungs-Bundle.: * Secret liegt vor und die Apotheke ist weiterhin berechtigt.
* Vollständige Dispensierinformationen stehen bereit (entweder frisch oder über vorheriges $dispense).
* Bei Flowtype 200 muss sichergestellt sein, dass dem Versicherten eine Quittung für private Abrechnung ausgehändigt wird.

* Beschreibung: Durchzuführende Aktionen
  * Nach erfolgter Belieferung schließt die Apotheke den Workflow mit $close ab, übermittelt die finalen Dispensierinformationen (oder verweist auf zuvor gesendete Daten) und erhält ein serverseitig signiertes Quittungs-Bundle.: * Das AVS ruft /Task/{id}/$close?secret=… via POST auf und sendet die Dispensierinformationen (falls noch nicht vorhanden).
* Der Fachdienst validiert die Daten, erstellt das Quittungs-Bundle und setzt den Task auf `completed`.

* Beschreibung: Nachbedingungen
  * Nach erfolgter Belieferung schließt die Apotheke den Workflow mit $close ab, übermittelt die finalen Dispensierinformationen (oder verweist auf zuvor gesendete Daten) und erhält ein serverseitig signiertes Quittungs-Bundle.: * Der Workflow ist abgeschlossen; Quittung liegt im AVS vor und kann an Rechenzentrum/Kostenträger weitergegeben werden.
* Versicherte sehen den Abschluss im FdV; ggf. erfolgt eine Übermittlung an BfArM bzw. ePA gemäß Flowtype.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Nach erfolgter Belieferung schließt die Apotheke den Workflow mit $close ab, übermittelt die finalen Dispensierinformationen (oder verweist auf zuvor gesendete Daten) und erhält ein serverseitig signiertes Quittungs-Bundle.: * [E-Rezept-Abgabe vollziehen](./menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-close)

* Beschreibung: Relevante(r) Sektor(en)
  * Nach erfolgter Belieferung schließt die Apotheke den Workflow mit $close ab, übermittelt die finalen Dispensierinformationen (oder verweist auf zuvor gesendete Daten) und erhält ein serverseitig signiertes Quittungs-Bundle.: 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept-Abgabe vollziehen

