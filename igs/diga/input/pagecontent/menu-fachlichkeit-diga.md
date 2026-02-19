Das Feature "Elektronische Verordnung von DiGAs" erweitert die bestehenden Workflows um
Verordnungen für Digitale Gesundheitsanwendungen (DiGA). DiGAs sind zertifizierte Apps oder Webanwendungen, die Patienten bei der Erkennung, Überwachung und Behandlung von Erkrankungen unterstützen. 
Das Feature beschreibt die Prozessparameter, Rollen und fachlichen Anforderungen für den Workflow-Fachdienst und beteiligte Clientsysteme.

### Abgrenzungen
Folgende Aspekte sind nicht Gegenstand dieses IG:
- Die Option der Beantragung einer DiGA durch gesetzlich Versicherte direkt bei einer
Krankenkasse ohne vorliegende ärztliche oder psychotherapeutische Verordnung.
- Privatversicherte und Versicherte sonstiger Kostenträger werden nicht betrachtet.
- Da für die Berufsgenossenschaften und gesetzlichen Unfallkassen noch nicht die
Voraussetzungen geschaffen wurden, auf den E-Rezept-Fachdienst in der TI
zuzugreifen, können sie an der elektronischen Verordnung von DiGAs noch nicht
teilnehmen. Die Einbindung wird für eine Folgestufe angestrebt.
- Bestehende Schnittstellen zwischen DiGA Herstellern und Krankenkassen zwecks
Abrechnung von Freischaltcodes werden nachgenutzt und sind daher unabhängig
dieses Dokumentes.

### Epic

Durch das Digitale Versorgungsgesetz wurde ermöglicht, "digitale Gesundheitsanwendungen" (DiGAs) ärztlich zu verordnen.

Beschreibung DiGA: (Quelle: https://www.bundesgesundheitsministerium.de/themen/krankenversicherung/online-ratgeber-krankenversicherung/arznei-heil-und-hilfsmittel/digitale-gesundheitsanwendungen):

*DiGA - auch Apps auf Rezept genannt - sind digitale CE-gekennzeichnete Medizinprodukte niedriger Risikoklassen, die die Versicherten etwa bei der Behandlung von Erkrankungen oder dem Ausgleich von Beeinträchtigungen unterstützen können. Anwendungsfelder wie Diabetologie, Kardiologie, Logopädie, Psychotherapie oder Physiotherapie vermitteln nur einen kleinen Überblick über die Vielzahl der Einsatzgebiete. Eine häufige Form sind Gesundheits-Apps für das Smartphone, aber es gibt auch browserbasierte Webanwendungen oder Software zur Verwendung auf klassischen Desktop-Rechnern. [...] Voraussetzung ist, dass die Anwendungen zuvor eine Prüfung auf Anforderungen wie Sicherheit, Funktionstauglichkeit, Datenschutz und Datensicherheit beim BfArM durchlaufen haben. [...] Um Leistungserbringende und Versicherte über gute und sichere digitale Gesundheitsinformationen informieren zu können, wurde beim BfArM ein Verzeichnis für DiGA eingerichtet (https://diga.bfarm.de/de). Es enthält neben der Aufzählung erstattungsfähiger DiGA eine Vielzahl weitergehender Informationen für die Versicherten und Leistungserbringenden.*

Beschreibung des Verordnungsvorgangs: (Quelle: https://www.kbv.de/html/diga.php)
Ärzte und Psychotherapeuten können bislang ein Rezept auf Muster 16 für eine DiGA ausstellen. Zu jeder gelisteten DiGA stellt das BfArM im Verzeichnis Informationen bereit, die verordnungsrelevant sind. Diese Informationen stehen den Praxisverwaltungssystemen (PVS) bereit:
- Im DiGA-Verzeichnis steht zu jeder DiGA unter "Informationen für Fachkreise" eine eindeutige PZN.
- Kann eine DiGA für unterschiedliche Indikationen mit jeweils unterschiedlichen Inhalten angewendet werden, ist jeder Indikation eine eigene PZN zugeordnet.
- Sofern für eine DiGA unterschiedliche Anwendungsdauern hinterlegt sein sollten, würden ebenfalls eigene PZN zugeordnet sein.
- Die PZN ist auf dem Rezept anzugeben.

Verordnungsdauer und Menge:
- Für jede DiGA ist eine bestimmte, vom Hersteller bereits vorgegebene Anwendungsdauer festgelegt; diese Informationen können im DiGA-Verzeichnis ebenfalls unter „Informationen für Fachkreise“ eingesehen werden. Eine Angabe auf der Verordnung ist nicht erforderlich.
- Eine Folgeverordnung für die gleiche DiGA kann ausgestellt werden, wenn sie aus medizinischer Sicht indiziert ist und das angestrebte Therapieziel damit voraussichtlich erreicht werden kann.
- Derzeit sind keine DiGA-Höchstverordnungsmengen pro Versicherten festgelegt; das heißt, dass gegebenenfalls mehrere unterschiedliche DiGA für unterschiedliche Indikationen gleichzeitig verordnet werden können.
- Pro Rezeptblatt darf nur eine DiGA verordnet werden.

Einlösen des Rezeptes:
- Mit dem Rezept wenden sich Versicherte an ihre Krankenkasse.
- Diese prüft unter anderem den Versichertenstatus und generiert einen Freischaltcode.
- Danach laden sich Versicherte die DiGA-App im jeweiligen App-Store herunter und geben den Freischaltcode ein.
- Die Kosten für die DiGA werden dann von der Kasse direkt mit dem Hersteller abgerechnet.
- Eine Zuzahlungspflicht für Versicherte besteht nicht. Nur wenn der DiGA-Preis über dem Höchstbetrag liegt, müssen Versicherte die Mehrkosten tragen. Kosten optionaler Dienste und Funktionen einer DIGA, die keinen medizinischen Zweck verfolgen, sowie in-App Käufe trägt der Versicherte selbst.

Verweise:
- Anforderungen an Primärsysteme zur Auswahl einer DiGA aus dem Verzeichnis des BfArM ergeben sich aus den Zertifizierungsanforderungen der KBV (siehe https://update.kbv.de/ita-update/Verordnungen/VDGA/)
- Die FHIR Profile der KBV zur elektronischen Verordnung der DiGA werden hier definiert: https://simplifier.net/evdga
- Die technische Anlage zur elektronischen Verordnung Digitaler Gesundheitsanwendungen (Muster E16D): https://update.kbv.de/ita-update/DigitaleMuster/eVDGA/KBV_ITA_VGEX_Technische_Anlage_EVDGA.pdf
- Vereinbarungen zur Abrechnung werden hier definiert:  https://www.gkv-spitzenverband.de/krankenversicherung/digitalisierung/kv_diga/diga.jsp

### User Stories

#### Versicherte

Als Patient möchte ich 
- ... DiGA-Verordnungen unmittelbar/sofort elektronisch empfangen können, so dass ich die DiGA, die mir verschrieben wurde, auch medienbruchfrei beziehen kann.
- ... auch ohne Einsatz eines E-Rezept-FdVs (beispielsweise durch Papierausdruck und/oder Einsatz Krankenkassen-App) mit DiGA-Verordnungen umgehen können, so dass ich nicht darauf angewiesen bin, eine NFC-fähige eGK, eine dazu passende PIN, ein NFC-fähiges Gerät haben zu müssen, um DiGAs verwenden zu können.
- ..., dass sich der Prozess des Empfangs der DiGA-Verordnungen möglichst wenig von dem Prozess für Arzneimittelverordnungen unterscheidet, so dass ich mich nicht umgewöhnen muss.
- ..., dass ich über den Erhalt einer DiGA-Verordnung in meinem E-Rezept-FdV benachrichtigt werde, so dass ich reagieren kann und den Erhalt nicht selbst prüfen muss.
- ..., dass meine sensiblen medizinischen Daten nur den Personen oder Institutionen offenbart werden, die sie wirklich brauchen, so dass ich mich sicher fühle.
- ..., dass eine mir verordnete DiGA ganz leicht freigeschaltet werden kann, so dass ich möglichst ohne Hürden in die Nutzung der DiGA einsteigen und damit meine Therapie unterstützen kann.
- ..., dass ich beim Freischaltprozess, so weit es geht, von der Technik unterstützt werde, so dass dieser Vorgang leicht ist und sich für mich "automatisch" anfühlt.
- ..., dass ich die Freischaltcode-Anforderung bei meiner Krankenkasse einfach starten und den Status verfolgen kann. Der Start kann über ein E-Rezept-FdV, die Krankenkassen-App (mindestens per Scan des Tokens), per Post oder im Servicecenter der Krankenkasse erfolgen.
- ..., dass ich den Freischaltcode der DiGA sowohl als Information meiner Krankenkasse (via Krankenkassen-App/Brief) oder direkt im E-Rezept-FdV erhalten kann.
- ..., dass der Abrechnungsprozess ohne mein Mitwirken abläuft, so dass ich wie gewohnt Leistungen meiner Krankenkasse einfach beziehen kann und keinen administrativen Aufwand habe.
- ... installierbare DiGA-Apps direkt aus der Ansicht der Verordnungen im E-Rezept-FdV (alternativ Krankenkassen-App) heraus installieren können, so dass ich nicht manuell im App/Play-Store suchen muss und der Prozess für mich einfach ist.
- ... auf DiGAs, die nicht installiert werden können (Bsp. Web-Apps) direkt aus der Ansicht der Verordnung in der App mit E-Rezept-Funktionalität (alternativ Krankenkassen-App) heraus aufrufen können, so dass ich nicht auf Bookmarks oder andere Quellen angewiesen bin.
- ..., dass ich einfach auf die beim BfArM hinterlegte Informationsseite der DiGA sowie die Gebrauchsanweisung per Link aus dem E-Rezept-FdV zugreifen kann, so dass ich mich schnell informieren kann.
- ..., dass ich einfach die Mindestanforderungen der verordneten DiGA-App aus dem Verzeichnis des BfArM per E-Rezept-FdV finden kann, so dass ich in der Lage bin die Mindestanforderungen an mein Endgerät zu prüfen. Im E-Rezept-FdV wird ein Hinweis ausgespielt (z.B.: "Auf diesem Gerät kann die DiGA ggf. nicht verwendet werden").

#### Verordnende
Als verordnender Arzt möchte ich, ...
- ... dass der DiGA-Verordnungsprozess nahtlos in meine Prozesse integriert ist, so dass die Prozesskosten/Aufwand beim Verordnen niedrig ist/bleibt.
- ... dass durch den DiGA-Verordnungsprozess keine zusätzlichen Aufwände in der täglichen Arbeit entstehen, so dass ich nicht noch mehr Zeit für Bürokratie aufbringen muss. Es sollen möglichst wenig Papierausdrucke erstellen.
- ... dass durch den DiGA-Verordnungsprozess möglichst gleiche Abläufe wie für sonstige Medikamente nachgenutzt werden, so dass ich dem Patienten nicht viel erklären muss. Über den Freischaltcodeabruf (Anfragen des Freischaltcodes beim Kostenträger) muss aufgeklärt werden.
- ... dass meine Patienten gut darüber informiert sind, was DiGAs sind. Als Arzt möchte ich möglichst wenig Aufklärung über administrative Prozesse der Krankenkasse zum Erhalt des Freischaltcodes übernehmen.
- ... dass ein Ersatzverfahren existiert (vergleichbar heutiger Prozess Muster 16), so dass ich auch bei Internetausfall (de/zentrale Verbindungsprobleme mit/ohne TI) eine DiGA verordnen kann.

#### Kostenträger
Als Kostenträger möchte ich ...
- ..., dass der Abrechnungsprozess einfach ist, so dass die Prozesskosten niedrig sind.
- ..., dass nur die versicherte Person die verordnete Leistung in Anspruch nehmen kann, so dass missbräuchliche Nutzung bestmöglich vermieden wird.
- ..., dass ich alle Informationen erhalte, die ich für den Abrechnungsprozess benötige, so dass ich nicht Rückfragen stellen muss, um die Abrechnung durchzuführen.
- ..., dass alle Prozesse und auch die Prüfbarkeit so gestaltet sind, dass eine einfache maschinelle Verarbeitung möglich ist, so dass ich automatisieren und damit die Prozesskosten niedrig halten kann.
-..., dass Versicherte einfach per Krankenkassen-App den E-Rezept Code vom Ausdruck scannen, durch Einsenden per Post, Abgabe im Servicecenter oder aus einem E-Rezept-FdV heraus die Freischaltcode-Anforderung starten können.
- ... nach Übergabe des E-Rezept-Tokens des Versicherten die Verordnungsdaten direkt über den E-Rezept-Fachdienst abholen.
- ... Services im Zusammenhang mit der Verordnung (Empfangen und Weiterleiten von E-Rezept-Token) über die Krankenkassen-Apps bereitstellen.
- ..., dass Verordnungs- und Abrechnungsprozess prüfbar sind, so dass ich jederzeit nachprüfen kann, ob eine Verordnung und die anschließende Nutzung korrekt sind.
- ..., dass der Abrechnungsprozess einfach ist, so dass die Prozesskosten niedrig sind.
- ..., dass der Verordnungs- und Abrechnungsprozess so gestaltet ist, dass Betrug ausgeschlossen oder mindestens erschwert wird, so dass die Versichertengelder für den richtigen Zweck eingesetzt werden. Eine revisionssichere Dokumentation muss möglich sein.
- ..., dass nur die versicherte Person die verordnete Leistung in Anspruch nehmen kann, so dass missbräuchliche Nutzung bestmöglich vermieden wird.
- ..., dass ich alle Informationen erhalte, die ich für den Abrechnungsprozess benötige, so dass ich nicht Rückfragen stellen muss, um die Abrechnung durchzuführen.
- ..., dass alle Prozesse und auch die Prüfbarkeit so gestaltet sind, dass eine einfache maschinelle Verarbeitung möglich ist, so dass ich automatisieren und damit die Prozesskosten niedrig halten kann.
- ... nach Übergabe des E-Rezept-Tokens des Versicherten die elektronischen Verordnungsdaten direkt vom E-Rezept-Fachdienst abholen.

#### DiGA Hersteller
DiGA Hersteller sind zunächst nicht in den Verordnungsvorgang und nicht bei Übergabe der elektronischen Verordnung vom Versicherten an die Krankenkasse involviert. Die User Stories aus Sicht der DiGA Hersteller, sollen dennoch als Perspektive zum Verständnis der Rolle der Hersteller und derer Anforderungen hier genannt werden.

Als DiGA Hersteller möchte ich 
- ..., dass Patienten auch die DiGA erhalten, die sie verordnet bekommen haben.
- ... meinen Patienten einen einfachen Einstieg in meine DiGA bieten.
- ..., dass Nutzer im Standardprozess nicht mit dem Freischaltcode in Berührung kommen oder diesen gar manuell übertragen müssen.
- ..., dass die Übermittlung des Freischaltcodes in den E-Rezept-Fachdienst die Dispensierung darstellt.
- ..., dass mit Einlösung des E-Rezeptes bei der Krankenkasse der Patient über den Freischaltcode informiert wird.
- ..., dass mit Einlösung des E-Rezeptes der Freischaltcode fristgerecht bereitgestellt wird, damit ich nach der Einlösung des Freischaltcodes durch den Versicherten abrechnen kann.
- ..., dass im Verordnungsprozess wie auch bei Bereitstellung der Freischaltcodes hochverfügbare Dienste angeboten werden.
- ..., dass Patienten eine einheitliche Rückmeldung erhalten, warum kein Freischaltcode ausgestellt werden kann.