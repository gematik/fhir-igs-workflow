Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-avs.md %}

### Modulspezifische Anforderungen

#### Nachrichten abrufen

siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.html)

#### Nachricht versenden

<!-- A_21373 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-55" title="PS abgebende LEI: Nachricht versenden - Externe URL ausschließlich für Einlösung" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS sicherstellen, dass die Einbettung einer externen URL ausschließlich für das Einlösen von E-Rezepten in einer externen Bestellplattform genutzt wird.
</requirement>

<!-- A_28538 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-56" title="PS abgebende LEI: Nachricht versenden - Belieferung Arzneimittel - Nachricht erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI (Apotheke) MUSS im Anwendungsfall "Nachricht an Versicherten versenden" die Nachricht gemäß der Struktur [gemSpec_DM_eRp#TAB_eRpDM_003] und 
  <ul>
    <li>einem communicationType entsprechend der zu übermittelnden Information</li>
    <li>TransactionID aus der empfangenen Nachricht des Versicherten</li>
  </ul>
  erstellen.
</requirement>

Für TAB_eRpDM_003 siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.html)

Beispiele für diesen Anwendungsfall stehen im GitHub  https://github.com/gematik/interactive-api-erp . 

Die Erläuterung und das Schema des Payloads sind in [gemSpec_DM_eRp#TAB_eRpDM_003] zu finden.

<!-- A_19333-02 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-57" title="PS abgebende LEI: Nachricht versenden - Belieferung Arzneimittel - Communication Ressource erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI (Apotheke) MUSS im Anwendungsfall "Nachricht an Versicherten versenden" bezüglich der Belieferung eines Arzneimittels eine Communication Ressource mit dem Profil GEM_ERP_PR_Communication_Reply mit 
  <ul>
    <li>Versicherten-ID des Absenders der empfangenen Nachricht in recipient</li>
    <li>Task-ID des referenzierten E-Rezeptes in basedOn</li>
    <li>Nachrichten-ID der empfangenen Anfrage in inResponseTo</li>
    <li>Nachricht in payload contentString</li>
  </ul>
  erstellen.
</requirement>

