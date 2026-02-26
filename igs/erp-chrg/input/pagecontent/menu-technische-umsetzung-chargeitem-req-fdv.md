## Abrechnungsinformationen abrufen
### Liste von Abrechnungsinformationen abrufen
Mit diesem Anwendungsfall kann der Nutzer eine Liste aller Abrechnungsinformationen vom E-Rezept-Fachdienst abrufen, welche für den Versicherten bereitgestellt wurden.<br>
Er wird [hier](./query-api-chargeitem-req-fdv-get.html) im Detail beschreiben.

### Abrechnungsinformation abrufen
Mit diesem Anwendungsfall kann der Nutzer (Versicherter) die Abrechnungsinformation zu einem E-Rezept vom E-Rezept-Fachdienst herunterladen.<br>
Er wird [hier](./query-api-chargeitem-req-fdv-get-id.html) im Detail beschreiben.

## Abrechnungsinformation-Token als 2D-Code anzeigen
Mit diesem Anwendungsfall kann der Nutzer den AccessCode zum Ändern als 2D-Code auf dem Bildschirm seines E-Rezept-FdVs anzeigen lassen, um es direkt in der Apotheke vorzuzeigen und die Apotheke damit zu berechtigen, die Abrechnungsinformation vom E-Rezept-Fachdienst abzurufen und den PKV-Abgabedatensatz einmalig zu ändern.

<!--A_24577-->
<requirement conformance="MAY" key="IG-ERP-CHRG-51674CC3" title="E-Rezept-FdV: optional: 2D-Code Abrechnungsinformation anzeigen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" umsetzen.
</requirement>

<!--A_22726-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-30013X4C" title="E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen - E-Rezept auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" es dem Nutzer ermöglichen, ein E-Rezept für die Anzeige des 2D-Code der Abrechnungsinformation auszuwählen, um einer Apotheke das Einscannen zu ermöglichen und sie somit für das Ändern des PKV-Abgabedatensatzes zu berechtigen.
</requirement>

<!--A_22727-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-48162NWX" title="E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen - Abrechnungsinformation-Token erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" für das ausgewählte E-Rezept den Abrechnungsinformation-Token erstellen.
</requirement>

Für die Beschreibung der Struktur des Abrechnungsinformation-Token siehe [gemSpec_DM_eRp].

<!--A_22728-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-46601PCT" title="E-Rezept-FdV: 2D-Code Abrechnungsinformation anzeigen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" mit dem erstellten Abrechnungsinformation-Token einen 2D-Code erstellen und auf dem Display des Endgerätes anzeigen.
</requirement>

## Abrechnungsinformation-Token einer Apotheke übermitteln
Mit diesem Anwendungsfall kann der Nutzer den AccessCode zum Ändern mittels einer Nachricht einer Apotheke übermitteln und die Apotheke damit zu berechtigen, die Abrechnungsinformation vom E-Rezept-Fachdienst abzurufen und den PKV-Abgabedatensatz einmalig zu ändern.<br>
Er wird [hier](./query-api-communication-req-fdv.md) im Detail beschreiben.

## Abrechnungsinformation markieren
Mit diesem Anwendungsfall kann der Nutzer (Versicherter) Markierungen zu seiner Abrechnungsinformation setzen. Diese werden auf dem E-Rezept-Fachdienst gespeichert.<br>
Er wird [hier](./query-api-chargeitem-req-fdv-patch.html) im Detail beschreiben.

## Abrechnungsinformation löschen
Mit diesem Anwendungsfall kann der Nutzer (Versicherter) die Abrechnungsinformation zu einem E-Rezept, die auf dem E-Rezept-Fachdienst gespeichert ist, löschen.<br>
Er wird [hier](./query-api-chargeitem-req-fdv-delete.html) im Detail beschreiben.

## Abrechnungsinformation exportieren
Mit diesem Anwendungsfall kann der Versicherte die Abrechnungsinformation aus dem E-Rezept-FdV exportieren, um es zur Abrechnung einzureichen oder zu archivieren.

<!--A_24555-->
<requirement conformance="MAY" key="IG-ERP-CHRG-66685XSJ" title="E-Rezept-FdV: optional: Abrechnungsinformation exportieren" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation exportieren" umsetzen.
</requirement>

<!--A_22184-02-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-24140HHW" title="E-Rezept-FdV: Abrechnungsinformation exportieren - PDF/A erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation exportieren" auf Basis der vom E-Rezept-Fachdienst zu einer Prescription-ID heruntergeladenen ChargeItem, Verordnungsdatensatz, PKV-Abgabedatensatz und Quittung Ressourcen
      <ul>
        <li>einen Ausdruck erstellen,</li>
        <li>für den Ausdruck ein PDF gemäß PDF/A-3-Standard (ISO 19005-3) erstellen,</li>
        <li>in das Dokument den signierten Verordnungsdatensatz (&#60;Prescription-ID&#62;_verordnung.p7s), den signierten PKV-Abgabedatensatz (&#60;Prescription-ID&#62;_abgabedaten.p7s) und den signierten Quittung Datensatz (&#60;Prescription-ID&#62;_quittung.p7s) gemäß PDF/A-3 einbetten.</li>
      </ul>
</requirement>

Für die Visualisierung der Abrechnungsinformation für PKV-Versicherte ist die zwischen DAV und PKV-Verband vereinbarte Technische Anlage zu den PKV-Abgabedaten und dem dortigen Kapitel 6 Ausdruck für den Privatversicherten sowie dem Unterkapitel 6.2 Spezifikation des Ausdrucks für den Versicherten [Empfehlung](http://www.abda.de/themen/e-health/datenauschtausch-pkv) zu beachten. Zur Umsetzungsunterstützung siehe auch [hier](https://github.com/DAV-ABDA/eRezept-Beispiele/tree/main/PKV). 

<!--A_22185-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-54660ZU5" title="E-Rezept-FdV: Abrechnungsinformation exportieren - PDF teilen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS es dem Nutzer im Anwendungsfall "Abrechnungsinformation exportieren" ermöglichen, das erstellte PDF mit anderen Apps zu teilen, um den Versicherten die Möglichkeit zu geben, seine Abrechnungsinformation an Krankenversicherungen oder andere Institutionen zur Abrechnung zu übermitteln.
</requirement>

Das schließt das Versenden per E-Mail oder die Ablage im Dateisystem ein.