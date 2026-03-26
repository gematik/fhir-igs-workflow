# Best practice UX Primärsysteme für abgebende LEIs - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Fachliche Aspekte zur Arzneimittelverordnung**](menu-fachlichkeit.md)
* **Best practice UX Primärsysteme für abgebende LEIs**

## Best practice UX Primärsysteme für abgebende LEIs

> Hinweis: Die in diesem Implementierungsleitfaden beschriebenen best practice für User Experience soll die Umsetzung im Primärsystem so unterstützen, dass die Nutzung der Anwendung E-Rezept bestmöglich in die Arbeitsabläufe in der Apotheke integriert. Die best practice für User Experience stellen eine Umsetzungsempfehlung dar. D.h. es ist den Herstellern der Primärsystem freigestellt, effizientere Lösungen zu implementieren, welche den Prozessen in den Primärsystemen entsprechen.

### Zuweisung von E-Rezepten an eine Apotheke

Dieser Abschnitt beschreibt UX-Guidelines für den Fall der Zuweisung eines E-Rezeptes an eine Apotheke via E-Rezept-FdV oder via KIM (KIM-Dienstkennung: “eRezept;Zuweisung;V1.0”). Im folgenden werden diese beiden Fälle als “Zuweisung” bezeichnet.

#### Hinweise bei zugewiesenen E-Rezepten

Wenn ein E-Rezept über das E-Rezept-FdV oder über KIM an eine Apotheke zugewiesen wird, soll der Sender schnellstmöglich über die Annahme und Bearbeitung des E-Rezeptes durch die Apotheke informiert werden. Dabei ist der Hinweis über den Erhalt eines E- Rezeptes via KIM oder E-Rezept-FdV so lange im AVS anzuzeigen, bis der Hinweis verarbeitet wurde. Im Falle der Zuweisung per E-Rezept-FdV soll eine Rückmeldung an den Kunden übermittelt werden. Bei Erhalt eines E-Rezeptes soll potentiell jeder Arbeitsplatz einen Hinweis erhalten. Es soll konfiguriert werden können, an welchen Arbeitsplätzen der Hinweis angezeigt wird.

Das PS der abgebenden LEI SOLL bei Erhalt einer Zuweisung via KIM oder über das E-Rezept-FdV einen entsprechenden Hinweis an den Arbeitsplätzen in der Apotheke anzeigen, um ein zeitnahes Bearbeiten der Zuweisung zu bewirken.
Nachdem die Apotheke eine Zuweisung erhalten hat soll das Primärsystem, so weit möglich, Daten im Hintergrund verarbeiten und einen möglichst automatischen Arbeitsablauf starten. Zuweisungen, die einen E-Rezept-Token enthalten, sollen dabei einfach in das System integriert werden können, indem automatisch ein Vorgang angelegt wird, dem das E- Rezept zugeordnet wird. Folgende Nachrichten enthalten einen E-Rezept-Token:

* KIM-Nachricht mit Dienstkennung “eRezept;Zuweisung;V1.0”
* Communication des E-Rezept-FdV (GEM_ERP_PR_Communication_DispReq)

Das PS der abgebenden LEI SOLL bei Erhalt einer Zuweisung eines E-Rezeptes via KIM oder über das E-Rezept-FdV prüfen, ob ein Vorgang im Primärsystem zur Rezept-ID existiert und falls nicht automatisch einen Vorgang anlegen und die Informationen zum E-Rezept in diesen Vorgang übernehmen
#### Konfiguration von Nachrichten bei Zuweisung

Im Arbeitsablauf der Apotheke ist der Austausch und die Kommunikation mit den Kunden über Verordnungen und Medikamente ein wichtiger Bestandteil. Viele Nachrichten sind dabei zum Großteil identisch. Daher sollen Vorlagen und Nachrichten konfigurierbar sein, die für die Kommunikation bei Zuweisung genutzt werden können.

Das PS der abgebenden LEI SOLL die Möglichkeit bieten, bestimmte Nachrichten zu konfigurieren, die entweder automatisch versendet oder als Vorlage für den manuellen Versand genutzt werden können. Folgende Nachrichtentypen sind zu berücksichtigen: Empfangsbestätigung nach Zuweisung eines E-Rezepts via KIM oder E-Rezept-FdV Abholbenachrichtigung an einen Kunden (Nicht-)Lieferbarkeit eines Medikament
Für die individuelle Kommunikation und Benachrichtigung von Kunden sollen die Nachrichten mit möglichst wenig Aufwand erstellt werden können. In Vorlagen für Nachrichten können Platzhalter verwendet werden, die bei Nutzung der Vorlagen automatisch befüllt werden.

Das PS der abgebenden LEI SOLL es ermöglichen Einheiten von Textvorlagen zu konfigurieren, die dann in der Maske zur Erstellung einer Nachricht verwendet werden können.

Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen zu konfigurieren, ob die Empfangsbestätigung automatisch nach Zuweisung via KIM und/oder Zuweisung via E-Rezept-FdV übermittelt werden soll.
#### Nachrichtenaustausch bei zugewiesenen Rezepten

Nach Zuweisung eines E-Rezepts über KIM kann es erforderlich sein, mit dem Verordnenden Arzt in Kontakt zu treten. Wenn ein Versicherter ein E-Rezept über das E-Rezept-FdV einer Apotheke zugewiesen hat, ist es wichtig, dass der Versicherte über den Verlauf des Bearbeitungsvorgangs informiert wird. Aktuell kann der Nutzer des E-Rezept-FdV nicht auf Nachrichten der Apotheke antworten, daher soll die Apotheke den Versicherten mit entsprechenden Informationen über den Bestellvorgang informieren. Rückmeldungen, wie bspw. der Empfang der Zuweisung und das Herunterladen des E- Rezepts, können automatisch erfolgen. Der Nutzer soll die Möglichkeit haben, vorkonfigurierte Nachrichten zu verwenden, die vor dem Versenden editierbar sind, um bspw. zusätzliche Informationen zum Vorgang hinzuzufügen.

Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, eine vorkonfigurierte oder manuell erstellte Empfangsbenachrichtigung an den Sender einer Zuweisung zu übermitteln. Dies geschieht je nach Konfiguration automatisch oder manuell.
Sobald der Vorgang seitens der Apotheke bearbeitet wurde, möchte der Nutzer den Kunden darüber informieren, dass die Bestellung abgeholt werden kann. Alle für das Abholen relevanten Informationen (bspw. Abhol-Code, Zeitpubkt der Verfügbarkeit) sollen in der Nachricht übermittelt werden.

Das PS der abgebenden LEI SOLL es Nutzer ermöglichen, eine vorkonfigurierte oder manuell erstellte Abholbenachrichtigung an den Sender einer Zuweisung zu übermitteln. Die Abholinformationen sind entsprechend einzubetten.
Falls ein Medikament in der Apotheke nicht verfügbar ist, ist das dem Kunden mitzuteilen. In diesem Fall ist das E-Rezept am TI-Flow-Fachdienst wieder freizugeben (Operation POST /Task//$reject). Es empfiehlt sich dem Kunden die klare Handlungsempfehlung mitzugeben, dass eine andere Apotheke zum Einlösen des Rezepts gesucht werden muss.

Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, eine vorkonfigurierte oder manuell erstellte Nachricht zu erstellen, die den Kunden darüber informiert, dass das Medikament nicht beliefert werden kann. Die Nachricht soll beinhalten, dass das E-Rezept freigegeben wurde und der Versicherte es einer anderen Apotheke zuweisen kann.
Neben vorher beschriebenen Nachrichten, soll das System ebenfalls ermöglichen, manuell erstellte Nachrichten an den Sender einer Zuweisung zu übermitteln.

Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, manuell erstellte Nachrichten an den Sender einer Zuweisung zu übermitteln.
Das Erstellen und Senden einer Nachricht soll nach Möglichkeit aus dem Arbeitsfluss im AVS möglich sein, ohne dabei ein separates Programm öffnen zu müssen. Weiterhin ist eine fortlaufende Kommunikation mit einem Vorgang zu verknüpfen, sodass der Anwender den Nachrichtenverlauf nachvollziehen kann. Dies bezieht sich sowohl auf die Kommunikation via KIM, als auch via E-Rezept-FdV.

Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, einem Kunden eine Nachricht zu erstellen, ohne dafür ein separates Programm öffnen zu müssen, sondern in der bestehenden Ansicht die Nachricht zu verfassen und zu versenden.

Das PS der abgebenden LEI SOLL die zu einem Vorgang gehörende Kommunikation mit dem Vorgang derart verknüpfen, dass diese im Kontext des Vorgangs dargestellt werden kann.
Exemplarisch eine Beispielnachricht, wie sie der Kunde im Frontend des Versicherten sehen würde:

**Abbildung: **Eine exemplarische Beispielnachricht


### Bedienen eines Rezepts

Dieser Abschnitt beschreibt UX-Guidelines für den Prozess der Bedienung eines E- Rezeptes. Hinweis: Für die Bedienung von E-Rezepten ist es es wichtig, alle Informationen zum Datenaustausch mit dem TI-Flow-Fachdienst zu sichern. Insbesondere bei Verlust des Secrets nach dem Herunterladen des E-Rezepts (Operation POST /Task//$accept) ist die Weiterverarbeitung des E-Rezepts nicht mehr möglich.

#### Bedienen von E-Rezepten nach Ablauf von Fristen

Verordnungen für apothekenpflichtige Arzneimittel für gesetzlich Versicherte unterliegen bestimmten Fristen:

* Belieferungsfrist: Frist bis zu welcher ein Rezept zu Lasten der gesetzlichen Krankenkasse eingelöst werden kann (Frist endet zu Task.extension:acceptDate, bei Kassenrezepten 28 Tage nach Ausstellung). Danach kann die Apotheke entscheiden das Rezept als Privatrezept zu beliefern (§11, Abs 4 AM-RL).
* Einlösefrist: Frist bis zu welcher ein Rezept beliefert werden darf (Frist endet zu Task.extension:expiryDate, bei Kassenrezepten 3 Monate nach Ausstellung). Danach darf ein Rezept nicht mehr von der Apotheke beliefert werden (§2, Abs. 5 AMVV). Bei Mehrfachverordnungen sind Belieferungsfrist und Einlösefrist identisch und können vom Arzt bis zu einem Jahr frei gewählt werden. Das Primärsystem soll dem Nutzer bei Ablaufen der entsprechenden Fristen entsprechende Hinweise darstellen.

Das PS der abgebenden LEI SOLL beim Abrufen eines E-Rezeptes die Belieferungsfrist und Einlösefrist eines E-Rezeptes anzeigen.

Das PS der abgebenden LEI SOLL für den Fall, dass eine Frist überschritten wurde dem Anwender einen entsprechenden Hinweis darstellen.

Das PS der abgebenden LEI SOLL bei Überschreiten der Belieferungsfrist dem Anwender die Möglichkeit geben, das Präparat als Privatrezept zu beliefern.
Der TI-Flow-Fachdienst löscht eingestellte Rezepte zehn Tage nach Ablaufen einer der Gültigkeit einer Verordnung (Task.extension:expiryDate). Daher kann das AVS in diesen zehn Tagen ein abgelaufenes Rezept vom TI-Flow-Fachdienst abrufen. Diese Verordnungen dürfen nicht von der Apotheke beliefert werden.

Das PS der abgebenden LEI DARF bei Überschreiten der Einlösefrist dem Anwender NICHT die Möglichkeit geben, das Rezept zu beliefern.
#### Finden von vorhandenen Vorgängen per Scan des E-Rezept-Tokens nach Zuweisung

Wenn ein Versicherter das E-Rezept-Token entweder per E-Rezept-FdV übermittelt oder in der Filiale den zugehörigen Datamatrix-Code vorgezeigt hat, dann ruft die Apotheke das E-Rezept vom TI-Flow-Fachdienst ab. Das E-Rezept erhält den Status “in-progress”. Ein E-Rezept mit diesem Status kann nicht noch einmal vom E-Rezept- Fachdienst abgerufen  werden. Wenn der Kunde das Medikament dann zu einem späteren Zeitpunkt in der Filiale abholt, soll es möglich sein, den zugehörigen Vorgang im AVS auch per Scan des E-Rezept-Token zu finden. Hinweis: Die Abfrage eines bereits durch die Apotheke heruntergeladenen E-Rezepts am TI-Flow-Fachdienstes liefert einen Fehler. Daher sollte diese Abfrage nicht durchgeführt werden.

Das PS der abgebenden LEI SOLL dem Anwender ermöglichen, einen bestehenden Vorgang zum Einlösen eines E-Rezepts mittels E-Rezept-Token zu suchen und nach Fund dem Anwender anzuzeigen.
Ist der Vorgang zum gescannten E-Rezept-Token bereits abgeschlossen, dann soll der Vorgang angezeigt, aber nicht wieder geöffnet werden.

#### Verarbeitung von Freitextverordnungen

Für die Abgabe von Medikamenten, die auf einer Freitextverordnung basieren, soll der Nutzer des AVS bestmöglich unterstützt werden, entsprechende Präparate zu finden und abzugeben. Hierzu sollen die gesamten Freitext-Informationen  der Verordnung angezeigt werden:

* Darreichungsform: KBV_PR_ERP_Medication_FreeText.form.text
* Freitextverordnung: KBV_PR_ERP_Medication_FreeText.code.text Das System soll den Nutzer dabei unterstützen zu erkennen, ob die Verschreibung für ein E-Rezept zulässig ist. Siehe auch https://github.com/gematik/api-erp#umfang-der- anwendung-e-rezept . Das System soll den Nutzer darin unterstützen, diese Verordnung im Sinne einer Verordnung von Fertigarzneimittel (PZN), Wirkstoff oder einer Rezeptur zu beliefern. Hierzu können beispielsweise Inhalte des Freitextes nach PZN-Pattern untersucht und anschließend in der Arzneimitteldatenbank ermittelt werden. Weiterhin könnte das System anbieten nach einzelnen Bestandteilen einer Freitextverordnung in einer geeigneten Datenbank zu suchen.

Das PS der abgebenden LEI SOLL es dem Nutzer ermöglichen, nach Bestandteilen der Freitextverordnung zu suchen, ohne händisch die Inhalte der Verordnung in ein Suchfeld zu übertragen.

Das PS der abgebenden LEI SOLL, wenn eine Freitextverordnung vorliegt, den Nutzer darauf hinweisen, dass die Angaben im E-Rezept auf Vollständigkeit zu prüfen ist.
Hierbei ist insbesondere darauf hinzuweisen, dass geprüft werden muss, ob eine Dosieranweisung vorliegt.

#### Prüfung von E-Rezepten

Der TI-Flow-Fachdienst überprüft derzeit noch nicht gänzlich die formale Richtigkeit der E-Rezepte. Das AVS soll eine formale Prüfung der Verordnungsdaten vornehmen. Diese Prüfung kann mittels ABDA- bzw. TI-Referenzvalidator vorgenommen werden.

Das PS der abgebenden LEI KANN für die Prüfung von E-Rezepten die aktuelle Version des ABDA-Referenzvalidators einsetzen.
Siehe auch https://github.com/DAV-ABDA/eRezept-Referenzvalidator/releases.

#### Sonderfall: Nachträgliches Zuordnen von E-Rezepten

In bestimmten Fällen kann es vorkommen, dass ein Vorgang für eine Verordnung im Primärsystem angelegt wird, obwohl der E-Rezept-Token für das Herunterladen des E- Rezepts noch nicht vorliegt. Beispiele für diesen Fall sind:

* telefonische Bestellung eines Medikaments
* fernmündliche Verordnung nach §4 AMVV
* Nachreichen eines Rezeptes, um die Abgabe über die gesetzliche Krankenkasse abrechnen zu lassen Es soll die Möglichkeit bestehen, einem Vorgang nachträglich ein E-Rezept zuzuordnen. Somit soll vermieden werden, dass der bestehende Vorgang gelöscht und ein neuer Vorgang angelegt werden muss. Abweichungen zwischen den Informationen im Vorgang und der Verordnung sollen dem Nutzer angezeigt werden.

Das PS der abgebenden LEI SOLL dem Nutzer ermöglichen, ein E-Rezept einem im System bestehenden Vorgang zuzuordnen.
#### Weiterleiten von E-Rezepten an eine andere Apotheke

Für Apothekenverbünde mit mehreren Filialen besteht die Möglichkeit E-Rezepte für die Belieferung weiterzuleiten. Dies kann von Interesse sein, wenn beispielsweise innerhalb eines Verbundes eine Apotheke sich um Vorbestellungen und Botendienste kümmert.  In dem Fall können die anderen Apotheken des Verbundes die vom TI-Flow-Fachdienst heruntergeladenen E-Rezepte an diese Apotheke weiterleiten. Das Weiterleiten kann auch im Rahmen eines Inhaberwechsels genutzt werden. Hinweis: Beim Abruf der Quittung erfolgt im TI-Flow-Fachdienst keine Prüfung, ob die Telematik-ID der Quittung abrufenden Apotheke mit der Telematik-ID der Apotheke übereinstimmt, welche das E-Rezept heruntergeladen und den Status in “in-progress” geändert hat. Für das Weiterleiten eines E-Rezeptes werden AccessCode, Task-ID, Secret des E- Rezeptes sowie sämtliche Inhalte der E-Rezeptes übermittelt. Die weitere Bearbeitung des E-Rezeptes kann ohne den Umweg über Freigabe des E-Rezeptes von einer Apotheke und erneutes Herunterladen durch eine andere Apotheke erfolgen. Wenn eine Apotheke Zugang zu diesen Informationen erhält, kann diese die Abgabe vollziehen. Hierzu muss die empfangene Apotheke die FHIR-OperationPOST /Task//$close des Rezeptes beim Fachdienst aufrufen.

Das PS der abgebenden LEI KANN eine Möglichkeit bieten, folgende Informationen an eine andere Filial-Apotheke über einen sicheren Kommunikationskanal zu übermitteln: Verordnungsdatensatz inklusive QES Task-ID des E-Rezepts AccessCode des E-Rezepts Secret des E-Rezepts. Der Kommunikationskanal muss so gewählt werden, dass die sehr hohe Vertraulichkeit des Informationen und deren Integrität geschützt wird.
Für die sichere Kommunikation kann KIM verwendet werden.

Das PS der abgebenden LEI KANN eine Möglichkeit bieten, die von einer anderen Filial-Apotheke übermittelten Informationen zu einem E-Rezept zu importieren und einen Vorgang dazu zu öffnen.
Unter der Annahme, dass die Apotheken in einem Apothekenverbund die gleiche Software nutzen, wurde bisher darauf verzichtet eine standardisiertes Schnittstelle bspw. auf Basis von KIM-Nachrichten zu entwickeln. Hinweis: Es ist zu vermeiden, E-Rezepte mittels Zurückweisen (Operation POST /Task//$reject) und erneuten Abrufen  (Operation POST /Task//$accept) zu übergeben. Diese Vorgehensweise erzeugt Protokolleinträge und zukünftig Notifications für den Versicherten, welche für diesen ggf. nicht nachvollziehbar sind.

#### Bedienen von E-T-Rezepten

Für die Bedienung und Belieferung von E-T-Rezepten gelten gesonderte UX-Hinweise.

Das PS der abgebenden LEI SOLL dem Nutzer bei der Bedienung eines E-T-Rezeptes sicherstellen, dass das Kennzeichen "T-Rezept" immer bei Verordnungen für Arzneimittel nach §3a AMVV dem Anwender sichtbar dargestellt wird.

Das PS der abgebenden LEI SOLL dem Nutzer bei der Bedienung eines E-T-Rezeptes sicherstellen, dass die Belieferung des E-T-Rezeptes nicht via Postversand möglich ist.
### Nachbereitung

#### Quittung automatisch abrufen

Die Quittung für ein beliefertes E-Rezept muss innerhalb einer vertraglich vereinbarten Frist abgerufen werden. Es sind die Regelungen des Rahmenvertrags nach SGB V §300 zu berücksichtigen. Das AVS soll sicherstellen, dass die Frist nicht überschritten wird und ggf. die Quittung automatisch abrufen. Die gematik empfiehlt die Quittung zeitnah nach der Abgabe an den Kunden abzurufen, denn mit dem Quittungsabruf werden dem Versicherten die Abgabeinformationen zum Abruf mit der App bereitgestellt.

Das PS der abgebenden LEI SOLL die Quittung mittels der Operation POST /Task/<id>/$close automatisch abrufen, wenn eine konfigurierbare Frist nach Abgabe des E-Rezept erreicht ist und der Quittungsabruf noch nicht erfolgt ist.
Hinweis: Der TI-Flow-Fachdienst bietet mit der Operation GET /Task/ die Möglichkeit, die Quittung nach dem erstmaligen Aufruf der Operation POST /Task//$close noch einmal abzurufen. Dies ist nur möglich, bis das E-Rezept durch den Versicherten oder nach Erreichen der Löschfrist automatisch durch den E-Rezept- Fachdienst gelöscht wird. Der Anwendungsfall "Quittung abrufen" generiert nicht nur die Quittung für die Abrechnung der Apotheke, sondern schließt auch den Workflow im TI-Flow-Fachdienst ab. Der Versicherte hat Einblick in den Statusverlauf und kann ein E-Rezept auch nach Abschluss des Workflows löschen. Das AVS muss bei der Abgabe jeglichen Rezepttyps und unabhängig vom Kostenträger den Workflow über diesen Anwendungsfall abschließen.

Das PS der abgebenden LEI MUSS die Quittung mittels der Operation POST /Task/<id>/$close für jedes E-Rezept, was beliefert wurde, abrufen, um den Workflow im TI-Flow-Fachdienst abzuschließen.
#### QES durch den Apotheker

Jeder Abgabedatensatz zu einem E-Rezept muss signiert werden. Für die nicht- qualifizierten Signatur wird die SMC-B der Apotheke verwendet. In vertraglich vereinbarten Fällen (“Rahmenvertrag über die Arzneimittelversorgung nach §129 Absatz 2 SGB V”,  https://www.abda.de/fileadmin/user_upload/assets/Vertraege/2021-10- 01_RV_129_redaktionelle_Gesamtfassung_Stand_01102021_barrierefrei.pdf) muss der HBA des Apothekers/-assistents/Pharmazieingenieurs für eine QES verwendet werden. In Fällen, in denen eine nicht-qualifizierte Signatur ausreicht, soll keine QES erzwungen werden. Dies führt zu Zeitersparnis, da unnötige PIN-Eingaben vermieden werden.

Das PS der abgebenden LEI SOLL für die Signatur des Abgabedatensatzes nur eine QES fordern, wenn diese aufgrund vertraglicher Festlegungen erforderlich ist. In allen anderen Fällen muss der Abgabedatensatz mit der SMC-B signiert werden.

Das PS der abgebenden LEI SOLL für die QES des Abgabedatensatzes eine Stapel- und/oder Komfortsignatur ermöglichen.
Für Stapel- und Komfortsignatur siehe [gemILF_PS].

#### Verständliche Rückmeldungen vom Apotheken

Rechenzentrum In der Nachbereitung bedarf es für den Nutzer des AVS einer Übersicht der Abrechnungsinformationen aus dem Apotheken Rechenzentrum (ARZ). Hierbei ist der Nutzer so zu unterstützen, dass Fehler in der Abrechnung von E-Rezepten schnell sichtbar sind und der Nutzer auch dahin geleitet wird fehlende oder falsche Angaben zu korrigieren.

Das PS der abgebenden LEI SOLL dem Nutzer eine Übersicht über den Abrechnungsstatus von beim ARZ eingereichten E-Rezepten darstellen können.

Das PS der abgebenden LEI SOLL dem Nutzer in der Abrechnungsstatusliste deutlich kenntlich machen, wenn das Apotheken Rechenzentrum Hinweise, Verbesserungsvorschläge oder Fehler für die Abrechnung eines E-Rezepts zurückgegeben hat.

Das PS der abgebenden LEI SOLL im Falle unzureichender Dokumentation der Abgabe in der Abrechnungsstatusliste den Nutzer auf die korrekte Stelle verweisen, die in der Dokumentation zu korrigieren ist.
### Fehlermanagement

#### Erreichbarkeit von TI-Komponenten

Im Arbeitsablauf des Nutzers können Fehler in der Erstellung und Verarbeitung eines E- Rezeptes auftreten. Da vom Nutzer kein technisches Vorwissen erwartet werden darf, sind Fehlermeldungen so anzugeben, dass dieser nach Möglichkeit darauf reagieren kann.

Hierbei sollen Fehlermeldungen so aufbereitet werden, sodass der Nutzer versteht, welches System im Prozess den Fehler verursacht hat. Außerdem sollen bei technischen Fehlern diese sprachlich aufbereitet werden, so dass der Nutzer den Inhalt des Fehlers verstehen kann. Für den Fall, dass die zentralen Dienste der TI (insbesondere der TI-Flow-Fachdienst) nicht erreichbar sind, ist es für die Mitarbeiter einer Apotheke hilfreich darüber benachrichtigt zu werden.

Solch eine Nicht-Erreichbarkeit kann durch einen Ausfall der TI- Dienste oder der lokalen TI-Komponenten der Apotheken (HBA, SMB-C, Konnektor, etc.) auftreten. In diesem Fall können E-Rezepte nicht vom TI-Flow-Fachdienst abgerufen und eingelöst werden. Diese Information ist präsent darzustellen. Der Arbeitsfluss und insbesondere die Funktionalität für das Einlösen von Muster-16 Verordnungen dürfen in diesem Fall nicht blockiert werden.

Das PS der abgebenden LEI SOLL im Falle der Nicht-Erreichbarkeit von zentralen Diensten der TI automatisch versuchen eine Fehlerbehebung durchzuführen.
Für das Umschwenken auf eine andere Instanz des TI-Flow-Fachdienstes siehe [gemSpec_ILF_PS_eRp#4.2 Namensauflösung].

Das PS der abgebenden LEI SOLL in dem Fall, dass die für die Anwendung E-Rezept notwendigen zentralen Dienste der TI nicht erreichbar sind, den Nutzer darüber benachrichtigen.

Das PS der abgebenden LEI DARF NICHT im Falle der Nicht-Erreichbarkeit der zentralen Dienste der TI das AVS derart blockieren, dass andere Arten der Einlösung, die unabhängig von der Anwendung E-Rezept der Telematikinfrastruktur sind (z.B. Muster-16 Verordnungen), nicht möglich sind.

Das PS der abgebende LEI SOLL beim Auftreten eines Fehlers dem Nutzer eine verständliche Fehlermeldung ausgeben.
Wenn das Fehler-meldende System eine technische Fehlermeldung liefert, braucht diese dem Nutzer nicht dargestellt werden.

Das PS der abgebende LEI SOLL beim Auftreten eines Fehlers, falls möglich, dem Nutzer Handlungsempfehlungen ausgeben, die dazu beitragen können, den Fehler zu beseitigen.
Die Bereitstellung der Fehlerdetails per Email o.Ä. steht mit diesen Anforderungen nicht im Widerspruch. Es soll weiterhin möglich sein technische Details an den technischen Support zu übermitteln.

