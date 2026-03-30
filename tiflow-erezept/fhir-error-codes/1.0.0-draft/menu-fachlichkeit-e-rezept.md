# Verordnung von apothekenpflichtigen Arzneimitteln - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Fachliche Aspekte zur Arzneimittelverordnung**](menu-fachlichkeit.md)
* **Verordnung von apothekenpflichtigen Arzneimitteln**

## Verordnung von apothekenpflichtigen Arzneimitteln

Dieses Kapitel beschreibt den fachlichen Normalfall von der Verordnung bis zur Belieferung in der Apotheke. Im Fokus stehen die Handlungen der Beteiligten (Arzt, Versicherter, Apotheke) sowie die fachlichen Schritte.

Das Szenario umfasst die Versorgung gesetzlich (GKV) und privat (PKV) Versicherter.

### Epic

Die Fachanwendung E-Rezept ermöglicht eine Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel in elektronischer Form. Sie setzt sich aus den folgenden dargestellten Bestandteilen zusammen:

**Abbildung: **Übersicht E-Rezept
Der verordnende Leistungserbringer erstellt für einen Versicherten ein E-Rezept, welches auf dem zentralen TI-Flow-Fachdienst abgelegt wird. Der Standardfall sieht vor, dass der Versicherte seine E-Rezepte mit dem E-Rezept-Frontend des Versicherten auf seinem technischen Gerät verwaltet. Mit dem E-Rezept-Frontend des Versicherten kann der Versicherte einen E-Rezept-Token generieren, der eine Apotheke für den Zugriff auf ein konkretes E-Rezept im TI-Flow-Fachdienst berechtigt. Der Versicherte übermittelt den E-Rezept-Token elektronisch an eine Apotheke oder legt ihn in Form eines 2D-Codes in einer Apotheke vor. Die elektronische Übertragung des E-Rezept-Tokens an eine Apotheke erfolgt über den TI-Flow-Fachdienst.

Für Versicherte, welche kein E-Rezept-Frontend des Versicherten nutzen, erstellt der verordnende Leistungserbringer den E-Rezept-Token und übergibt ihn in Form eines 2D-Code auf einem Ausdruck dem Versicherten. Der Ausdruck kann in einer Apotheke vorgelegt werden.

Durch die Übergabe der Gesundheitskarte oder eines Patientenausdrucks an eine andere Person kann diese als Vertreter das E-Rezept in einer Apotheke einlösen.

Der Versicherte hat die Hoheit über das E-Rezept, da jeglicher Zugriff auf ein konkretes Rezept im TI-Flow-Fachdienst entweder nur dem Versicherten, dem das E-Rezept verordnet wurde, oder einer Apotheke gestattet ist. Der E-Rezept-Token realisiert ein Besitzmodell, d.h. wer im Besitz des E-Rezept-Tokens und damit des AccessCodes ist, kann damit die Dispensierung in einer Apotheke veranlassen.

Mit der Übergabe bzw. dem Einlesen des E-Rezept-Tokens an einen/durch einen Apotheker erfolgt die Aufforderung zur Dispensierung. Der Apotheker lädt das E-Rezept vom zentralen TI-Flow-Fachdienst und verarbeitet es. Zugriffe auf den TI-Flow-Fachdienst werden im TI-Flow-Fachdienst protokolliert und sind durch den jeweils betroffenen Versicherten einsehbar.

Die dezentrale E-Rezept-Fachlogik wird im Primärsystem der verordnenden und abgebenden Leistungserbringerinstitutionen, sowie im E-Rezept-Frontend des Versicherten (E-Rezept-FdV) umgesetzt. Alle Client-Systeme nutzen Dienste der zentralen TI-Plattform, wobei die Primärsysteme der Leistungserbringer zusätzlich auf Funktionalitäten des Konnektors zurückgreifen.

In der TI gibt es genau einen Anbieter für den TI-Flow-Fachdienst und einen Anbieter für das E-Rezept-Frontend des Versicherten.

Das E-Rezept-Frontend des Versicherten muss diskriminierungsfrei, werbefrei und unabhängig sein.

Für den Zugang zur Telematikinfrastruktur nutzt der Versicherte seine eGK mit NFC-Schnittstelle, sodass eine Nutzung des E-Rezepts auch ohne weitere Hardware an den Geräten des Versicherten möglich ist.

### User Stories

* Als verordnender Leistungserbringer möchte ich ein E-Rezept ausstellen und bereitstellen, damit der Versicherte das Arzneimittel beziehen kann.
* Als Versicherter möchte ich mein E-Rezept einlösen können, damit ich das Arzneimittel in der Apotheke erhalte.
* Als Apotheke möchte ich ein E-Rezept annehmen, beliefern und abschließen, damit die Abgabe korrekt dokumentiert ist.

#### User Stories Versicherte

##### E-Rezepte Abrufen

* Als Patient möchte ich ein “E-Rezept” auswählen können, das ich herunterladen möchte, so dass ich es später einlösen oder zuweisen kann.
* Als Patient möchte ich, dass alle für mich verfügbaren “E-Rezepte” automatisch auf mein Gerät heruntergeladen werden, wenn sie dort noch nicht gespeichert sind, so dass ich nicht selbst meine Rezepte herunterladen muss. (eRP_159)
* Als Patient möchte ich, dass meine E-Rezept-App für einen konsistenten Zustand zwischen dem Fachdienst und der App sorgt, so dass ich keine Rezepte doppelt auf meinem Gerät habe oder andere Inkonsistenzen entstehen, so dass ich nicht verwirrt werde. (eRP_160)
* Als Patient möchte ich, dass der Status meiner Rezepte automatisch von der App aktualisiert wird, wenn er sich im Fachdienst geändert hat, so dass ich immer auf dem neuesten Stand bin und nicht Rezepte einlösen will, die bereits eingelöst sind. (eRP_161)
* Als Patient möchte ich alle E-Rezepte, die für mich verfügbar sind, sehen können, so dass ich entscheiden kann, was ich mit diesen E-Rezepten machen will.
* Als Patient möchte ich sehen können, welchen Status ein E-Rezept hat, so dass ich in der Lage bin, den nächsten Schritt entscheiden zu können.
* Als Patient möchte ich die relevanten Informationen aus einem E-Rezept lesen können, so dass ich weiß, was mir verschrieben wurde.

##### E-Rezepte löschen

* Als Patient möchte ich ein E-Rezept auswählen können, das ich löschen will, so dass ich mein Recht auf informationelle Selbstbestimmung ausüben kann.
* Als Patient möchte ich die ausgewählten E-Rezepte löschen können, so dass ich mein Recht auf informationelle Selbstbestimmung ausüben kann.
* Als Patient möchte ich Rückmeldung darüber erhalten, wenn die ausgewählten E-Rezepte gelöscht worden sind, so dass ich sicher sein kann, dass die Daten auch wirklich nicht mehr vorliegen.
* Als Patient möchte ich Rückmeldung darüber erhalten, wenn das Löschen fehlgeschlagen ist, so dass ich auf anderem Wege ein Löschen einleiten kann.
* Als Patient möchte ich eigenständig E-Rezepte aus meinem E-Rezept-FdV löschen können, um die Übersichtlichkeit in der Ansicht zu erhöhen.
* Als Patient möchte ich nicht mehr benötigte E-Rezepte mit zugehörigen Informationen oder Nachrichten aus der Ansicht meines E-Rezept-FdV löschen können.

Mit diesem Anwendungsfall kann der Nutzer die lokal in seinem E-Rezept-FdV gespeicherten E-Rezepte mit allen dazugehörigen Informationen löschen.

### Verordnung apothekenpflichtiger Arzneimittel (GKV/PKV)

Ein verordnender Leistungserbringer erstellt im Primärsystem (PVS/KIS) den Verordnungsdatensatz, signiert diesen qualifiziert und stellt das E-Rezept im TI-Flow-Fachdienst bereit.

#### Fachlicher Ablauf

1. Der Verordner wählt den Verordnungsdatensatz aus und bestätigt die Ausstellung des E-Rezepts.
1. Die Verordnung wird qualifiziert signiert.
1. Das E-Rezept wird für den Versicherten bereitgestellt.
1. Der Versicherte kann das bereitgestellte E-Rezept in einer Apotheke einlösen.

#### Fachliche Unterschiede zwischen GKV und PKV

* Für PKV-Versicherte können zusätzliche Schritte zur Bereitstellung PKV-relevanter Versichertendaten erforderlich sein (z. B. Online Check-in).
* Beide Gruppen durchlaufen für apothekenpflichtige Arzneimittel den regulären Einlöseprozess in der öffentlichen Apotheke.

**Beteiligte Systeme:** PVS/KIS, TI-Flow-Fachdienst

**Technische Anwendungsfälle**

| |
| :--- |
| [UC 2.1 - E-Rezepte erzeugen](menu-technische-umsetzung-anwendungsfaelle.md#uc-2-1-e-rezepte-erzeugen) |
| [E-Rezept qualifiziert signieren](menu-technische-umsetzung-anwendungsfaelle.md#e-rezept-qualifiziert-signieren) |
| [UC 2.3 - E-Rezept einstellen](menu-technische-umsetzung-anwendungsfaelle.md#uc-2-3-e-rezept-einstellen) |
| [UC 2.5 - E-Rezept durch Verordnenden löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc-2-5-e-rezept-durch-verordnenden-loeschen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Anwendungsfall
*Verordnung apothekenpflichtiger Arzneimittel (160/200)*
### Belieferung in der Apotheke (GKV/PKV)

Nach Übergabe von Task-ID und AccessCode (z. B. 2D-Code oder Nachricht) ruft die Apotheke das E-Rezept im Fachdienst ab, beliefert den Versicherten und schließt den Workflow ab.

#### Fachlicher Ablauf

1. Die Apotheke nimmt das E-Rezept an und ruft die Verordnungsdaten ab.
1. Falls erforderlich, dokumentiert die Apotheke die Abgabeinformationen während der Belieferung.
1. Nach der Abgabe wird der Vorgang abgeschlossen und eine Quittung bereitgestellt.
1. Falls die Quittung nicht vorliegt, kann sie erneut bereitgestellt werden.

#### Fachliche Unterschiede zwischen GKV und PKV

* Bei PKV-Versicherten kann zusätzlich eine Einwilligung zur Bereitstellung von Abrechnungsinformationen vorliegen.
* Bei PKV muss dem Versicherten nach Abschluss der Abgabe eine ausgedruckte Quittung für die private Abrechnung bereitgestellt werden.

### Anwendungsfälle

**Beteiligte Systeme:** AVS, TI-Flow-Fachdienst

**Technische Anwendungsfälle**

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
*Belieferung apothekenpflichtiger Arzneimittel (160/200)*
### Verwalten von E-Rezepten durch Versicherten

Versicherte verwalten ihre E-Rezepte in der E-Rezept-App, sehen Zugriffsprotokolle ein und laden bei Bedarf zusätzliche Informationen zum ausgegebenen Medikament herunter. Wird auf einen Papierausdruck verzichtet, erfolgt die Einlösung über die App: Aus den heruntergeladenen Daten wird ein 2D-Code (DataMatrix) erzeugt, der in der Apotheke gescannt wird und damit die Adresse sowie Zugriffsberechtigung zum E-Rezept bereitstellt.

#### Fachlicher Ablauf

1. Der Versicherte ruft seine E-Rezepte im FdV ab und sieht Status sowie Detailinformationen ein.
1. Optional erstellt die E-Rezept-App einen 2D-Code zur Einlösung und stellt ihn zur Verfügung.
1. Der Versicherte kann zusätzliche Informationen (z. B. Dispensierinformationen) abrufen.
1. Bei Bedarf löscht der Versicherte ein E-Rezept.

### Anwendungsfälle

**Beteiligte Systeme:** PVS/KIS, AVS, E-Rezept-FdV , TI-Flow-Fachdienst

#### Technische Anwendungsfälle der Verordnung

| |
| :--- |
| [UC 3.1 - E-Rezepte durch Versicherten abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-1-e-rezepte-durch-versicherten-abrufen) |
| [UC 3.2 - E-Rezept durch Versicherten löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-2-e-rezept-durch-versicherten-loeschen) |
| [UC 3.9 - Dispensierinformationen durch Versicherten abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-9-dispensierinformationen-durch-versicherten-abrufen) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zu Anwendungsfall
*Verwalten von E-Rezepten durch Versicherten*

