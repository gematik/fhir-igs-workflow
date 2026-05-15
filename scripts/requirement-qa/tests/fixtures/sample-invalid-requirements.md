# Sample Invalid Requirements (for negative testing)

## Anforderungen mit Fehlern

<!-- A_201 -->
<requirement key="REQ-INVALID-001">
  <!-- Missing actor tag -->
  <conformance value="SHALL"/>
  Der TI-Flow-Fachdienst MUSS validieren.
</requirement>

<!-- A_202 -->
<requirement key="REQ-INVALID-002">
  <actor name="UnknownActor">Unknown Actor</actor>
  <conformance value="SHALL"/>
  Der unbekannte Actor MUSS etwas tun.
</requirement>

<!-- A_203 -->
<requirement key="REQ-INVALID-003">
  <actor name="eRp_FdV">E-Rezept FdV</actor>
  <conformance value="SHALL"/>
  Der TI-Flow-Fachdienst MUSS validieren.
</requirement>

<!-- A_204 -->
<requirement key="REQ-INVALID-004">
  <actor name="TI-Flow_FD">TI-Flow Fachdienst</actor>
  <conformance value="SHALL"/>
  Der Prozess läuft ab.
</requirement>

<!-- A_205 -->
<requirement key="REQ-INVALID-005">
  <actor name="TI_Flow_FD">Legacy TI_Flow Name</actor>
  <conformance value="SHALL"/>
  Der TI-Flow-Fachdienst MUSS unterstützen.
</requirement>
