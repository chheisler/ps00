;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |22|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 22 for Lesson 0.4
; An expression whose value is a list of
; the numbers 1-5

(cons 1 (cons 2(cons 3 (cons 4 (cons 5 empty)))))