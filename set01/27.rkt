;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |27|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 27 for Lesson 0.4
; Definition of two function2 which take a list of strings
; and draw their combined text as an image

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

; tests for list-length
(check-expect (list-length empty) 0)
(check-expect (list-length (list 4)) 1)
(check-expect (list-length (list 5 3 2)) 3)

; joined-string : ListOfString -> String
; GIVEN a list of strings
; RETURNS the strings combined and separated by spaces
; Examples:
; (joined-string (list "Hello" "world!")) => "Hello world!"
; (joined-string empty) => ""
; (joined-string (list "This" "is" "a" "string.")) => "This is a string."
(define (joined-string string-list)
  (cond
    [(empty? string-list) ""]
    [(= (list-length string-list) 1) (first string-list)]
    [else (string-append (first string-list) " "
      (joined-string (rest string-list)))]))

; tests for joined-string
(check-expect (joined-string (list "Hello" "world!")) "Hello world!")
(check-expect (joined-string empty) "")
(check-expect (joined-string (list "This" "is" "a" "string."))
  "This is a string.")

; strings-image1 : ListOfString -> Image
; GIVEN a list of strings
; RETURNS an image of them joined by spaces
; Examples:
; (strings-image1 empty) => (text "" 12 "black")
; (strings-image1 (list "foo" "bar")) => (text "foo bar" 12 "black")
; (strings-image1 (list "I'm" "not" "good" "at" "making" "sentences")) =>
;   (text "I'm not good at making sentences" 12 "black")
(define (strings-image1 string-list)
  (text (joined-string string-list) 12 "black"))

; strings-image2 : ListOfString -> Image
; GIVEN a list of strings
; RETURNS an image of them joined by spaces
; Examples:
; (strings-image2 empty) => (text "" 12 "black")
; (strings-image2 (list "foo" "bar")) => (beside (text "foo" 12 "black")
;   (text "bar" 12 "black"))
; (strings-image2 (list "Hodor!")) => (text "Hodor!" 12 "black")
(define (strings-image2 string-list)
  (cond
    [(empty? string-list) (text "" 12 "black")]
    [(= (list-length string-list) 1) (text (first string-list) 12 "black")]
    [else (beside (text (first string-list) 12 "black")
      (strings-image2 (rest string-list)))]))

; tests for strings-image1 and strings-image2
(check-expect (strings-image1 empty) (text "" 12 "black"))
(check-expect (strings-image1 (list "foo" "bar")) (text "foo bar" 12 "black"))
(check-expect (strings-image1 (list "I'm" "not" "good" "at" "making" "sentences"))
  (text "I'm not good at making sentences" 12 "black"))
(check-expect (strings-image2 empty) (text "" 12 "black"))
(check-expect (strings-image2 (list "foo" "bar")) (beside (text "foo" 12 "black")
  (text "bar" 12 "black")))
(check-expect (strings-image2 (list "Hodor!")) (text "Hodor!" 12 "black"))

; make list-length available in other modules
(require "./extras.rkt")
(provide list-length)