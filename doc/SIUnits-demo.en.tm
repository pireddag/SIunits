<TeXmacs|2.1>

<style|<tuple|tmdoc|old-dots|old-lengths|SIUnits-simple|framed-theorems|preview-ref|smart-ref>>

<\body>
  <\hide-preamble>
    <assign|markup|<macro|body|<with|font-family|ss|color|blue|<arg|body>>>>

    <assign|environmentVariable|<macro|body|<with|font-shape|italics|color|green|<arg|body>>>>

    <assign|typesetLength|<macro|body|<markup|<arg|body>>>>

    <assign|testCase|<macro|body|<with|color|blue|<em|<samp|<with|color|#2218b5|<arg|body>>>>>>>

    <assign|SIexample|<macro|body|<testCase|<arg|body>>>>
  </hide-preamble>

  <\doc-data|<doc-title|The <name|SIUnits> package>>
    \;
  </doc-data>

  <abstract-data|<\abstract>
    The SIunits package helps in formatting physical quantities (numbers and
    their associated units) according to the prescription of the
    International System of Units. It is inspired by the <verbatim|siunitx>
    <LaTeX> package by Joseph Wright (<hlink|https://ctan.org/pkg/siunitx|https://ctan.org/pkg/siunitx>).

    It provides a <TeXmacs> macro named <markup|SI>, which takes an arbitrary
    number of arguments, the first of which is a number, while the rest
    concur to form the unit, and typesets the resulting physical quantity.
  </abstract>>

  Writes a physical quantity in the format recommended by the International
  System of Units (SI in short); that is a number, followed by a space,
  followed by the unit symbol (in upright type).

  From <hlink|"The International System of Units (SI)", 9th edition
  (English)|https://www.bipm.org/utils/common/pdf/si-brochure/SI-Brochure-9-EN.pdf>,
  Section 5.4.3:\ 

  <\quotation>
    The numerical value always precedes the unit and a space is always used
    to separate the unit from the number. Thus the value of the quantity is
    the product of the number and the unit. The only exceptions to this rule
    are for the unit symbols for degree, minute and second for plane angle,
    \<degree\>, <rsup|\<prime\>> and <rsup|\<prime\>\<prime\>>, respectively,
    for which no space is left between the numerical value and the unit
    symbol.
  </quotation>

  \ Section 5.2:

  <\quotation>
    Unit symbols are printed in upright type regardless of the type used in
    the surrounding text.
  </quotation>

  <section|How to type a physical quantity with SIUnits>

  The <markup|SI> macro can be used both in text mode and in math mode.

  Type the command <markup|\\SI>, followed by return. You will get a field in
  which you can type the number:

  <inactive|<SI|>>

  <inactive|<SI|3>>

  After typing the number, press tab; another field will appear:

  <inactive|<SI|3|>>

  Use that field to write the unit:

  <inactive|<SI|3|m>>

  For writing compound units, you can either write the compound expression in
  the unit field (in which case you will have to take care of the spacing
  between the symbols which form the compound unit) or you can keep pressing
  tab to obtain other fields; in this case the <markup|SI> macro will take
  care of the spacing. Each unit should be entered together with the power it
  is raised to, typed as superscript to the unit; negative numbers can be
  entered using dashes, which the <markup|SI> macro will typeset as Unicode
  \<minus\> (minus) symbols because it enters math mode if it isn't yet in
  it:

  <inactive|<SI|3|m|s<rsup|-1>>>

  Finally, press return to activate:

  <SI|3|m|s<rsup|-1>>

  <\note>
    When pressing the tab key in math, it is used to cycle through different
    symbols, therefore one must do some other action to get TeXmacs to
    interpret the tab key as the request for a new field. One possibility is
    using the right arrow to exit the macro, and using the left one to move
    back in; now pressing the tab key should generate a macro field where one
    can enter a unit.
  </note>

  Here are a few examples.

  <small-table|<tabular|<tformat|<cwith|2|2|1|3|cell-tborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|3|3|cell-rborder|0ln>|<cwith|1|1|1|3|cell-bborder|2ln>|<cwith|1|1|1|3|cell-tborder|2ln>|<cwith|1|1|1|3|cell-bsep|2sep>|<cwith|1|1|1|3|cell-tsep|2sep>|<cwith|3|3|1|-1|cell-tborder|0ln>|<cwith|2|2|1|-1|cell-bborder|0ln>|<cwith|3|3|1|-1|cell-bborder|0ln>|<cwith|4|4|1|-1|cell-tborder|0ln>|<cwith|3|3|1|1|cell-lborder|0ln>|<cwith|3|3|3|3|cell-rborder|0ln>|<table|<row|<cell|<strong|Example>>|<cell|<strong|Macro>>|<cell|<strong|Activated
  ma<strong|>cro>>>|<row|<cell|<SIexample|In
  text>>|<cell|<inactive|<SI|3|kg|m<rsup|-2>>>>|<cell|<SI|3|kg|m<rsup|-2>>>>|<row|<cell|<SIexample|In
  math>>|<cell|<math|<inactive|<SI|3|kg|m<rsup|-2>>>>>|<cell|<math|<SI|3|kg|m<rsup|-2>>>>>|<row|<cell|<SIexample|In
  text>>|<cell|<inactive|<SI|-3|m|s<rsup|-2>>>>|<cell|<SI|-3|m|s<rsup|-2>>>>|<row|<cell|<SIexample|In
  math>>|<cell|<math|<inactive|<SI|-3|m|s<rsup|-2>>>>>|<cell|<math|<SI|-3|m|s<rsup|-2>>>>>>>>|>

  <paragraph|Exceptions>

  Degrees, minutes and seconds have to be entered by typing the corresponding
  word.

  <small-table|<tabular|<tformat|<cwith|3|3|2|2|cell-valign|b>|<cwith|4|4|1|1|cell-valign|b>|<cwith|1|1|1|-1|cell-tborder|2ln>|<cwith|1|1|1|-1|cell-bborder|2ln>|<cwith|1|1|1|-1|cell-tsep|2sep>|<cwith|1|1|1|-1|cell-bsep|2sep>|<table|<row|<cell|<strong|Macro>>|<cell|<strong|Activated
  macro>>>|<row|<cell|<inactive|<SI|20|degrees>>>|<cell|<SI|20|degrees>>>|<row|<cell|<inactive|<SI|10|minutes>>>|<cell|<SI|10|minutes>>>|<row|<cell|<inactive|<SI|15|seconds>>>|<cell|<SI|15|seconds>>>>>>|>\ 

  <subparagraph|Exceptions - math mode>

  <small-table|<tabular|<tformat|<cwith|3|3|2|2|cell-valign|b>|<cwith|4|4|1|1|cell-valign|b>|<cwith|1|1|1|-1|cell-tborder|2ln>|<cwith|1|1|1|-1|cell-bborder|2ln>|<cwith|1|1|1|-1|cell-tsep|2sep>|<cwith|1|1|1|-1|cell-bsep|2sep>|<table|<row|<cell|<strong|Macro>>|<cell|<strong|Activated
  macro>>>|<row|<cell|<math|<inactive|<SI|20|degrees>>>>|<cell|<math|\<alpha\>=<SI|20|degrees>>>>|<row|<cell|<math|<inactive|<SI|10|minutes>>>>|<cell|<math|\<beta\>=<SI|10|minutes>>>>|<row|<cell|<math|<inactive|<SI|15|seconds>>>>|<cell|<math|\<gamma\>=<SI|15|seconds>>>>>>>|>

  <section|More examples>

  <subsection|<markup|SI> macro inside text and math formatted with a
  selection of <src-var|font-shape>s, <src-var|font-family>s,
  <src-var|color>s, and <src-var|size>s>

  The formatting of the text and math in which the <markup|SI> macro is
  inserted carries over to the typeset output of <markup|SI>, except for the
  <src-var|font-shape>, which is overruled by <src-var|math-font-shape>, set
  by the <markup|SI> macro itself to \P<src-textual|right>\Q (the tag set by
  <markup|SI> is inner with respect to the tags of the enclosing text).

  In this version, all <markup|SI> macros are typeset in math, so the typeset
  representation<todo|complete>

  <with|color|blue|<em|<samp|<with|color|#2f9eff|<with|color|#2218b5|Inside
  emphasized text>>>>>

  <em|The speed should never exceed the value of <SI|3|m|s<rsup|-1>> when
  using automatic steering>

  <testCase|Math inside emphasized text>

  <em|The speed should never exceed the value of <math|v=<SI|3|m|s<rsup|-1>>>
  when using automatic steering> \ 

  <testCase|Inside bold text>

  <strong|Please do not exceed the speed of <SI|3|m|s<rsup|-1>> when driving
  in automatic mode>

  <testCase|Math inside bold text>

  <strong|Please do not exceed the speed of <math|v=<SI|3|m|s<rsup|-1>>> when
  driving in automatic mode>

  <testCase|Inside sans-serif emphasized text>

  <samp|<em|The speed should never exceed the value of <SI|3|m|s<rsup|-1>>
  when using automatic steering>>

  <\testCase>
    A negative number in text, inserted as a dash
  </testCase>

  \ <samp|<em|The speed should never exceed the value of <SI|-3|m|s<rsup|-1>>
  when using automatic steering>>

  <testCase|Math inside sans-serif emphasized text>

  <em|<samp|The speed should never exceed the value of
  <math|v=<SI|3|m|s<rsup|-1>>> when using automatic steering>>

  <testCase|Small text>

  <small|The speed should never exceed the value of <SI|3|m|s<rsup|-1>> when
  using automatic steering>

  <testCase|Small red text>

  <with|color|red|<small|The speed should never exceed the value of
  <SI|3|m|s<rsup|-1>> when using automatic steering>>

  <testCase|SI in text within math>

  <math|v=k<rsub|1>*\<alpha\><text| if the acceleration is smaller than
  <SI|3|m|s<rsup|-2>>, otherwise> v=3k<rsub|1>+k<rsub|2>*\<alpha\><rsup|2>>

  <testCase|Set an SI macro inside display math>

  <\equation*>
    W=<SI|2|m|s<rsup|-1>>
  </equation*>

  <testCase|Set an SI macro inside an equation array>

  <\eqnarray*>
    <tformat|<table|<row|<cell|W>|<cell|=>|<cell|<SI|2|m|s<rsup|-1>>>>>>
  </eqnarray*>

  <subsection|Change to math an <markup|SI> macro that has already been
  written in text mode>

  The effect can be appreciated when replicating the steps.

  I enter

  v=<inactive|<SI|3|m|s<rsup|-1>>>

  in text mode and I activate it; the symbol v is typeset upright (I have
  entered it in text and I am not applying any changes to it).

  I select the whole expression (including the initial \Pv=\Q) and I press $,
  turning the selection into math mode. The v symbol is then typeset in
  italics; the spacing between the equal sign and the left- and right-hand
  signs of the equality changes; the typeset output of <markup|SI> remains
  upright.

  <em|Before>:

  The speed should never exceed the value of v=<SI|3|m|s<rsup|-1>> when using
  automatic steering

  (the superscript in text mode is entered from the menu with
  <menu|Insert|Presentation tag|Superscript> and it corresponds to the
  <markup|rsup> primitive, which is the same as for math superscripts)

  <em|After>:

  The speed should never exceed the value of <math|v=<SI|3|m|s<rsup|-1>>>
  when using automatic steering

  The styling of the text entered as units might or might not be retained;
  see <smart-ref|sec:styled-input> for details.

  <subsection|Styled input><label|sec:styled-input>

  One should apply styling to the input to <markup|SI> \Pwhen it is useful\Q
  and leave the rest of the styling to both the text in which the <markup|SI>
  macro is inserted and to the <markup|SI> macro itself.

  One case in which styled text inside an <markup|SI> macro could be useful
  is when one wants to emphasize one of the units; keeping in mind that the
  font shape needs to be <src-textual|upright> by prescription of the
  <name|Bureau International des Poids et Mesures>, one could emphasize the
  unit using color: <SI|2|<with|color|red|m>|s<rsup|-1>>.

  Despite the fact that some styling is not acceptable, here is a survey of
  the effects of applying styles to the input of <markup|SI>.

  <\testCase>
    Italics input to SI
  </testCase>

  <inactive|<SI|2|<em|m>|s<rsup|-1>>> becomes <SI|2|<em|m>|s<rsup|-1>>

  The <em|m> is entered emphasized; the typeset output of <markup|SI> is not
  emphasized, even if <markup|em> <compound|src-textual|>is the innermost
  tag, while the roman <src-var|font-shape> tag set by <markup|SI> is outer
  with respect to that.

  If the input is done in math mode, then the markup is different
  (<markup|math-it>\Ventered with <menu|Insert|Textual operator|Italic>) and
  for this reason it is typeset as emphasized text

  <testCase|Bold input to SI>

  <inactive|<SI|2|<strong|m>|s<rsup|-1>>> becomes
  <SI|2|<strong|m>|s<rsup|-1>>

  The <strong|m> is entered bold; the typeset output of <markup|SI> is bold;
  <markup|strong> is the innermost tag, while the roman <src-var|font-shape>
  tag set by <markup|SI> is outer with respect to that. Math mode respects
  the <src-textual|strong> tag.

  <testCase|Sans-serif input to SI>

  <inactive|<SI|2|<samp|m>|s<rsup|-1>>> becomes <SI|2|<samp|m>|s<rsup|-1>>

  We list a representative series of cases in the following table

  <small-table|<tabular|<tformat|<cwith|8|8|1|1|cell-valign|b>|<cwith|1|1|1|-1|cell-tborder|2ln>|<cwith|1|1|1|-1|cell-bborder|2ln>|<cwith|1|1|1|-1|cell-tsep|2sep>|<cwith|1|1|1|-1|cell-bsep|2sep>|<cwith|1|1|2|2|cell-hyphen|t>|<cwith|1|-1|6|6|cell-hyphen|t>|<cwith|1|-1|6|6|cell-width|0.25par>|<cwith|1|-1|6|6|cell-hmode|min>|<cwith|1|-1|1|1|cell-hyphen|t>|<cwith|1|-1|1|1|cell-width|0.2par>|<cwith|1|-1|1|1|cell-hmode|min>|<cwith|1|-1|2|2|cell-valign|t>|<cwith|1|1|1|-1|cell-halign|c>|<table|<row|<\cell>
    <strong|Styling>\ 

    mode of entering
  </cell>|<\cell>
    <\strong>
      Retained

      (yes/no)
    </strong>
  </cell>|<cell|<strong|Macro>>|<cell|<strong|Activated
  macro>>|<cell|<strong|Markup>>|<\cell>
    <strong|Comment>
  </cell>>|<row|<\cell>
    <testCase|Italics in text>
  </cell>|<cell|no>|<cell|<inactive|<SI|2|<em|m>|s<rsup|-1>>>>|<cell|<SI|2|<em|m>|s<rsup|-1>>>|<cell|<markup|em>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <testCase|Bold in text>
  </cell>|<cell|yes>|<cell|<inactive|<SI|2|<strong|m>|s<rsup|-1>>>>|<cell|<SI|2|<strong|m>|s<rsup|-1>>>|<cell|<markup|strong>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <testCase|Sans-serif in text>
  </cell>|<cell|yes>|<cell|<inactive|<SI|2|<samp|m>|s<rsup|-1>>>>|<cell|<SI|2|<samp|m>|s<rsup|-1>>>|<cell|<markup|samp>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <testCase|Italics in math>
  </cell>|<cell|yes>|<cell|<math|<inactive|<SI|2|<math-it|m>|s<rsup|-1>>>>>|<cell|<math|<SI|2|<math-it|m>|s<rsup|-1>>>>|<cell|<markup|math-it>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <testCase|Bold in math>
  </cell>|<cell|yes>|<cell|<math|<inactive|<SI|2|<math-bf|m>|s<rsup|-1>>>>>|<cell|<math|<SI|2|<math-bf|m>|s<rsup|-1>>>>|<cell|<markup|math-bf>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <\testCase>
      Bold in math\ 

      (second version)
    </testCase>
  </cell>|<cell|yes>|<cell|<math|<inactive|<SI|2|\<b-m\>|s<rsup|-1>>>>>|<cell|<math|<SI|2|\<b-m\>|s<rsup|-1>>>>|<cell|>|<\cell>
    How is this entered? I do not see the markup!

    (I did F6, which made an italic bold m come up, which appears as such in
    the source)
  </cell>>|<row|<\cell>
    <testCase|Sans-serif in math>
  </cell>|<cell|yes>|<cell|<math|<inactive|<SI|2|<math-ss|m>|s<rsup|-1>>>>>|<cell|<math|<SI|2|<math-ss|m>|s<rsup|-1>>>>|<cell|<markup|math-ss>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <testCase|Small in text>
  </cell>|<cell|yes>|<cell|<inactive|<SI|2|<small|m>|s<rsup|-1>>>>|<cell|<SI|2|<small|m>|s<rsup|-1>>>|<cell|<markup|small>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <\testCase>
      Small red in text
    </testCase>
  </cell>|<cell|yes>|<cell|<inactive|<SI|2|<small|<with|color|red|m>>|s<rsup|-1>>>>|<cell|<SI|2|<small|<with|color|red|m>>|s<rsup|-1>>>|<cell|<markup|small>,
  <markup|with>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <testCase|Small in math>
  </cell>|<cell|yes>|<cell|<math|<inactive|<SI|2|<small|m>|s<rsup|-1>>>>>|<cell|<math|<SI|2|<small|m>|s<rsup|-1>>>>|<cell|<markup|small>>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <testCase|Small red in math>
  </cell>|<cell|>|<cell|<math|<inactive|<SI|2|<small|<with|color|red|m>>|s<rsup|-1>>>>>|<cell|<math|<SI|2|<small|<with|color|red|m>>|s<rsup|-1>>>>|<cell|<markup|small>,
  <markup|with>>|<\cell>
    \;
  </cell>>>>>|Styled text as input to <markup|SI>>

  <section|How the <markup|SI> macro formats a physical quantity>

  We separate the number from the unit using a space.

  We separate compound units in mathematics with an implicit multiplication
  and in text by a stretchable space of <src-length|0.5spc>.
</body>

<\initial>
  <\collection>
    <associate|ornament-color|#818181>
    <associate|ornament-corner|50%>
    <associate|ornament-shape|rounded>
    <associate|page-screen-margin|false>
    <associate|preamble|false>
  </collection>
</initial>