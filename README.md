# MasterNotes
 My personal LaTeX class for taking notes.

## Contents

All of the main files are in the `ceri/sty` folder.
- `MasterNotes` for a book-style document.
- `MasterArticle` for a article-style document.
- `MasterLessons` for a specific "Leçons pour l'Agrégation" style document (in particular landscaped).

### Illustrations

To change the picture of the titlepage with the `MasterNotes` class, you have to change the picture in the `ceri/images` folder and in the line 80 of the `MasterNotes.cls` file.

To set up the picture for a new chapter, type the two following commands:
```
\chapimage{path-to-the-image}
\chapter{Chapter Name}
```

To set up the picture for a new part, type the following command:
```
\partt{Part Name}{path-to-the-image}
```
The image must be in 9:16 ratio.

### Environments

Here's some custom environments:
 `theo`, `theo*` environments for theorems
- `defin`, `defin*` environments for definitions
- `rem`, `rems`, `rem*` environments for remarks
- `propo`, `propo*` environments for properties
- `lem`, `lem*` environments for lemmas
- `coro`, `coro*` environments for corollaries
- `ex`, `exs` environments for examples
- `exo`, `exos` environments for exercises
- `demo` environment for proofs

### Options

Some options are available, but only change the color palette of the documents. Here's the options implemented : `70s`, `ikea`, `hive`, `acajou`, `matelot`, `fruitjelly`, `grape`, `stone`, `pastelish`, `waterblood`, `formica`, `lavander`, `bees`, `caramel`, `mushrooms`, `corpo`, `violetfroggy` and `2000s`.

You can check this and see the palettes in the `ceri/sty/options.sty` file. It is easy to add one.

## Licence

This project is completely free and open source. In the case of using/modifying this files, please add me and the link to my GitHub page in credits.

## Disclaimer

This class is not supported. I will no longer take time to add some stuff. I'm working on my other project, called [MyCourse]{https://github.com/MrStrumff/MyCourse}. 
