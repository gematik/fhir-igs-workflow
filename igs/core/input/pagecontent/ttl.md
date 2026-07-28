
<!-- TI-Flow-26_2 KBV_23, KBV_30 -->
Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter Ressourcen. 

> *Hinweis:* Spezifische Löschfristen für Anwendungsmodule und deren Workflows und werden in den jeweiligen Implementation Guides definiert.

## Allgemeine Anforderungen zur Protokollierung beim Löschen

<!-- A_19256-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A129" title="TI-Flow-Fachdienst - Löschfrist veraltete Protokolleinträge" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource AuditEvent nach 3 Jahren ab dem Erzeugungsdatum AuditEvent.recorded innerhalb von einem Monat löschen.
</requirement>