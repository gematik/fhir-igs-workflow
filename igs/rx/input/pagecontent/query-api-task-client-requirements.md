Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Task`-Query-Endpunkte.

A_19347-01

A_19348-01

### Alternativer Ablauf 1: Ein spezifisches E-Rezept durch Nutzer abrufen

Die Alternative 1 wird genutzt, wenn nur die Informationen zu einem E-Rezept vom E-Rezept-Fachdienst heruntergeladen werden sollen, bspw. um zu prüfen, ob sich der Status geändert hat. Dafür muss die Task-ID dieses Rezepts im E-Rezept-FdV bekannt sein.

A_19350-01

Für weitere Informationen siehe Operation "Ein einzelnes E-Rezept abrufen" aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.

### Alternativer Ablauf 2: Ein spezifisches E-Rezept mit AccessCode abrufen

Die Alternative 2 wird genutzt, wenn der Nutzer als Vertreter eines Versicherten ein E-Rezept vom E-Rezept-Fachdienst herunterladen möchte. Dafür müssen die Task-ID und der AccessCode dieses Rezepts im E-Rezept-FdV bekannt sein. Die Informationen Task-ID und AccessCode werden im E-Rezept-Token übermittelt.

A_19351-01

Für weitere Informationen siehe Operation "Ein einzelnes E-Rezept abrufen" aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.