;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |26|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 26 for Lesson 0.4
; Definition of a function which takes a list of Points
; and draws them onto an image

; import Point functions from exercise 11 and image pack
(require 2htdp/image)
(require "./11.rkt")

; points-image : ListOfPoint -> Image
; GIVEN a list of points
; RETURNS a 300x300 white field with a blue circle
; drawn at the location of every point in the list
; Examples:
; (points-image (list (make-point 100 203)
;   (make-point 22 76) (make-point 8 40))) =>
;     (place-image (circle 10 "solid" "blue") 100 203
;       (place-image (circle 10 "solid" "blue") 22 76
;         (place-image (circle 10 "solid" "blue" 8 40 (empty-scene 300 300))))
; (points-image empty) => (empty-scene 300 300)
(define (points-image point-list)
  (cond
    [(empty? point-list) (empty-scene 300 300)]
    [else (place-image (circle 10 "solid" "blue")
      (point-x (first point-list))
      (point-y (first point-list))
      (points-image (rest point-list)))]))

; tests for points-image
(check-expect (points-image (list (make-point 100 203)
  (make-point 22 76) (make-point 8 40)))
  (place-image (circle 10 "solid" "blue") 100 203
    (place-image (circle 10 "solid" "blue") 22 76
      (place-image (circle 10 "solid" "blue") 8 40 (empty-scene 300 300)))))
(check-expect (points-image empty) (empty-scene 300 300))