# FD-Anforderungen: Query API AuditEvent

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die AuditEvent-Query-Endpunkte.

<requirement conformance="SHALL" key="IG-WF-CORE-Q-AE-001" title="E-Rezept-Fachdienst - unzulässige Operationen AuditEvent (A_19402)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource AuditEvent mittels der HTTP-Operationen PUT, PATCH, HEAD, DELETE und POST unterbinden, damit keine unzulässigen Operationen auf den Protokolldaten ausgeführt werden können.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-Q-AE-002" title="E-Rezept-Fachdienst - Rollenprüfung Versicherter liest AuditEvent (A_19395)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent und auf einen konkreten über &lt;id&gt; adressierten /AuditEvent/&lt;id&gt; sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezept-Protokolleinträge nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-Q-AE-003" title="E-Rezept-Fachdienst - Filter AuditEvent auf KVNR des Versicherten (A_19396)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent die dem Versicherten zugeordneten AuditEvent-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in AuditEvent.entity.name die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen E-Rezept-Protokolleinträge einsehen können.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-Q-AE-004" title="E-Rezept-Fachdienst - Rückgabe AuditEvents im Bundle (A_19397)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent die Ergebnisliste der AuditEvent-Ressourcen bei mehr als einem Eintrag als Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in das Zugriffsprotokoll erhält.
</requirement>
