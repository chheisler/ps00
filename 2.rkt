;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 2 for Lesson 0.4
; An expressions that returns true if the result
; of 100/3 is greather than the result of (100 + 3)/(3 + 3)
; and false otherwise
(cond
  [(> (/ 100 3) (/ (+ 100 3)(+ 3 3))) true]
  [else false])