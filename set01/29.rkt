;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |29|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 29 for Lesson 0.4
; Definition of a function which given a list of Person
; data structs creates a group photograph of them

; import image module and person-image function from
; exercise 21
(require 2htdp/image)
(require "./21.rkt")

; group-photo : ListOfPerson -> Image
; GIVEN a list of people
; RETURNS an image with those people standing side by side
; Examples:
; (group-photo (list 
;   (make-person "Bob" "Johnson" 32 180 80)
;   (make-person "Jane" "Doe" 28 140 65))) =>
;     (beside/align "bottom" 
;       (person-image (make-person "Bob" "Johnson" 32 180 80))
;       (person-image (make-person "Jane" "Doe" 28 140 65)))
;       (empty-scene 0 0)
; (group-photo (list (make-person "Jane" "Doe" 28 140 65))) =>
;   (beside/align "bottom"
;     (person-image (make-person "Jane" "Doe" 28 140 65))
;     (empty-scene 0 0))
; (group-photo empty) => (empty-scene 0 0)
(define (group-photo person-list)
  (cond
    [(empty? person-list) (empty-scene 0 0)]
    [else (beside/align "bottom"
      (person-image (first person-list))
      (group-photo (rest person-list)))]))

; tests for group-photo
(check-expect (group-photo (list 
  (make-person "Bob" "Johnson" 32 180 80)
  (make-person "Jane" "Doe" 28 140 65)))
  (beside/align "bottom" 
    (person-image (make-person "Bob" "Johnson" 32 180 80))
    (person-image (make-person "Jane" "Doe" 28 140 65))
    (empty-scene 0 0)))
(check-expect (group-photo (list (make-person "Jane" "Doe" 28 140 65)))
  (beside/align "bottom"
    (person-image (make-person "Jane" "Doe" 28 140 65))
    (empty-scene 0 0)))
(check-expect (group-photo empty) (empty-scene 0 0))