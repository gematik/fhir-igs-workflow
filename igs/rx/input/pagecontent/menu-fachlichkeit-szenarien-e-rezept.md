{% assign use_cases = site.data['use-cases'] %}

Dieses Kapitel beschreibt den fachlichen Normalfall von der Verordnung bis zur Belieferung in der Apotheke.
Im Fokus stehen die Handlungen der Beteiligten (Arzt, Versicherter, Apotheke) sowie die fachlichen Schritte.

Das Szenario umfasst die Versorgung gesetzlich (GKV) und privat (PKV) Versicherter.

### Epic

Ein Versicherter soll ein apothekenpflichtiges Arzneimittel sicher und nachvollziehbar erhalten.
Der Verordner erstellt eine Verordnung, der Versicherte kann sie einlösen, die Apotheke beliefert und dokumentiert die Abgabe.

### User Stories (fachlich)

- Als verordnender Leistungserbringer möchte ich ein E-Rezept ausstellen und bereitstellen, damit der Versicherte das Arzneimittel beziehen kann.
- Als Versicherter möchte ich mein E-Rezept einlösen können, damit ich das Arzneimittel in der Apotheke erhalte.
- Als Apotheke möchte ich ein E-Rezept annehmen, beliefern und abschließen, damit die Abgabe korrekt dokumentiert ist.

## Verordnung apothekenpflichtiger Arzneimittel (GKV/PKV)

Ein verordnender Leistungserbringer erstellt im Primärsystem (PVS/KIS) den Verordnungsdatensatz, signiert diesen qualifiziert und stellt das E-Rezept im E-Rezept-Fachdienst bereit.

### Fachlicher Ablauf

1. Der Verordner wählt den Verordnungsdatensatz aus und bestätigt die Ausstellung des E-Rezepts.
2. Die Verordnung wird qualifiziert signiert.
3. Das E-Rezept wird für den Versicherten bereitgestellt.
4. Der Versicherte kann das bereitgestellte E-Rezept in einer Apotheke einlösen.

### Fachliche Unterschiede zwischen GKV und PKV

- Für PKV-Versicherte können zusätzliche Schritte zur Bereitstellung PKV-relevanter Versichertendaten erforderlich sein (z. B. Online Check-in).
- Beide Gruppen durchlaufen für apothekenpflichtige Arzneimittel den regulären Einlöseprozess in der öffentlichen Apotheke.

**Beteiligte Systeme:** PVS/KIS, E-Rezept-Fachdienst

**Technische Anwendungsfälle (User Stories)**

{% assign scenario_use_cases = "E_Rezept_erstellen, E_Rezept_qualifiziert_signieren, E_Rezept_vervollstaendigen_und_Task_aktivieren, E_Rezept_loeschen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Verordnung apothekenpflichtiger Arzneimittel (160/200)</i>" %}

## Belieferung in der Apotheke (GKV/PKV)

Nach Übergabe von Task-ID und AccessCode (z. B. 2D-Code oder Nachricht) ruft die Apotheke das E-Rezept im Fachdienst ab, beliefert den Versicherten und schließt den Workflow ab.

### Fachlicher Ablauf

1. Die Apotheke nimmt das E-Rezept an und ruft die Verordnungsdaten ab.
2. Falls erforderlich, dokumentiert die Apotheke die Abgabeinformationen während der Belieferung.
3. Nach der Abgabe wird der Vorgang abgeschlossen und eine Quittung bereitgestellt.
4. Falls die Quittung nicht vorliegt, kann sie erneut bereitgestellt werden.

### Fachliche Unterschiede zwischen GKV und PKV

- Bei PKV-Versicherten kann zusätzlich eine Einwilligung zur Bereitstellung von Abrechnungsinformationen vorliegen.
- Bei PKV muss dem Versicherten nach Abschluss der Abgabe eine ausgedruckte Quittung für die private Abrechnung bereitgestellt werden.

**Beteiligte Systeme:** AVS, E-Rezept-Fachdienst

**Technische Anwendungsfälle (User Stories)**

{% assign scenario_use_cases = "E_Rezept_abrufen_apotheke, E_Rezept_abgabe_dokumentieren, E_Rezept_abgabe_abschliessen, E_Rezept_loeschen, E_Rezept_secret_wiederherstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Belieferung apothekenpflichtiger Arzneimittel (160/200)</i>" %}

## Übergang in technische Umsetzung

Die fachlichen Anwendungsfälle werden in den technischen Anwendungsfällen konkretisiert:

- [Technische Anwendungsfälle](./menu-technische-umsetzung-anwendungsfaelle.html)
