{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

### Verschreiben
Der technische Ablauf zum Verschreiben einer Verordnung für eine DiGA erfolgtanalog zu
einer Verordnung für apothekenpflichtige Arzneimittel.
Verordnungen von DiGAs können Ärzten, Zahnärzten und Psychotherapeuten vornehmen.
Der Arzt oder medizinischer Fachangestellter (MFA) erstellt eine elektronische
Verordnung für eine DiGA. Über das Primärsystem der LEI wird vom E-Rezept-Fachdienst
eine Rezept-ID angefragt und in der Verordnung ergänzt. Der Arzt prüft die Verordnung
und führt eine qualifizierte elektronische Signatur (QES) der Verordnung durch.
Anschließend wird die signierte Verordnung (E-Rezept) an den E-Rezept-Fachdienst
übermittelt, wo die formale Korrektheit der Verordnung gemäß dem Datenmodell und die
QES validiert werden.
Das E-Rezept liegt auf dem E-Rezept-Fachdienst zum Abruf durch den Versicherten
bereit.

{% assign scenario_use_cases = "UC_2_1_E_Rezepte_erzeugen, E_Rezept_qualifiziert_signieren, UC_2_3_E_Rezept_einstellen, UC_2_5_E_Rezept_durch_Verordnenden_loeschen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Verordnung von digitalen Gesundheitsanwendungen (162)</i>" %}

### Zuweisen durch den Versicherten
Der Versicherte sieht in seinem E-Rezept-FdV, dass ein E-Rezept für eine DiGA erstellt
wurde. Diese kann er einsehen und seinem Kostenträger zuweisen, damit er einen
Freischaltcode zur Nutzung der DiGA erhält.
Das E-Rezept-FdV bietet dem Versicherten dazu die Möglichkeit den E-Rezept-Token der
Verordnung an den Kostenträger zu übertragen. Das Ermitteln des Kostenträgers erfolgt
möglichst automatisch, kann aber auch manuell erfolgen.
Wenn der Versicherte kein E-Rezept-FdV nutzt, hat er die Möglichkeit den
Patientenausdruck an seine Krankenkasse zu übermitteln. Dies kann durch Funktionalität
in der Krankenkassen-App unterstützt werden.

### Einlösen
Der Kostenträger kann mit den Informationen aus dem E-Rezept-Token die Verordnung
vom E-Rezept-Fachdienst herunterladen und den Vorgang prüfen. Sobald ein
Freischaltcode generiert wurde, wird dem Versicherten dieser über Abgabeinformationen
der Verordnung bereitgestellt. Dadurch wird der Vorgang der Verordnung abgeschlossen
und der Versicherte hat den Freischaltcode für die DiGA in seinem E-Rezept-FdV
vorliegen.
Sollte die fachliche Prüfung des Kostenträgers ergeben, dass kein Leistungsanspruch für
diese Verordnung besteht, kann der E-Rezept-Workflow auch ohne die Übermittlung eines
Freischaltcodes abgeschlossen werden. In diesem Fall enthält die Abgabeinformation
einen Hinweis auf die Begründung (versichertenfreundlicher Formulierung mit Verweis
auf das Schreiben der Krankenkasse), warum kein Freischaltcode bereitgestellt wurde.
Über entsprechende Protokolleinträge ist der Versicherte darüber informiert, dass der
Kostenträger den Vorgang bearbeitet.
Der Kostenträger erhält analog zum Abschluss von Arzneimittelverordnungen eine
Quittung des Fachdienstes, was dem Kostenträger quittiert, dass der Vorgang erfolgreich
abgeschlossen wurde. Die Quittung wird nicht für Abrechnungszwecke benötigt, da die
Abwicklung des Vorgangs direkt mit dem Kostenträger erfolgt.
input.