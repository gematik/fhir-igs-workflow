## Anforderung definieren
<requirement conformance="SHALL" title="E-Rezept-Fachdienst – title">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    text
</requirement>

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

## Vorlage für Anwendungsfälle in use-cases-get.yaml

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