<TeXmacs|1.99.11>

<style|<tuple|generic|SIUnits>>

<\body>
  <\hide-preamble>
    \;

    <assign|SI|<macro|number|unit|<extern|SIScheme|<arg|number>|<arg|unit>>>>
  </hide-preamble>

  <paragraph|Outside math mode>

  <SI|2|m>

  <paragraph|Inside math mode>

  <math|<SI|2|m>>

  \;

  <paragraph|Exceptions>

  Degrees, minutes and seconds have to be entered typing the corresponding
  word.

  <small-table|<tabular|<tformat|<cwith|2|2|2|2|cell-valign|b>|<table|<row|<cell|<inactive|<SI|20|degrees>>>|<cell|<SI|20|degrees>>>|<row|<cell|<inactive|<SI|10|minutes>>>|<cell|<SI|10|minutes>>>|<row|<cell|<inactive|<SI|15|seconds>>>|<cell|<SI|15|seconds>>>>>>|>

  \;

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
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
    </associate>
  </collection>
</auxiliary>