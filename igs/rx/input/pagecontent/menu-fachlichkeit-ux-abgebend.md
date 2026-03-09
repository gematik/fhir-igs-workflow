> Hinweis: Die in diesem Implementierungsleitfaden beschriebenen best practice für User Experience soll die Umsetzung im Primärsystem so unterstützen, dass die Nutzung der Anwendung E-Rezept bestmöglich in die Arbeitsabläufe in der Apotheke integriert. Die best practice für User Experience stellen eine Umsetzungsempfehlung dar. D.h. es ist den Herstellern der Primärsystem freigestellt, effizientere Lösungen zu implementieren, welche den Prozessen in den Primärsystemen entsprechen.

### Zuweisung von E-Rezepten an eine Apotheke

Dieser Abschnitt beschreibt UX-Guidelines für den Fall der Zuweisung eines E-Rezeptes an eine Apotheke via E-Rezept-FdV oder via KIM (KIM-Dienstkennung: "eRezept;Zuweisung;V1.0"). Im folgenden werden diese beiden Fälle als "Zuweisung" bezeichnet.

#### Hinweis bei zugewiesenen E-Rezepten

Wenn ein E-Rezept über das E-Rezept-FdV oder über KIM an eine Apotheke zugewiesen wird, soll der Sender schnellstmöglich über die Annahme und Bearbeitung des E-Rezeptes durch die Apotheke informiert werden. Dabei ist der Hinweis über den Erhalt eines E- Rezeptes via KIM oder E-Rezept-FdV so lange im AVS anzuzeigen, bis der Hinweis verarbeitet wurde. Im Falle der Zuweisung per E-Rezept-FdV soll eine Rückmeldung an den Kunden übermittelt werden. Bei Erhalt eines E-Rezeptes soll potentiell jeder Arbeitsplatz einen Hinweis erhalten. Es soll konfiguriert werden können, an welchen Arbeitsplätzen der Hinweis angezeigt wird.

<!-- A_23786 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-315" title="PS abgebende LEI: UX - Zuweisung - Hinweis" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL bei Erhalt einer Zuweisung via KIM oder über das E-Rezept-FdV einen entsprechenden Hinweis an den Arbeitsplätzen in der Apotheke anzeigen, um ein zeitnahes Bearbeiten der Zuweisung zu bewirken.
</requirement>

Nachdem die Apotheke eine Zuweisung erhalten hat soll das Primärsystem, so weit möglich, Daten im Hintergrund verarbeiten und einen möglichst automatischen Arbeitsablauf starten. Zuweisungen, die einen E-Rezept-Token enthalten, sollen dabei einfach in das System integriert werden können, indem automatisch ein Vorgang angelegt wird, dem das E- Rezept zugeordnet wird. Folgende Nachrichten enthalten einen E-Rezept-Token:
- KIM-Nachricht mit Dienstkennung "eRezept;Zuweisung;V1.0"
- Communication des E-Rezept-FdV (GEM_ERP_PR_Communication_DispReq)

<!-- A_23787 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-316" title="PS abgebende LEI: UX - Zuweisung - Übernahme E-Rezept aus Nachricht in einen Vorgang" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL bei Erhalt einer Zuweisung eines E-Rezeptes via KIM oder über das E-Rezept-FdV prüfen, ob ein Vorgang im Primärsystem zur Rezept-ID existiert und falls nicht automatisch einen Vorgang anlegen und die Informationen zum E-Rezept in diesen Vorgang übernehmen
</requirement>

#### Konfiguration von Nachrichten bei Zuweisung

Im Arbeitsablauf der Apotheke ist der Austausch und die Kommunikation mit den Kunden über Verordnungen und Medikamente ein wichtiger Bestandteil. Viele Nachrichten sind dabei zum Großteil identisch. Daher sollen Vorlagen und Nachrichten konfigurierbar sein, die für die Kommunikation bei Zuweisung genutzt werden können.

<!-- A_23788 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-317" title="PS abgebende LEI: UX - Nachrichtenkonfiguration" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL die Möglichkeit bieten, bestimmte Nachrichten zu konfigurieren, die entweder automatisch versendet oder als Vorlage für den manuellen Versand genutzt werden können. Folgende Nachrichtentypen sind zu berücksichtigen: Empfangsbestätigung nach Zuweisung eines E-Rezepts via KIM oder E-Rezept-FdV Abholbenachrichtigung an einen Kunden (Nicht-)Lieferbarkeit eines Medikament
</requirement>

Für die individuelle Kommunikation und Benachrichtigung von Kunden sollen die Nachrichten mit möglichst wenig Aufwand erstellt werden können. In Vorlagen für Nachrichten können Platzhalter verwendet werden, die bei Nutzung der Vorlagen automatisch befüllt werden.

<!-- A_23789 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-318" title="PS abgebende LEI: UX - Komposition einer Nachricht an einen Kunden mit Textvorlagen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL es ermöglichen Einheiten von Textvorlagen zu konfigurieren, die dann in der Maske zur Erstellung einer Nachricht verwendet werden können.
</requirement>

<!-- A_23790 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-319" title="PS abgebende LEI: UX - Nachrichtenkonfiguration - automatischer Versand der Empfangsbestätigung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen zu konfigurieren, ob die Empfangsbestätigung automatisch nach Zuweisung via KIM und/oder Zuweisung via E-Rezept-FdV übermittelt werden soll.
</requirement>

#### Nachrichtenaustausch bei zugewiesenen Rezepten

Nach Zuweisung eines E-Rezepts über KIM kann es erforderlich sein, mit dem Verordnenden Arzt in Kontakt zu treten. Wenn ein Versicherter ein E-Rezept über das E-Rezept-FdV einer Apotheke zugewiesen hat, ist es wichtig, dass der Versicherte über den Verlauf des Bearbeitungsvorgangs informiert wird. Aktuell kann der Nutzer des E-Rezept-FdV nicht auf Nachrichten der Apotheke antworten, daher soll die Apotheke den Versicherten mit entsprechenden Informationen über den Bestellvorgang informieren. Rückmeldungen, wie bspw. der Empfang der Zuweisung und das Herunterladen des E- Rezepts, können automatisch erfolgen. Der Nutzer soll die Möglichkeit haben, vorkonfigurierte Nachrichten zu verwenden, die vor dem Versenden editierbar sind, um bspw. zusätzliche Informationen zum Vorgang hinzuzufügen.

<!-- A_23791 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-320" title="PS abgebende LEI: UX - Zuweisung - Empfangsbestätigung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, eine vorkonfigurierte oder manuell erstellte Empfangsbenachrichtigung an den Sender einer Zuweisung zu übermitteln. Dies geschieht je nach Konfiguration automatisch oder manuell.
</requirement>

Sobald der Vorgang seitens der Apotheke bearbeitet wurde, möchte der Nutzer den Kunden darüber informieren, dass die Bestellung abgeholt werden kann. Alle für das Abholen relevanten Informationen (bspw. Abhol-Code, Zeitpubkt der Verfügbarkeit) sollen in der Nachricht übermittelt werden.

<!-- A_23792 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-321" title="PS abgebende LEI: UX - Zuweisung - Abholbenachrichtigung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL es Nutzer ermöglichen, eine vorkonfigurierte oder manuell erstellte Abholbenachrichtigung an den Sender einer Zuweisung zu übermitteln. Die Abholinformationen sind entsprechend einzubetten.
</requirement>

Falls ein Medikament in der Apotheke nicht verfügbar ist, ist das dem Kunden mitzuteilen. In diesem Fall ist das E-Rezept am E-Rezept-Fachdienst wieder freizugeben (Operation POST /Task/<id>/$reject). Es empfiehlt sich dem Kunden die klare Handlungsempfehlung mitzugeben, dass eine andere Apotheke zum Einlösen des Rezepts gesucht werden muss.

<!-- A_23793 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-322" title="PS abgebende LEI: UX - Zuweisung  - Nachricht bei Nicht-Verfügbarkeit eines Medikaments" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, eine vorkonfigurierte oder manuell erstellte Nachricht zu erstellen, die den Kunden darüber informiert, dass das Medikament nicht beliefert werden kann. Die Nachricht soll beinhalten, dass das E-Rezept freigegeben wurde und der Versicherte es einer anderen Apotheke zuweisen kann.
</requirement>

Neben vorher beschriebenen Nachrichten, soll das System ebenfalls ermöglichen, manuell erstellte Nachrichten an den Sender einer Zuweisung zu übermitteln.

<!-- A_23794 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-323" title="PS abgebende LEI: UX - Zuweisung - Nachrichten an Sender" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, manuell erstellte Nachrichten an den Sender einer Zuweisung zu übermitteln.
</requirement>

Das Erstellen und Senden einer Nachricht soll nach Möglichkeit aus dem Arbeitsfluss im AVS möglich sein, ohne dabei ein separates Programm öffnen zu müssen. Weiterhin ist eine fortlaufende Kommunikation mit einem Vorgang zu verknüpfen, sodass der Anwender den Nachrichtenverlauf nachvollziehen kann. Dies bezieht sich sowohl auf die Kommunikation via KIM, als auch via E-Rezept-FdV.

<!-- A_23795 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-324" title="PS abgebende LEI: UX - Zuweisung - Nachrichten an Sender - ohne Medienbruch" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, einem Kunden eine Nachricht zu erstellen, ohne dafür ein separates Programm öffnen zu müssen, sondern in der bestehenden Ansicht die Nachricht zu verfassen und zu versenden.
</requirement>

<!-- A_23796 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-325" title="PS abgebende LEI: UX - Zuweisung - Nachrichten eines Vorgangs" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL die zu einem Vorgang gehörende Kommunikation mit dem Vorgang derart verknüpfen, dass diese im Kontext des Vorgangs dargestellt werden kann.
</requirement>

Exemplarisch eine Beispielnachricht, wie sie der Kunde im Frontend des Versicherten sehen würde: 

<figure>
    <div class="gem-ig-img-container" style="--box-width: 300px; margin-bottom: 30px;">
        <img src="./ux-abgebend-1.png" alt="Beispielnachricht" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Eine exemplarische Beispielnachricht</figcaption>
</figure>

<br>

### Bedienen eines Rezepts

Dieser Abschnitt beschreibt UX-Guidelines für den Prozess der Bedienung eines E- Rezeptes. Hinweis: Für die Bedienung von E-Rezepten ist es es wichtig, alle Informationen zum Datenaustausch mit dem E-Rezept-Fachdienst zu sichern. Insbesondere bei Verlust des Secrets nach dem Herunterladen des E-Rezepts (Operation POST /Task/<id>/$accept) ist die Weiterverarbeitung des E-Rezepts nicht mehr möglich.

#### Bedienen von E-Rezepten nach Ablauf von Fristen

Verordnungen für apothekenpflichtige Arzneimittel für gesetzlich Versicherte unterliegen bestimmten Fristen:
- Belieferungsfrist: Frist bis zu welcher ein Rezept zu Lasten der gesetzlichen
Krankenkasse eingelöst werden kann (Frist endet zu Task.extension:acceptDate, bei Kassenrezepten 28 Tage nach Ausstellung). Danach kann die Apotheke entscheiden das Rezept als Privatrezept zu beliefern (§11, Abs 4 AM-RL).
- Einlösefrist: Frist bis zu welcher ein Rezept beliefert werden darf (Frist endet zu
Task.extension:expiryDate, bei Kassenrezepten 3 Monate nach Ausstellung). Danach darf ein Rezept nicht mehr von der Apotheke beliefert werden (§2, Abs. 5 AMVV). Bei Mehrfachverordnungen sind Belieferungsfrist und Einlösefrist identisch und können vom Arzt bis zu einem Jahr frei gewählt werden. Das Primärsystem soll dem Nutzer bei Ablaufen der entsprechenden Fristen entsprechende Hinweise darstellen.

<!-- A_23797 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-326" title="PS abgebende LEI: UX - Fristen eines Rezeptes - Anzeigen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL beim Abrufen eines E-Rezeptes die Belieferungsfrist und Einlösefrist eines E-Rezeptes anzeigen.
</requirement>

<!-- A_23798 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-327" title="PS abgebende LEI: UX - Fristen eines Rezeptes - Hinweis bei überschrittener Frist" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL für den Fall, dass eine Frist überschritten wurde dem Anwender einen entsprechenden Hinweis darstellen.
</requirement>

<!-- A_23799 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-328" title="PS abgebende LEI: UX - Fristen eines Rezeptes - Überschreiten der Belieferungsfrist" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL bei Überschreiten der Belieferungsfrist dem Anwender die Möglichkeit geben, das Präparat als Privatrezept zu beliefern.
</requirement>

Der E-Rezept-Fachdienst löscht eingestellte Rezepte zehn Tage nach Ablaufen einer der Gültigkeit einer Verordnung (Task.extension:expiryDate). Daher kann das AVS in diesen zehn Tagen ein abgelaufenes Rezept vom E-Rezept-Fachdienst abrufen. Diese Verordnungen dürfen nicht von der Apotheke beliefert werden.

<!-- A_23800 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-RX-329" title="PS abgebende LEI: UX - Fristen eines Rezeptes - Überschreiten der Einlösefrist" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI DARF bei Überschreiten der Einlösefrist dem Anwender NICHT die Möglichkeit geben, das Rezept zu beliefern.
</requirement>

#### Finden von vorhandenen Vorgängen per Scan des E-Rezept-

Tokens nach Zuweisung Wenn ein Versicherter das E-Rezept-Token entweder per E-Rezept-FdV übermittelt oder in der Filiale den zugehörigen Datamatrix-Code vorgezeigt hat, dann ruft die Apotheke das E-Rezept vom E-Rezept-Fachdienst ab. Das E-Rezept erhält den Status "in Abgabe (gesperrt)". Ein E-Rezept mit diesem Status kann nicht noch einmal vom E-Rezept- Fachdienst abgerufen  werden. Wenn der Kunde das Medikament dann zu einem späteren Zeitpunkt in der Filiale abholt, soll es möglich sein, den zugehörigen Vorgang im AVS auch per Scan des E-Rezept-Token zu finden. Hinweis: Die Abfrage eines bereits durch die Apotheke heruntergeladenen E-Rezepts am E-Rezept-Fachdienstes liefert einen Fehler. Daher sollte diese Abfrage nicht durchgeführt werden.

<!-- A_23801 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-330" title="PS abgebende LEI: UX - Suche nach Vorgang mittels E-Rezept-Token" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL dem Anwender ermöglichen, einen bestehenden Vorgang zum Einlösen eines E-Rezepts mittels E-Rezept-Token zu suchen und nach Fund dem Anwender anzuzeigen.
</requirement>

Ist der Vorgang zum gescannten E-Rezept-Token bereits abgeschlossen, dann soll der Vorgang angezeigt, aber nicht wieder geöffnet werden.

#### Verarbeitung von Freitextverordnungen

Für die Abgabe von Medikamenten, die auf einer Freitextverordnung basieren, soll der Nutzer des AVS bestmöglich unterstützt werden, entsprechende Präparate zu finden und abzugeben. Hierzu sollen die gesamten Freitext-Informationen  der Verordnung angezeigt werden:
- Darreichungsform: KBV_PR_ERP_Medication_FreeText.form.text
- Freitextverordnung: KBV_PR_ERP_Medication_FreeText.code.text
Das System soll den Nutzer dabei unterstützen zu erkennen, ob die Verschreibung für ein E-Rezept zulässig ist. Siehe auch https://github.com/gematik/api-erp#umfang-der- anwendung-e-rezept . Das System soll den Nutzer darin unterstützen, diese Verordnung im Sinne einer Verordnung von Fertigarzneimittel (PZN), Wirkstoff oder einer Rezeptur zu beliefern. Hierzu können beispielsweise Inhalte des Freitextes nach PZN-Pattern untersucht und anschließend in der Arzneimitteldatenbank ermittelt werden. Weiterhin könnte das System anbieten nach einzelnen Bestandteilen einer Freitextverordnung in einer geeigneten Datenbank zu suchen.

<!-- A_23802 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-331" title="PS abgebende LEI: UX - Freitextverordnung - Arzneimittelsuche" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, nach Bestandteilen der Freitextverordnung zu suchen, ohne händisch die Inhalte der Verordnung in ein Suchfeld zu übertragen.
</requirement>

<!-- A_23803 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-332" title="PS abgebende LEI: UX - Freitextverordnung - Hinweis zur manuellen Prüfung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL, wenn eine Freitextverordnung vorliegt, den Nutzer darauf hinweisen, dass die Angaben im E-Rezept auf Vollständigkeit zu prüfen ist.
</requirement>

Hierbei ist insbesondere darauf hinzuweisen, dass geprüft werden muss, ob eine Dosieranweisung vorliegt.

#### Prüfung von E-Rezepten

Der E-Rezept-Fachdienst überprüft derzeit noch nicht gänzlich die formale Richtigkeit der E-Rezepte. Das AVS soll eine formale Prüfung der Verordnungsdaten vornehmen. Diese Prüfung kann mittels ABDA- bzw. TI-Referenzvalidator vorgenommen werden.

<!-- A_23804 -->
<requirement conformance="MAY" key="IG-TIFLOW-RX-333" title="PS abgebende LEI: UX - Prüfung mittels ABDA-Referenzvalidators" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI KANN für die Prüfung von E-Rezepten die aktuelle Version des ABDA-Referenzvalidators einsetzen.
</requirement>

Siehe auch https://github.com/DAV-ABDA/eRezept-Referenzvalidator/releases.

#### Sonderfall: Nachträgliches Zuordnen von E-Rezepten

In bestimmten Fällen kann es vorkommen, dass ein Vorgang für eine Verordnung im Primärsystem angelegt wird, obwohl der E-Rezept-Token für das Herunterladen des E- Rezepts noch nicht vorliegt. Beispiele für diesen Fall sind:
- telefonische Bestellung eines Medikaments
- fernmündliche Verordnung nach §4 AMVV
- Nachreichen eines Rezeptes, um die Abgabe über die gesetzliche Krankenkasse
abrechnen zu lassen Es soll die Möglichkeit bestehen, einem Vorgang nachträglich ein E-Rezept zuzuordnen. Somit soll vermieden werden, dass der bestehende Vorgang gelöscht und ein neuer Vorgang angelegt werden muss. Abweichungen zwischen den Informationen im Vorgang und der Verordnung sollen dem Nutzer angezeigt werden.

<!-- A_23805 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-334" title="PS abgebende LEI: UX - Zuordnung eines E-Rezepts zu einem bestehenden Vorgang" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL dem Nutzer ermöglichen, ein E-Rezept einem im System bestehenden Vorgang zuzuordnen.
</requirement>

#### Weiterleiten von E-Rezepten an eine andere Apotheke

Für Apothekenverbünde mit mehreren Filialen besteht die Möglichkeit E-Rezepte für die Belieferung weiterzuleiten. Dies kann von Interesse sein, wenn beispielsweise innerhalb eines Verbundes eine Apotheke sich um Vorbestellungen und Botendienste kümmert.  In dem Fall können die anderen Apotheken des Verbundes die vom E-Rezept-Fachdienst heruntergeladenen E-Rezepte an diese Apotheke weiterleiten. Das Weiterleiten kann auch im Rahmen eines Inhaberwechsels genutzt werden. Hinweis: Beim Abruf der Quittung erfolgt im E-Rezept-Fachdienst keine Prüfung, ob die Telematik-ID der Quittung abrufenden Apotheke mit der Telematik-ID der Apotheke übereinstimmt, welche das E-Rezept heruntergeladen und den Status in "in Abgabe (gesperrt)" geändert hat. Für das Weiterleiten eines E-Rezeptes werden AccessCode, Task-ID, Secret des E- Rezeptes sowie sämtliche Inhalte der E-Rezeptes übermittelt. Die weitere Bearbeitung des E-Rezeptes kann ohne den Umweg über Freigabe des E-Rezeptes von einer Apotheke und erneutes Herunterladen durch eine andere Apotheke erfolgen. Wenn eine Apotheke Zugang zu diesen Informationen erhält, kann diese die Abgabe vollziehen. Hierzu muss die empfangene Apotheke die FHIR-OperationPOST /Task/<id>/$close des Rezeptes beim Fachdienst aufrufen.

<!-- A_23806 -->
<requirement conformance="MAY" key="IG-TIFLOW-RX-335" title="PS abgebende LEI: UX - Weiterleitung eines E-Rezepts" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI KANN eine Möglichkeit bieten, folgende Informationen an eine andere Filial-Apotheke über einen sicheren Kommunikationskanal zu übermitteln: Verordnungsdatensatz inklusive QES Task-ID des E-Rezepts AccessCode des E-Rezepts Secret des E-Rezepts. Der Kommunikationskanal muss so gewählt werden, dass die sehr hohe Vertraulichkeit des Informationen und deren Integrität geschützt wird.
</requirement>

Für die sichere Kommunikation kann KIM verwendet werden.

<!-- A_23807 -->
<requirement conformance="MAY" key="IG-TIFLOW-RX-336" title="PS abgebende LEI: UX - Empfang eines weitergeleiteten eines E-Rezepts" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI KANN eine Möglichkeit bieten, die von einer anderen Filial-Apotheke übermittelten Informationen zu einem E-Rezept zu importieren und einen Vorgang dazu zu öffnen.
</requirement>

Unter der Annahme, dass die Apotheken in einem Apothekenverbund die gleiche Software nutzen, wurde bisher darauf verzichtet eine standardisiertes Schnittstelle bspw. auf Basis von KIM-Nachrichten zu entwickeln. Hinweis: Es ist zu vermeiden, E-Rezepte mittels Zurückweisen (Operation POST /Task/<id>/$reject) und erneuten Abrufen  (Operation POST /Task/<id>/$accept) zu übergeben. Diese Vorgehensweise erzeugt Protokolleinträge und zukünftig Notifications für den Versicherten, welche für diesen ggf. nicht nachvollziehbar sind.

#### Bedienen von E-T-Rezepten

Für die Bedienung und Belieferung von E-T-Rezepten gelten gesonderte UX-Hinweise.

<!-- A_27841 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-337" title="PS abgebende LEI: UX - Bedienung T-Rezept – Hinweis T-Rezept" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL dem Nutzer bei der Bedienung eines E-T-Rezeptes sicherstellen, dass das Kennzeichen "T-Rezept" immer bei Verordnungen für Arzneimittel nach §3a AMVV dem Anwender sichtbar dargestellt wird.
</requirement>

<!-- A_27842 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-338" title="PS abgebende LEI: UX - Bedienung T-Rezept – Hinweis T-Rezept Belieferungsoption" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL dem Nutzer bei der Bedienung eines E-T-Rezeptes sicherstellen, dass die Belieferung des E-T-Rezeptes nicht via Postversand möglich ist.
</requirement>

### Nachbereitung

#### Quittung automatisch abrufen

Die Quittung für ein beliefertes E-Rezept muss innerhalb einer vertraglich vereinbarten Frist abgerufen werden. Es sind die Regelungen des Rahmenvertrags nach SGB V §300 zu berücksichtigen. Das AVS soll sicherstellen, dass die Frist nicht überschritten wird und ggf. die Quittung automatisch abrufen. Die gematik empfiehlt die Quittung zeitnah nach der Abgabe an den Kunden abzurufen, denn mit dem Quittungsabruf werden dem Versicherten die Abgabeinformationen zum Abruf mit der App bereitgestellt.

<!-- A_23808 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-339" title="PS abgebende LEI: UX – Quittung automatisch abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL die Quittung mittels der Operation POST /Task/&lt;id&gt;/$close automatisch abrufen, wenn eine konfigurierbare Frist nach Abgabe des E-Rezept erreicht ist und der Quittungsabruf noch nicht erfolgt ist.
</requirement>

Hinweis: Der E-Rezept-Fachdienst bietet mit der Operation GET /Task/<id> die Möglichkeit, die Quittung nach dem erstmaligen Aufruf der Operation POST /Task/<id>/$close noch einmal abzurufen. Dies ist nur möglich, bis das E-Rezept durch den Versicherten oder nach Erreichen der Löschfrist automatisch durch den E-Rezept- Fachdienst gelöscht wird. Der Anwendungsfall "Quittung abrufen" generiert nicht nur die Quittung für die Abrechnung der Apotheke, sondern schließt auch den Workflow im E-Rezept-Fachdienst ab. Der Versicherte hat Einblick in den Statusverlauf und kann ein E-Rezept auch nach Abschluss des Workflows löschen. Das AVS muss bei der Abgabe jeglichen Rezepttyps und unabhängig vom Kostenträger den Workflow über diesen Anwendungsfall abschließen.

<!-- A_25643 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-340" title="PS abgebende LEI: UX – Workflow von E-Rezepten abschließen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS die Quittung mittels der Operation POST /Task/&lt;id&gt;/$close für jedes E-Rezept, was beliefert wurde, abrufen, um den Workflow im E-Rezept-Fachdienst abzuschließen.
</requirement>

#### QES durch den Apotheker

Jeder Abgabedatensatz zu einem E-Rezept muss signiert werden. Für die nicht- qualifizierten Signatur wird die SMC-B der Apotheke verwendet. In vertraglich vereinbarten Fällen ("Rahmenvertrag über die Arzneimittelversorgung nach §129 Absatz 2 SGB V",  https://www.abda.de/fileadmin/user_upload/assets/Vertraege/2021-10- 01_RV_129_redaktionelle_Gesamtfassung_Stand_01102021_barrierefrei.pdf) muss der HBA des Apothekers/-assistents/Pharmazieingenieurs für eine QES verwendet werden. In Fällen, in denen eine nicht-qualifizierte Signatur ausreicht, soll keine QES erzwungen werden. Dies führt zu Zeitersparnis, da unnötige PIN-Eingaben vermieden werden.

<!-- A_23809 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-341" title="PS abgebende LEI: UX - Abgabedatensatz signieren - QES Signatur in notwendigen Fällen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL für die Signatur des Abgabedatensatzes nur eine QES fordern, wenn diese aufgrund vertraglicher Festlegungen erforderlich ist. In allen anderen Fällen muss der Abgabedatensatz mit der SMC-B signiert werden.
</requirement>

<!-- A_23810 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-342" title="PS abgebende LEI: UX - Abgabedatensatz signieren - QES Signatur" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL für die QES des Abgabedatensatzes eine Stapel- und/oder Komfortsignatur ermöglichen.
</requirement>

Für Stapel- und Komfortsignatur siehe [gemILF_PS].

#### Verständliche Rückmeldungen vom Apotheken

Rechenzentrum In der Nachbereitung bedarf es für den Nutzer des AVS einer Übersicht der Abrechnungsinformationen aus dem Apotheken Rechenzentrum (ARZ). Hierbei ist der Nutzer so zu unterstützen, dass Fehler in der Abrechnung von E-Rezepten schnell sichtbar sind und der Nutzer auch dahin geleitet wird fehlende oder falsche Angaben zu korrigieren.

<!-- A_23811 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-343" title="PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL dem Nutzer eine Übersicht über den Abrechnungsstatus von beim ARZ eingereichten E-Rezepten darstellen können.
</requirement>

<!-- A_23812 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-344" title="PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte - Hinweisen zu Abrechnungsfehlern" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL dem Nutzer in der Abrechnungsstatusliste deutlich kenntlich machen, wenn das Apotheken Rechenzentrum Hinweise, Verbesserungsvorschläge oder Fehler für die Abrechnung eines E-Rezepts zurückgegeben hat.
</requirement>

<!-- A_23813 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-345" title="PS abgebende LEI: UX - Abrechnungsstatusliste für E-Rezepte - Verweis zur Korrektur" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL im Falle unzureichender Dokumentation der Abgabe in der Abrechnungsstatusliste den Nutzer auf die korrekte Stelle verweisen, die in der Dokumentation zu korrigieren ist.
</requirement>

### Fehlermanagement

#### Erreichbarkeit von TI-Komponenten

Im Arbeitsablauf des Nutzers können Fehler in der Erstellung und Verarbeitung eines E- Rezeptes auftreten. Da vom Nutzer kein technisches Vorwissen erwartet werden darf, sind Fehlermeldungen so anzugeben, dass dieser nach Möglichkeit darauf reagieren kann. 

Hierbei sollen Fehlermeldungen so aufbereitet werden, sodass der Nutzer versteht, welches System im Prozess den Fehler verursacht hat. Außerdem sollen bei technischen Fehlern diese sprachlich aufbereitet werden, so dass der Nutzer den Inhalt des Fehlers verstehen kann. Für den Fall, dass die zentralen Dienste der TI (insbesondere der E-Rezept-Fachdienst) nicht erreichbar sind, ist es für die Mitarbeiter einer Apotheke hilfreich darüber benachrichtigt zu werden. 

Solch eine Nicht-Erreichbarkeit kann durch einen Ausfall der TI- Dienste oder der lokalen TI-Komponenten der Apotheken (HBA, SMB-C, Konnektor, etc.) auftreten. In diesem Fall können E-Rezepte nicht vom E-Rezept-Fachdienst abgerufen und eingelöst werden. Diese Information ist präsent darzustellen. Der Arbeitsfluss und insbesondere die Funktionalität für das Einlösen von Muster-16 Verordnungen dürfen in diesem Fall nicht blockiert werden.

<!-- A_23814 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-346" title="PS abgebende LEI: UX - Nicht-Erreichbarkeit des E-Rezept-Fachdienstes - Automatische Behebung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL im Falle der Nicht-Erreichbarkeit von zentralen Diensten der TI automatisch versuchen eine Fehlerbehebung durchzuführen.
</requirement>

Für das Umschwenken auf eine andere Instanz des E-Rezept-Fachdienstes siehe [gemSpec_ILF_PS_eRp#4.2 Namensauflösung].

<!-- A_23815 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-347" title="PS abgebende LEI: UX - Hinweis bei Nicht-Erreichbarkeit des E-Rezept-Fachdienstes" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI SOLL in dem Fall, dass die für die Anwendung E-Rezept notwendigen zentralen Dienste der TI nicht erreichbar sind, den Nutzer darüber benachrichtigen.
</requirement>

<!-- A_23816 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-RX-348" title="PS abgebende LEI: UX - Hinweis bei Nicht-Erreichbarkeit des E-Rezept-Fachdienstes - Operabilität des AVS" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI DARF NICHT im Falle der Nicht-Erreichbarkeit der zentralen Dienste der TI das AVS derart blockieren, dass andere Arten der Einlösung, die unabhängig von der Anwendung E-Rezept der Telematikinfrastruktur sind (z.B. Muster-16 Verordnungen), nicht möglich sind.
</requirement>

<!-- A_23817 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-349" title="PS abgebende LEI: UX - Verständliche Fehlermeldungen - technische Fehler" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebende LEI SOLL beim Auftreten eines Fehlers dem Nutzer eine verständliche Fehlermeldung ausgeben.
</requirement>

Wenn das Fehler-meldende System eine technische Fehlermeldung liefert, braucht diese dem Nutzer nicht dargestellt werden.

<!-- A_23818 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-RX-350" title="PS abgebende LEI: UX - Verständliche Fehlermeldungen - Handlungsempfehlung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebende LEI SOLL beim Auftreten eines Fehlers, falls möglich, dem Nutzer Handlungsempfehlungen ausgeben, die dazu beitragen können, den Fehler zu beseitigen.
</requirement>

Die Bereitstellung der Fehlerdetails per Email o.Ä. steht mit diesen Anforderungen nicht im Widerspruch. Es soll weiterhin möglich sein technische Details an den technischen Support zu übermitteln.
