### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$create`](./op-create-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$create`](./op-create-req-pvs.html): Anforderungen an den Client des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.

### Hinweise

- Der Parameter <code value="*"/> steuert den Typ des dem Task zugrunde liegenden Workflows.
- Die Operation `POST /Task/$create` ist nicht zum Aufbau von Vorräten (Prefetch) oder zum „Vorbereiten" von Rezept-Hüllen ohne konkrete Verordnungsabsicht vorgesehen. Jeder `create`-Aufruf führt serverseitig zur Vergabe einer neuen, fortlaufenden und über lange Zeit eindeutig zu haltenden Rezept-/Task-ID. Nicht aktivierte bzw. verworfene Tasks „verbrauchen“ diese IDs dauerhaft und reduzieren den verfügbaren Nummernraum. Ein `create` sollte daher erst dann erfolgen, wenn das Primärsystem tatsächlich ein E-Rezept erzeugen und im Anschluss zeitnah mit `activate` starten will. Insbesondere ist das Generieren des maximal möglichen Kontingents pro Formular-/Maskenöffnung oder „auf Verdacht“ zu unterlassen.
- Der unter dem Identifier `GEM_ERP_NS_PrescriptionId` hinterlegte Wert stellt die 10 Jahre lang eineindeutige Rezept-ID dar.
- An Identifier unter `GEM_ERP_NS_AccessCode` ist der serverseitig generierte AccessCode, der für nachfolgende Zugriffe auf diesen Task in einem http-Request für die Berechtigungsprüfung mitgegeben werden muss.
- Unter `GEM_ERP_CS_FlowType` hat der TI-Flow-Fachdienst den Übergabeparameter zur Konfiguration des des Workflows übernommen.
- Der Wert in performer entspricht dem intendierten Institutionstyp, in welchen der Versicherte für die Einlösung der Verordnung gelenkt werden soll.

