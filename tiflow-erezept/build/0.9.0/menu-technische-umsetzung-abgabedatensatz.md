# Abgabedatensatz signieren - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* **Abgabedatensatz signieren**

## Abgabedatensatz signieren

Nach der Belieferung eines E-Rezepts erstellt das PS der abgebenden LEI einen Abgabedatensatz, welcher zusammen mit dem E-Rezept-Bundle und der Quittung für die Abrechnung des E-Rezepts verwendet wird.

Die Inhalte und die Struktur des Abgabedatensatzes werden durch DAV und GKV-SV vorgegeben. Die Definition erfolgt in Form von FHIR-Profilen. Der Datensatz selbst sollte zur Vereinfachung der Verarbeitung in Folgeprozessen in Analogie der KBV-Festlegungen im XML-Format (anstelle von bspw. JSON) dargestellt sein.

Der Abgabedatensatz dient der Abrechnung. Demgegenüber stehen die Dispensierinformationen der MedicationDispense-Ressource für den Versicherten (vgl. Abschnitt 5.3.2).

Für die Signatur des Abgabedatensatzes wird der Konnektor verwendet.

Das PS der abgebenden LEI MUSS beim Signieren des Abgabedatensatzes mit einer QES die Signaturoperation des Konnektors mit eingebetteter OCSP-Antwort (IncludeRevocationInfo = true) ausführen.

Das PS der abgebenden LEI MUSS die Signatur des Abgabedatensatzes mittels Einzelsignatur, Stapelsignatur und Komfortsignatur unterstützen.

Das PS der abgebenden LEI MUSS beim Signieren eines Abgabedatensatzes mit einer non-QES vor dem Signieren prüfen, dass die für die nonQES verwendet SMC-B gültig ist.
Hinweis: Die SMC-B ist gültig, wenn ein gültiger ACCESS_TOKEN des IDP-Dienstes für den Zugriff auf den E-Rezept-Fachdienst auf Basis dieser SMC-B vorliegt.

