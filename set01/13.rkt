;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |13|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 13 for Lesson 0.4
; Tests to see if predictions for constructing
; Point with Boolean and accessing it are
; correct

; import Point functions from exercise 11
(require "./11.rkt")

; tests for predictions
; make-point should accept Booleans and assign
; and return a point with them for its x and
; y values
(check-expect (make-point true false) (make-point true false))
(check-expect (point-x (make-point true false)) true)