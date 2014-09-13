;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |14|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 14 for Lesson 0.4
; defines a Student struct with id, name and major
; and tests that the following predicted functions
; exist and work as expected.

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

; defining the Student structure should have created:
;   make-student
;   student?
;   student-id
;   student-name

; make-student : PosInt String String -> Student
; GIVEN an ID, name and a major
; RETURNS a student with that ID, name and major
; Examples:
; (make-student 101 "Alphonse Elric" "Alchemy") =>
;   (make-student 101 "Alphonse Elric" "Alchemy")

; student? : Any -> Boolean
; GIVEN any value
; RETURNS whether the value is a Student
; Examples:
; (student? (make-student 101 "Alphonse Elric" "Alchemy")) => true
; (student? "Narp!") => false

; student-id : Student -> PosInt
; GIVEN a student
; RETURNS the ID of the student
; Examples:
; (student-id (make-student 101 "Alphonse Elric" "Alchemy")) => 101
; (student-id (make-student 42 "Samwell Tarly" "History")) => 42

; student-name : Student -> String
; GIVEN a student
; RETURNS the name of the student
; Examples
; (student-name (make-student 101 "Alphonse Elric" "Alchemy")) =>
;   "Alphonse Elric"
; (student-name (make-student 42 "Samwell Tarly" "History")) =>
;   "Samwell Tarly"

; student-major : Student -> String
; GIVEN a student
; RETURNS the student's major
; Examples
; (student-major (make-student 101 "Alphonse Elric" "Alchemy")) =>
;   "Alchemy"
; (student-major (make-student 42 "Samwell Tarly" "History")) =>
;   "History"

; tests for predicted functions
(check-expect (make-student 101 "Alphonse Elric" "Alchemy")
  (make-student 101 "Alphonse Elric" "Alchemy"))
(check-expect (student? (make-student 101 "Alphonse Elric"
  "Alchemy")) true)
(check-expect (student? "Narp!") false)
(check-expect (student-id (make-student 101 "Alphonse Elric" "Alchemy")) 101)
(check-expect (student-id (make-student 42 "Samwell Tarly" "History")) 42)
(check-expect (student-name (make-student 101 "Alphonse Elric" "Alchemy"))
  "Alphonse Elric")
(check-expect (student-name (make-student 42 "Samwell Tarly" "History"))
  "Samwell Tarly")
(check-expect (student-major (make-student 101 "Alphonse Elric" "Alchemy"))
  "Alchemy")
(check-expect (student-major (make-student 42 "Samwell Tarly" "History"))
  "History")