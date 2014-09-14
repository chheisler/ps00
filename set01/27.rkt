;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |27|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 27 for Lesson 0.4
; Definition of a function which takes a list of strings
; and draw their combined text

(require 2htdp/image)

; list-length : List -> NonNegInt
; GIVEN a list
; RETURNS the length of the list
; Examples:
; (list-length empty) => 0
; (list-length (list 4)) => 1
; (list-length (list 5 3 2)) => 3
(define (list-length lst)
  (cond
    [(empty? lst) 0]
    [else (+ 1 (list-length (rest lst)))]))

; combined-string : ListOfString -> String
; GIVEN a list of strings
; RETURNS the strings combined and separated by spaces
; Examples:
; (combined-string (list "Hello" "world!")) => "Hello world!"
; (combined-string empty
(define (combined-string string-list)
  (cond
    [(empty? string-list) ""]
    [(= (list-length string-list) 1) (first string-list)]
    [else (string-append (first string-list) " "
      (combined-string (rest string-list)))]))

(define (strings-image string-list)
  (text (combined-string string-list) 12 "black"))

(list-length empty)
(list-length (list 2 41 432 1 3))
(strings-image (list "Hello" "World" "What" "Is" "Up"))

; make list-length available in other modules
(require "./extras.rkt")
(provide list-length)