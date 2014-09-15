;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |28|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 28 for Lesson 0.4
; Definition of a funcion which draws a list of strings
; with each string on a new line

; import image module and list-length from exercise 27
(require 2htdp/image)
(require "./27.rkt")

; document-image : ListOfString -> Image
; GIVEN a list of strings
; RETURNS an image of the stings separated by linebreaks
; Examples:
; (document-image (list "This" "is" "a" "list.")) =>
;   (above/align "left" (text "This" 12 "black") (text "is" 12 "black")
;     (text "a" 12 "black") (text "list." 12 "black"))
; (document-image (list "This sentence will" "wrap two lines.")) =>
;   (above/align "left" (text "This sentence will" 12 "black")
;     (text "wrap two lines." 12 "black"))
; (document-image empty) => (text "" 12 "black")
; (document-image (list "Just one line.")) =>
;   (text "Just one line." 12 "black")
(define (document-image string-list)
  (cond
    [(empty? string-list) (text "" 12 "black")]
    [(= (list-length string-list) 1) (text (first string-list) 12 "black")]
    [else (above/align "left" (text (first string-list) 12 "black")
      (document-image (rest string-list)))]))

; tests for document-image
(check-expect (document-image (list "This" "is" "a" "list."))
  (above/align "left" (text "This" 12 "black") (text "is" 12 "black")
    (text "a" 12 "black") (text "list." 12 "black")))
(check-expect (document-image (list "This sentence will" "wrap two lines."))
  (above/align "left" (text "This sentence will" 12 "black")
    (text "wrap two lines." 12 "black")))
(check-expect (document-image empty) (text "" 12 "black"))
(check-expect (document-image (list "Just one line."))
  (text "Just one line." 12 "black"))