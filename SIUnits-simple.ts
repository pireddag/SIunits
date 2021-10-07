<TeXmacs|1.99.16>

<style|source>

<\body>
  <use-module|(SIFormat)>

  We enter in the SI macro only the arguments that define the physical
  quantity, that is the number and the list of units that multiplied with
  each other yield the compound unit. The SI macro passes them onto the
  SIHelper macro using quote-arg, adding to the call the value of the current
  mode (so that the user must not enter it). The SIHelper macro in turn calls
  the SIScheme function, that in this way has access to the current mode.

  The "input" argument is entered as-is in the quote-arg macro (no backslash
  before)

  The argument value\|mode appears in the argument list of SIHelper as the
  only string mode in green italics

  <assign|SI|<xmacro|input|<SIHelper|<value|mode>|<quote-arg|input>>>>

  <assign|SIHelper|<macro|mode|inp|<extern|SIScheme|<arg|mode>|<arg|inp>>>>

  \;

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|preamble|true>
  </collection>
</initial>