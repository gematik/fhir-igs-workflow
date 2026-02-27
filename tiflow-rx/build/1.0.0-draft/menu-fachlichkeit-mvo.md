# Verordnung von Mehrfachverordnungen (MVO) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Fachliche Aspekte zur Arzneimittelverordnung**](menu-fachlichkeit.md)
* **Verordnung von Mehrfachverordnungen (MVO)**

## Verordnung von Mehrfachverordnungen (MVO)

Das Szenario beschreibt die Mehrfachverordnung (MVO) für apothekenpflichtige Arzneimittel. Eine MVO besteht aus mehreren Teilverordnungen, die jeweils als eigenes E-Rezept verarbeitet werden.

### Kontext

Mehrfachverordnungen sollen die Versorgung mit Arzneimittel für chronisch Kranke erleichtern. Hierfür wurde in § 31 Absatz 1b SGB V die Grundlage geschaffen: „Für Versicherte, die eine kontinuierliche Versorgung mit einem bestimmten Arzneimittel benötigen, können Vertragsärzte Verordnungen ausstellen, nach denen eine nach der Erstabgabe bis zu dreimal sich wiederholende Abgabe erlaubt ist. Die Verordnungen sind besonders zu kennzeichnen. Sie dürfen bis zu einem Jahr nach Ausstellungsdatum zu Lasten der gesetzlichen Krankenkasse durch Apotheken beliefert werden.”

Neben § 31 Absatz 1b SGB V regelt § 4 Abs. 3 AMVV i.V.m. § 2 Abs. 1 Nr. 6a AMVV die gesetzliche Grundlage der Mehrfachverordnungen.

Aus der Mehrfachverordnung ergeben sich Vorteile für Patienten und die Abläufe in Arztpraxen, da die Rezepte für Dauermedikationen im Voraus ausgestellt werden können und somit Wege zur Arztpraxis zum Rezepte abholen entfallen.

### User Stories

Die User Stories beschreiben die Erwartungen der Nutzer für die neuen digitalen Prozesse mit Bezug zur Mehrfachverordnung.

#### Versicherte

Als Versicherter möchte ich:

* für jedes einzelne E-Rezept aus meiner Mehrfachverordnung eine Apotheke frei auswählen können, damit ich wählen kann, ob ich die einzelnen Rezepte in der gleichen oder in unterschiedlichen Apotheken einlöse.
* erkennen können, dass ein Rezept Bestandteil einer Mehrfachverordnung ist, um meine Abläufe (d.h. Gänge zum Arzt für Abholung Rezepte und Gänge zur Apotheke für Einlösung Rezepte) besser organisieren zu können.
* erkennen können, um das wievielte Rezept einer Mehrfachverordnung es sich handelt, damit ich meine Medikamenteneinnahme sowie die Termine beim Arzt und Apotheker einplanen kann.
* sehen können, wie viele E-Rezepte aus meiner Mehrfachverordnung ich bereits eingelöst habe.
* sehen können, wann ich mein einzelnes E-Rezept aus der Mehrfachverordnung einlösen kann, das heißt den Beginn der Einlösefrist.
* genau sehen können, wie lange jede einzelne Verordnung gültig ist, das heißt das Ende der Einlösefrist.
* dass ich meine E-Rezepte darüber hinaus wie alle meine anderen Rezepte in meiner E-Rezept-App verwalten kann, um mich nicht mit neuen Abläufen in meiner E-Rezept App oder mit dem Arzt und Apotheker herumschlagen zu müssen.
* dass meine E-Rezept-App mich dabei unterstützt, dass ich das richtige E-Rezept in der Apotheke einlöse, damit ich in der Apotheke keine Zeit damit verschwende, einen ungültigen Token vorzuzeigen z.B. wenn ein E-Rezept erst in der Zukunft eingelöst werden kann.
* dass meine E-Rezept-App mich dabei unterstützt, dass ich auf den ersten Blick erkenne, dass der Beginn der Einlösefrist eines E-Rezeptes erst in der Zukunft liegt.
* erinnert werden, dass eine Teilverordnung gültig geworden ist, damit ich nicht vergesse, das Rezept einzulösen.
* jedes einzelne E-Rezept einer Mehrfachverordnung löschen können.

#### Verordnende

Als Verordnender möchte ich:

* dass mein Primärsystem mich dabei unterstützt, eine Mehrfachverordnung auszustellen, so dass ich identische Felder nur einmal ausfülle und mich auf das Ausfüllen der Unterschiede (z.B. Anzahl der einzelnen Rezepte) konzentrieren kann.
* dass mein Primärsystem mich dabei unterstützt, die Einlösefristen für die einzelnen E-Rezepte automatisch zu berechnen und auszufüllen, so dass ich nicht mühsam Termine berechnen muss.
* alle einzelnen E-Rezepte einer Mehrfachverordnung in einem Schritt löschen können, damit ich eventuell auftretende Fehler schnell und unkompliziert korrigieren kann.
* dass mein Primärsystem mich dabei unterstützt, die einzelnen Teilverordnungen einfach und unkompliziert in einem Arbeitsschritt zu signieren.

#### Apotheker

Als Apotheker möchte ich:

* erkennen können, dass ein Rezept Bestandteil einer Mehrfachverordnung ist. sehen können, um das wievielte Rezept einer Mehrfachverordnung es sich handelt.
* jedes E-Rezept einer Mehrfachverordnung einzeln abrufen, beliefern und abrechnen können.
* ein E-Rezept einer Mehrfachverordnung, das mir zugewiesen worden ist, löschen können.
* erkennen können, wenn der Beginn des Einlösezeitraumes einer Verordnung noch nicht erreicht wurde, sodass ich keine unnötige Arbeit mit noch nicht gültigen Rezepten habe.
* wenn mein Patient es sich wünscht, die Zugangsinformationen und den Gültigkeitszeitraum zum Rezept speichern und später (wenn sie gültig werden) abrufen können.

### Fachliches Konzept

Eine Mehrfachverordnung besteht aus mindestens 2 bis maximal 4 Teilverordnungen. Jede Teilverordnung einer Mehrfachverordnung ist ein vollständiges E-Rezept mit QES-signierten Verordnungsdatensatz und E-Rezept-Token. Das bedeutet, dass jede der Teilverordnungen durch den eigenen E-Rezept-Token auch einzeln durch den Versicherten, ggf. in verschiedenen Apotheken, eingelöst werden kann.

Das Statusmodell für E-Rezepte wird für die Teilverordnungen nicht geändert. Der Versicherte erhält nach der Abgabe für jede Teilverordnung eine eigene Information zur Abgabe (MedicationDispense). Auch die Abrechnung der Apotheke bzw. der Versicherten gegenüber dem Kostenträger erfolgt auf Basis der Teilverordnungen.

Es gibt kein Ersatzverfahren (Muster 16), da Mehrfachverordnungen nur in elektronischer Form vorhanden sind.

Für Mehrfachverordnungen gibt es keine Ersatzverordnungen. Bei Verlust muss ein Einzelrezept für die verlorene Teilverordnung ausgestellt werden.

Die Mehrfachverordnung ist unabhängig vom Versichertenverhältnis, d.h. anwendbar für GKV- und PKV-Versicherte.

#### Gültigkeit der Teilverordnungen einer Mehrfachverordnung

Der Verordnende legt den Beginn des Gültigkeitszeitraumes für jede Teilverordnung im Verordnungsdatensatz fest. Der Verordnende kann das Ende der Gültigkeitszeitraumes einer Teilverordnung festlegen. Falls das Ende nicht durch den Verordnenden festgelegt wird, dann gilt die Teilverordnung bis 365 Tage nach dem Ausstellungsdatum der Mehrfachverordnung.

Die Abrechnungsmöglichkeit gegenüber den Kostenträgern ist bestimmt durch die Arzneimittel-Richtlinie des G-BA und die Regelungen der ergänzenden Verträge nach § 129 Absatz 5 SGB V in denen der Zeitraum, in dem eine Abrechnung zu Lasten der Krankenkassen möglich ist, festgelegt ist. Bei den Teilverordnungen ist eine Abrechnung gegenüber dem Kostenträger möglich, wenn das E-Rezept innerhalb des Gültigkeitszeitraum beliefert und quittiert wird.

Bis zum Erreichen des Gültigkeitszeitraums ist keine Einsicht für die Apotheke in das E-Rezept möglich. Der Versicherte kann mittels E-Rezept-FdV oder E-Rezept-AdV die E-Rezepte einsehen. Kürzere Belieferungsfristen nach § 12 Absatz 1 Nummer 1 Buchstabe c BtMVV und den § 3a Absatz 4 und 3b Absatz 2 AMVV bleiben unberührt. mDas bedeutet, es gibt keine Mehrfachverordnung für Entlassrezepte, BTM-Rezepte und T-Rezepte.

**Abbildung: **Übersicht Gültigkeit von Teilverordnungen


#### Löschen und Löschfristen für Teilverordnungen einer Mehrfachverordnung

Es besteht beim Löschen kein Unterschied zu Einzelrezepten. Wenn eine Teilverordnung noch nicht eingelöst wurde, dann kann sie von Arzt, Patient oder Apotheker gelöscht werden.

Für die Teilverordnungen gelten die gleichen Löschfristen wie für Einzelrezepte. D.h. Teilverordnungen werden automatisch 10 Tage nach Ablauf der Gültigkeit oder 100 Tage nach Dispensierung gelöscht.

#### Ausdruck für den Versicherten

Der Versicherte kann einen Ausdruck für die Teilverordnungen durch den Verordnenden erhalten. Regelungen für das Erstellen des Ausdrucks für die Teilverordnungen einer Mehrfachverordnung sind in der , Technischen Anlage zur elektronischen Arzneimittelverordnung (E16A)” [KBV ITA_VGEX TECHNISCHE ANLAGE_ ERP] getroffen.

Wenn ein Ausdruck die Daten zu mehrere Teilverordnungen einer Mehrfachverordnung beinhaltet und diese eingescannt werden, dann dürfen die E-Rezept-Token der Teilverordnungen, welche noch nicht ihren Gültigkeitszeitraum erreicht haben, nicht automatisch im AVS gespeichert werden, da der Versicherte das Recht hat, für diese ggf. eine andere Apotheke für das Einlösen auszuwählen. Das Speichern kann auf Wunsch des Versicherten erfolgen.

### Flowtypes und Verarbeitung

Der Unterschied gegenüber den in der bisherigen Prozessdefinition für den Workflowtype 160 bzw. 200 ausgestellten Verordnungsdaten besteht in der Verschreibung mehrerer Einzelrezepte auf einmal.

Unabhängig vom Flowtype bleibt die fachliche Regel gleich: jede Teilverordnung ist ein eigener, separater Workflow.

### Anwendungsfälle

**Beteiligte Systeme:** PVS/KIS, AVS, E-Rezept-Fachdienst, E-Rezept-FdV

#### Technische Anwendungsfälle der Verordnung

| |
| :--- |
| [UC 2.1 - E-Rezepte erzeugen](menu-technische-umsetzung-anwendungsfaelle.md#uc-2-1-e-rezepte-erzeugen) |
| [E-Rezept qualifiziert signieren](menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-qualifiziert-signieren) |
| [UC 2.3 - E-Rezept einstellen](menu-technische-umsetzung-anwendungsfaelle.md#uc-2-3-e-rezept-einstellen) |
| [UC 2.5 - E-Rezept durch Verordnenden löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc-2-5-e-rezept-durch-verordnenden-loeschen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Anwendungsfall
*Verordnung von Mehrfachverordnungen*
#### Technische Anwendungsfälle für die Belieferung

| |
| :--- |
| [UC 4.1 - E-Rezept durch Abgebenden abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-1-e-rezept-durch-abgebenden-abrufen) |
| [UC 4.2 - E-Rezept durch Abgebenden zurückgeben](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-2-e-rezept-durch-abgebenden-zurueckgeben) |
| [UC 4.3 - E-Rezept durch Abgebenden löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-3-e-rezept-durch-abgebenden-loeschen) |
| [UC 4.4 - Quittung abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-4-quittung-abrufen) |
| [UC 4.5 - Abgabedatensatz durch Abgebenden signieren](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-5-abgabedatensatz-signieren) |
| [UC 4.8 - Quittung erneut abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-8-quittung-erneut-abrufen) |
| [UC 4.16 - Dispensierinformationen bereitstellen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-16-dispensierinformationen-bereitstellen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Anwendungsfall
*Belieferung von Mehrfachverordnungen*

