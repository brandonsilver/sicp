(define (square a) (* a a))

(define (sum-of-squares a b) (+ (square a) (square b)))

;; --- this didn't work... ---
;; (define (larger-sum-of-squares x y z)
;;   (cond ((and (> x y) (> y z)) (sum-of-squares x y)
;; 	 ((and (> x z) (> z y)) (sum-of-squares x z))
;; 	 ((and (> y z) (> z x)) (sum-of-squares y z))
;; 	 ((and (> y x) (> x z)) (sum-of-squares y x))
;; 	 ((and (> z x) (> x y)) (sum-of-squares z x))
;; 	 ((and (> z y) (> y x)) (sum-of-squares z y)))))

(define (larger-sum-of-squares x y z)
  (if (> x y)
      (if (> y z)
	  (sum-of-squares x y)
	  (sum-of-squares x z))
      (if (> x z)
	  (sum-of-squares y x)
	  (sum-of-squares y z)))))

(larger-sum-of-squares 2 3 4)
