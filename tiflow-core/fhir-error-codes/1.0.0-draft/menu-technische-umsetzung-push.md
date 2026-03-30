# Push Notification senden - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Push Notification senden**

## Push Notification senden

Die Funktionalität zu Push Notification für FdVs ist anwendungsübergreifend in [gemF_PushNotification] beschrieben.

Der TI-Flow-Fachdienst übernimmt die Rolle „Fachdienst“. Er verwaltet FdV-Instanzen, die sich bei ihm für den Empfang von Push Notifications registriert haben, erstellt Push Notifications für vom Nutzer abonnierte Ereignisse und übermittelt diese an das zuständige Push Gateway. Der TI-Flow-Fachdienst bietet Schnittstellen für das E-Rezept-FdV zur Registrierung, Deregistrierung und Konfiguration von Kanälen an.

### Push Notification senden

Der TI-Flow-Fachdienst erstellt ein Notification-Objekt für verschlüsselte Notifications wie in [OpenAPI_PushGateway] beschrieben. Der Nachrichteninhalt, auf den in diesem Kapitel verwiesen wird, ist der Inhalt des Ciphertexts.

Der TI-Flow-Fachdienst MUSS den Nachrichteninhalt einer Push Notification gemäß TAB_eRPFD_028 erzeugen.

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| erp.task.activate | Task.identifier.PrescriptionID | TaskId | Falls Task.flowType = "160","166","169","200","209": KBV_PR_ERP_Bundle.entry.[medicationName]Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | POST /Task/<id>/$activate |
| erp.task.accept | Task.identifier.PrescriptionID | TaskId | Falls Task.flowType = "160","166","169","200","209": KBV_PR_ERP_Bundle.entry.[medicationName]Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | POST /Task/<id>/$accept |
| erp.task.reject | Task.identifier.PrescriptionID | TaskId | Falls Task.flowType = "160","166","169","200","209": KBV_PR_ERP_Bundle.entry.[medicationName]Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | POST /Task/<id>/$reject |
| erp.task.close | Task.identifier.PrescriptionID | TaskId | Falls Task.flowType = "160","166","169","200","209": GEM_ERP_PR_PAR_CloseOperation_Input.parameter[rxDispensation].part[medication].[medicationName]Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | POST /Task/<id>/$close |
| erp.task.dispense | Task.identifier.PrescriptionID | TaskId | Falls Task.flowType = "160","166","169","200","209": GEM_ERP_PR_PAR_DispenseOperation_Input.parameter[rxDispensation].part[medication].[medicationName]Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | POST /Task/<id>/$dispense |
| erp.task.abort | Task.identifier.PrescriptionID | TaskId | Falls Task.flowType = "160","166","169","200","209": KBV_PR_ERP_Bundle.entry.[medicationName]Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | POST /Task/<id>/$abort |
| erp.communication.new | Communication.basedOn.reference | TaskId | Falls Communication.basedOn.reference.Task.flowType = "160","166","200": KBV_PR_ERP_Bundle.entry.[medicationName]Falls Communication.basedOn.reference.Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | POST /CommunicationFalls Profil GEM_ERP_PR_Communication_Reply: Communication.payload.content.info_textFalls Profil GEM_ERP_PR_Communication_DiGA: Communication.payload.content |
| erp.chargeitem.create | ChargeItem.identifier.PrescriptionID | TaskId | ChargeItem.supportingInformation.KBV_PR_ERP_Bundle.entry.[medicationName] | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | POST /ChargeItem |
| erp.chargeitem.update | ChargeItem.identifier.PrescriptionID | TaskId | ChargeItem.supportingInformation.KBV_PR_ERP_Bundle.entry.[medicationName] | Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden | PUT /ChargeItem/<id> |
| erp.eu.prescription.get | Task.identifier.PrescriptionID | TaskId | KBV_PR_ERP_Bundle.entry.[medicationName] | GEM_ERPEU_PR_PAR_GET_Prescription_Input.parameter.part[practionerName].valueString | - |
| erp.eu.prescription.redeem | Task.identifier.PrescriptionID | TaskId | KBV_PR_ERP_Bundle.entry.[medicationName] | GEM_ERPEU_PR_PAR_GET_Prescription_Input.parameter.part[practionerName].valueString | - |
| erp.eu.prescription.close | Task.identifier.PrescriptionID | TaskId | GEM_ERPEU_PR_PAR_CloseOperation_Input.parameter[rxDispensation].[medication].[medicationName] | GEM_ERPEU_PR_PAR_CloseOperation_Input.parameter.part[practionerData].name.text | - |

**Tabelle: **TAB_eRPFD_028 Nachrichteninhalt Push Notification

 **Definition [medicationName]:**
 Falls medication dem Profil "KBV_PR_ERP_Medication_Ingredient" entspricht:
 `Medication.ingredient.item.itemCodeableConcept.text`
 Ansonsten:
 `Medication.code.text` 

Der TI-Flow-Fachdienst MUSS den Nachrichteninhalt einer Push Notification verschlüsseln.
Die Vorgaben für die Verschlüsselung sind in `A_27161-* - Fachdienst - Push Notification senden - Nachricht verschlüsseln` beschrieben.

Der TI-Flow-Fachdienst MUSS beim Erstellen einer Push Notification die Identifier des zugehörigen Protokolleintrags (AuditEvent.id) des Triggers im Identifier-Feld des äußeren Notification-Objekts (notification.identifier) angeben.
### Push Notification Datenstruktur

Der TI-Flow-Fachdienst und das E-Rezept-FdV MÜSSEN für den Anwendungsfall "Push Notifications" Nachrichteninhalte mit der folgenden Datenstruktur im JSON Format unterstützen:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| ChannelId | ja | Der Trigger, der die Push Notification initiiert hat. | bis zu 30 Stellen, UTF-8 | erp.communication.new |
| Identifier | ja | Ein Identifier, der als Kontext zur Nachricht dient. | bis zu 50 Stellen, UTF-8 | 160.000.000.000.123.76 |
| IdentifierType | ja | Der Art Identifier, der mitgeschickt wird. | bis zu 20 Stellen, UTF-8 | TaskId |
| Product | ja | Der Name des verordneten bzw. abgegebenen Produkts (Medikament oder DiGA). | bis zu 100 Stellen, UTF-8 | Sumatriptan-1a Pharma 100 mg Tabletten |
| ActorName | ja | Der Name des Akteurs. Das kann zum Beispiel der Name der Apotheke oder des Kostenträgers sein. | bis zu 100 Stellen, UTF-8 | Meine Apotheke |
| Message | nein | Die Nachricht, die an den Versicherten verschickt wird.Nachrichten mit mehr als 240 Zeichen müssen nach 237 Zeichen abgeschnitten und mit drei Punkten (…) ergänzt werden. | bis zu 240 Stellen, UTF-8 | Wir möchten Sie informieren, dass Ihre bestellten Medikamente zur Abholung bereitstehen. |

**Tabelle: **TAB_eRp_DM_004 Push Notification Datenstruktur Nachrichteninhalte

