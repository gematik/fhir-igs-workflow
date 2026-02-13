Verarbeitungsregeln für den E-Rezept-Fachdienst

## Verordnen durch Psychotherapeuten
Psychotherapeuten verordnen DiGA analog zu Ärzten und Zahnärzten. Die
Verordnung ist mit einem HBA der Rollen oid_psychotherapeut,
 oid_ps_psychotherapeut oder oid_kuj_psychotherapeut qualifiziert zu signieren.

## Authentisierung Kostenträger
Kostenträger authentisieren sich über den zentralen IDP-Dienst mit ihrer
SM-B KTR und der Rolle oid_kostenträger. Sektorale IDPs werden nicht genutzt.

## Workflow 162
Für Übermittlungen von DiGA Verordnungen wird der **Flowtype 162** verwendet.

Der Flowtype 162 verwendet dasselbe Statusmodell wie Flowtype 160. 

Der Statusübergang von "in Abgabe (gesperrt)" zu "gelöscht" über "UC 4.3 - E-Rezept durch Abgebenden löschen" ist für DiGA Verordnungen nicht vorgesehen.

## Löschfristen
Die Löschfristen für Workflows mit Verordnungen des Flowtype 162 entsprechen denen des Flowtype 160.

## Zugriff auf FHIR-VZD
Zur Prüfung der IKNR muss der E-Rezept-Fachdienst die Telematik-ID des
Kostenträgers auflösen. Das Mapping zwischen IKNR und Telematik-ID erfolgt über das FHIR-VZD und kann bis zu 24 Stunden gecacht werden.

## eVDGA FHIR Profile
Zur Verordnung von DiGA werden die KBV-Profile der elektronischen Verordnung
Digitaler Gesundheitsanwendungen verwendet (https://simplifier.net/evdga). Die
Workflowprofile des E-Rezept-Workflows werden um diese Profile ergänzt.
