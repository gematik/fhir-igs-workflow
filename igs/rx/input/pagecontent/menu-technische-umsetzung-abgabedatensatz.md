Nach der Belieferung eines E-Rezepts erstellt das PS der abgebenden LEI einen Abgabedatensatz, welcher zusammen mit dem E-Rezept-Bundle und der Quittung für die Abrechnung des E-Rezepts verwendet wird.

Die Inhalte und die Struktur des Abgabedatensatzes werden durch DAV und GKV-SV vorgegeben. Die Definition erfolgt in Form von FHIR-Profilen. Der Datensatz selbst sollte zur Vereinfachung der Verarbeitung in Folgeprozessen in Analogie der KBV-Festlegungen im XML-Format (anstelle von bspw. JSON) dargestellt sein. 

Der Abgabedatensatz dient der Abrechnung. Demgegenüber stehen die Dispensierinformationen der MedicationDispense-Ressource für den Versicherten (vgl. Abschnitt 5.3.2). 

Für die Signatur des Abgabedatensatzes wird der Konnektor verwendet.

<!-- A_21619-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-1" title="PS abgebende LEI: Abgabedatensatz mit QES: OCSP Response einbetten" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS beim Signieren des Abgabedatensatzes mit einer QES die Signaturoperation des Konnektors mit eingebetteter OCSP-Antwort (IncludeRevocationInfo = true) ausführen.
</requirement>

<!-- A_21244-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-2" title="PS abgebende LEI: Abgabedatensatz signieren - Signaturverfahren" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS die Signatur des Abgabedatensatzes mittels Einzelsignatur, Stapelsignatur und Komfortsignatur unterstützen.
</requirement>

<!-- A_27050 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-3" title="PS abgebende LEI: Abgabedatensatz signieren - Gültigkeit SMC-B prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS beim Signieren eines Abgabedatensatzes mit einer non-QES vor dem Signieren prüfen, dass die für die nonQES verwendet SMC-B gültig ist.
</requirement>

Hinweis: Die SMC-B ist gültig, wenn ein gültiger ACCESS_TOKEN des IDP-Dienstes für den Zugriff auf den TI-Flow-Fachdienst auf Basis dieser SMC-B vorliegt.
