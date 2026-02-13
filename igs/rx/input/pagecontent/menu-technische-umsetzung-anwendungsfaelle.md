### Technische Anwendungsfaelle

Diese Seite ordnet die technischen RX-Anwendungsfaelle den konkreten Schnittstellen zu.

#### Lesezugriffe

- Query auf Aufgabenlisten und Einzelaufgaben: [Query API: Task](./query-api-task.html)

#### E-Rezept erstellen

- Operation zum Anlegen eines neuen Tasks: [Operation API: E-Rezept erstellen](./op-create.html)

#### E-Rezept qualifiziert signieren

- Die QES-Erstellung erfolgt im Primaersystem (HBA/Konnektor) vor dem Aufruf von `$activate`.

#### E-Rezept vervollstaendigen und Task aktivieren

- Operation zur Aktivierung und Validierung des signierten Verordnungsdatensatzes: [Operation API: E-Rezept aktivieren](./op-activate.html)

#### E-Rezept in Abgabe nehmen

- Operation zum Reservieren eines E-Rezepts fuer die abgebende Institution: [Operation API: Task akzeptieren](./op-accept.html)

#### Dispensierinformationen bereitstellen

- Operation zum Speichern bzw. Aktualisieren von Dispensierinformationen waehrend der Belieferung: [Operation API: Dispensierinformationen bereitstellen](./op-dispense.html)

#### E-Rezept abschliessen oder zurueckweisen

- Abschluss des Workflows inkl. Quittung: [Operation API: Task schliessen](./op-close.html)
- Rueckgabe eines reservierten Tasks in den Status `ready`: [Operation API: Task zurueckweisen](./op-reject.html)

#### E-Rezept loeschen (Abbruch)

- Operation zum Abbruch des Workflows: [Operation API: E-Rezept loeschen](./op-abort.html)

#### Uebertragen an den ePA MedicationService

- Erfolgt fachlich als Folgeverarbeitung erfolgreicher `$activate`-, `$dispense`-, `$close`- und `$abort`-Aufrufe.
- Die normativen Anforderungen sind auf den jeweiligen Operationsseiten dokumentiert.
