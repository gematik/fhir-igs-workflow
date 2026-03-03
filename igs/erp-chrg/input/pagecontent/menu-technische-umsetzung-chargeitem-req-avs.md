### Abrechnungsinformation bereitstellen
Mit diesem Anwendungsfall stellt die abgebende LEI die Abrechnungsinformation zu einem E-Rezept auf dem E-Rezept-Fachdienst ein.<br>
Er wird [hier](./query-api-chargeitem-req-avs-post.html) im Detail beschreiben.

### Abrechnungsinformation abrufen
Mit diesem Anwendungsfall kann eine abgebende LEI die Abrechnungsinformation vom E-Rezept-Fachdienst abrufen, welche durch sie zuvor bereitgestellt und noch nicht gelöscht wurde. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.<br>
Er wird [hier](./query-api-chargeitem-req-avs-get-id.html) im Detail beschreiben.

### PKV-Abgabedatensatz ändern
Mit diesem Anwendungsfall kann die abgebende LEI den PKV-Abgabedatensatz zu einem E-Rezept, welche die abgebende LEI zuvor auf dem E-Rezept-Fachdienst bereitgestellt hat, ändern. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.<br>
Er wird [hier](./query-api-chargeitem-req-avs-put.html) im Detail beschreiben.