(texmacs-module (SIUnits SIFormat))

;;; Writes a physical quantity in the format recommended by the SI
;;; That is a number, followed by a space, followed by the unit symbol (in roman type).

;;; From "The International System of Units (SI)", 9th edition (English)
;;; https://www.bipm.org/utils/common/pdf/si-brochure/SI-Brochure-9-EN.pdf
;;; Section 5.4.3
;;; The numerical value always precedes the unit and a space is always used to separate the
;;; unit from the number. Thus the value of the quantity is the product of the number and the
;;; unit. The space between the number and the unit is regarded as a multiplication sign (just as
;;; a space between units implies multiplication). The only exceptions to this rule are for the
;;; unit symbols for degree, minute and second for plane angle, °, ′ and ′′, respectively, for
;;; which no space is left between the numerical value and the unit symbol.
;;; Section 5.2
;;; Unit symbols are printed in upright type regardless of the type used in the surrounding text.


(tm-define (SIScheme number unit)
	   (set! number (tree->stree number))
	   (set! unit (tree->stree unit))
	   (let ((spacer (setSpacer unit))) ; calculating spacer with the input values of unit (the spacer function is written with that in mind)
	     ; will set unit to the value for typesetting later
	     (begin
	       (set! unit (setUnit unit)) ; set unit after calculating spacer, as the spacer function is written with in mind the input values of unit
	       (stree->tree `(concat ,number ,spacer (with "math-font-family" "ms" (with "math-font-shape" "right" ,unit)))))))

(define (setUnit unit) ; I got the Scheme format of each character by typing the character in TeXmacs and then Edit-> Copy to -> TeXmacs Scheme
  (cond ((equal? unit "degrees") "<degree>")
	((equal? unit "minutes") "'")
	((equal? unit "seconds") "") ; Here the Github preview of the file shows just a pair of double quotes, but there are two characters inside
	(else unit)))

(define (setSpacer unit)
  (cond ((equal? unit "degrees") "")
	((equal? unit "minutes") "")
	((equal? unit "seconds") "")
	(else " ")))

;; For the Scheme serialization see section 5 of
;; http://www.texmacs.org/tmdoc/devel/format/stylesheet/prim-style-misc.de.html
;; For how to use the Scheme serialization in Scheme code
;; which then gets passed onto TeXmacs using the extern primitive see the examples in
;; http://www.texmacs.org/tmdoc/devel/format/stylesheet/prim-style-misc.en.html

;; quasiquote the whole expression with the backtick
;; (only way to get concat to work: I think it needs to be passed "as-is" to the function stree-tree)
;; (not quote, as we need to unquote the variables)
;; unquote the variables
;; all the arguments of the "with" function need to be strings

;; Note: I have seen cases where an error comes up if the first argument of "with"
;; is within quotes and there is no error if there are no quotes
;; (i.e. as if Scheme expects a variable not a string)
;; but I did not figure out when

