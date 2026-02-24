### Einordnung in die Telematikinfrastruktur
TODO: Fix link

E-Rezepts für PKV-Versicherte wird [hier](https://www.example.com) beschrieben. Die App des Kostenträgers ist eine neue Komponente, zu der das E-Rezept-Frontend des Versicherten eine Schnittstelle für Abrechnungsinformationen anbietet. Die App des Kostenträgers ist keine Komponente der TI. Der Export als PDF ermöglicht weitere Übermittlungskanäle (z. B. E-Mail, Webportal).

### Fachliches Konzept
Die digitale Abrechnungsinformation besteht aus den folgenden Datensätzen: Verordnungsdatensatz, PKV-Abgabedatensatz und Quittungsdatensatz.

Der Verordnungsdatensatz wird durch den Arzt/Zahnarzt erstellt, mit einer Qualifizierten Elektronischen Signatur (QES) versehen und auf dem E-Rezept-Fachdienst eingestellt. Für den Abrechnungsprozess wird der Verordnungsdatensatz ohne QES übermittelt, um das Risiko vom Mehrfacheinlösungen zu vermeiden. Statt der QES wird der Verordnungsdatensatz durch den E-Rezept-Fachdienst fortgeschritten signiert, um die Integrität des Datensatzes für den Abrechnungsprozess sicherzustellen.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält, sofern in der Apotheke Änderungen bei der Abgabe vorgenommen werden, den QES-signierten PKV-Abgabedatensatz und sofern in der Apotheke keine Änderungen erfolgen, den fortgeschritten signierten PKV-Abgabedatensatz. Das Informationsmodell zum PKV-Abgabedatensatz wird durch den Verband der PKVen und DAV erarbeitet. 

Die Quittung wird durch den E-Rezept-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im E-Rezept-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (Rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat die Möglichkeit, sie vorab, beispielsweise wenn die Abrechnung abgeschlossen wurde, zu löschen.

Eine Langzeitarchivierung der Abrechnungsinformation im E-Rezept-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Der PKV-Versicherte kann über die E-Rezept App die Abrechnungsinformation digital an seine PKV schicken, um die Erstattung zu beantragen. Der Export in Form eines PDFs ermöglicht hierbei verschiedene Kanäle zur Übermittlung (wie E-Mail, Webportal, App des Kostenträgers).

### Technisches Konzept
TODO: Fix link

Der Workflow-Typ "200" und der Workflow-Typ "209" werden [hier](https://www.example.com) beschrieben.

Für E-Rezepte der Workflow-Types "200" und "209" können die Abrechnungsinformationen über den E-Rezept-Fachdienst an den Versicherten übermittelt werden.
