Für die Anwendungsfälle "Dispensierinformationen bereitstellen" und "Quittung abrufen" muss das PS der abgebenden LEI Dispensierinformationen an den E-Rezept-Fachdienst übermitteln. Dieses Kapitel beschreibt, wie ein entsprechendes PS den Datensatz zu den Dispensierinformationen zu befüllen hat. Für die Spezifikation der Ressource MedicationDispense siehe [gemSpec_DM_eRp].

<!-- A_27035 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-196" title="PS abgebende LEI: Dispensierinformationen - Flowtype 160/169/200/209 - MedicationDispense erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 169, 200 oder 209 eine FHIR-Ressource mit dem Profil GEM_ERP_PR_MedicationDispense erstellen.
</requirement>

<!-- A_26004-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-197" title="CS Kostenträger: Dispensierinformationen – Flowtype 162 – MedicationDispense erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das Clientsystem des Kostenträgers MUSS beim Erstellen von Dispensierinformationen mit Flowtype 162 eine FHIR-Ressource mit dem Profil GEM_ERP_PR_MedicationDispense_DiGA erstellen.
</requirement>

<!-- A_22071-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-198" title="PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Mehrere MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit mehreren Teilabgaben und mit Flowtype 160, 169, 200 oder 209 mehrere MedicationDispenses im Parameters Profil angeben.
</requirement>

Die Profilversion bei der Abgabe richtet sich nach dem Abgabedatum der Arzneimittel. Wenn mehrere Arzneimittel zu einer Verordnung abgegeben werden, dann richtet sich die gültige Profilversion nach dem Datum der neuesten Abgabe (s. [gemSpec_DM_eRp#Zeitliche Gültigkeit von FHIR-Ressourcen]).

<!-- A_27047 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-199" title="PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Profilversion bei mehreren MedicationDispenses" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 169, 200 oder 209, wenn mehrere Teilabgaben oder Stückelungen enthalten sind, eine Profilversion zur Erstellung der Parameters Ressource nutzen, die zum Zeitpunkt des neuesten Abgabedatums (MedicationDispense.whenHandedOver) gültig ist.
</requirement>

Die Befüllung des Medication-Objekts innerhalb der MedicationDispense erfolgt durch die Übernahme wesentlicher Attribute wie PZN, Wirkstoff, Darreichungsform und Dosierinformationen aus dem Verordnungsdatensatz.
Falls es zu einer Substitution kommt, können die Daten aus dem Securpharm-Scan, sowie den Arzneimitteldatenbanken als Datengrundlage verwendet werden.
Wenn der Secupharm-Code Informationen zu Charge und Haltbarkeitsdatum enthält, müssen diese in den Dispensierdatensatz aufgenommen werden.

<!-- A_21105-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-200" title="PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Fertigarzneimittel: Chargeninfo" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 169, 200 oder 209 die FHIR-Ressource Medication um Chargeninformation und Verfallsdatum aus dem SecurPharm-Scan [SecurPharm] ergänzen, sofern es sich bei dem abgegebenen Arzneimittel um ein Fertigarzneimittel handelt, das einen Data-Matrix-Code gemäß securPharmSystem besitzt.
</requirement>

<!-- A_27033 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-201" title="PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 – Fertigarzneimittel: Wirkstoff, Wirkstärke und Handelsname" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das PS der abgebenden LEI MUSS beim Erstellen einer MedicationDispense eines Fertigarzneimittels für ein E-Rezept des Flowtype 160, 169, 200 oder 209 jede FHIR-Ressource Medication um Wirkstoff, Wirkstärke (inkl. Einheit) und Handelsnamen ergänzen, sofern die Informationen in der verwendeten Arzneimittel-Datenbank vorliegen.
</requirement>

<!-- A_27034 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-202" title="PS abgebende LEI:  Dispensierinformationen – Flowtype 160/169/200/209 – Rezeptur: Wirkstoff, Wirkstärke" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das PS der abgebenden LEI MUSS beim Erstellen einer MedicationDispense einer Rezeptur für ein E-Rezept des Flowtype 160, 169, 200 oder 209 für jede FHIR-Ressource Medication Wirkstoff und Wirkstärke (inkl. Einheit) strukturiert angeben, wenn diese Information strukturiert im Verordnungsdatensatz vorlag.
</requirement>

Die Dosieranweisung werden in der MedicationDispense als Freitext angegeben. Die Angabe strukturierter Dosieranweisungen ist nicht erlaubt. Ein AVS gibt die Dosieranweisung in der MedicationDispense nur an, wenn der Apotheker diese im Vergleich zur Dosieranweisung in der Verordnung konkretisiert, verbessert oder anpasst.

<!-- A_27036 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-203" title="PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 - Dosieranweisung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 169, 200 oder 209 die Dosieranweisung angeben, wenn diese sich im Vergleich zu der Dosieranweisung in der Verordnung verändert hat.
</requirement>

<!-- A_27037 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-204" title="PS abgebende LEI: Dispensierinformationen – Flowtype 160/169/200/209 - Dosierangaben Freitext" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
        Das PS der abgebenden LEI MUSS beim Erstellen von Dispensierinformationen mit Flowtype 160, 169, 200 oder 209 die Dosierangaben als Freitext in MedicationDispense.dosageInstruction.text hinterlegen.
</requirement>
