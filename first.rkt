#|
(+ 1 2)
(- 2 4325)
(/ 4 5)    ;=> 0.8
(sqr 3)
(expt 2 3)
(sin 0)
(cos pi)

(+ 2 (+ 3 4))
(+ 2 3 4 5)

(+ 2 (+ (* 3 3) 4))
(+ 2 (+ (* 3 (/ 12 4)) 4))

(+ 1 2)

(string-append "hello" "world")
(string-append "hello " "world")
(string-append "hell" "o world")
"hello world"
(string-append "hello" " " "world")
(string-length "hello world")

(+ 2 (string-length "hello world"))

(number->string 42)
(string->number "42")

(string->number "Hello World")
;; Boolean
true false

; (and x y)
(and true true)
(and true false)

(or true false)
(or false false)
(not false)
(not true)

(>= 10 10)
(<= -1 0)

(string=? "design" "tinker")

(and (or (= (string-length "hello world")
            (string->number "11"))
         (string=? "hello world" "good morning"))
     (>= (+ (string-length "hello world")
            60)
         80))

(require 2htdp/image)

(* (image-width <>)
   (image-height <>))
(circle 10 "solid" "red")   
(rectangle 30 20 "outline" "blue")

(overlay (circle 5 "solid" "red")
         (rectangle 20 20 "solid" "blue"))
         
(overlay (rectangle 20 20 "solid" "blue")
         (circle 5 "solid" "red"))
(image-width (square 10 "solid" "red"))
(image-width
  (overlay (rectangle 20 20 "solid" "blue")
           (circle 5 "solid" "red")))
           
(place-image (circle 5 "solid" "green")
             50 80
             (empty-scene 100 100))

; x =  1    2     3    4    5
; y =  2    4     6    8    10

(define (y x) (* x 2))
(y 1)
(y 2)
(y 3)
(y 4)
(y 5)

;; (define (nombre-funcion nombre-de-argumentos) expresion-cuerpo)
;; (nombre-funcion parametros)

(empty-scene 100 100)

(place-image <> 50 0 (empty-scene 100 100))
(place-image <> 50 10 (empty-scene 100 100))
(place-image <> 50 20 (empty-scene 100 100))
(place-image <> 50 30 (empty-scene 100 100))
|#

;; -------------------------------------------------------------------

(require 2htdp/image)
(require 2htdp/universe)

(define (create-rocket-scene height)
  (place-image <> 50 height (empty-scene 100 100)))
  
; (create-rocket-scene 0)
; (animate create-rocket-scene)

;         +1 if x > 0
; f(x) =   0 if x = 0
;         -1 if x < 0

(define (sign x)
  (cond
    [(> x 0)   1]
    [(= x 0)   0]
    [(< x 0)  -1]))
    
; (sign 10)
; (sign -5)
; (sign 0)

(define (create-rocket-scene.v2 height)
  (cond
    [(<= height 100)
     (place-image <> 50 height (empty-scene 100 100))]
    [(> height 100)
     (place-image <> 50 100 (empty-scene 100 100))]))
     
; (animate create-rocket-scene.v2)

; (create-rocket-scene.v2 5000)

; (- 100 (/ (image-height <>) 2))

; (place-image <> 50 (- 100 (/ (image-height <>) 2))
;              (empty-scene 100 100))

(define (create-rocket-scene.v3 height)
  (cond
    [(<= height 79)
     (place-image <> 50 height (empty-scene 100 100))]
    [(> height 79)
     (place-image <> 50 79 (empty-scene 100 100))]))

; (animate create-rocket-scene.v3)

(define HEIGHT   100)
(define WIDTH    100)

(define ROCKET <>)
(define ROCKET-X (/ WIDTH 2))
(define ROCKET-CENTER-TO-BOTTOM (- HEIGHT
                                   (/ (image-height ROCKET) 2)))

(define (create-rocket-scene.v4 h)
  (cond
    [(<= h ROCKET-CENTER-TO-BOTTOM)
     (place-image ROCKET ROCKET-X h (empty-scene WIDTH HEIGHT))]
    [(> h ROCKET-CENTER-TO-BOTTOM)
     (place-image ROCKET ROCKET-X ROCKET-CENTER-TO-BOTTOM
                  (empty-scene WIDTH HEIGHT))]))

; (animate create-rocket-scene.v4)

(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 4 "solid" "green")))
(define UFO-X  (/ WIDTH 2))
(define UFO-CENTER-TO-BOTTOM (- HEIGHT
                                (/ (image-height UFO) 2)))

(define (create-ufo-scene h)
  (cond [(<= h UFO-CENTER-TO-BOTTOM)
         (place-image UFO UFO-X h (empty-scene WIDTH HEIGHT))]
        [(> h UFO-CENTER-TO-BOTTOM)
         (place-image UFO UFO-X UFO-CENTER-TO-BOTTOM
                      (empty-scene WIDTH HEIGHT))]))

; (animate create-ufo-scene)

;; pendiente

; d = v * t - 1/2 a * t^2
; d(t) = v * t - 1/2 a * t^2

; (require 2htdp/image)
; (require 2htdp/universe)

(define VELOCITY 20)
(define DECELERATION 1)
(define MTSCN (empty-scene WIDTH HEIGHT))

(define (distance t)
  (- (* VELOCITY t)
     (* 1/2 DECELERATION (sqr t))))

(define (create-rocket-scene.v6 t)
  (cond
    [(<= (distance t) ROCKET-CENTER-TO-BOTTOM)
     (place-image ROCKET ROCKET-X (distance t) MTSCN)]
    [(> (distance t) ROCKET-CENTER-TO-BOTTOM)
     (place-image ROCKET ROCKET-X ROCKET-CENTER-TO-BOTTOM MTSCN)]))

(animate create-rocket-scene.v6)



