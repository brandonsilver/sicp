(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? prev-guess guess)
  (< (/ (abs (- guess prev-guess)) guess) 0.0001))

(define (cube-root-iter prev-guess guess x)
  (if (good-enough? prev-guess guess)
      guess
      (cube-root-iter guess
		      (improve guess x)
		      x)))

(define (cube-root x)
  (cube-root-iter 0.0 1.0 x))

(cube-root 262144)
