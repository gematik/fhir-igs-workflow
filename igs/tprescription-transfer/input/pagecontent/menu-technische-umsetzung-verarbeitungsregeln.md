# Technische Umsetzung - Verarbeitungsregeln

## Uebertragung an BfArM

Der digitale Durchschlag wird RESTful ueber das Internet an den BfArM Webdienst
uebertragen. Vorgaben zur Authentifizierung sind in gemSpec_FD_eRp beschrieben.

## Fehlerbehandlung

Bei Ablehnung der Instanz durch den BfArM Webdienst wird ein Fehlercode
"400 Bad Request" und eine OperationOutcome zurueckgegeben. Eine enumerierte
Liste von Fehlerkategorien existiert nicht; die Fehler werden als Freitext
bereitgestellt.
