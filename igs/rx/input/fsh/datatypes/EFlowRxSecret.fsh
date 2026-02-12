Profile: EFlowRxSecret
Parent: Identifier
Id: eflow-rx-secret
Title: "GEM ERP PR Secret"
Description: "Das Secret ist ein generiertes Geheimnis, das Zugriff auf eine E-Rezept-Ressource gewährt, z. B. Task."
* insert Meta
* use = #official (exactly)
* system 1.. MS
* system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret" (exactly)
* value 1.. MS
  * ^short = "Secret für die abgebende Apotheke."
  * ^definition = "Das Secret, das die Apotheke erhält, wenn das E-Rezept vom E-Rezept-Server angenommen wird."
