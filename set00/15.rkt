;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 15 for Lesson 0.4
; struct definition for a Student type
; and comments describing its fields
; and their interpretations

; A Student is a
; (make-student PosInt String String)
;
; Interpretation:
; id is a positive integer uniquely identifying the student
; name is the full name of the student
; major is the name of the student's major
;
; student-fn : Student -> ??
; (define (student-fn student)
;   (...
;     (student-id student)
;     (student-name student)
;     (student-major student)))
(define-struct student (id name major))