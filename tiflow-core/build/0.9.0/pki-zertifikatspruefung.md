# Zertifikatsprüfung - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* **Zertifikatsprüfung**

## Zertifikatsprüfung

### Zertifikatsprüfung

Clientsysteme verwenden bei den in TAB_ILFERP_012 dargestellten Aktivitäten Zertifikate.

* Aktivität: TLS-Verbindungsaufbau zum E-Rezept-Fachdienst
  * Zertifikat der TI: nein
  * Zertifikatstyp: TLS Internet Zertifikat
  * Rollen-OID: n/a
  * Nutzung: aktiv
* Aktivität: TLS-Verbindungsaufbau zum Verzeichnisdienst der TI
  * Zertifikat der TI: nein
  * Zertifikatstyp: TLS Internet Zertifikat
  * Rollen-OID: n/a
  * Nutzung: aktiv
* Aktivität: TLS-Verbindungsaufbau zum IDP-Dienst
  * Zertifikat der TI: nein
  * Zertifikatstyp: TLS Internet Zertifikat
  * Rollen-OID: n/a
  * Nutzung: aktiv
* Aktivität: Aufbau sicherer Kanal zur VAU des E-Rezept-Fachdienstes
  * Zertifikat der TI: ja
  * Zertifikatstyp: C.FD.ENC
  * Rollen-OID: oid_erp-vau
  * Nutzung: aktiv
* Aktivität: Nur für PS der abgebenden LEI: Signaturzertifikat E-Rezept-Fachdienst
  * Zertifikat der TI: ja
  * Zertifikatstyp: C.FD.OSIG
  * Rollen-OID: oid_erezept
  * Nutzung: aktiv

**Tabelle: **Zertifikatsnutzung"

Es gelten folgende übergreifende Festlegungen für die Prüfung aktiv durch ein Clientsystem genutzter Zertifikate.

Das Clientsystem des E-Rezept-Fachdienst MUSS alle Zertifikate, die es aktiv verwendet (bspw. TLS-Verbindungsaufbau), auf Integrität und Authentizität prüfen. Falls die Prüfung kein positives Ergebnis ("gültig") liefert, so MUSS es die von dem Zertifikat und den darin enthaltenen Attributen (bspw. öffentliche Schlüssel) abhängenden Arbeitsabläufe ablehnen.

Das Clientsystem des E-Rezept-Fachdienst MUSS alle öffentlichen Schlüssel, die es verwenden will, auf eine positiv verlaufene Zertifikatsprüfung zurückführen können.
“Ein Zertifikat aktiv verwenden” bedeutet im Sinne von A_20769, dass ein Clientsystem einen dort aufgeführten öffentlichen Schlüssel innerhalb einer kryptografischen Operation (Signaturprüfung, Verschlüsselung, Signaturprüfung von öffentlichen (EC)DH-Schlüsseln etc.) nutzt. Erhält ein Clientsystem bspw. einen ACCESS_TOKEN, in dem Signaturen und Zertifikate enthalten sind, und behandelt es diesen Token als opakes Datenobjekt, ohne die Zertifikate darin gesondert zu betrachten, dann verwendet das Primärsystem diese Zertifikate im Sinne von A_20769 passiv.

#### Zertifikatsprüfung von Zertifikaten der TI

Das Primärsystem MUSS bei der Prüfung von X.509-Zertifikaten der TI den CertificateService des Konnektors mit der Operation VerifyCertificate gemäß [gemSpec_Kon#4.1.9.5.3] verwenden und dabei
* das zu prüfende Zertifikat als Parameter X509Certificate verwenden
* die aktuelle Systemzeit als Parameter VerificationTime verwenden
Das Primärsystem MUSS bei Prüfung eines C.FD.ENC den Rückgabewert in RoleList gegen die erwartete Rollen-OID gemäß TAB_ILFERP_012 prüfen und bei Abweichungen die Benutzung des Zertifikats für einen Verbindungsaufbau zur VAU ablehnen.
#### Zertifikatsprüfung von Internet-Zertifikaten

Folgende Vorgaben gelten für die Prüfung von Internet-Zertifikaten.

Das Clientsystem des E-Rezept-Fachdienst MUSS für die Prüfung eines Zertifikats für den TLS-Verbindungsaufbau zum E-Rezept-Fachdienst und IDP das Zertifikat auf ein CA-Zertifikat einer CA, die die "CA/Browser Forum Baseline Requirements for the Issuance and Management of Publicly-Trusted Certificates" [Baseline Requirements for TLS Server Certificates] erfüllt, kryptographisch (Signaturprüfung) zurückführen können. Ansonsten MUSS es das Zertifikat als "ungültig" bewerten.Das Clientsystem des E-Rezept-Fachdienst MUSS die zeitliche Gültigkeit des Zertifikats prüfen. Falls diese Prüfung negativ ausfällt, muss es das Zertifikat als "ungültig" bewerten.
Hinweis: Der erste Teil von A_20091-* ist gleichbedeutend damit, dass das CA-Zertifikat im Zertifikats-Truststore eines aktuellen Webbrowsers ist.

