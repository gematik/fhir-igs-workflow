## Anforderung definieren

<requirement conformance="SHALL" title="E-Rezept-Fachdienst – title">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    text
</requirement>

Eine Nummer/key muss nicht vergeben werden, da diese automatisch generiert wird.

### Tags in Anforderungen

Für Tags in Anforderungen muss die folgende Syntax verwendet werden:
<id> ->  `&#60;id&#62;`

## Bild einfügen

1. Bild in den Ordner input/images legen

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="./todo.png" alt="todo" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>todo</figcaption>
</figure>

<br>

## PUML einfügen

1. PlantUML Code in die `.plantuml` Datei im Ordner `input/images-source` einfügen
2. In der Markdowndatei mit folgendem Code auf die `.svg` Datei verlinken:

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
    {% include todo.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>todo</figcaption>
</figure>

## Tabellen

| Spalte 1 | Spalte 2 | Spalte 3 |
| --- | --- | --- |
| Inhalt 1 | Inhalt 2 | Inhalt 3 |

<div><figcaption><strong>Tabelle: </strong>title</figcaption></div>

## Links
[Linktext](https://www.example.com)


## Vorlage für Anwendungsfälle in use-cases-get.yaml

### Bestehenden Anwendungsfall aus Core ziehen

```yaml
- id: UC_2_1_E_Rezepte_erzeugen
  core-uc: UC_2_1_E_Rezepte_erzeugen
```

### Bestehenden Anwendungsfall aus Core ziehen und anpassen

```yaml
- id: UC_2_1_E_Rezepte_erzeugen
  core-uc: UC_2_1_E_Rezepte_erzeugen
  description: |
    Andere Beschreibung
```

### Neuen Anwendungsfall anlegen

```yaml
- id: E_Rezept_qualifiziert_signieren
  anchor: e-rezept-qualifiziert-signieren
  link: menu-technische-umsetzung-anwendungsfaelle.html#e-rezept-qualifiziert-signieren
  title: title
  roles:
    - (Zahn-)Arzt
  description: |
    ...
  preconditions: |
    - 
  actions: |
    - 
  postconditions: |
    - 
  interface: |
    - 
  diagram: seq-
```

## Anlegen einer Seite

1. Neue Markdown-Datei im Ordner `input/pagecontent` anlegen
2. in der sushi-config.yaml die Seite unter dem Element `pages` hinzufügen und Titel vergeben.

## Suchen aller afo keys

key="[^"]*"