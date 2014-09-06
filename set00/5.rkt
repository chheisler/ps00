;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 5 for Lesson 0.4
; The definition of a function which computers the square of a number

; sq : Number -> Number
; GIVEN: any number
; RETURNS: the square of that number
; Examples:
; (sq 4) => 16
; (sq 14.2) => 201.64
; (sq -3) => 9
(define (sq x)
  (* x x))

; tests for sq
(check-expect (sq 4) 16)
(check-expect (sq 14.2) 201.64)
(check-expect (sq -3) 9)