{% assign use_cases = site.data['use-cases'] %}

Das Szenario beschreibt den Normalfall für apothekenpflichtige Arzneimittel von der Verordnung bis zur Belieferung in der Apotheke.
Es umfasst die Workflows `160` und `200`:

- `160`: Muster 16 (apothekenpflichtige Arzneimittel) für gesetzlich Versicherte (GKV)
- `200`: PKV (apothekenpflichtige Arzneimittel) für privat Versicherte (PKV)

## Verordnung apothekenpflichtiger Arzneimittel (Workflow 160/200)

Ein verordnender Leistungserbringer erstellt im Primärsystem (PVS/KIS) den Verordnungsdatensatz, signiert diesen qualifiziert und stellt das E-Rezept im E-Rezept-Fachdienst bereit.

### Fachlicher Ablauf

1. Das Primärsystem erstellt mit `POST /Task/$create` einen Task für das E-Rezept und erhält Rezept-ID sowie AccessCode.
2. Der Leistungserbringer signiert den Verordnungsdatensatz mit QES (HBA/Konnektor).
3. Das Primärsystem übermittelt den QES-Datensatz mit `POST /Task/{id}/$activate`; der Task wird auf `ready` gesetzt.
4. Der Versicherte kann das bereitgestellte E-Rezept anschließend in einer Apotheke einlösen.

### Fachliche Unterschiede zwischen 160 und 200

- Der Flowtype wird bereits bei `$create` festgelegt (`160` oder `200`) und bestimmt den Rezepttyp.
- Workflow `200` setzt für die digitale Bereitstellung PKV-relevanter Versichertendaten den vorgesehenen Prozess voraus (Online Check-in).
- Beide Workflows führen für apothekenpflichtige Arzneimittel in den regulären Einlöseprozess in der öffentlichen Apotheke.

**Beteiligte Systeme:** PVS/KIS, E-Rezept-Fachdienst

**Fachliche Anwendungsfälle (User Stories)**

{% assign scenario_use_cases = "E_Rezept_erstellen, E_Rezept_qualifiziert_signieren, E_Rezept_vervollstaendigen_und_Task_aktivieren, E_Rezept_loeschen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfälle mit Bezug zu Szenario <i>Verordnung apothekenpflichtiger Arzneimittel (160/200)</i>" %}

## Belieferung in der Apotheke (Workflow 160/200)

Nach Übergabe von Task-ID und AccessCode (z. B. 2D-Code oder Nachricht) ruft die Apotheke das E-Rezept im Fachdienst ab, beliefert den Versicherten und schließt den Workflow ab.

### Fachlicher Ablauf

1. Das AVS ruft mit `POST /Task/{id}/$accept?ac=...` das E-Rezept ab und erhält Task, QES-Datensatz sowie ein apothekenspezifisches Secret.
2. Optional kann das AVS Dispensierinformationen vorab mit `POST /Task/{id}/$dispense?secret=...` speichern (Status bleibt `in-progress`).
3. Mit `POST /Task/{id}/$close?secret=...` wird die Abgabe abgeschlossen und ein signiertes Quittungs-Bundle zurückgegeben.
4. Bei Bedarf kann die Apotheke die Quittung später erneut abrufen.

### Fachliche Unterschiede zwischen 160 und 200

- Bei Rezepten mit Flowtype `200` kann beim Abruf zusätzlich ein Consent bereitgestellt werden (wenn die Einwilligung zur Bereitstellung von Abrechnungsinformationen vorliegt).
- Bei `200` muss dem Versicherten nach Abschluss der Abgabe eine ausgedruckte Quittung für die private Abrechnung bereitgestellt werden.

**Beteiligte Systeme:** AVS, E-Rezept-Fachdienst

**Fachliche Anwendungsfälle (User Stories)**

{% assign scenario_use_cases = "E_Rezept_abrufen_apotheke, E_Rezept_abgabe_dokumentieren, E_Rezept_abgabe_abschliessen, E_Rezept_loeschen, E_Rezept_secret_wiederherstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfälle mit Bezug zu Szenario <i>Belieferung apothekenpflichtiger Arzneimittel (160/200)</i>" %}

## Übergang in technische Umsetzung und Schnittstellen

Für die Umsetzung wird aus den fachlichen Anwendungsfällen in die technischen Anwendungsfälle verzweigt:

- [Technische Anwendungsfälle](./menu-technische-umsetzung-anwendungsfaelle.html)

Die zugehörigen Schnittstellen für den Normalfall sind insbesondere:

- [Operation API: $create](./op-create.html)
- [Operation API: $activate](./op-activate.html)
- [Operation API: $accept](./op-accept.html)
- [Operation API: $dispense](./op-dispense.html)
- [Operation API: $close](./op-close.html)
- [Query API: Task](./query-api-task.html)
- [Query API: MedicationDispense](./query-api-medicationdispense.html)
