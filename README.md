# SIunits
A Scheme function to format physical quantities according to SI conventions in TeXmacs

## How to install
* Place the `packages/SIunits.ts` style file in a subdirectory of `.TeXmacs/packages/SIUnits` directory (will have to add it as a subdirectory of `.TeXmacs/packages`)
* Place the `progs/SIFormat.scm` inside the `.TeXmacs/progs/SIUnits` directory (will have to add it as a subdirectory of `.TeXmacs/progs`)
    * It must be this directory as `SIunits.ts` will look for the Scheme code in it
* The package should then be available from within the TeXmacs editor

## How to use
Type `\SI`, then return. You should obtain a box with a macro with one empty field, that will look like
`<SI|>`
Enter the numerical value in the first field. To enter unit symbols, press tab: a new field will appear, where you will be able to enter the unit symbol (including exponent); further `tab`s will make available additional fields for entering additional unit symbols for compound units. Press again return to activate; the typeset quantity should appear in your document.

### Exceptions
The symbols for angles are entered by spelling them out (degrees, minutes, seconds). In this case the units will be typeset (as °, ' and ") without spacing them from the number.
