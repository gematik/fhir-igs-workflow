# Nutzung ZETA durch Clientsystme - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Technische Umsetzung - Zero Trust Access (ZETA)**](menu-technische-umsetzung-zeta.md)
* **Nutzung ZETA durch Clientsystme**

## Nutzung ZETA durch Clientsystme

Zur Umsetzung der ZETA Architektur müssen Clientsysteme folgende Anforderungen erfüllen.

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

Sich.techn. Eignung: ProduktgutachtenDas Clientsystem des TI-Flow-Fachdienstes MUSS die ZETA Client Funktionen gemäß [gemSST_PS_ZETA_V] umsetzen.

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

Sich.techn. Eignung: ProduktgutachtenDas Clientsystem des TI-Flow-Fachdienstes MUSS sicherstellen, dass jegliche Kommunikation mit dem TI-FlowFachdienst über den ZETA Client erfolgt.
Hinweis: Der Zeta-Client beinhaltet zwingend zu nutzende Kommunikationsfunktionen wie TLS, ZETA/ASL-Kanal und weitere (siehe [gemSpec_ZETA])

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

Sich.techn. Eignung: ProduktgutachtenDas Clientsystem des TI-Flow-Fachdienstes MUSS zur Authentisierung der Institution das Verfahren mittels SM(C)-B signiertem Client Assertion JWT und DPoP gemäß [RFC7523] und [RFC9449] verwenden.

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

Sich.techn. Eignung: ProduktgutachtenDas Clientsystem des TI-Flow-Fachdienstes MUSS für jede Anfrage an den TI-Flow-Fachdienst die ZETA Client Funktion mit aktivem ZETA/ASL-Kanal verwenden.

