;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; sq : Number -> Number
; GIVEN: any number
; RETURNS: the square of that number
; Examples:
; (sq 4) => 16
; (sq 14.2) => 201.64
(define (sq x)
  (* x x))

; tests
(sq 4)
(sq 14.2)