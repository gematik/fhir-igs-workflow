# Anwendungsfälle für den Abrechnungsinformationen des E-Rezepts für PKV-Versicherte - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Überblick zur Verordnung und Belieferung von Arzneimitteln**](menu-fachlichkeit-ueberblick.md)
* **Anwendungsfälle für den Abrechnungsinformationen des E-Rezepts für PKV-Versicherte**

## Anwendungsfälle für den Abrechnungsinformationen des E-Rezepts für PKV-Versicherte

Übersicht der fachlichen Anwendungsfälle im PKV‑Szenario.

Die folgenden fachlichen Anwendungsfälle beschreiben – aus Sicht der beteiligten Rollen – die Schritte zur Bereitstellung und Nutzung der Abrechnungsinformation.

#### Übergreifende Vorbedingungen

* Der Versicherte ist als PKV-Versicherter identifiziert.
* Die beteiligten Systeme sind gegenüber der TI authentisiert.

#### Abrechnungsinformation durch Abgebenden bereitstellen

* Beschreibung: Vorbedingungen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * Ein Mitarbeiter der abgebenden LEI hat „Quittung abrufen“ durchgeführt.
* Task-ID und Secret zur Statusänderung „in Abgabe (gesperrt)“ sind bekannt.
* Das E-Rezept hat den Status „quittiert“.
* Einwilligung des Versicherten liegt vor.

* Beschreibung: Durchzuführende Aktionen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * PKV-Abgabedatensatz erstellen und signieren.
* ChargeItem mit PrescriptionID und Pflichtfeldern erzeugen.
* ChargeItem, Secret und Abgabedaten an den E-Rezept-Fachdienst senden.
* Fachdienst prüft Einwilligung, Signatur und FHIR-Validität; übernimmt Verordnungsdatensatz und Quittung.
* Fachdienst erzeugt AccessCode zum Ändern.

* Beschreibung: Nachbedingungen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * Abrechnungsinformation ist gespeichert und protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * [Abrechnungsinformation bereitstellen](./menu-technische-umsetzung-anwendungsfaelle.md#bereitstellen-abgebende-lei)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.:  APOTHEKER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformation durch Abgebenden bereitstellen

#### Abrechnungsinformation durch Abgebenden abrufen

* Beschreibung: Vorbedingungen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Rezept-ID und AccessCode zum Ändern sind bekannt.

* Beschreibung: Durchzuführende Aktionen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Aufruf des E-Rezept-Fachdienstes mit Rezept-ID und AccessCode.
* Fachdienst prüft AccessCode und Berechtigung.
* Fachdienst liefert Verordnungs- und PKV-Abgabedatensatz.

* Beschreibung: Nachbedingungen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Datensätze liegen im Primärsystem vor; Zugriff ist protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * [Abrechnungsinformation abrufen](./menu-technische-umsetzung-anwendungsfaelle.md#abrufen-abgebende-lei)

* Beschreibung: Relevante(r) Sektor(en)
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.:  APOTHEKER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformation durch Abgebenden abrufen

#### PKV-Abgabedatensatz durch Abgebenden ändern

* Beschreibung: Vorbedingungen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Abrechnungsinformation wurde zuvor bereitgestellt.
* Rezept-ID und AccessCode zum Ändern sind bekannt.

* Beschreibung: Durchzuführende Aktionen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Neuer PKV-Abgabedatensatz wird erzeugt.
* Rezept-ID, AccessCode und Datensatz werden an den Fachdienst übermittelt.
* Fachdienst prüft AccessCode, Berechtigung, Signatur und FHIR-Validität.
* Datensatz wird überschrieben; neuer AccessCode wird erzeugt.

* Beschreibung: Nachbedingungen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Änderung ist protokolliert; neuer AccessCode liegt vor.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * [PKV-Abgabedatensatz ändern](./menu-technische-umsetzung-anwendungsfaelle.md#pkv-abgabedatensatz-aendern)

* Beschreibung: Relevante(r) Sektor(en)
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.:  APOTHEKER 

**Tabelle:**Fachlicher Anwendungsfall PKV-Abgabedatensatz durch Abgebenden ändern

#### Einwilligung zum Speichern der Abrechnungsinformationen erteilen

* Beschreibung: Vorbedingungen
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.: * Der Nutzer ist als PKV-Versicherter identifiziert.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.: * Einwilligung im FdV erfassen.
* Consent-Ressource erstellen und an den Fachdienst übertragen.

* Beschreibung: Nachbedingungen
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.: * Einwilligung ist gespeichert und protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.: * [Einwilligung erteilen](./menu-technische-umsetzung-anwendungsfaelle.md#einwilligung-erteilen)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Einwilligung zum Speichern der Abrechnungsinformationen erteilen

#### Einwilligung zum Speichern der Abrechnungsinformationen widerrufen

* Beschreibung: Vorbedingungen
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.: * Einwilligung wurde zuvor erteilt und ist abrufbar.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.: * Widerruf im FdV bestätigen.
* DELETE /Consent?category=CHARGCONS ausführen.

* Beschreibung: Nachbedingungen
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.: * Einwilligung und Abrechnungsinformationen sind gelöscht; Vorgang ist protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.: * [Einwilligung widerrufen](./menu-technische-umsetzung-anwendungsfaelle.md#einwilligung-widerrufen)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Einwilligung zum Speichern der Abrechnungsinformationen widerrufen

#### Einwilligung zum Speichern der Abrechnungsinformationen einsehen

* Beschreibung: Vorbedingungen
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.: * Keine.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.: * GET /Consent ausführen.
* Consent-Ressource mit CHARGCONS auswerten.

* Beschreibung: Nachbedingungen
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.: * Einwilligungsstatus liegt zur Anzeige im FdV vor.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.: * [Einwilligung einsehen](./menu-technische-umsetzung-anwendungsfaelle.md#einwilligung-einsehen)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Einwilligung zum Speichern der Abrechnungsinformationen einsehen

#### Abrechnungsinformationen durch den Versicherten abrufen

* Beschreibung: Vorbedingungen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Einwilligung liegt vor.
* Abrechnungsinformationen wurden durch eine Apotheke bereitgestellt.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Liste per GET /ChargeItem abrufen.
* Detailabruf via GET /ChargeItem/ durchführen.
* Fachdienst signiert Datensätze beim Detailabruf.

* Beschreibung: Nachbedingungen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Daten stehen im FdV zur Anzeige und zum Export bereit; Abruf ist protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * [Abrechnungsinformation abrufen](./menu-technische-umsetzung-anwendungsfaelle.md#abrechnungsinformation-abrufen-versicherter)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformationen durch den Versicherten abrufen

