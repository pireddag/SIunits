(texmacs-module (SIFormat))
;; (use-modules (srfi srfi-1)) ;; for find function
;; https://www.gnu.org/software/guile/manual/html_node/SRFI_002d1-Searching.html
;; https://www.gnu.org/software/guile/manual/html_node/About-SRFI-Usage.html
;; https://www.gnu.org/software/guile/manual/html_node/Using-Guile-Modules.html
;; srfi-1 is not available in guile 1.8, I am using filter in place of find


;;; Writes a physical quantity in the format recommended by the SI
;;; That is a number, followed by a space, followed by the unit symbol (in roman type).

;;; From "The International System of Units (SI)", 9th edition (English)
;;; https://www.bipm.org/utils/common/pdf/si-brochure/SI-Brochure-9-EN.pdf
;;; Section 5.4.3
;;; The numerical value always precedes the unit and a space is always used to separate the
;;; unit from the number. Thus the value of the quantity is the product of the number and the
;;; unit. The only exceptions to this rule are for the
;;; unit symbols for degree, minute and second for plane angle, °, ′ and ′′, respectively, for
;;; which no space is left between the numerical value and the unit symbol.
;;; Section 5.2
;;; Unit symbols are printed in upright type regardless of the type used in the surrounding text.

;;; The space between the number and the unit is regarded by TeXmacs as function application,
;;; which at the moment (2020-11-16) I am using as a substitute for multiplication (in the same way for
;;; spaces between units, the multiplication sign does not work with font shape = right).


(tm-define (SIScheme input)
  (:secure #t)
  (display input)
	   (display "\n")
	   (set! input (tree->stree input))
	   (display "converted to Scheme:")
	   (display "\n")
	   (display input)
	   (display "\n")
	   (let ((number (car (cdr input)))
		 (unit (cdr (cdr input))))
	     (begin
	       (display "Split input")
	       (display "\n")
	       (display number)
	       (display "\n")
	       (display unit)
	       (display "\n")
	       (SICompose number unit))))

;; Contextual overloading, Scheme developer guide, 1.5
(tm-define (unitSpacer) ; default, will be used in regular text
	   `(hspace "0.5spc"))
(tm-define (unitSpacer)
	   (:require (in-math?))
	   "*")

;; for testing within Guile;
;; comment when using this module in TeXmacs
;;(define (unitSpacer) "*")

(define (SICompose number unit)
  (let ((tSetNumber (setNumber number))
	(tsetSpacer (setSpacer (car unit)))) ; calculates spacer with the input values of unit
    (begin
      (display "concatenated units")
      (display "\n")
      (display  (concatenateUnits (withFormat unit)))
            (display "\n")
      (display  (append `(concat  ,number ,tsetSpacer)
			(concatenateUnits (withFormat unit))))
      (display "\n")
      (display  (stree->tree (append `(concat  ,tSetNumber ,tsetSpacer)
			   (concatenateUnits (withFormat unit)))))
      (stree->tree (append `(concat  ,tSetNumber ,tsetSpacer)
			   (concatenateUnits (withFormat unit)))))))

;; Two definitions, one for text, one for math
(tm-define (setNumber number)
	   `(with "font-shape" "upright" ,number))

(tm-define (setNumber number)
	   (:require (in-math?))
	   `(with "math-font-shape" "right" ,number))


(define (setSpacer unit)
  (cond ((equal? unit "degrees") "")
	((equal? unit "minutes") "")
	((equal? unit "seconds") "")
	(else " ")))


(define (setUnit unit) ; I found out the Scheme format of each character by typing the character in TeXmacs and then Edit-> Copy to -> TeXmacs Scheme
  (cond ((equal? unit "degrees") "<degree>")
	((equal? unit "minutes") "'")
	((equal? unit "seconds") "") ; Here the Github preview of the file shows just a pair of double quotes, but there are two characters inside
	(else unit)))



;; Add format to units (conditional definitions)
(tm-define (withFormat unitLst)
  (map (lambda (x) `(with "font-shape" "upright" ,(setUnit x))) unitLst))

(tm-define (withFormat unitLst)
  (:require (in-math?))
  (map (lambda (x) `(with "math-font-shape" "right" ,(setUnit x))) unitLst))

;; Interleaving taken from /home/giovanni/test/test TeXmacs/2 - Test/Test Scheme/testInterleave.scm
;; Combine with denestifyConditional, which (2020-11-17) needs to consider only the 'with symbol
;; write a drop-right function for Guile 1.8, it should be native in Guile 3
(define (concatenateUnits unitLst)
  (let ((uSpacer (unitSpacer))) 
    (drop-right
     (denestifyConditional (map (lambda (x)  (cons x (cons uSpacer (list)))) unitLst))
     1)))

;;; auxiliary functions


;; I need a list of symbols at which we stop denestification, and a test for presence in this list
;; I cannot use use the find function in srfi-1, see
;; https://www.gnu.org/software/guile/manual/html_node/SRFI_002d1-Searching.html
;; and load corresponding module
;; because it is not available in guile 1.8
  ;;
  ;; therefore I filter the list and then check that there is something in the filtered list
  ;; as I did in the formatRef program (manipulateList.scm)
  
(define stopDenestificationList '(with hspace)) 

  ;; (define (denestTest expr)
  ;;   (find (lambda (x) (equal? x expr)) stopDenestificationList))

(define (denestTest expr)
  (not (equal?
	(filter (lambda (x) (equal? x expr)) stopDenestificationList)
	'())))

  
;; First version of denestify, which stops only at the symbol 'with
;;     (define (denestifyConditional lst)
;; (cond ((null? lst) '())
;;       ((pair? (car lst))
;; 	 (if (equal? (car (car lst)) 'with) ; If the car of lst is 'with, we cons it
;; 	     (cons (car lst)
;; 		   (denestifyConditional (cdr lst)))
;; 	     ;; otherwise we append it
;; 	     (append (denestifyConditional (car lst))
;; 		     (denestifyConditional (cdr lst)))))
;; 	;; (car lst) is an atom
;; 	 (else (if (equal? (car lst) 'with)
;; 		  lst ;; in this code we simply leave lst as it is (we do not need to protect it)
;; 		  (cons (car lst) (denestifyConditional (cdr lst)))))))
  

  ;; Second version of denestify, that stops at a list of symbols checked using the denestTest function (which uses the list stopDenestificationList)
  (define (denestifyConditional lst)
    (cond ((null? lst) '())
	  ((pair? (car lst))
	   (if (denestTest (car (car lst))) ; If the car of (car lst) is 'with or another of the symbols in denestTest, we cons it
	       (cons (car lst)
		     (denestifyConditional (cdr lst)))
	       ;; otherwise we append it
	       (append (denestifyConditional (car lst))
		       (denestifyConditional (cdr lst)))))
	  ;; (car lst) is an atom
	  (else (if (denestTest (car lst)) ; test for presence of (car lst) in the list of symbols that stop denestification
		    lst ;; in this code we simply leave lst as it is (we do not need to protect it)
		    (cons (car lst) (denestifyConditional (cdr lst)))))))

  ;; For guile 1.8
(define (drop-right lst k) (reverse (list-tail (reverse lst) k)))

;; For the tests on presence of strings in the Scheme output
;; https://stackoverflow.com/questions/33338078/flattening-a-list-in-scheme
;; answer https://stackoverflow.com/a/33338401
;; denestifyConditional are adaptation of this
(define (denestify lst)
  (cond ((null? lst) '())
        ((pair? (car lst))
         (append (denestify (car lst))
                 (denestify (cdr lst))))
        (else (cons (car lst) (denestify (cdr lst))))))

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

;;; Tests

;; test find function of srfi-1
  
;; (find (lambda (x) (equal? x 'with)) '(with hspace))

;; (if  (find (lambda (x) (equal? x 'with)) '(with hspace))
;;      "ok"
;;      "not ok")
  ;;

  
  
