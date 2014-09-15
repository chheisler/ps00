;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |24|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 24 for Lesson 0.4
; Definition for a function which takes a list of numbers
; and returns their product

; product : List -> Number
; GIVEN a list of numbers
; RETURNS the product of the numbers
; or 1 if the list is empty
; Examples:
; (product (list 3 3 5 1)) => 45
; (product empty) => 1
; (product (list 0.5 8 -5) => -20
(define (product num-list)
  (cond
    [(empty? num-list) 1]
    [else (* (first num-list) (product (rest num-list)))]))

; tets for product
(check-expect (product (list 3 3 5 1)) 45)
(check-expect (product empty) 1)
(check-expect (product (list 0.5 8 -5)) -20)