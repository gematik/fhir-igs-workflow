{% assign use_cases = site.data['gen-use-cases'] %}

> Die weitere fachliche und technische Beschreibung zum Übertragen des digitale Durchschlag E-T-Rezept wird im FHIR Implementation Guide [gemIG_TIFlow_bfarm] beschrieben.
{: .stu-note}

### Epic und User Story

Gemäß § 312 Abs. 1 Nr. 2 SGB V soll die gematik Maßnahmen durchführen, damit vertragsärztliche Verordnungen für Arzneimittel nach § 3a Abs. 1 Satz 1 der Arzneimittelverschreibungsverordnung (elektronisches T-Rezept, E-T-Rezept) elektronisch übermittelt werden können. Weitere Vorgaben an das elektronische T-Rezept ergeben sich insbesondere aus dem § 3a in der Arzneimittelverschreibungsverordnung (AMVV).

Das vorliegende Feature Dokument bildet die Grundlage, damit die gematik sowie die beteiligten Industriepartner den neuen elektronischen Verordnungstyp entwickeln und bereitstellen können. 

In diesem Abschnitt wird das Feature fachlich motiviert und der Mehrwert für Nutzer vorgestellt. Aus diesen Epics und User Stories wird anschließend ein technisches Konzept abgeleitet.

#### Epic: E-T-Rezept

##### Vorteile durch das E-T-Rezept

Ziel des E-T-Rezept ist es sicherzustellen, dass Arzneimittel nach §3a Abs. 1 Satz 1 AMVV, also die teratogenen Wirkstoffe Lenalidomid, Pomalidomid oder Thalidomid, digital, sicher und effizient verordnet werden können. Das bisherige Verordnungsverfahren über ein amtliches Formblatt soll im Regelfall für Vertragsärzte abgelöst und somit bei den an der Versorgung beteiligten Akteuren (Ärztinnen und Ärzte sowie Apotheken) zur Erleichterung als auch in der Bundesopiumstelle im BfArM administrative Aufwände reduziert werden, ohne die Patientenversorgung zu beeinträchtigen. Beispielsweise müssen sich Ärzte künftig vor der Verordnung von Arzneimitteln nach §3a Abs. 1 Satz 1 AMVV nicht mehr beim BfArM registrieren und keine Formblätter mehr anfordern. Auch das Bedrucken der Formblätter mit dem Nadeldrucker entfällt. Administrative Aufwände in der Apotheke können durch die automatische Übermittlung der Daten an das BfArM reduziert werden.

Auch die Überwachung der Verschreibung und Abgabe von Arzneimitteln nach §3a Abs. 1 Satz 1 AMVV wird erleichtert. Aus Gründen der Datensparsamkeit mussten bisher alle Patientendaten auf den Rezeptdurchschlägen vor der Übermittlung an das BfArM geschwärzt werden. Dadurch konnte im BfArM T-Register beispielsweise nicht anhand des Alters geprüft werden, ob die Verordnung für gebärfähige Frauen ausgestellt wurde. Zudem wurden die Durchschläge erst nach der Abgabe einmal wöchentlich dem BfArM T-Register übermittelt, was bedeutete, dass die Prüfung erst stattfand, nachdem die Medikamenteneinnahme begonnen hatte. Es ist zudem nicht auszuschließen, dass Durchschläge der Rezepte auf dem Postweg verloren gehen.

**Veränderung durch das E-T-Rezept**: Durch die Prüfung der Angabe einer Reichdauer und der Pflichtangaben im Verordnungsprozess kann sichergestellt werden, dass die Angabe der Reichdauer gesetzeskonform ist und Pflichtangaben auf der Verordnung nicht vergessen werden.

##### E-T-Rezept ausstellen

E-T-Rezepte können in der ambulanten vertragsärztlichen Versorgung und im Rahmen des Entlassmanagements von Krankenhäusern durch alle Ärzte mit einem Heilberufsausweis ausgestellt werden. Tierärzte und Zahnärzte sind nicht befugt E-T-Rezepte auszustellen. Damit Vorliegen des elektronischen Heilberufsausweis nachgewiesen wurde, dass eine gültige Approbation vorliegt, ist keine vorherige Registrierung beim BfArM mehr notwendig. Die bereits etablierten und erlernten Arbeitsprozesse für die Erstellung eines E-Rezepts, sollen für die E-T-Rezepte nachgenutzt und erweitert werden (z.B. Vorbereitung durch MFAs, Signaturprozesse, etc.). Es muss für Versicherte von allen Kostenträgern genutzt werden, sofern dies technisch möglich ist. 

Verordnung von Arzneimitteln nach §3a AMVV müssen gemäß §3a Abs. 1 AMVV als "T-Rezept" gekennzeichnet werden. Das Primärsystem des Arztes soll sicherstellen, dass das Kennzeichen "T-Rezept" immer bei Verordnungen für Arzneimittel nach §3a AMVV gesetzt wird. Es soll auch sicherstellen, dass das Kennzeichen für andere Arzneimittel nicht gesetzt werden kann und diese somit nicht fälschlicherweise als E-T-Rezepte verordnet werden. 

Weiterhin müssen gemäß §3a AMVV folgende zusätzliche Angaben durch den Arzt auf der elektronischen Verordnung zwingend erfasst werden:

1. Bestätigung des Arztes, dass die Sicherheitsmaßnahmen gemäß der aktuellen Fachinformation eines entsprechenden Fertigarzneimittels eingehalten werden, insbesondere, dass erforderlichenfalls ein Schwangerschafts-Präventionsprogramm durchgeführt wird. (§3a Abs. 2 AMVV)
2. Bestätigung des Arztes, dass der Patientin oder dem Patienten vor Beginn der medikamentösen Behandlung geeignete medizinische Informationsmaterialien ausgehändigt wurden. (§3a Abs. 2 AMVV)
3. Angabe des Arztes, wenn eine Behandlung außerhalb der jeweils zugelassenen Anwendungsgebiete erfolgt. (§3a Abs. 2 AMVV)
4. Angabe, ob es sich um eine Verschreibung für eine gebärfähige Frau handelt. (§3a Abs. 3 AMVV)
5. Reichdauer des verschriebenen Arzneimittels. (§3a Abs. 3 AMVV)
6. Bestätigung des Arztes, dass er über ausreichende Sachkenntnisse zur Verschreibung von Arzneimitteln nach §3a Abs. 1 Satz 1 AMVV verfügt. (§3a Abs. 5 AMVV)
7. Die auf der Verordnung anzugebene Reichdauer darf die maximal zulässige Reichdauer nicht überschreiten: bei gebärfähigen Frauen 4, andernfalls 12 Wochen (§3a Abs. 3 AMVV). Das Primärsystem soll den Arzt unterstützen, die Reichdauer zu berechnen (z.B. durch die gewählte Packungsgröße und Dosierung) und bei Überschreitung der zulässigen Reichdauer warnen. Sofern die automatische Berechnung nicht möglich ist, muss der Arzt die Reichdauer selbst gemäß der Empfehlung berechnen und erfassen. Das BfArM wird hierzu zeitnah eine Handreichung zur Berechnung der Reichdauer veröffentlichen.

Das Primärsystem soll den Arzt ebenfalls dabei unterstützen, die Pflichtfelder auszufüllen und die Vollständigkeit vor der QES prüfen. Hierbei können zusätzliche Klicks beispielsweise eingespart werden, indem der verordnende Arzt nur einmalig aktiv bestätigen muss, dass ausreichend Sachkenntnisse zur Verschreibung der Arzneimittel nach §3a AMVV vorliegen. Für alle darauffolgenden E-T-Rezepte kann diese Angabe dann durch das System automatisch ausgefüllt werden. Auch bei der Angabe, ob es sich um eine gebärfähige Frau handelt, kann das System auf Informationen zum Geschlecht des Patienten aus der Akte/Karteikarte des Versicherten zurückgreifen und den Arzt somit bei der Befüllung zu unterstützen. Die anderen Pflichtangaben sollen bei jeder Verordnung durch den Arzt bewusst bestätigt werden. 

Sofern es technisch nicht möglich ist, ein E-T-Rezept auszustellen, ist das amtliche Formblatt zu verwenden. 

Das Ausstellen von E-T-Rezepten für Stations- oder Praxisbedarf ist nicht zulässig. Eine Zuweisung sowie eine Direktweiterleitung von E-T-Rezepten von einem Arzt an eine Apotheke ist nicht zulässig. Ebenso gibt es keine Mehrfachverordnungen für E-T-Rezepte.

##### E-T-Rezept einlösen, dispensieren und abrechnen

Versicherte können E-T-Rezepte über dieselben Wege wie E-Rezepte für andere apothekenpflichtige Arzneimittel einlösen (jedoch nicht im EU-Ausland und via Versand).

E-T-Rezepte dürfen nur 6 Kalendertage nach dem Ausstellungstag beliefert werden (§ 3a Abs. 4 AMVV). Der TI-Flow-Fachdienst stellt sicher, dass die Rezepte nur innerhalb dieser Frist eingelöst werden. Die fristgerechte Abgabe des Arzneimittels ist durch die Apotheke sicherzustellen. Die Einhaltung der Gültigkeit wird durch den TI-Flow-Fachdienst sichergestellt. E-T-Rezepte mit dem Kennzeichen "Entlassrezept" dürfen (analog zu "normalen" Arzneimittel Rezepten und der AM-RL im Rahmen des Entlassmangements) nur 3 Werktage zulasten der GKV abgerechnet werden, danach aber bis zum Ende der Gültigkeit als Selbstzahlerrezept eingelöst werden.

Eine Belieferung von E-T-Rezepten via Versand ist ausgeschlossen (§17 Abs. 2b ApBetrO). 

Für Versicherte ist es wichtig, auf dem Patientenausdruck bzw. im E-Rezept-FdV erkennen zu können, dass es sich um ein E-Rezept mit kürzerer Gültigkeit handelt und dass nicht alle Belieferungsoptionen zur Verfügung stehen.

Die Verarbeitung von E-T-Rezepten in dem Primärsystem der abgebenden Apotheke verhält sich grundsätzlich analog zu E-Rezepten von apothekenpflichtigen Arzneimitteln. Die Kategorie "T-Rezept" sowie die zusätzlichen Angaben des Arztes aus §3a Abs. 2, 3 und 5 AMVV müssen in der Warenwirtschaft leicht zu erkennen sein, damit die Apotheke die Rezepte prüfen können. 

Die Abrechnung von E-T-Rezepten verläuft je nach Kostenträger analog zu den Prozessen von E-Rezepten von Arzneimitteln.

Bei allen belieferten E-T-Rezepten muss die Apotheke die Quittung zwingend abrufen, damit die Übermittlung der digitalen Durchschläge an das T-Register (gemäß § 3a Abs. 7 AMVV) bei allen E-T-Rezepten sichergestellt wird. 

> **Offener Punkt**: Das BMG prüft derzeit, ob in der ApBetrO definiert werden soll, dass der Zeitpunkt des Quittungsabrufs in der Apotheke zu dokumentieren ist. 

#### User Stories

##### User Stories des Verordnenden

Als Arzt möchte ich ...

- ... in meinem Primärsystem elektronisch T-Rezepte ausstellen können, so dass ich die Therapie und die Therapiesicherheit meines Patienten gewährleisten kann.
- ... , dass mein System automatisch ein E-T-Rezept erstellt, sobald ich einen Wirkstoff nach §3a Absatz 1 Satz AMVV verordne, sodass ich mich an die gesetzlichen Vorgaben halte.
- ... , dass sich T-Rezepte, in der Handhabung in meinem Primärsystem nicht wesentlich von normalen Arzneimittelrezepten unterscheiden, so dass sich die Prozesse in meiner Praxis nicht unterscheiden.
- ... E-T-Rezepte gemeinsam mit "normalen" E-Rezepten signieren können, sodass ich bspw. Begleitmedikamente und Arzneimittel nach §3a Abs. 1 Satz 1 AMVV in einem Vorgang verordnen kann.
- ... , dass mich mein Primärsystem mich bei der Verordnung von E-T-Rezepten unterstützt, die Reichweite des verordneten Arzneimittels zu berechnen, damit ich diese nicht selbst berechnen muss und die gesetzliche Höchstmenge nicht überschreite. Hierbei soll mein System auch die Dosierung aus einem Medikationsplan in die Berechnung einschließen, sofern ich dort die Dosierung notiert habe (und auf dem E-T-Rezept "Dosieranweisung/Medikationsplan mitgegeben" angegeben habe). 
- ... , dass mein System mich in einer verständlichen Fehlermeldung darauf hinweist, wenn die zulässige Höchstmenge überschritten wird und mir einen Vorschlag anbietet, wie ich die Angaben ändern kann, um die Höchstmenge einzuhalten (z.B. kleinere Packungsgröße). 
- ... die Reichweite selbst berechnen und in der Verordnung eintragen können, wenn mein System diese nicht selbst berechnen kann. 
- ... , dass mein Primärsystem automatisch in der Verordnung erfasst, dass es sich nicht um eine gebärfähige Frau handelt, nachdem ich diese Information einmalig erfasst habe. 
- ... nur einmalig in meinem Primärsystem bestätigen, dass ich ausreichend Sachkenntnisse habe, um Arzneimittel nach §3a AMVV zu verordnen. Danach soll diese Angabe automatisch in E-T-Rezepten für mich erfasst werden.
- ... , dass mein Primärsystem mich dabei unterstützt die beim E-T-Rezept zusätzlichen Pflichtangaben auf dem Rezept komfortabel und zuverlässig auszufüllen (z.B. Angabe der ausreichenden Sachkenntnis) 
- ... , dass mein Primärsystem ein T-Rezept auf dem amtlichen Formblatt erstellt, wenn das E-T-Rezept (z.B. aufgrund einer technischen Störung) nicht erstellt werden kann.

Mögliche Darstellung in Primärsystem der verordnenden LEI (TI-Demonstrator):

<figure>
    <div class="gem-ig-img-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./fachl-t-rezept-1.png" alt="Abfrage der Gebärfähigkeit" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Beispielhafte Abfrage der Gebärfähigkeit</figcaption>
</figure>

<br>

<figure>
    <div class="gem-ig-img-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./fachl-t-rezept-2.png" alt="E-T-Rezept im Verordnungsmodul" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Beispielhafte Darstellung eines E-T-Rezepts im Verordnungsmodul</figcaption>
</figure>

<br>

<figure>
    <div class="gem-ig-img-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./fachl-t-rezept-3.png" alt="E-T-Rezept Reichdauer" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Beispielhafte Darstellung eines Warnhinweises bei Überschreiten der Reichdauer</figcaption>
</figure>

<br>

##### User Stories der Apotheke

Als Apotheke möchte ich ...

- ... E-T-Rezepte in meiner Warenwirtschaft verarbeiten können, so dass ich meine Patienten mit Arzneimitteln versorgen kann.
- ... mich darauf verlassen können, dass nur gültige und vollständig ausgefüllte E-T-Rezepte bei mir eingelöst werden, sodass ich keinen Aufwand mit der Prüfung von Pflichtangaben (z.B. wurden alle Angaben zur Aufklärung durch den Arzt bestätigt) habe. 
- als Apotheke möchte ich mich darauf verlassen können, dass die Angabe der Reichdauer gesetzeskonform ist und Pflichtangaben auf der Verordnung nicht vergessen werden, sodass ich mich auf die Inhaltliche Prüfung der Verordnung fokussieren kann.
- ... , dass sich E-T-Rezepte in der Handhabung, abgesehen von der gesetzlich vorgegebenen Dokumentation, in meiner Warenwirtschaft nicht von normalen E-Rezepten unterscheiden, so dass sich die Prozesse in meiner Apotheke nicht ändern.
- .... , dass Patienten bei E-T-Rezepten bei digitalen Einlösewegen (E-Rezept-FdV oder Apotheken Apps mit CardLink) erst gar nicht der Versand der Arzneimittel angeboten wird, da es nicht zulässig ist.
- ... die abgetrennte Menge des verordneten Arzneimittels in meiner Arzneimitteldatenbank suchen können, sofern diese im Verordnungsdatensatz nicht erfasst wurde, damit ich die Reichweitenberechnung des Arztes nachvollziehen kann.

Mögliche Darstellung im Primärsystem der Apotheke (TI-Demonstrator):

<figure>
    <div class="gem-ig-img-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./fachl-t-rezept-4.png" alt="E-T-Rezept Warenwirtschaft" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Darstellung eines E-T-Rezepts in einer Warenwirtschaft</figcaption>
</figure>

<br>

<figure>
    <div class="gem-ig-img-container" style="--box-width: 500px; margin-bottom: 30px;">
        <img src="./fachl-t-rezept-5.png" alt="E-T-Rezept Details in Warenwirtschaft" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Darstellung von E-T-Rezept-Details in einer Warenwirtschaft</figcaption>
</figure>

<br>

##### User Stories des Versicherten

Als Patient möchte ich ....

- ..., dass ich E-T-Rezepte in meiner App auf einen Blick erkennen und von anderen Rezept-Typen unterscheiden kann, sodass ich einen guten Überblick über meine Rezepte habe.
- ..., dass mir nur zulässige Belieferungsoptionen angezeigt werden, damit ich keine unnötigen Abstimmungsaufwände mit der Apotheke habe (Versand darf nicht angeboten werden).
- ... die kürzere Gültigkeit der E-T-Rezepte in meiner App und dem Ausdruck leicht erkennen können, sodass ich das Rezept rechtzeitig einlöse.

Mögliche Darstellung im E-Rezept-FdV (TI-Demonstrator):

<figure>
    <div class="gem-ig-img-container" style="--box-width: 300px; margin-bottom: 30px;">
        <img src="./fachl-t-rezept-6.png" alt="E-T-Rezept im FdV" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Darstellung eines Einlösevorgangs von einem E-T-Rezept im E-Rezept-FdV</figcaption>
</figure>

<br>

#### Darstellung als Patient Journey

In einer Patient Journey wird der zukünftige Versorgungsprozess (von dem Ausstellen der Verordnung bis hin zur Übermittlung der Daten an das BfArM) dargestellt: [Link zum Demonstrator](https://www.figma.com/proto/WK4kuhH0YLfIt8ixpRUkGW/Showcase-%7C-T-Rezept?page-id=19%3A2&node-id=4017-2335&p=f&viewport=-3147%2C-3057%2C0.37&t=sN866urDA2PzVSmi-1&scaling=contain&content-scaling=fixed&starting-point-node-id=4017%3A2335&hotspot-hints=0)


#### Verschreiben

Der technische Ablauf zum Verschreiben eines Arzneimittels nach §3a AMVV auf einem E-T-Rezept erfolgt analog zu einer Verordnung für apothekenpflichtige Arzneimittel.

Verordnungen von T-Rezepten können ausschließlich approbierte Ärzte mit einem gültigen elektronischen Heilberufsausweis vornehmen.

Der Arzt oder medizinischer Fachangestellte (MFA) erstellt eine elektronische Verordnung für ein Arzneimittel nach §3a AMVV. Das Primärsystem der LEI reichert den Datensatz um die vom TI-Flow-Fachdienst abgerufene Rezept-ID an. Der Arzt prüft die Verordnung und führt eine qualifizierte elektronische Signatur (QES) der Verordnung durch.

Anschließend wird die signierte Verordnung (E-T-Rezept) an den TI-Flow-Fachdienst übermittelt, wo die formale Korrektheit der Verordnung gemäß dem Datenmodell und die QES validiert werden.

Es wird ein neuer Flowtype eingeführt: 166. Dieser Workflow wird unabhängig vom Versicherungsverhältnis des Patienten genutzt. Der TI-Flow-Fachdienst stellt sicher, dass die mit diesem Flowtype erstellten Verordnungen den E-Rezept-Verordnungsprofilen, die Vorgaben für das T-Rezept enthalten, entsprechen.

Das E-T-Rezept liegt auf dem TI-Flow-Fachdienst zum Abruf durch den Versicherten und für durch den Versicherten autorisierte Apotheken bereit.

##### Technische Anwendungsfälle

**Beteiligte Systeme:** PVS/KIS , TI-Flow-Fachdienst

{% assign scenario_use_cases = "UC_2_1_E_Rezepte_erzeugen, E_Rezept_qualifiziert_signieren, UC_2_3_E_Rezept_einstellen, UC_2_5_E_Rezept_durch_Verordnenden_loeschen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Verordnung von E-T-Rezepten</i>" %}

### Beliefern

Der Versicherte kann ein E-T-Rezept über die für E-Rezepte von apothekenpflichtigen Arzneimitteln bestehenden Wege einer Apotheke zuweisen (E-Rezept-FdV, Patientenausdruck, eGK in der Apotheke).

Eine Apotheke schließt den Vorgang zu einem E-T-Rezept analog zu E-Rezepten für apothekenpflichtige Arzneimittel ab und erhält dadurch die Quittung für das E-T-Rezept. Die Abgabe des Arzneimittels muss innerhalb der gesetzlichen Vorgaben erfolgen.

##### Technische Anwendungsfälle

**Beteiligte Systeme:** AVS, TI-Flow-Fachdienst

{% assign scenario_use_cases = "UC_4_1_E_Rezept_durch_Abgebenden_abrufen, UC_4_2_E_Rezept_durch_Abgebenden_zurueckgeben, UC_4_3_E_Rezept_durch_Abgebenden_loeschen, UC_4_4_Quittung_abrufen, UC_4_5_Abgabedatensatz_signieren, UC_4_8_Quittung_erneut_abrufen, UC_4_16_Dispensierinformationen_bereitstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Belieferung von E-T-Rezepten</i>" %}

#### Abrechnung

Die Abrechnung der E-T-Rezepte erfolgt analog zu den E-Rezepten für Arzneimittel.

Für Versicherte privater Krankenversicherungen besteht wie für Arzneimittel E-Rezepte die Möglichkeit, dass die Apotheke die Abrechnungsdaten digital über den TI-Flow-Fachdienst bereitstellen kann oder einen Ausdruck zur Einreichung beim Kostenträger erstellt.