# Systemüberblick - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Systemüberblick**

## Systemüberblick

### Einordnung in die Telematikinfrastruktur

Die Einführung des E-Rezepts für PKV-Versicherte setzt auf die bestehende Infrastruktur auf. PKV-Versicherte sind eine neue Benutzergruppe. Die App des Kostenträgers ist eine neue Komponente, zu der das E-Rezept-Frontend des Versicherten eine Schnittstelle für Abrechnungsinformationen anbietet. Die App des Kostenträgers ist keine Komponente der TI. Der Export als PDF ermöglicht weitere Übermittlungskanäle (z. B. E-Mail, Webportal).

### Fachliches Konzept

Die digitale Abrechnungsinformation besteht aus den folgenden Datensätzen: Verordnungsdatensatz, PKV-Abgabedatensatz und Quittungsdatensatz.

Der Verordnungsdatensatz wird durch den Arzt/Zahnarzt erstellt, mit einer Qualifizierten Elektronischen Signatur (QES) versehen und auf dem E-Rezept-Fachdienst eingestellt. Für den Abrechnungsprozess wird der Verordnungsdatensatz ohne QES übermittelt, um das Risiko vom Mehrfacheinlösungen zu vermeiden. Statt der QES wird der Verordnungsdatensatz durch den E-Rezept-Fachdienst fortgeschritten signiert, um die Integrität des Datensatzes für den Abrechnungsprozess sicherzustellen.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält, sofern in der Apotheke Änderungen bei der Abgabe vorgenommen werden, den QES-signierten PKV-Abgabedatensatz und sofern in der Apotheke keine Änderungen erfolgen, den fortgeschritten signierten PKV-Abgabedatensatz. Das Informationsmodell zum PKV-Abgabedatensatz wird durch den Verband der PKVen und DAV erarbeitet.

Die Quittung wird durch den E-Rezept-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im E-Rezept-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (Rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat die Möglichkeit, sie vorab, beispielsweise wenn die Abrechnung abgeschlossen wurde, zu löschen.

Die Löschfristen für das E-Rezept mit den in Beziehung stehenden Daten, wie Dispensierinformationen und Kommunikationen zum E-Rezept, werden unabhängig von der zugehörigen Abrechnungsinformation durchgesetzt. TODO: Siehe [gemSysL_eRp#A_18525].

Eine Langzeitarchivierung der Abrechnungsinformation im E-Rezept-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Der PKV-Versicherte kann über die E-Rezept App die Abrechnungsinformation digital an seine PKV schicken, um die Erstattung zu beantragen. Der Export in Form eines PDFs ermöglicht hierbei verschiedene Kanäle zur Übermittlung (wie E-Mail, Webportal, App des Kostenträgers).

### Technisches Konzept

Für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel für PKV-Versicherte wird der Workflow-Typ “200” eingeführt. Für den Workflow von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel mit Steuerung durch Leistungserbringer wird der Workflow-Typ “209” eingeführt.

Im Workflow-Typ “200” und Workflow-Typ “209” werden dasselbe Informationsmodell für den Verordnungsdatensatz (siehe https://simplifier.net/erezept ) wie bei der Verordnung für GKV-Versicherte verwendet. Hinweis: In MedicationRequest.insurance.Coverage.type mit dem Codesystem Coverage.type.coding in https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Coverage ist erkennbar, ob der Versicherte, für den das E-Rezept erstellt wurde, bei einer PKV versichert ist.

Der Ablauf im Workflow-Typ “200” ist identisch zum Workflow-Typ “160”. Der Ablauf im Workflow-Typ “209” ist identisch zum Workflow-Typ “169”.

Der Workflow-Typ “200” und der Workflow-Typ “209” verwenden dasselbe Statusmodell, wie der Workflow-Typ “160”. Siehe TODO [gemSysL_eRp#2.4.6 Konzept Status E-Rezept].

Für E-Rezepte der Workflow-Types “200” und “209” können die Abrechnungsinformationen über den E-Rezept-Fachdienst an den Versicherten übermittelt werden.

#### Identifikation von PKV-Versicherten

Die Zuordnung eines E-Rezeptes zu einem Versicherten erfolgt auf Basis der Versicherten-ID (10-stelliger unveränderlicher Teil der Krankenversichertennummer (KVNR)). D.h. teilnehmende PKV-Versicherte benötigen eine KVNR, welche ihnen über ihre Krankenversicherung zugeordnet wird. An der Versicherten-ID kann nicht erkannt werden, ob der Versicherte bei einer PKV versichert ist.

Die Authentisierung des Nutzers am E-Rezept-Fachdienst erfolgt mittels eines ACCESS_TOKEN. Diese werden durch Identity Provider (IdP) ausgestellt, welche die Identität des Nutzers attestieren. Es werden ACCESS_TOKEN von IdPs akzeptiert, bei denen der E-Rezept-Fachdienst sich registriert hat.

Mit dem Start der Anwendung E-Rezept kann der IdP der gematik genutzt werden. Für die Authentisierung eines Versicherten am IdP der gematik mittels E-Rezept-FdV wird eine eGK mit NFC-Schnittstelle verwendet.

Mit der Entwicklung von digitalen Identitäten, bspw. föderierter IdPs, werden diese für die Authentisierung einbezogen.

