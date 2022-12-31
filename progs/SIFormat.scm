(texmacs-module (SIFormat))

;;; Writes a physical quantity in the format recommended by the SI
;;; That is a number, followed by a space, followed by the unit symbol
;;; (in upright type).

;; (use-modules (srfi srfi-1)) for find function, used in no-flatten-test
;; https://www.gnu.org/software/guile/manual/html_node/SRFI_002d1-Searching.html
;; https://www.gnu.org/software/guile/manual/html_node/About-SRFI-Usage.html
;; https://www.gnu.org/software/guile/manual/html_node/Using-Guile-Modules.html
;; srfi-1 is not available in guile 1.8, I am using filter to build a
;; find function


;;; Prescriptions from "The International System of Units (SI)", 9th edition
;;; (English)
;;
;; https://www.bipm.org/utils/common/pdf/si-brochure/SI-Brochure-9-EN.pdf
;; (referred through the comments as "the SI manual")
;;
;; Section 5.4.3
;;
;; The numerical value always precedes the unit and a space is always
;; used to separate the unit from the number. Thus the value of the
;; quantity is the product of the number and the unit. The only
;; exceptions to this rule are for the unit symbols for degree, minute
;; and second for plane angle, °, ′ and ′′, respectively, for which no
;; space is left between the numerical value and the unit symbol.
;;
;; Section 5.2
;;
;; Unit symbols are printed in upright type regardless of the type
;; used in the surrounding text.

;; The space between the number and the unit is regarded by TeXmacs
;; as function application, which at the moment (2020-11-16) I am
;; using as a substitute for multiplication (in the same way for
;; spaces between units, the multiplication sign does not work with
;; font shape = right).


;;
;; How the code works
;;
;; For the Scheme serialization see section 5 of
;; http://www.texmacs.org/tmdoc/devel/format/stylesheet/prim-style-misc.de.html
;; For how to use the Scheme serialization in Scheme code which then
;; gets passed onto TeXmacs using the extern primitive see the
;; examples in
;; http://www.texmacs.org/tmdoc/devel/format/stylesheet/prim-style-misc.en.html

;; quasiquote the whole expression with the backtick (only way to get
;; concat to work: I think it needs to be passed "as-is" to the
;; function stree-tree) (not quote, as we need to unquote the
;; variables) unquote the variables all the arguments of the "with"
;; function need to be strings

;; Note: I have seen cases where an error comes up if the first
;; argument of "with" is within quotes and there is no error if there
;; are no quotes (i.e. as if Scheme expects a variable not a string)
;; but I did not figure out when



;; Current version
;;
;; - It has an input argument called mode that tells the mode (comes
;; from a value|mode macro in the TeXmacs macro that calls it).
;;
;; - Delete the recursive functions which check the head of the tree
;; till they find one of the heads we are looking for (i.e.  'text,
;; 'math, 'equation*, 'eqnarray*, 'body)
;;
;;  These recursive functions are developed starting from the folder
;;  "test trees" (/home/giovanni/test/test TeXmacs/2 - Test/Test
;;  trees/test_commands.tm)
;;
;;  They are modelled after the macro "special" in section "Contextual
;;  overloading" (2.5.1 of TeXmacs Scheme developer guide) in-math?
;;  (see previous work) is not ok because it checks the position of
;;  the cursor, not of the tree

;;  For contextual overloading, Scheme developer guide, 1.5



;; To do
;;
;; - A tail-recusive version of the flattening function
;;
;; - Figure out what flatten-conditional does in this program and
;; remove it if it is not necessary
;;
;; -- see interleaving function; it could be the way to build an
;; interleaving function without having available a fold procedure
;;
;; -- Guile 1.8 does not have access to srfi, so can't use fold
;;
;; -- 2020-12-20
;;
;; (fold (lambda (x y z) (cons x (cons y z))) '() '(1 2 3) '(1 2 3))
;; would work I think
;;
;; Outputs (3 3 2 2 1 1)
;;
;; - If I keep flatten-conditional: set the no-flatten-test to only the
;; necessary symbols (perhaps hspace is not necessary)
;;
;; - Perhaps: rename "denestify" to "flatten" for all flattening
;; functions

;;; =======
;;; Changes
;;; =======
;;
;; 2020-12-04
;;
;; Changed the symbols for the angular quantities minutes and seconds
;; (define (setUnit unit)
;;
;; I found out the Scheme format of each character by typing the
;; character in TeXmacs and then Edit-> Copy to -> TeXmacs Scheme
;;
;; Minutes is now `(rsup "<prime>")) ; it was "'" in previous versions
;;
;; Seconds is now `(rsup "<prime><prime>"); It was "" in previous
;; version (where the Github preview of the file shows just a pair of
;; double quotes, but there are two characters inside)
;;
;; For seconds, it is also possible to try "<#2033>", which comes from
;; copy-pasting from sec 5.4.3 of the SI manual onto TeXmacs,then
;; copying to TeXmacs Scheme

;; I copied "<prime>" and "<#2033>" from section 5.4.3 of
;; https://www.bipm.org/utils/common/pdf/si-brochure/SI-Brochure-9-EN.pdf
;; (copy, paste to TeXmacs, copy from TeXmacs editor to TeXmacs
;; scheme)
;;
;; "<prime>" needs to be typeset as superscript (typeset as regular
;; text, it is as large as numbers)
;;
;; I found the expression "<prime><prime>" in TeXmacs, in the text
;; copied as a whole paragraph from the SI manual, 5.4.3, but I do not
;; know how it came to be

;; Keyboard shortcuts

(kbd-map
  ("s i tab" (begin (make `math) (make-hybrid) (insert "si") (kbd-return)) ))

(kbd-map
  (:mode in-math?)
  ("s i tab" (begin (make-hybrid) (insert "si") (kbd-return))))



;; (tm-define (SIScheme mode input)
;;   (:secure #t)
;;   (display input)
;;   (display "\n")
;;   (let ((inMath? (mathMode? (tree->stree mode))))
;;     ;; from string to logical value
;;     (set! input (tree->stree input))
;;     (display input)
;;     (display "\n")
;;     (display (null? input))
;;     (display "\n")
;;     (let ((number (car (cdr input)))
;; 	  (unit (cdr (cdr input))))
;;       (display "number")
;;       (display "\n")
;;       (display number)
;;             (display "\n")
;;       (display "unit")
;;       (display "\n")
;;       (display unit)
;;       (display "\n")
;;       (display (null? unit))
;;       (if (null? unit)
;; 	  (set! unit '("")))
;;       (SICompose number unit inMath?))))

(tm-define (SIScheme mode input)
  ;; The argument input is passed from the macro as the full tree including the
  ;; tag; because of this, we need to take its cdr to extract individual arguments
  (:secure #t)
  (let ((inMath? (mathMode? (tree->stree mode))))
    ;; from string to logical value
    (set! input (tree->stree input))
    (let ((number (car (cdr input)))
	  (unit (cdr (cdr input))))
      (if (null? unit) ; With the current macro setup we use the calling macro
		       ; with arity one till we add an argument; when arity is
		       ; one (cdr (cdr input)) is an empty list, which does not
		       ; work with the rest of the code. In this case we
		       ; substitute to the null list the '("") list
	  (set! unit '("")))
      (SICompose number unit inMath?))))

(define (mathMode? mode)
  (if (equal? mode "math")
      #t
      #f))

(define (SICompose number unit inMath?)
  (let* ((tSetNumber (setNumber number))
	 (tSetSpacer (setSpacer (car unit))) ; calculates spacer with
					     ; the input values of
					     ; unit
	 (tSetUnitsLst  (concatenateUnits (withFormat unit)))
	 (quantity (append
		    `(concat  ,tSetNumber ,tSetSpacer)
		    tSetUnitsLst)))
    (stree->tree (if inMath?
		     quantity
		     `(math ,quantity)))))


;;; ====================
;;; Formatting functions
;;; ====================

(define (setUnitSpacer) "*")

(define (setNumber number)
  `(with "math-font-shape" "right" ,number))

(define (setSpacer unit)
  (cond ((equal? unit "degrees") "")
	((equal? unit "minutes") "")
	((equal? unit "seconds") "")
	(else " ")))

;; I found out the Scheme format of each character by typing the
;; character in TeXmacs and then Edit-> Copy to -> TeXmacs Scheme
(define (setUnit unit) 
  (cond ((equal? unit "degrees") "<degree>")
	((equal? unit "minutes") `(rsup "<prime>")) ; was "'" in previous versions
	((equal? unit "seconds") `(rsup "<prime><prime>"))
	;; Was "" in previous versions, where the Github preview of
	;; the file shows just a pair of double quotes, but there are
	;; two characters inside

	;; It is also possible to try "<#2033>", which comes from
	;; copy-pasting from sec 5.4.3 onto TeXmacs,then copyingt to
	;; TeXmacs Scheme
	(else unit)))
;; I copied "<prime>" and "<#2033>" from section 5.4.3 of
;; https://www.bipm.org/utils/common/pdf/si-brochure/SI-Brochure-9-EN.pdf
;; (copy, paste to TeXmacs, copy from TeXmacs editor to TeXmacs
;; Scheme)
;;
;; "<prime>" needs to be typeset as superscript (typeset as regular
;; text is as large as numbers)
;;
;; I found the expression "<prime><prime>" in TeXmacs, in the text
;; copied as a whole paragraph from the SI text, 5.4.3, but I do not
;; know how it came to be



;; Add format to units
(define (withFormat unitLst)
  (map (lambda (x) `(with "math-font-shape" "right" ,(setUnit x))) unitLst))

;; Interleaving taken from /home/giovanni/test/test TeXmacs/2 -
;; Test/Test Scheme/testInterleave.scm
;;
;; The implementation of interleaving as "building lists" plus
;; "flattening" is in
;; https://stackoverflow.com/questions/30071930/any-idea-of-how-to-interleave-two-lists-in-dr-racket
;; is there a better way?
;;
;; 2020-12-20 Also, I cannot see whether stopping flattening looking
;; at the first element of lists with flattenConditional is
;; robust. What happens if there are units which are entered with some
;; formatting of their own, set with a with markup?
;;
;; 2020-12-20 Perhaps the conditional flattening works (stopping
;; at with) because of the way the expressions are constructed
;; combining the units, wrapped by with's, the asterisks, which are
;; characters, and the interleaving, which is done by setting (cons
;; cons (list)) inside a map. So the conditional flattening stops
;; exactly at the right point. This is an ad-hoc solution, which is
;; quicker than defining a fold function (which exists in srfi-1, not
;; available in guile 1.8)
;;
;; Combine with flatten-conditional, which (2020-11-17) needs to
;; consider only the 'with symbol
;;
;; write a drop-right function for Guile 1.8, it should be native in
;; Guile 3
(define (concatenateUnits unitLst)
  (let ((uSpacer (setUnitSpacer))) 
    (drop-right
     (flatten-conditional
      (map (lambda (x)  (cons x (cons uSpacer (list)))) unitLst))
     1)))


;;; =====================================================
;;; auxiliary functions
;;; =====================================================


;; I need a list of symbols at which we stop flattening, and a
;; test for presence in this list. I cannot use use the find function
;; in srfi-1, see
;; https://www.gnu.org/software/guile/manual/html_node/SRFI_002d1-Searching.html
;; and load corresponding module because it is not available in guile
;; 1.8
;;
;; therefore I build a find function by filtering the list and then
;; checking that there is something in the filtered list, as I did in
;; the formatRef program (manipulateList.scm)

;;  A list of atoms which stop flattening.
(define no-flatten-list
  '(with hspace)) 

(define (no-flatten-test expr)
  (find expr no-flatten-list))


;; See /home/giovanni/test/test TeXmacs/2 - Test/Test
;; Scheme/testFlattenList.scm which in turn is taken from
;; https://stackoverflow.com/questions/33338078/flattening-a-list-in-scheme
;; answer https://stackoverflow.com/a/33338401 flatten-conditional
;; are adaptation of this

;; Second version of the flattening function, that stops at a list of symbols
;; checked using the no-flatten-test function (which uses the list
;; no-flatten-list)
(define (flatten-conditional lst)
  (cond ((null? lst) '())
	((pair? (car lst))
	 ;; (car lst) is a list
	 (if (no-flatten-test (car (car lst))) ; If the car of (car lst) is one
					       ; of the symbols in
					       ; no-flatten-test ('with in the
					       ; case of this code), we cons it
	     (cons (car lst)
		   (flatten-conditional (cdr lst)))
	     ;; otherwise we flatten it conditionally and append it
	     (append (flatten-conditional (car lst))
		     (flatten-conditional (cdr lst)))))
	;; (car lst) is an atom
	(else (if (no-flatten-test (car lst)) ; test for presence of (car lst)
					      ; in the list of symbols that
					      ; stop flattening
		  lst		; in this code we leave lst as it is (we do not
				; need to protect it as we did in a previous
				; version of the same function where we did not
				; cons the lists that start with one of the
				; symbols that stops flattening) otherwise we
				; cons (car lst) to the conditionally flattened
				; (cdr lst)
		  (cons (car lst) (flatten-conditional (cdr lst)))))))

;; Necessary definitions for guile 1.8
(define (drop-right lst k) (reverse (list-tail (reverse lst) k)))

(define (find element lst)
  (not (equal?
	(filter (lambda (x) (equal? x element)) lst)
	'())))

