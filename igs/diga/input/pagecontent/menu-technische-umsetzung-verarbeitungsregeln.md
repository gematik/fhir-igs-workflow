Verarbeitungsregeln fuer den E-Rezept-Fachdienst

## Verordnen durch Psychotherapeuten
Psychotherapeuten verordnen DiGA analog zu Aerzten und Zahnaerzten. Die
Verordnung ist mit einem HBA der Rollen oid_psychotherapeut,
 oid_ps_psychotherapeut oder oid_kuj_psychotherapeut qualifiziert zu signieren.

## Authentisierung Kostentraeger
Kostentraeger authentisieren sich ueber den zentralen IDP-Dienst mit ihrer
SM-B KTR und der Rolle oid_kostentraeger. Sektorale IDP werden nicht genutzt.

## Workflow 162
Der Flowtype 162 verwendet dasselbe Statusmodell wie Flowtype 160. Der
Statusuebergang von "in Abgabe (gesperrt)" zu "geloescht" ueber UC 4.3 ist fuer
DiGA nicht vorgesehen.

## Loeschfristen
Die Loeschfristen fuer E-Rezepte des Flowtype 162 entsprechen denen des
Flowtype 160.

## Zugriff auf FHIR-VZD
Zur Pruefung der IKNR muss der E-Rezept-Fachdienst die Telematik-ID des
Kostentraegers aufloesen. Das Mapping erfolgt ueber das FHIR-VZD und kann bis zu
24 Stunden gecacht werden.

## eVDGA FHIR Profile
Zur Verordnung von DiGA werden die KBV-Profile der elektronischen Verordnung
Digitaler Gesundheitsanwendungen verwendet (https://simplifier.net/evdga). Die
Workflowprofile des E-Rezept-Workflows werden um diese Profile ergaenzt.
