;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |21|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 21 for Lesson 0.4
; A definition of a Person datatype and a
; function which given a Person draws them.

(require 2htdp/image)

#|-----------------------------------|#
#| data definition for Person struct |#
#|-----------------------------------|#

; A Person is a
; (make-person String String NonNegInt PosReal PosReal
;
; Interpretation:
; first-name is the person's first name
; last-name is the person's last name
; age is the person's age in years
; height is the person's height in centimeters
; weight is the person's weight in kilograms
;
; person-fn : Person -> ??
; (define (person-fn person)
;   (...
;     (person-first-name person)
;     (person-last-name person)
;     (person-age person)
;     (person-height person)
;     (person-weight person)))
(define-struct person (first-name last-name age height weight))


#|------------------------------------------------|#
#| helpers for calculating the size of body parts |#
#|------------------------------------------------|#

; definitions for body proportions
(define HEAD-PROP 0.25)
(define TORSO-HEIGHT 0.375)
(define ARM-HEIGHT 0.35)
(define LEG-HEIGHT 0.375)
(define TORSO-WIDTH 0.6)
(define ARM-WIDTH 0.2)
(define LEG-WIDTH 0.25)

; definitions for gaps between body parts
(define ARM-GAP 2)
(define LEG-GAP 4)

; part-height : Person String -> PosReal
; GIVEN a person and a body part
; WHERE part is one of "head", "torso", "arm" or "leg"
; RETURNS the height of that body part
; Examples:
; (part-height (make-person "John" "Doe" 25 175 75) "torso") =>
;   (* 175 TORSO-HEIGHT)
(define (part-height person part)
  (cond
    [(equal? part "head") (/ (* (person-height person) HEAD-PROP) 2)]
    [(equal? part "torso") (* (person-height person) TORSO-HEIGHT)]
    [(equal? part "arm") (* (person-height person) ARM-HEIGHT)]
    [(equal? part "leg") (* (person-height person) LEG-HEIGHT)]))

; part-width : Person String -> PosReal
; GIVEN a person and a body part
; WHERE part is oen of "torso", "arm" or "leg"
; RETURNS the width of that body part
; Examples:
; (part-width (make-person "John "Doe" 25 175 75) "leg") =>
;    (* 75 LEG-WIDTH)
(define (part-width person part)
  (cond
    [(equal? part "torso") (* (person-weight person) TORSO-WIDTH)]
    [(equal? part "arm") (* (person-weight person) ARM-WIDTH)]
    [(equal? part "leg") (* (person-weight person) LEG-WIDTH)]))

; tests for height and width functions
(check-expect (part-height (make-person "John" "Doe" 25 175 75) "torso")
  (* 175 TORSO-HEIGHT))
(check-expect (part-width (make-person "John" "Doe" 25 175 75) "leg")
  (* 75 LEG-WIDTH))


#|--------------------------------|#
#| helpers for drawing body parts |#
#|--------------------------------|#

; head-image : Person -> Circle
; GIVEN a person
; RETURNS a circle representing their head
; Examples:
; (head-image (make-person "John" "Doe" 25 175 75)) =>
;   (circle (* 175 HEAD-PROP) "solid" "black")
(define (head-image person)
  (circle (part-height person "head") "solid" "black"))
  
; torso-image : Person -> Rectangle
; GIVEN a person
; RETURNS a rectangle representing their torso
; Examples:
; (torso-image (make-person "John" "Doe" 25 175 75)) =>
;   (rectangle (* 75 TORSO-WIDTH) (* 175 TORSO-HEIGHT) "solid" "black")
(define (torso-image person)
  (rectangle (part-width person "torso")
    (part-height person "torso") "solid" "black"))
   
; arm-image : Person -> Rectangle
; GIVEN a person
; RETURNS a rectangle representing their arm
; Examples:
; (arm-image (make-person "John" "Doe" 25 175 75)) =>
;   (rectangle (* 75 ARM-WIDTH) (* 175 ARM-HEIGHT) "solid" "black")
(define (arm-image person)
  (rectangle (part-width person "arm")
    (part-height person "arm") "solid" "black"))

; arm-gap-image : Person -> Rectangle
; GIVEN a person
; RETURNS a rectangle representing the gap between their arm and torso
; Examples:
; (arm-gap-image (make-person "John" "Doe" 25 175 75)) =>
;   (rectangle ARM-GAP (* 175 TORSO-HEIGHT) "solid" "white")
(define (arm-gap-image person)
  (rectangle ARM-GAP (part-height person "torso") "solid" "white"))
  
; upper-body-image : Person -> Image
; GIVEN a person
; RETURNS a set of rectangles representing their upper body
; Examples:
; (upper-body-image (make-person "John" "Doe" 25 175 75)) =>
; (beside (arm-image (make-person "John" "Doe" 25 175 75))
;   (arm-gap-image (make-person "John" "Doe" 25 175 75))
;   (torso-image (make-person "John" "Doe" 25 175 75))
;   (arm-gap-image (make-person "John" "Doe" 25 175 75))
;   (arm-image (make-person "John" "Doe" 25 175 75)))
(define (upper-body-image person)
  (beside (arm-image person)
    (arm-gap-image person)
    (torso-image person)
    (arm-gap-image person)
    (arm-image person)))

; leg-image : Person -> Rectangle
; GIVEN a person
; RETURNS a solid black rectangle representing their leg
; Examples:
; (leg-image (make-person "John" "Doe" 25 175 75)) =>
;   (rectangle (* LEG-WIDTH 75) (* LEG-HEIGHT 175) "solid" "black")
(define (leg-image person)
  (rectangle (part-width person "leg")
    (part-height person "leg") "solid" "black"))

; leg-gap-image : Person -> Rectangle
; GIVEN a person
; RETURNS a solid white rectangle reprsenting the gap between their legs
; Examples:
; (leg-gap-image (make-person "John" "Doe" 25 175 75)) =>
;   (rectangle LEG-GAP (* LEG-HEIGHT 175) "solid" "white")
(define (leg-gap-image person)
  (rectangle LEG-GAP (part-height person "leg") "solid" "white"))

; lower-body-image : Person -> Image
; GIVEN a person
; RETURNS an image representing their lower body
; Examples:
; (lower-body-image (make-person "John" "Doe" 25 175 75)) =>
;   (beside (leg-image (make-person "John" "Doe" 25 175 75))
;     (leg-gap-image (make-person "John" "Doe" 25 175 75))
;     (leg-image (make-person "John" "Doe" 25 175 75)))
(define (lower-body-image person)
  (beside (leg-image person)
  (leg-gap-image person)
  (leg-image person)))

; tests for body part drawing functions
(check-expect (head-image (make-person "John" "Doe" 25 175 75))
  (circle (/ (* 175 HEAD-PROP) 2) "solid" "black"))
(check-expect (torso-image (make-person "John" "Doe" 25 175 75))
  (rectangle (* 75 TORSO-WIDTH) (* 175 TORSO-HEIGHT) "solid" "black"))
(check-expect (arm-image (make-person "John" "Doe" 25 175 75))
  (rectangle (* 75 ARM-WIDTH) (* 175 ARM-HEIGHT) "solid" "black"))
(check-expect (arm-gap-image (make-person "John" "Doe" 25 175 75))
  (rectangle ARM-GAP (* 175 TORSO-HEIGHT) "solid" "white"))
(check-expect (upper-body-image (make-person "John" "Doe" 25 175 75))
  (beside (arm-image (make-person "John" "Doe" 25 175 75))
    (arm-gap-image (make-person "John" "Doe" 25 175 75))
    (torso-image (make-person "John" "Doe" 25 175 75))
    (arm-gap-image (make-person "John" "Doe" 25 175 75))
     (arm-image (make-person "John" "Doe" 25 175 75))))
(check-expect (leg-image (make-person "John" "Doe" 25 175 75))
  (rectangle (* LEG-WIDTH 75) (* LEG-HEIGHT 175) "solid" "black"))
(check-expect (leg-gap-image (make-person "John" "Doe" 25 175 75))
  (rectangle LEG-GAP (* LEG-HEIGHT 175) "solid" "white"))
(check-expect (lower-body-image (make-person "John" "Doe" 25 175 75))
  (beside (leg-image (make-person "John" "Doe" 25 175 75))
    (leg-gap-image (make-person "John" "Doe" 25 175 75))
    (leg-image (make-person "John" "Doe" 25 175 75))))


#|-----------------------------|#
#| definition for person-image |#
#|-----------------------------|#
  
; person-image : Person -> Image
; GIVEN a person
; RETURNS an image representing that person based on their height
; Examples:
; (person-image (make-person "John" "Doe" 25 175 75)) =>
;   (above (head-image (make-person "John" "Doe" 25 175 75))
;     (upper-body-image (make-person "John" "Doe" 25 175 75))
;     (lower-body-image (make-person "John" "Doe" 25 175 75))
;     (text "John Doe" 16 "black"))
; (person-image (make-person "Jane" "Doe" 28 140 65)) =>
;   (above (head-image (make-person "Jane" "Doe" 28 140 65))
;     (upper-body-image (make-person "Jane" "Doe" 28 140 65))
;     (lower-body-image (make-person "Jane" "Doe" 28 140 65))
;     (text "Jane Doe" 16 "black"))
(define (person-image person)
  (above (head-image person)
  (upper-body-image person)
  (lower-body-image person)
  (text (string-append (person-first-name person)
    " " (person-last-name person)) 16 "black")))

; tests for person-image
(check-expect (person-image (make-person "John" "Doe" 25 175 75))
  (above (head-image (make-person "John" "Doe" 25 175 75))
    (upper-body-image (make-person "John" "Doe" 25 175 75))
    (lower-body-image (make-person "John" "Doe" 25 175 75))
    (text "John Doe" 16 "black")))
(check-expect (person-image (make-person "Jane" "Doe" 28 140 65))
  (above (head-image (make-person "Jane" "Doe" 28 140 65))
    (upper-body-image (make-person "Jane" "Doe" 28 140 65))
    (lower-body-image (make-person "Jane" "Doe" 28 140 65))
    (text "Jane Doe" 16 "black")))

; make make-person and person-image available to other modules
(require "./extras.rkt")
(provide make-person)
(provide person-image)
