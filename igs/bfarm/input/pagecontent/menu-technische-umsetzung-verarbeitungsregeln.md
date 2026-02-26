# Technische Umsetzung - Verarbeitungsregeln

## Übertragung an BfArM

Der digitale Durchschlag wird RESTful über das Internet an den BfArM Webdienst übertragen. Vorgaben zur Authentifizierung sind in gemSpec_FD_eRp beschrieben.

## Fehlerbehandlung

Bei Ablehnung der Instanz durch den BfArM Webdienst wird ein Fehlercode "400 Bad Request" und eine OperationOutcome zurückgegeben. Eine enumerierte Liste von Fehlerkategorien existiert nicht; die Fehler werden als Freitext bereitgestellt.
