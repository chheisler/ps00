;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |16|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Exercise 16 for Lesson 0.4
; Definition of my-image using a local image file
; and a few simple tests with it using the image module

; import the image module
(require 2htdp/image)

; define our image using a local file
(define my-image (bitmap "./proper.png"))

; play around with it to make sure it works
(above my-image my-image my-image)
(beside my-image my-image my-image)
(place-image my-image 20 60 my-image)