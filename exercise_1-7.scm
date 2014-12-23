(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))
(define (good-enough?-two prev-guess guess)
  (< (/ (abs (- guess prev-guess)) guess) 0.0001))

(define (sqrt-iter-two prev-guess guess x)
  (if (good-enough?-two prev-guess guess)
      guess
      (sqrt-iter-two guess
		     (improve guess x)
		     x)))

(define (sqrt x)
  (sqrt-iter-two 0.0 1.0 x))

(sqrt 2)
