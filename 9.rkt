;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 9 for Lesson 0.4
; Definition of a predicate even-int? which tells whether
; an integer is even or not

; even-int? : Integer -> Boolean
; GIVEN: an integer
; RETURNS: whether the integer is even.
; Examples:
; (even-int? 2) => true
; (even-int? 5) => false
; (even-int? -3) => false
; (even-int? 0) => true
; (even-int? -8) => true
(define (even-int? x)
  (= (modulo x 2) 0))

; tests for even-int?
(check-expect (even-int? 2) true)
(check-expect (even-int? 5) false)
(check-expect (even-int? -3) false)
(check-expect (even-int? 0) true)
(check-expect (even-int? -8) true)