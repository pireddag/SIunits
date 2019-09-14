(texmacs-module (SIUnits SIFormat))


;(tm-define (SIScheme number unit)
;	   (set! number (tree->stree number))
;	   (set! unit (tree->stree unit))
;	   (stree->tree number))

(tm-define (SIScheme number unit)
	   (set! number (tree->stree number))
	   (set! unit (tree->stree unit))
  (stree->tree `(concat ,number " " (with "math-font-family" "ms" (with "math-font-shape" "right" ,unit)))))



					; For the Scheme serialization see section 5 of
					; http://www.texmacs.org/tmdoc/devel/format/stylesheet/prim-style-misc.de.html
					; For how to use the Scheme serialization in Scheme code
					; which then gets passed onto TeXmacs using the extern primitive see the examples in
					; http://www.texmacs.org/tmdoc/devel/format/stylesheet/prim-style-misc.en.html


					; quasiquote the whole expression with the backtick
					; (only way to get concat to work: I think it needs to be passed "as-is" to the function stree-tree)
					; (not quote, as we need to unquote the variables)
					; unquote the variables
					; all the argument of the "with" function need to be strings

					; Note: I have seen cases where an error comes up if the first argument of "with"
					; is within quotes and there is no error if there are no quotes
					; (i.e. as if Scheme expects a variable not a string)
					; but I did not figure out when
