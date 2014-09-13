;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |18|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 18 for Lesson 0.4
; Definition of a function which given an index in a sequence
; returns a rectangle with dimensions matching the pattern
; seen in exercise 17

(require 2htdp/image)

; the next two rectangles in the sequence will be 32x64 and 64x128
; indexing from 1, the dimensions of the nth rectangle are given by
; the formula 2^(n)x2^(n+1)

; rec-sequence : PosInt -> Rectangle
; GIVEN an index in the sequence of rectangles where the nth rectangle
; has the dimensions [2^(n)]x[2^(n+1)]
; RETURNS a solid blue rectangle with those dimensions
; Examples:
; (rec-sequence 1) => (rectangle 2 4 "solid" "blue")
; (rec-sequence 3) => (rectangle 8 16 "solid" "blue")
; (rec-sequence 5) => (rectangle 32 64 "solid" "blue")
(define (rec-sequence n) (rectangle (expt 2 n) (expt 2 (+ n 1))"solid" "blue"))

; tests for rec-sequence
(check-expect (rec-sequence 1) (rectangle 2 4 "solid" "blue"))
(check-expect (rec-sequence 3) (rectangle 8 16 "solid" "blue"))
(check-expect (rec-sequence 5) (rectangle 32 64 "solid" "blue"))
