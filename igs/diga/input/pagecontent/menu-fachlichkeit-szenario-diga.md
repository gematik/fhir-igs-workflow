{% assign use_cases = site.data.use-cases %}

Das E-Rezept fuer Digitale Gesundheitsanwendungen (DiGA) ersetzt das Muster-16-Verfahren und sorgt dafuer, dass zertifizierte DiGAs medienbruchfrei, sicher und nachvollziehbar verordnet, an Kostentraeger uebermittelt und freigeschaltet werden koennen. Es ergaenzt die bestehenden Ablaeufe des E-Rezepts, erweitert sie um Psychotherapeutinnen und Psychotherapeuten sowie Kostentraeger und ermoeglicht eine vollstaendig digitale Bereitstellung der Freischaltcodes.

## Vorteile durch das E-Rezept fuer DiGA

- Versicherte muessen Antraege und Muster-16-Vordrucke nicht mehr postalisch einreichen, sondern erhalten Verordnungen sofort im E-Rezept-FdV oder optional als Ausdruck (Section 360 Abs. 9 SGB V).
- Aerztinnen, Zahnaerzte und Psychotherapeutinnen nutzen etablierte E-Rezept-Prozesse weiter, inklusive QES und Workflowsteuerung, wodurch Schulungs- und Dokumentationsaufwaende sinken.
- Krankenkassen empfangen Anfragen ueberwiegend digital, koennen die Verordnungsdaten strukturiert abrufen und sparen manuelle Bearbeitung der Papierformulare.
- Der E-Rezept-Fachdienst dokumentiert Bereitstellung und Nutzung des Freischaltcodes transparent, was Missbrauch erschwert und revisionssichere Nachweise liefert.

## DiGA-Verordnung erstellen

PVS/KIS greifen auf das BfArM-DiGA-Verzeichnis zu, waehlen die passende PZN (inklusive indikations- oder laufzeitbezogener Varianten) und erzeugen eine elektronische Verordnung. Nach Vergabe der PrescriptionID wird die Verordnung qualifiziert elektronisch signiert, an den E-Rezept-Fachdienst uebermittelt und dort als Flowtype 162 geprueft. Aerztinnen, Zahnaerzte und Psychotherapeutinnen folgen damit den gleichen QES- und Aktivierungsablaeufen wie bei Arzneimitteln; bei TI-Stoerungen steht das Muster 16 weiterhin als Ersatzverfahren bereit.

> Offener Punkt: Das BMG und die KBV stimmen ab, ob die PZN dauerhaft als Identifier genutzt wird. Das Datenmodell wird an das Ergebnis angepasst.

**Beteiligte Systeme:** PVS/KIS (inkl. Psychotherapeutinnen-Systeme), Konnektor, E-Rezept-Fachdienst

**Fachliche Anwendungsfaelle**

{% assign scenario_use_cases = "E_Rezept_erstellen, E_Rezept_qualifiziert_signieren, E_Rezept_vervollstaendigen_und_Task_aktivieren" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfaelle mit Bezug zu Szenario <i>DiGA</i>" %}

## DiGA zuweisen und Freischaltcode anfordern

Versicherte sehen neue DiGA-Verordnungen im E-Rezept-FdV (oder erhalten einen Ausdruck) und weisen sie ihrem Kostentraeger zu. Das E-Rezept-FdV ermittelt - idealerweise automatisch - die Telematik-ID der Krankenkasse ueber das FHIR-VZD, erstellt eine `Communication_DispReq` und uebermittelt den E-Rezept-Token. Alternativ koennen Versicherte den Ausdruck per Post, Servicecenter oder Krankenkassen-App einreichen; der Kostentraeger startet daraufhin selbst den Abruf. Status- und Protokolleintraege im FdV machen den Fortschritt (Freischaltcode angefordert, in Pruefung, erledigt) sichtbar.

**Beteiligte Systeme:** E-Rezept-FdV nach Section 360 Abs. 10 SGB V, Krankenkassen-App, Kostentraeger-Backend, E-Rezept-Fachdienst

**Fachliche Anwendungsfaelle**

{% assign scenario_use_cases = "DiGA_E_Rezept_zuweisen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfaelle mit Bezug zu Szenario <i>Zuweisung der DiGA-Verordnung</i>" %}

## Pruefung durch Kostentraeger und Bereitstellung des Freischaltcodes

Kostentraeger authentisieren sich ueber ihren Basis-Consumer, rufen das E-Rezept mit `$accept` ab und pruefen Anspruch, Indikation sowie ggf. ergaenzende Unterlagen. Nach erfolgreicher Pruefung erzeugen sie den Freischaltcode, legen ihn als Abgabeinformation via `$dispense` oder `$close` im E-Rezept-Fachdienst ab und schliessen den Workflow mit einer Quittung ab. Falls kein Freischaltcode ausgegeben werden kann, hinterlegen sie eine versichertenfreundliche Begruendung, damit Versicherte den Ausgang im FdV nachvollziehen koennen. Die gespeicherten Abgabeinformationen stehen - wie bei Arzneimitteln - auch der ePA zur Verfuegung.

**Beteiligte Systeme:** Kostentraeger-Backend inkl. Basis-Consumer, E-Rezept-Fachdienst, interne Freischaltcode-Services

**Fachliche Anwendungsfaelle**

{% assign scenario_use_cases = "DiGA_E_Rezept_abrufen_kostentraeger, DiGA_Freischaltcode_bereitstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfaelle mit Bezug zu Szenario <i>Freischaltcode-Bereitstellung durch Kostentraeger</i>" %}
