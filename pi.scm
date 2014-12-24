;; Calculates an upper bound for pi given number of steps.
;; This uses a linear iterative approach based on archimedes' original algorithm [0].
;; For additional (crappy) notes, see [1].
;;
;; [0]: http://mathworld.wolfram.com/ArchimedesAlgorithm.html
;; [1]: https://www.evernote.com/pub/view/bas1/2014spring/6deda844-50cf-4768-a902-0fbf0fd78888?locale=en#st=p&n=6deda844-50cf-4768-a902-0fbf0fd78888

(define (calc-pi steps)
  (define (iter counter t u)
    (define (sides)
      (* 6 (pow 2 steps)))
    (define (perimeter)
      (* (sides) t))
    (define (next-t)
      (/ t (+ u 1)))
    (define (next-u)
      (sqrt (+ 1 (pow (next-t) 2))))
    (if (= counter 0)
	(perimeter)
	(iter (- counter 1) (next-t) (next-u))))
  (iter steps (/ 1.0 (sqrt 3)) (/ 2.0 (sqrt 3))))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

;; An improved version of SICP's square root algorithm. Its measure of "good-enough" is
;; now based on the rate of convergence. 
(define (sqrt x)
  (define (good-enough? prev-guess guess)
    (< (/ (abs (- guess prev-guess)) guess) 0.00001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter prev-guess guess)
    (if (good-enough? prev-guess guess)
	guess
	(sqrt-iter guess (improve guess))))
  (sqrt-iter 0.0 1.0))

(define (pow b e)
  (if (= e 0)
      1
      (* b (pow b (- e 1)))))
