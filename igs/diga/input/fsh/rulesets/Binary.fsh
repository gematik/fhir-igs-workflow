Instance: Example-Binary-DiGA
InstanceOf: TIFlowDiGABinary
Title: "Binärdatei für Quittungs-Bundle"
Description: "Beispiel für eine Binärdatei (Binary) für ein DiGA-Quittungs-Bundle"
Usage: #inline
* id = $UUID-binary-DiGA
* contentType = #application/octet-stream
* data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="

Instance: Example-Binary-Prescription
InstanceOf: Binary
Title: "Binary einer Verschreibung (QES)"
Description: "Beispiel für binäre Daten einer elektronischen Verschreibung im PKCS#7-Format"
Usage: #inline
* contentType = #application/pkcs7-mime
* data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="