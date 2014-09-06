;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 10 for Lesson 0.4
; Definition of a function which takes three numbers
; and sums the two largest of them

; sum-top-2 : Number Number Number -> Number
; GIVEN: 3 numbers
; RETURNS: the sum of the two largest
; Examples:
; (sum-top-2 4 29 1) => 33
; (sum-top-2 6 89 10) => 99
; (sum-top-2 11 3 11) => 22
(define (sum-top-2 x y z)
  (cond
    [(and (>= x z)(>= y z)) (+ x y)]
    [(and (>= x y)(>= z y)) (+ x z)]
    [else (+ y z)]))

; tests for sum-top-2
(check-expect (sum-top-2 4 29 1) 33)
(check-expect (sum-top-2 6 89 10) 99)
(check-expect (sum-top-2 11 3 11) 22)