Query API: Communication

Communication wird für die Kommunikation zwischen Versicherten und Kostenträger verwendet.

## POST /Communication
- Zuweisung von Verordnungen durch den Versicherten an den Kostenträger. Der Payload ist hierbei optional (Kardinalitaet 0..1)
- Übermittlung des Freischaltcodes dürch den Kostenträger an den Versicherten.

## GET /Communication
- Abruf von Zuweisungen durch den Kostenträger
- Abruf von Rückmeldungen durch den Versicherten
