# Operation `$abort` (Task abbrechen)

Diese Seite enthaelt die moduluebergreifenden Basisanforderungen fuer `$abort`.

<requirement conformance="SHALL" key="IG-WF-CORE-OP-201" title="E-Rezept-Fachdienst - E-Rezept loeschen - Rollenpruefung (A_19026-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Loeschen eines E-Rezepts ueber den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort sicherstellen, dass ausschliesslich Nutzer in der Rolle oid_versicherter, oid_praxis_arzt, oid_zahnarztpraxis, oid_praxis_psychotherapeut, oid_krankenhaus, oid_oeffentliche_apotheke, oid_krankenhausapotheke, oid_institution-vorsorge-reha die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte geloescht werden koennen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-202" title="E-Rezept-Fachdienst - E-Rezept loeschen - Statuspruefung in-progress (A_19145-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS das Loeschen eines E-Rezepts ueber den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort verhindern und die Operation mit dem HTTP-Fehlercode 403 abweisen, wenn der Status des adressierten Tasks gleich "in-progress" ist und die Rolle des aufrufenden Nutzers nicht einer der folgenden Rollen entspricht: oid_oeffentliche_apotheke, oid_krankenhausapotheke, damit Nutzer ausserhalb der Apotheke keine Rezepte loeschen, die sich aktuell in Belieferung befinden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-203" title="E-Rezept-Fachdienst - Statuspruefung Nutzer (ausserhalb Apotheke) loescht Rezept (A_19146)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS das Loeschen eines E-Rezepts ueber den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort verhindern und die Operation mit dem HTTP-Fehlercode 403 abweisen, wenn der Status des adressierten Tasks ungleich "in-progress" ist und die Rolle des aufrufenden Nutzers einer der folgenden Rollen entspricht: oid_oeffentliche_apotheke, oid_krankenhausapotheke, damit kein Apotheker ein Rezept loescht, das ihm nicht ausdruecklich zugewiesen wurde.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-204" title="E-Rezept-Fachdienst - E-Rezept loeschen - Pruefung KVNR, Versicherter loescht Rezept (A_20546-03)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Loeschen eines E-Rezepts durch einen Versicherten, wenn der HTTP-Request keinen HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." enthaelt, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in Task.for hinterlegte KVNR des beguenstigten Patienten pruefen und bei Missmatch den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschliesslich der beguenstigte Patient als Berechtigter ohne Kenntnis des AccessCodes ein E-Rezept loescht.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-205" title="E-Rezept-Fachdienst - E-Rezept loeschen - Verordnender - Pruefung AccessCode und Status (A_19120-03)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Loeschen eines E-Rezepts ueber den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort durch verordnende Leistungserbringer den im HTTP-Header "X-AccessCode" gegen den im referenzierten Task enthaltenen AccessCode pruefen und bei Missmatch oder Fehlen im HTTP-Header oder wenn der Task.Status ungleich "ready" ist, den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschliesslich die verordnende Leistungserbringerinstitution in Kenntnis des AccessCodes als Berechtigte ein E-Rezept loeschen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-206" title="E-Rezept-Fachdienst - Pruefung Secret, Apotheker loescht Rezept (A_19224)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Loeschen eines E-Rezepts ueber den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort durch abgebende Leistungserbringer (Apotheken) das im URL-Parameter "?secret=..." uebertragene Geheimnis gegen das im referenzierten Task enthaltene Secret in Task.identifier pruefen und bei Missmatch oder Fehlen des URL-Parameters den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschliesslich Apotheker in Kenntnis des Secret als Berechtigte ein E-Rezept loeschen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-207" title="E-Rezept-Fachdienst - E-Rezept loeschen - Medizinische und personenbezogene Daten loeschen (A_19027-06)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Loeschen eines E-Rezepts ueber den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort alle personenbezogenen medizinischen Daten, ausser der KVNR in Task.for, aus dem referenzierten Task entfernen. Dies gilt insbesondere fuer Task.input (inkl. referenzierter Elemente), Task.output (inkl. referenzierter Elemente), Task.identifier (AccessCode), Task.identifier (Secret, falls vorhanden), Task.extension:lastMedicationDispense, Task.owner, referenzierte Medication, referenzierte MedicationDispense und referenzierte Communication.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-208" title="E-Rezept-Fachdienst - Finaler Status cancelled (A_19121)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Loeschen eines E-Rezepts ueber den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort den Status des Tasks Task.status auf den Wert "cancelled" setzen, damit das E-Rezept nicht weiter bearbeitet werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-209" title="E-Rezept-Fachdienst - E-Rezept loeschen - Push Notification Versicherter (A_28131)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$abort bei erfolgreichem Abschluss der Operation, wenn die Rolle des aufrufenden Nutzers ungleich oid_versicherter ist, den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.abort" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>
