;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |32|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 32 for Lesson 0.4
; The definition of a function which takes a list of points
; and returns the sum of their distances from (0,0)

;import point functions from exercise 11
(require "./11.rkt")

; dist-from-origin : Point -> NonNegReal
; GIVEN a point on a 2D plane
; RETURNS its distance from the origin (0,0)
; using Manhattan distance
; Examples
; (dist-from-origin (make-point 0 0)) => 0
; (dist-from-origin (make-point -5 -3)) => 8
; (dist-from-origin (make-point 11 2)) => 13
(define (dist-from-origin point)
  (+ (abs (point-x point)) (abs (point-y point))))
  
; total-distance : ListOfPoint -> NonNegReal
; GIVEN a list of points on a 2D plane
; RETURNS the sum of their total distances
; from the origin (0,0) using Manhattan distance
; Examples:
; (total-distance empty) => 0
; (total-distance (list (make-point 4 -8) (make-point -1 -4))) => 17
; (total-distance (list (make-point -10 4))) => 14
(define (total-distance point-list)
  (cond
    [(empty? point-list) 0]
    [else (+ (dist-from-origin (first point-list))
      (total-distance (rest point-list)))]))

; tests for dist-from-origin
(check-expect (dist-from-origin (make-point 0 0)) 0)
(check-expect (dist-from-origin (make-point -5 -3)) 8)
(check-expect (dist-from-origin (make-point 11 2)) 13)

; tests for total-distance
(check-expect (total-distance empty) 0)
(check-expect (total-distance (list (make-point 4 -8) (make-point -1 -4))) 17)
(check-expect (total-distance (list (make-point -10 4))) 14)