# Nutzung ZETA durch Clientsystme - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Zero Trust Access (ZETA)**](menu-technische-umsetzung-zeta.md)
* **Nutzung ZETA durch Clientsystme**

## Nutzung ZETA durch Clientsystme

### Nutzung ZETA durch Clientsystme

Zur Umsetzung der ZETA Architektur müssen Clientsysteme folgende Anforderungen erfüllen.

Das Clientsystem des TI-Flow-Fachdienstes MUSS die ZETA Client Funktionen gemäß [gemSST_PS_ZETA_V] umsetzen.

Das Clientsystem des TI-Flow-Fachdienstes MUSS sicherstellen, dass jegliche Kommunikation mit dem TI-FlowFachdienst über den ZETA Client erfolgt.
Hinweis: Der Zeta-Client beinhaltet zwingend zu nutzende Kommunikationsfunktionen wie TLS, ZETA/ASL-Kanal und weitere (siehe [gemSpec_ZETA])

Ein Clientsystem des TI-Flow-Fachdienstes MUSS zur Authentisierung der Institution das Verfahren mittels SM(C)-B signiertem Client Assertion JWT und DPoP gemäß [RFC7523] und [RFC9449] verwenden.

Ein Clientsystem des TI-Flow-Fachdienstes MUSS für jede Anfrage an den TI-Flow-Fachdienst die ZETA Client Funktion mit aktivem ZETA/ASL-Kanal verwenden.

