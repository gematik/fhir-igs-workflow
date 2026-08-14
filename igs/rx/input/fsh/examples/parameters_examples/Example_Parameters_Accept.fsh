Instance: ExampleRxAcceptOutputParameters
InstanceOf: GEM_ERP_PR_PAR_AcceptOperation_Output
Usage: #example
Title: "Beispiel Erfolgsantwort der Rx $accept Operation"
Description: "Beispiel für die erfolgreiche Antwort (HTTP 200) der $accept-Operation: ein Parameters-Resource, dessen return-Parameter das Accept-Bundle (Task in-progress und qualifiziert signiertes E-Rezept) enthält"
* id = "ExampleRxAcceptOutputParameters"
* parameter[return].name = "return"
* parameter[return].resource = ExampleAcceptResponseBundle
