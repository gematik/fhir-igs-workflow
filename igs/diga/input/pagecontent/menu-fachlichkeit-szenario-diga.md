Dieses Szenario beschreibt den Prozess zur elektronischen Verordnung von DiGA.
Es fuehrt von der Verordnung ueber die Zuweisung durch den Versicherten bis zur
Bereitstellung des Freischaltcodes.

## Aufbau der Szenariobeschreibung

1. Kontext und Mehrwert
2. Prozessabschnitte
3. Beteiligte Akteure
4. Fachliche Anwendungsfaelle

## Prozessabschnitte

### Verschreiben
Der technische Ablauf zum Verschreiben einer DiGA erfolgt analog zu einer
Verordnung fuer apothekenpflichtige Arzneimittel. Aerzte, Zahnaerzte und
Psychotherapeuten erstellen die Verordnung, signieren sie qualifiziert (QES) und
stellen sie beim E-Rezept-Fachdienst ein. Das E-Rezept liegt anschliessend zum
Abruf bereit.

### Zuweisen durch den Versicherten
Der Versicherte weist das E-Rezept seinem Kostentraeger zu. Dazu wird der
E-Rezept-Token ueber das E-Rezept-FdV oder einen Patientenausdruck uebermittelt.
Die Ermittlung des Kostentraegers erfolgt moeglichst automatisch, kann aber auch
manuell erfolgen.

### Einloesen durch den Kostentraeger
Der Kostentraeger ruft die Verordnung ab, prueft sie und stellt einen
Freischaltcode bereit. Der Freischaltcode wird als Abgabeinformation im
E-Rezept-Fachdienst gespeichert und im E-Rezept-FdV angezeigt. Kann kein
Freischaltcode bereitgestellt werden, wird dies mit einer begruendenden
Rueckmeldung dokumentiert.

## Beteiligte Akteure

- Verordnende Leistungserbringer (Arzt/Zahnarzt/Psychotherapeut)
- Versicherte
- Kostentraeger (gesetzliche Krankenkassen)
- DiGA-Hersteller (indirekt, ohne Zugriff auf den E-Rezept-Fachdienst)

## Fachliche Anwendungsfaelle

Die fachlichen Anwendungsfaelle folgen dem Basis-Workflow und werden in den
technischen Kapiteln detailliert referenziert.
