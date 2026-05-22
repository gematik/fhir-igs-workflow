

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$accept` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$accept`](./op-accept-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zu `$accept`](./op-accept-req-avs.html): Anforderungen an das Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zu `$accept`](./op-accept-req-ktr.html): Anforderungen an das Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.

### Hinweise

- Das generierte `secret` stellt den Zugriffscode der abrufenden Apotheke dar und muss in allen folgenden Workflowschritten in `Task.identifier[GEM_ERP_NS_Secret].value` angegeben werden, damit nicht eine fremde Apotheke den Prozess übernehmen kann.
- Der `Task.status` ist in Bearbeitung (in-progress).
- Das Objekt `Binary` enthält den qualifiziert signierten Verordnungsdatensatz als PKCS#7-Datei in Base64-codierter Form. Innerhalb des Signaturobjekts ist das E-Rezept-Bundle enthalten (Enveloping-Signatur) und muss vom Apothekensystem für die Bearbeitung des E-Rezepts verarbeitet werden. Der codierte Base64-String ist hier aus Gründen der Lesbarkeit nicht vollständig dargestellt.