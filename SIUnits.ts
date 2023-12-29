<TeXmacs|2.1.1>

<style|source>

<\body>
  <active*|<\src-comment>
    2023-12-29 It seems that TeXmacs does not see the module if it is in the
    same directory as the package; the module has to be I think in the Guile
    search paths. See <hlink|Scheme developer
    guide|https://www.texmacs.org/tmweb/documents/manuals/texmacs-scheme.en.pdf>,
    section 1.4

    - I am placing the SIFormat module in the .TeXmacs/prog directory
  </src-comment>>

  <use-module|(SIFormat)>

  <assign|SI|<macro|number|unit|<extern|SIScheme|<arg|number>|<arg|unit>>>>

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