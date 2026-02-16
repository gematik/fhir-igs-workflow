<!-- Verarbeitungsregeln für den E-Rezept-Fachdienst -->

## Verordnen durch Psychotherapeuten
Für die Verordnung von DiGAs durch Psychotherapeuten gelten die gleichen technischen
Voraussetzungen wie für Ärzte und Zahnärzte. Der Psychotherapeut muss die Verordnung
mit seinem Heilberufsausweis (HBA) qualifiziert elektronisch signieren. Es muss ein HBA
verwendet werden, welcher einer der folgenden Berufsgruppe zugeordnet ist:
- Psychotherapeut/-in (oid_psychotherapeut)
- Psychologische/-r Psychotherapeut/-in (oid_ps_psychotherapeut)
- Kinder- und Jugendlichenpsychotherapeut/-in (oid_kuj_psychotherapeut)

Das Primärsystem der Psychotherapeuten Praxis ist über einen Konnektor an das zentrale
Netz der TI angebunden und greift über das zentrale Netz der TI auf den zentralen IdP-Dienst
und den E-Rezept-Fachdienst zu.
Die Authentisierung des Primärsystem einer Psychotherapeuten Praxis am E-Rezept-Fachdienst
erfolgt mittels eines ACCESS_TOKEN. Diese werden durch den zentralen IDP-Dienst
ausgestellt, welche die Identität des Nutzers attestieren. Eine Nutzung sektoraler IdPDienste
ist nicht vorgesehen.
Für die Authentisierung nutzt die Psychotherapeuten Praxis ihre SMC-B mit der
Rolle oid_praxis_psychotherapeut, bzw. in einer Gemeinschaftspraxis mit Ärzten die Rolle
oid_praxis_arzt.

## Authentisierung Kostenträger
Das Primärsystem des Kostenträgers ist über den Basis-Consumer des Kostenträger an
das zentrale Netz der TI angebunden und greift über das zentrale Netz der TI auf den
zentralen IdP-Dienst und den E-Rezept-Fachdienst zu.
Die Authentisierung des Clientsystem eines Kostenträgers am E-Rezept-Fachdienst erfolgt
mittels eines ACCESS_TOKEN. Diese werden durch den zentralen IDP-Dienst ausgestellt,
welche die Identität des Nutzers attestieren. Eine Nutzung sektoraler IdP-Dienste ist nicht
vorgesehen.
Für die Authentisierung nutzt der Kostenträger seine SM-B KTR mit der Rolle oid_kostentraeger.

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
