;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |20|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 20 for Lesson 0.4
; Module which draw a human shape using
; the function provided by the image
; library

(require 2htdp/image)
(define head (circle 16 "solid" "black"))
(define arm (rectangle 15 40 "solid" "black"))
(define arm-gap (rectangle 2 50 "solid" "white"))
(define torso (rectangle 40 50 "solid" "black"))
(define leg (rectangle 18 50 "solid" "black"))
(define leg-gap (rectangle 4 50 "solid" "white"))
(above head (beside arm arm-gap torso arm-gap arm) (beside leg leg-gap leg))