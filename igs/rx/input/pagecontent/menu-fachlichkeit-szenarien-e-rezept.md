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

### Verordnung apothekenpflichtiger Arzneimittel (GKV/PKV)

Ein verordnender Leistungserbringer erstellt im Primärsystem (PVS/KIS) den Verordnungsdatensatz, signiert diesen qualifiziert und stellt das E-Rezept im E-Rezept-Fachdienst bereit.

#### Fachlicher Ablauf

1. Der Verordner wählt den Verordnungsdatensatz aus und bestätigt die Ausstellung des E-Rezepts.
2. Die Verordnung wird qualifiziert signiert.
3. Das E-Rezept wird für den Versicherten bereitgestellt.
4. Der Versicherte kann das bereitgestellte E-Rezept in einer Apotheke einlösen.

#### Fachliche Unterschiede zwischen GKV und PKV

- Für PKV-Versicherte können zusätzliche Schritte zur Bereitstellung PKV-relevanter Versichertendaten erforderlich sein (z. B. Online Check-in).
- Beide Gruppen durchlaufen für apothekenpflichtige Arzneimittel den regulären Einlöseprozess in der öffentlichen Apotheke.

**Beteiligte Systeme:** PVS/KIS, E-Rezept-Fachdienst

**Technische Anwendungsfälle**

{% assign scenario_use_cases = "UC_2_1_E_Rezepte_erzeugen, E_Rezept_qualifiziert_signieren, UC_2_3_E_Rezept_einstellen, UC_2_5_E_Rezept_durch_Verordnenden_loeschen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Verordnung apothekenpflichtiger Arzneimittel (160/200)</i>" %}

### Belieferung in der Apotheke (GKV/PKV)

Nach Übergabe von Task-ID und AccessCode (z. B. 2D-Code oder Nachricht) ruft die Apotheke das E-Rezept im Fachdienst ab, beliefert den Versicherten und schließt den Workflow ab.

#### Fachlicher Ablauf

1. Die Apotheke nimmt das E-Rezept an und ruft die Verordnungsdaten ab.
2. Falls erforderlich, dokumentiert die Apotheke die Abgabeinformationen während der Belieferung.
3. Nach der Abgabe wird der Vorgang abgeschlossen und eine Quittung bereitgestellt.
4. Falls die Quittung nicht vorliegt, kann sie erneut bereitgestellt werden.

#### Fachliche Unterschiede zwischen GKV und PKV

- Bei PKV-Versicherten kann zusätzlich eine Einwilligung zur Bereitstellung von Abrechnungsinformationen vorliegen.
- Bei PKV muss dem Versicherten nach Abschluss der Abgabe eine ausgedruckte Quittung für die private Abrechnung bereitgestellt werden.

**Beteiligte Systeme:** AVS, E-Rezept-Fachdienst

**Technische Anwendungsfälle (User Stories)**

{% assign scenario_use_cases = "UC_4_1_E_Rezept_durch_Abgebenden_abrufen, UC_4_2_E_Rezept_durch_Abgebenden_zurueckgeben, UC_4_3_E_Rezept_durch_Abgebenden_loeschen, UC_4_4_Quittung_abrufen, UC_4_5_Abgabedatensatz_signieren, UC_4_8_Quittung_erneut_abrufen, UC_4_16_Dispensierinformationen_bereitstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Belieferung apothekenpflichtiger Arzneimittel (160/200)</i>" %}

### Verwalten von E-Rezepten durch Versicherten

Versicherte verwalten ihre E-Rezepte in der E-Rezept-App, sehen Zugriffsprotokolle ein und laden bei Bedarf zusätzliche Informationen zum ausgegebenen Medikament herunter. Wird auf einen Papierausdruck verzichtet, erfolgt die Einlösung über die App: Aus den heruntergeladenen Daten wird ein 2D-Code (DataMatrix) erzeugt, der in der Apotheke gescannt wird und damit die Adresse sowie Zugriffsberechtigung zum E-Rezept bereitstellt. Vertreter können E-Rezepte ebenfalls einsehen oder herunterladen, sofern ihnen der AccessCode bekannt ist.

#### Fachlicher Ablauf

1. Der Versicherte ruft seine E-Rezepte im FdV ab und sieht Status sowie Detailinformationen ein.
2. Optional erstellt die E-Rezept-App einen 2D-Code zur Einlösung und stellt ihn zur Verfügung.
3. Der Versicherte kann zusätzliche Informationen (z. B. Dispensierinformationen) abrufen.
4. Bei Bedarf löscht der Versicherte ein E-Rezept; Vertreter handeln analog mit bekanntem AccessCode.

**Beteiligte Systeme:** FdV, E-Rezept-Fachdienst

**Technische Anwendungsfälle (User Stories)**

{% assign scenario_use_cases = "UC_3_1_E_Rezepte_durch_Versicherten_abrufen, UC_3_2_E_Rezept_durch_Versicherten_loeschen, UC_3_9_Dispensierinformationen_durch_Versicherten_abrufen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Verwalten von E-Rezepten durch Versicherten</i>" %}


### Nachrichtenaustausch zwischen Versicherten und Apotheke

Versicherte und Apotheken tauschen Nachrichten zum E-Rezept asynchron über den E-Rezept-Fachdienst aus. Dabei kann der Versicherte eine Apotheke verbindlich zuweisen und optional strukturierte Angaben zur Belieferung (z. B. Abholung oder Botenlieferung) mitsenden. Die Apotheke kann auf diese Nachricht antworten und dem Versicherten weitere Informationen bereitstellen.

#### Fachlicher Ablauf

1. Der Versicherte weist das E-Rezept einer Apotheke zu und sendet eine Nachricht mit dem E-Rezept-Token.
2. Der E-Rezept-Fachdienst validiert den Inhalt, ergänzt Metadaten (Absender, Sendezeitpunkt) und stellt die Nachricht bereit.
3. Die Apotheke ruft neue Nachrichten ab, verarbeitet die Angaben und antwortet bei Bedarf mit einer eigenen Nachricht.
4. Der Versicherte ruft Antworten der Apotheke ab und kann den weiteren Belieferungsprozess starten.

**Beteiligte Systeme:** FdV, AVS, E-Rezept-Fachdienst

**Technische Anwendungsfälle (User Stories)**

{% assign scenario_use_cases = "UC_3_3_Nachricht_durch_Versicherten_uebermitteln, UC_3_8_Nachricht_durch_Versicherten_loeschen, UC_4_6_Nachrichten_durch_Abgebenden_empfangen, UC_4_7_Nachricht_durch_Abgebenden_uebermitteln, UC_4_9_Nachricht_durch_Abgebenden_loeschen, UC_3_4_Nachrichten_durch_Versicherten_empfangen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Nachrichtenaustausch zwischen Versicherten und Apotheke</i>" %}
