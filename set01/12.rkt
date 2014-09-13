;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 12 for Lesson 0.4
; Tests to see if predictions for point functions
; return values are accurate

; import Point functions from exercise 11
(require "./11.rkt")

; tests for predictions
(check-expect (make-point 5 3) (make-point 5 3))
(check-expect (point? 5) false)
(check-expect (point? true) false)
(check-expect (point? (make-point 2 1)) true)
(check-expect (point-x (make-point 8 5)) 8)
(check-expect (point-y (make-point 42 15)) 15)