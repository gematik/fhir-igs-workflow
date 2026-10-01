Aufgabe des TI-Flow-Fachdienst ist es Verordnungs- und Dispensierungsdaten von Arzneimitteln an die ePA zu übermitteln.

Der TI-Flow-Fachdienst muss daher in der Lage sein, die von den verordnenden Systemen (z.B. Praxis- oder Krankenhausinformationssysteme) gelieferten Daten in die von der ePA geforderten Formate zu überführen und an den ePA Medication Service zu übertragen.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 600px; margin-bottom: 30px;">
        <img src="./mapping-fachdienst.svg" alt="Mapping des TI-Flow-Fachdienstes" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Mapping des TI-Flow-Fachdienstes</figcaption>
</figure>

<br>

Dabei führt der TI-Flow-Fachdienst keine Interpretation oder Anreicherung von medizinischen Daten durch und führt daher rein technische Mappings aus. Dabei sollen die Quellen in die Zielprofile überführt und mit Transformationsregeln ergänzt werden.

## Übertragen von *Verordnungsdaten* an den ePA Medication Service

Der TI-Flow-Fachdienst empfängt die Verordnungsdaten durch Aufruf der [$activate-Operation](./op-activate.html) durch ein verordnendes System. Die empfangenen Daten entsprechen den Profilen und Vorgaben des E-Rezepts.

Die Verordnungsdaten werden vom TI-Flow-Fachdienst an den ePA Medication Service via ([ePA Operation API: Verordnung einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/op-provide-prescription-erp.html)).

Für technische Details zum Mapping von Verordnungsdaten und den dazugehörigen Transformationsregeln siehe: [Mapping von Verordnungsdaten](./mapping-prescription.html).

## Übertragen von *Dispensierinformationen* an den ePA Medication Service

Der TI-Flow-Fachdienst empfängt die Dispensierinformationen durch Abschluss eines Workflows mittels der [$dispense-Operation](./op-dispense.html) und/oder [$close-Operation](./op-close.html) durch ein abgebendes System. Die empfangenen Daten entsprechen den Profilen und Vorgaben der Dispensierinformationen.
Die Übertragung der Dispensierinformationen an den ePA Medication Service via ([ePA Operation API: Dispensierinformationen einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/op-provide-dispensation-erp.html)) erfolgt erst nach Abschluss des Workflows indem die $close-Operation aufgerufen wird.

Für technische Details zum Mapping von Dispensierinformationen und den dazugehörigen Transformationsregeln siehe: [Mapping von Dispensierinformationen](./mapping-dispensation.html).