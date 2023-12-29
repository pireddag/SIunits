<TeXmacs|2.1.1>

<style|<tuple|generic|SIUnits|old-dots|old-lengths>>

<\body>
  <\hide-preamble>
    \;

    <assign|SI|<macro|number|unit|<extern|SIScheme|<arg|number>|<arg|unit>>>>
  </hide-preamble>

  <paragraph|Outside math mode>

  <SI|2|m>

  <SI|5|kg>

  <paragraph|Inside math mode>

  <math|<SI|2|kg\<cdot\>m<rsup|-1>s<rsup|-1>>>

  \;

  <paragraph|Exceptions>

  Degrees, minutes and seconds have to be entered by typing the corresponding
  word.

  <small-table|<tabular|<tformat|<cwith|2|2|2|2|cell-valign|b>|<cwith|3|3|1|1|cell-valign|b>|<table|<row|<cell|<inactive|<SI|20|degrees>>>|<cell|<SI|20|degrees>>>|<row|<cell|<inactive|<SI|10|minutes>>>|<cell|<SI|10|minutes>>>|<row|<cell|<inactive|<SI|15|seconds>>>|<cell|<SI|15|seconds>>>>>>|>\ 

  <subparagraph|Exceptions - math mode>

  <small-table|<tabular|<tformat|<cwith|2|2|2|2|cell-valign|b>|<cwith|3|3|1|1|cell-valign|b>|<table|<row|<cell|<math|<inactive|<SI|20|degrees>>>>|<cell|<math|<SI|20|degrees>>>>|<row|<cell|<math|<inactive|<SI|10|minutes>>>>|<cell|<math|<SI|10|minutes>>>>|<row|<cell|<math|<inactive|<SI|15|seconds>>>>|<cell|<math|<SI|15|seconds>>>>>>>|>

  <\session|scheme|default>
    <\unfolded-io|Scheme] >
      (procedure-source SIScheme)
    <|unfolded-io>
      (lambda (number unit) (set! number (tree-\<gtr\>stree number)) (set!
      unit (tree-\<gtr\>stree unit)) (let* ((spacer (setSpacer unit))) (begin
      (set! unit (setUnit unit)) (stree-\<gtr\>tree (quasiquote (concat
      (unquote number) (unquote spacer) (with "math-font-family" "ms" (with
      "math-font-shape" "right" (unquote unit)))))))))
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>
  </session>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|1|1>>
    <associate|auto-5|<tuple|3.1|?>>
    <associate|auto-6|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||>|<pageref|auto-4>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||>|<pageref|auto-6>>
    </associate>
    <\associate|toc>
      <with|par-left|<quote|4tab>|Outside math mode
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Inside math mode
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Exceptions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.15fn>>

      Exceptions - math mode <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.15fn>
    </associate>
  </collection>
</auxiliary>