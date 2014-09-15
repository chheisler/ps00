;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 11 for Lesson 0.4
; Definition of a struct point which represents a point
; on a two dimensional field and contracts for its functions

; A Point is a
; (make-point Real Real)
;
; Interpretation:
; x is the position on the x-axis
; y is the position on the y-axis
;
; point-fn : Point -> ??
; (define (point-fn point)
;   (...
;     (point-x point)
;     (point-y point)))
(define-struct point (x y))

; make-point : Real Real -> Point
; GIVEN an x and y position
; RETURNS a point at that position on a 2D plane
; Examples:
; (make-point 12 16) => (make-point 12 16)

; point? : Any -> Boolean
; GIVEN any value
; RETURNS whether the value is a Point
; Examples:
; (point? (make-point 5 4)) => true
; (point? "Hodor!") => false

; point-x : Point -> Real
; GIVEN a point on a 2D plane
; RETURNS its position on the x-axis
; Examples:
; (point-x (make-point 3 5)) => 3
; (point-x (make-point 7 2)) => 7

; point-y : Point -> Real
; GIVEN a point on a 2D plane
; RETURNS its position on the y-axis
; Examples:
; (point-y (make-point 3 5)) => 5
; (pointpy (make-point 7 2)) => 2

; tests for point functions
(check-expect (make-point 12 16) (make-point 12 16))
(check-expect (point? (make-point  5 4)) true)
(check-expect (point? "Hodor!") false)
(check-expect (point-x (make-point 3 5)) 3)
(check-expect (point-x (make-point 7 2)) 7)
(check-expect (point-y (make-point 3 5)) 5)
(check-expect (point-y (make-point 7 2)) 2)

; make point functions available to other modules
(require "./extras.rkt")
(provide make-point)
(provide point?)
(provide point-x)
(provide point-y)