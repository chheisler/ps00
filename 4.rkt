;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; tip : NonNegNumber Number[0.0,1.0] -> Number
; GIVEN: the amount of the bill in dollars and the
; percentag of tip
; RETURNS: the amount of the tip in dollars
; Examples:
; (tip 10 0.15) => 1.5
; (tip 20 0.17) => 3.4
(define (tip bill percentage)
  (* bill percentage 1))
  
; tests
(tip 10 0.15)
(tip 20 0.17)