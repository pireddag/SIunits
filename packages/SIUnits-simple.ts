<TeXmacs|2.1.1>

<style|source>

<\body>
  <active*|<\src-title>
    <src-package|SIUnits-simple|1.0>

    <\src-purpose>
      Typesetting measurements units according to the SI prescriptions
    </src-purpose>

    <src-copyright|2022|GP>

    <\src-license>
      This software falls under the <hlink|GNU general public license,
      version 3 or later|$TEXMACS_PATH/LICENSE>. It comes WITHOUT ANY
      WARRANTY WHATSOEVER. You should have received a copy of the license
      which the software. If not, see <hlink|http://www.gnu.org/licenses/gpl-3.0.html|http://www.gnu.org/licenses/gpl-3.0.html>.
    </src-license>
  </src-title>>

  <use-module|(SIFormat)>

  <active*|<\src-comment>
    We enter in the SI macro only the arguments that define the physical
    quantity, that is the number and the list of units that multiplied with
    each other yield the compound unit.

    The SI macro passes them onto the SIHelper macro using quote-arg, adding
    to the call the value of the current mode. The SIHelper macro in turn
    calls the SIScheme function, that in this way has access to the current
    mode.

    The "input" argument is entered as-is in the quote-arg macro (no
    backslash before)

    The argument value\|mode appears in the argument list of SIHelper as the
    only string mode in green italics

    The two drd-props commands let TeXmacs know that the si and SI macros
    have 1 + 1*n accessible arguments.
  </src-comment>>

  \;

  <assign|SI|<xmacro|input|<SIHelper|<value|mode>|<quote-arg|input>>>>

  <assign|si|<xmacro|input|<SIHelper|<value|mode>|<quote-arg|input>>>>

  <assign|SIHelper|<macro|mode|inp|<extern|SIScheme|<arg|mode>|<arg|inp>>>>

  <drd-props|SI|arity|<tuple|repeat|1|1>|accessible|all>

  <drd-props|si|arity|<tuple|repeat|1|1>|accessible|all>

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