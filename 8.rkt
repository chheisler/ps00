;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 8 for Lesson 0.4
; The definition of a function which calculates the area of
; a circle

; circle-area : Number -> Number
; GIVEN: the radius r of a circle
; RETURNS: its area, using the formula pi * r ^ 2
; Examples:
; (circle-area 1) => 3.141592653589793
; (circle-area 5) => 78.53981633974483
; (circle-area 7) => 153.93804002589985
(define (circle-area r)
  (* pi r r))

; tests for circle-area
(check-within (circle-area 1) 3.141592653589793 3.141592653589794)
(check-within (circle-area 5) 78.53981633974482 78.53981633974483)
(check-within (circle-area 7) 153.93804002589984 153.93804002589985)