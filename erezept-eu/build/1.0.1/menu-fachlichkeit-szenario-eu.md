# Fachlichkeit - Szenario EU - EU Zugriff E-Rezept v1.0.1

EU Zugriff E-Rezept

Version 1.0.1 - ci-build 

* [**Table of Contents**](toc.md)
* **Fachlichkeit - Szenario EU**

## Fachlichkeit - Szenario EU

### Epic und User Story

Das fachliche Konzept zum Einlösen von E-Rezepten im europäischen Ausland wurde im Rahmen von “Feature ePrescription/eDispensation Land A” [gemF_ePres-eDisp] abgestimmt.

### Fachliches Konzept

#### Einlösbare Rezepte

Für das europäische Nutzungsszenario ePrescription/eDispensation dürfen folgende E-Rezepte nicht verarbeitet werden:

* Betäubungsmittel
* Arzneimittel, die nach ärztlicher Verschreibung oder nach den Vorschriften eines Arzneibuchs für den Versicherten zubereitet werden (bezeichnet als “formula magistralis” oder “extemporale Zubereitungen”).
* Arzneimittel, die als Humanarzneimittel eingestuft sind, aber nicht durch ein industrielles Verfahren hergestellt oder bei deren Herstellung kein industrielles Verfahren angewandt wurde.
* Arzneimittel, die nicht als Humanarzneimittel eingestuft sind, noch nicht gültige oder abgelaufene E-Rezepte. Zusätzlich bestehen Einschränkungen, wenn das Mapping aus den Verordnungsdaten in das geforderte europäische Datenformat nicht möglich ist.

Der E-Rezept-Fachdienst prüft bei Operationsaufrufen, ob die E-Rezepte die folgenden Kriterien erfüllen:

* Workflow **160** oder **200** (Verordnung für apothekenpflichtige Arzneimittel, keine Workflowsteuerung durch den Leistungserbringer),
* PZN-Verordnung (KBV_PR_ERP_Medication_PZN) mit strukturierter Angabe der Stückzahl sowie der Packungsgröße, getrennt nach Einheit und numerischem Wert,
* Gültigkeitszeitraum ist erreicht,
* Gültigkeitszeitraum ist nicht überschritten,
* der Workflow zum E-Rezept hat den Status “offen”.
* Ein E-Rezept, welches die obigen Kriterien erfüllt, wird im Kontext dieses Features als einlösbares E-Rezept bezeichnet.

Ein Versicherter kann sich im E-Rezept-FdV anzeigen lassen, welche seiner E-Rezepte im europäischen Ausland einlösbar sind

#### Autorisierung

##### Autorisierung des LE-EU für Zugriff auf die Anwendung E-Rezept

Die Authentisierung des LE-EU erfolgt im Land B (Ausland). Hierbei wird dem LE-EU eine Rolle zugeordnet. Bei der Übermittlung des Requests aus dem Land B zum NCPeH-FD wird die Rollen-Information und ggf. eine Permission-Information übermittelt. Der NCPeH-FD prüft die Permission für den Zugriff auf die Anwendung E-Rezept. Falls keine Permission übermittelt wurde, führt der NCPeH-FD eine Rollenprüfung durch.

Der E-Rezept-Fachdienst führt keine Permission- oder Rollenprüfung durch.

##### Autorisierung des LE-EU für Zugriff auf Daten eines Versicherten

Ein Versicherter muss den Zugriff eines LE-EU auf seine E-Rezepte autorisieren. Dafür verwendet der Versicherte einen länderspezifischen zufälligen 6-stelligen alpha-nummerischen Zugriffscode (a-z, A-Z, 0-9) und übermittelt diesen zusammen mit seiner Versicherten-ID an den LE-EU.

Versicherten-ID und Zugriffscode bilden zusammen die Information zur Zugriffsberechtigung und dienen der Autorisierung des LE-EU beim Operationsaufruf am E-Rezept-Fachdienst.

Der Zugriffscode wird dezentral im E-Rezept-Frontend des Versicherten (FdV) erzeugt. Das E-Rezept-FdV registriert den Zugriffscode am E-Rezept-Fachdienst.

Ein Zugriffscode kann nur am E-Rezept-Fachdienst registriert werden, wenn eine “Einwilligung zum Einlösen im EU-Ausland” des Versicherten vorliegt.

Bei der Registrierung des Zugriffscodes am E-Rezept-Fachdienst wird geprüft, ob einlösbare Rezepte im E-Rezept-Fachdienst für die KVNR des Versicherten vorliegen. Falls keine einlösbaren E-Rezepte vorliegen, wird der Zugriffscode nicht registriert und der Versicherte erhält eine entsprechende Meldung in seinem E-Rezept-FdV.

Ein Zugriffscode ist eine Stunde gültig.

Der Versicherte kann einen Zugriffscode vor dem Ende des Gültigkeitszeitraumes löschen und somit die Zugriffsberechtigung widerrufen.

Wenn der Versicherte einen neuen Zugriffscode erstellt, dann wird ein zuvor bestehender Zugriffscode überschrieben und somit nicht mehr für die Autorisierung akzeptiert.

Der registrierte Zugriffscode wird dem Nutzer im E-Rezept-FdV zusammen mit dem Gültigkeitszeitraum angezeigt, damit der Nutzer den Zugriffscode der LEI-EU übermitteln kann.

Nach Ablauf der Gültigkeit löscht der E-Rezept-Fachdienst den Zugriffscode.

Es gibt keine Möglichkeit in der Rolle Vertreter den Zugriff des LE-EU auf die Daten des Versicherten zu autorisieren.

### Technische Anwendungsfälle

#### Versicherteninteraktion

**Beteiligte Systeme:** E-Rezept-Fachdienst, E-Rezept-FdV

| |
| :--- |
|  |
| [UC 3.15 - Einwilligung durch Versicherten widerrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-15-einwilligung-widerrufen) |
| [UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-16-zugriffsberechtigung-erstellen) |
| [UC 3.17 - Zugriffsberechtigung durch Versicherten löschen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-17-zugriffsberechtigung-loeschen) |
| [UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-18-zugriffsberechtigung-einsehen) |
| [UC 3.19 - E-Rezept durch den Versicherten markieren](menu-technische-umsetzung-anwendungsfaelle.md#uc-3-19-e-rezept-markieren) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zur Verwaltung von
*E-Rezepten im EU Ausland*
#### Interaktion NCPeH

**Beteiligte Systeme:** E-Rezept-Fachdienst, NCPeH

| |
| :--- |
|  |
| [UC 4.21 - Liste ausgewählter E-Rezepte eines Versicherten abrufen](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-21-liste-ausgewaehlte-abrufen) |
| [UC 4.22 - Abgabe eines E-Rezeptes im europäischen Ausland](menu-technische-umsetzung-anwendungsfaelle.md#uc-4-22-abgabe-eu) |

**Tabelle:**Technische Anwendungsfälle mit Bezug zum Abrufen von
*E-Rezepten für die Einlösung im EU Ausland*

