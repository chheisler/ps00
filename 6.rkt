;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; quadratic-root : Number Number Number -> Number
; GIVEN: the variables a, b and c for a quadratic equation
; RETURNS: the root for the quadratic equation
; Examples:
; (quadratic-root 1 2 1) => -1
; (quadratic-root 4 8 3) => -0.5
(define (quadratic-root a b c)
  (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))