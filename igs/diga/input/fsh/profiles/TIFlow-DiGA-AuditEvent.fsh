Profile: TIFlowDiGAAuditEvent
Parent: TIAuditEventRest
Id: tiflow-diga-audit-event
Title: "TIFlow DiGA AuditEvent"
Description: "AuditEvent für die Protokollierung des Zugriffs auf DiGA-Verordnungen"
* insert Profile(GEM_ERP_PR_AuditEvent)

* source MS
  * site = "TI-Flow-Fachdienst DiGA" (exactly)

* entity 1..1 MS
  * what 1..1
  * name 1..1
    * ^short = "KVNR des Patienten, auf den sich das AuditEvent bezieht"
    * ^definition = "KVNR des Patienten, auf den sich das AuditEvent bezieht, verwendet als Filterkriterium, wenn der Patient auf seine Daten zugreift."
  * description 1..1
    * ^short = "E-Rezept-ID"
    * ^definition = "E-Rezept-ID soll eine Beziehung zu den Versicherungsunternehmensdaten haben, wenn der Task bereits gelöscht wurde"
