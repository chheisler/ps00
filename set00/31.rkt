;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |31|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 31 for Lesson 0.4
; Definition of a function which takes a list of numbers and returns
; a list of circles whose radii are the numbers from the list

(require 2htdp/image)

; circle-list : ListOfNumber -> ListOfCircle
; GIVEN a list of numbers
; RETURNS a list of circles with radii equal to the values given
; Examples:
; (circle-list empty) => empty
; (circle-list (list 54 32 9)) =>
;   (list (circle 54 "solid" "black")
;     (circle 32 "solid" "black")
;     (circle 9 "solid" "black"))
; (circle-list (list 0.5 30.8)) =>
;   (list (circle 0.5 "solid" "black")
;     (circle 30.8 "solid" "black"))
(define (circle-list num-list)
  (cond
    [(empty? num-list) empty]
    [else (cons (circle (first num-list) "solid" "black")
      (circle-list (rest num-list)))]))

; tests for circle-list
(check-expect (circle-list empty) empty)
(check-expect (circle-list (list 54 32 9))
  (list (circle 54 "solid" "black")
    (circle 32 "solid" "black")
    (circle 9 "solid" "black")))
(check-expect (circle-list (list 0.5 30.8))
  (list (circle 0.5 "solid" "black")
    (circle 30.8 "solid" "black")))