;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |19|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 19 for Lesson 0.4
; Definition of a function given a width and proportion
; returns a solid blue rectangle of that width a with
; height equal to the product of the width and proportion

(require 2htdp/image)

; rel-rec-sequence: Number Number -> Rectangle
; GIVEN two numbers
; RETURNS a solid blue rectangle, where the first number is the width
; of the rectangle, and the second number is the proportion of width
; and height of the rectangle to be produced (i.e. height = width * proportion).
; Examples:
; (rel-rec-sequence 5 1) => (rectangle 5 5 "solid" "blue")
; (rel-rec-sequence 11 2) => (rectangle 11 22 "solid" "blue")
; (rel-rec-sequence 8 0.5) => (rectangle 8 4 "solid" "blue")
(define (rel-rec-sequence width proportion)
  (rectangle width (* width proportion) "solid" "blue"))

; tests for rel-rec-sequence
(check-expect (rel-rec-sequence 5 1)
  (rectangle 5 5 "solid" "blue"))
(check-expect (rel-rec-sequence 11 2)
  (rectangle 11 22 "solid" "blue"))
(check-expect (rel-rec-sequence 8 0.5)
  (rectangle 8 4 "solid" "blue"))