;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 3 for Lesson 0.4
; The definition for a function that converts temperature from
; Fahrenheit to Celcius

; f->c : Number -> Number
; GIVEN: a temperature in degrees Fahrenheit as an argument
; RETURNS: the equivalent temperature in degrees Celcius.
; Examples:
; (f->c 32) => 0
; (f->c 100) => 37.77777777777778
(define (f->c f)
  (* (- f 32) (/ 5 9)))

;tests for f->c
(check-expect (f->c 32) 0)
(check-within (f->c 100) 37.77777777777777 37.77777777777778)
(check-expect (f->c 212) 100)