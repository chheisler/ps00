;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |30|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 30 for Lesson 0.4
; Definition of a function which takes a list of boolenas
; and returns a list where their values have been swapped.

; not-list : ListOfBoolean ->  ListOfBoolean
; GIVEN a list of booleans
; RETURNS a list of equal size with each value
; switched by a logical NOT
; Examples:
; (not-list (list true true false)) => (list false false true)
; (not-list (list false true false)) => (list true false true)
; (not-list empty) => empty
(define (not-list bool-list)
  (cond
    [(empty? bool-list) empty]
    [else (cons (not (first bool-list))(not-list (rest bool-list)))]))

; tests for not-list
(check-expect (not-list (list true true false)) (list false false true))
(check-expect (not-list (list false true false)) (list true false true))
(check-expect (not-list empty) empty)