;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |25|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 25 for Lesson 0.4
; Definition of a function which takes a list of booleans
; and returns true if all of them are true, else false

; all-true? : ListOfBoolean -> Boolean
; GIVEN a list of booleans
; RETURNS true if the list is empty
; or all of its elements are true
; otherwise returns false
; Examples:
; (all-true? (list true true true)) => true
; (all-true? (list true true false)) => false
; (all-true? empty) => true
(define (all-true? bool-list)
  (cond
    [(empty? bool-list) true]
    [else (and (first bool-list)(all-true? (rest bool-list)))]))

; tests for all-true?
(check-expect (all-true? (list true true true)) true)
(check-expect (all-true? (list true true false)) false)
(check-expect (all-true? empty) true)