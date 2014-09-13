;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 17 for Lesson 0.4
; Creating several blue rectangles with the
; dimensions 2x4, 4x8, 8x16 and 16x32

(require 2htdp/image)
(rectangle 2 4 "solid" "blue")
(rectangle 4 8 "solid" "blue")
(rectangle 8 16 "solid" "blue")
(rectangle 16 32 "solid" "blue")