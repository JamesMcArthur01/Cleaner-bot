;;CMP2020M Artificial Intelligence Assessment Item 1 – Criterion 2 – AI Planning
;;James McArthur, Student ID: 285674

;;The following source code is the PDDL domain templates for both problem scenarios as outlined in the assignment brief for this module.

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
;; START OF DOMAIN TEMPLATE 1
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------

(define (domain domain-template1)

    ;;typing is used for declaring the parameter and object types used in the problem solution
    (:requirements :typing)

    ;; We have two types: cleaners and the regions, both are objects
    (:types cleaner region - object)

    (:predicates  

    ;; described what region a cleaner is at
    (cleaner-at ?c - cleaner ?x - region)

    ;; indicates that region ?x is above region ?y
    (above ?x - region ?y - region)

    ;; indicates that region ?x is below region ?y
    (below ?x - region ?y - region)

    ;; indicates that region ?x is right of region ?y
    (right ?x - region ?y - region)

    ;; indicates that region ?x is left of region ?y
    (left ?x - region ?y - region)
    
    ;; indicates that a region is cleaned
    (cleaned ?x - region)

    ;; indicates that a region is dirty
    (dirty ?x - region)

    )

(:action suck
         :parameters (?c - cleaner ?x - region)
         :precondition(and(cleaner-at ?c ?x) (dirty ?x))
         :effect (and (cleaned ?x) (not(dirty ?x)))
         
         ;;Parameters: The cleaner object and the region that requires cleaning
         ;;Precondition: Conjunction of predicates, with cleaner-at to determine if cleaner is at specific region (true) and that the region is dirty (true).
         ;;Effect: The result is a conjunction of atomic effects that indicate the region is now clean (true) and therefore dirty is negated (false).
)

(:action move_up
         :parameters(?c - cleaner ?x - region ?y - region)
         :precondition(and(above ?y ?x)(cleaner-at ?c ?x) (dirty ?y))
         :effect(and (cleaner-at ?c ?y) (not(cleaner-at ?c ?x))) 
         
         ;;Parameters: The cleaner object, plus the region the cleaner is moving from and the region it is moving to
         ;;Precondition: On the condition that the region we want to move to (?y) is above the region the cleaner is currently at (?x) and that the region is dirty (true)
         ;;Effect: The result, if pre-conditions are met, is the cleaner (?c) is now at the new region (?y) and therefore not at the previous region (?x)
)

(:action move_down
         :parameters (?c - cleaner ?x - region ?y - region)
		 :precondition (and (below ?y ?x)(cleaner-at ?c ?x)(dirty ?y))
	     :effect (and (cleaner-at ?c ?y) (not(cleaner-at ?c ?x)))
	     
	     ;;Parameters: The cleaner object, plus the region the cleaner is moving from and the region it is moving to
         ;;Precondition: On the condition that the region we want to move to (?y) is below the region the cleaner is currently at (?x) and that the region is dirty (true)
         ;;Effect: The result, if pre-conditions are met, is the cleaner (?c) is now at the new region (?y) and therefore not at the previous region (?x)
)

(:action move_left
         :parameters (?c - cleaner ?x - region ?y - region)
	     :precondition (and (left ?y ?x)(cleaner-at ?c ?x)(dirty ?y))
	     :effect (and (cleaner-at ?c ?y) (not(cleaner-at ?c ?x)))
	     
	     ;;Parameters: The cleaner object, plus the region the cleaner is moving from and the region it is moving to
         ;;Precondition: On the condition that the region we want to move to (?y) is left of the region the cleaner is currently at (?x) and that the region is dirty (true)
         ;;Effect: The result, if pre-conditions are met, is the cleaner (?c) is now at the new region (?y) and therefore not at the previous region (?x)
)

(:action move_right
         :parameters (?c - cleaner ?x - region ?y - region)
	     :precondition(and (right ?y ?x) (cleaner-at ?c ?x) (dirty ?y)) 
	     :effect (and (cleaner-at ?c ?y) (not(cleaner-at ?c ?x)))
	     
	     ;;Parameters: The cleaner object, plus the region the cleaner is moving from and the region it is moving to
         ;;Precondition: On the condition that the region we want to move to (?y) is right of the region the cleaner is currently at (?x) and that the region is dirty (true)
         ;;Effect: The result, if pre-conditions are met, is the cleaner (?c) is now at the new region (?y) and therefore not at the previous region (?x)
)


)

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
;; END OF DOMAIN TEMPLATE 1
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
;; START OF DOMAIN TEMPLATE 2
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------

(define (domain domain-template2)

     ;;typing is used for declaring the parameter and object types used in the problem solution
	(:requirements :typing)

	;; We have two types: cleaners and the regions, both are objects
	(:types cleaner region - object)


	(:predicates  

    ;; described what region a cleaner is at
    (cleaner-at ?c - cleaner ?x - region)

    ;; described a region ?x is clear (no cleaner is at that region)
    (region_clear ?x - region)

    ;; indicates that region ?x is above region ?y
    (above ?x - region ?y - region)

    ;; indicates that region ?x is below region ?y
    (below ?x - region ?y - region)

    ;; indicates that region ?x is right of region ?y
    (right ?x - region ?y - region)

    ;; indicates that region ?x is left of region ?y
    (left ?x - region ?y - region)
    
    ;; indicates that a region is cleaned
    (cleaned ?x - region)

    ;; indicates that a region is dirty
    (dirty ?x - region)

 	)

(:action suck
	:parameters (?c - cleaner ?x - region) 
    :precondition (and (cleaner-at ?c ?x) (dirty ?x))	
	:effect	(and(cleaned ?x) (not(dirty ?x)))
	
	;;Parameters: An instance of cleaner object(?c) and instance of region object(?X)
    ;;Precondition: This action is dependent on existing predicate (cleaner-at) that determines if instance of cleaner object (?c) is at instance of region object (?x) and that the predicate of dirty at ?x is true
    ;;Effect: The result is a conjunction of atomic effects that indicate the region is now clean (true) and therefore dirty is negated (false).
)


(:action move_up
	:parameters (?c - cleaner ?x - region ?y - region)
	:precondition (and(region_clear ?y)	(above ?y ?x) (cleaner-at ?c ?x) (dirty ?y))
	:effect	(and(cleaner-at ?c ?y) (region_clear ?x) (not(cleaner-at ?c ?x))) 
	
	;;Parameters: The cleaner object (?c), plus the region the cleaner is moving from (?x) and the region it is moving to (?y)
    ;;Precondition: Conjunction of predicates including the condition that the region (?y) the cleaner (?c) needs to move to is clear (true) i.e. theres no other cleaner object there,
	              ;;that the region the cleaner (?c) wants to move to (?y) is above its current region (?x), that the cleaner is at a region adjacent to it (true) and that the specific 
	              ;;region its moving to is dirty (true) i.e. it requires cleaning
    ;;Effect: The result of this action means the predicate cleaner-at for cleaner (?c) at region ?y is true and that the cleaner is no longer at region ?x and is now clear (true)
)


(:action move_down
	:parameters (?c - cleaner ?x - region ?y - region)
	:precondition (and (region_clear ?y) (below ?y ?x) (cleaner-at ?c ?x) (dirty ?y)) 
	:effect (and (cleaner-at ?c ?y) (region_clear ?x) (not(cleaner-at ?c ?x))) 
	
	;;Parameters: The cleaner object (?c), plus the region the cleaner is moving from (?x) and the region it is moving to (?y)
    ;;Precondition: Conjunction of predicates including the condition that the region (?y) the cleaner (?c) needs to move to is clear (true) i.e. theres no other cleaner object there,
	              ;;that the region the cleaner (?c) wants to move to (?y) is below its current region (?x), that the cleaner is at a region adjacent to it (true) and that the specific 
	              ;;region its moving to is dirty (true) i.e. it requires cleaning
    ;;Effect: The result of this action means the predicate cleaner-at for cleaner (?c) at region ?y is true and that the cleaner is no longer at region ?x and is now clear (true)
) 


(:action move_left
	:parameters (?c - cleaner ?x - region ?y - region)
	:precondition (and (region_clear ?y) (left ?y ?x) (cleaner-at ?c ?x) (dirty ?y)) 
	:effect (and (cleaner-at ?c ?y) (region_clear ?x) (not(cleaner-at ?c ?x)))
	
	;;Parameters: The cleaner object (?c), plus the region the cleaner is moving from (?x) and the region it is moving to (?y)
    ;;Precondition: Conjunction of predicates including the condition that the region (?y) the cleaner (?c) needs to move to is clear (true) i.e. theres no other cleaner object there,
	              ;;that the region the cleaner (?c) wants to move to (?y) is left of its current region (?x), that the cleaner is at a region adjacent to it (true) and that the specific 
	              ;;region its moving to is dirty (true) i.e. it requires cleaning
    ;;Effect: The result of this action means the predicate cleaner-at for cleaner (?c) at region ?y is true and that the cleaner is no longer at region ?x and is now clear (true)
)
	  

(:action move_right
	:parameters (?c - cleaner ?x - region ?y - region)
	:precondition (and (region_clear ?y)(right ?y ?x)(cleaner-at ?c ?x)(dirty ?y)) 
    :effect (and (cleaner-at ?c ?y)(region_clear ?x) (not(cleaner-at ?c ?x))) 
    
    ;;Parameters: The cleaner object (?c), plus the region the cleaner is moving from (?x) and the region it is moving to (?y)
    ;;Precondition: Conjunction of predicates including the condition that the region (?y) the cleaner (?c) needs to move to is clear (true) i.e. theres no other cleaner object there,
	              ;;that the region the cleaner (?c) wants to move to (?y) is right of its current region (?x), that the cleaner is at a region adjacent to it (true) and that the specific 
	              ;;region its moving to is dirty (true) i.e. it requires cleaning
    ;;Effect: The result of this action means the predicate cleaner-at for cleaner (?c) at region ?y is true and that the cleaner is no longer at region ?x and is now clear (true)
)


)

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
;; END OF DOMAIN TEMPLATE 2
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
;;REFERENCES
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Haslum, P. (n.d.). Writing Planning Domains and Problems in PDDL. Retrieved from Australian National University: http://users.cecs.anu.edu.au/~patrik/pddlman/writing.html

;;Helmert, M. (n.d.). An Introduction to PDDL. Retrieved from University of Toronto (Computer Science): https://www.cs.toronto.edu/~sheila/2542/s14/A1/introtopddl2.pdf

;;Hrncir, J. (n.d.). PDDL (Planning Domain Definition Language). Retrieved from https://cw.felk.cvut.cz/w/_media/courses/a4m33pah/pddl.pdf

;;Kalisch, M., & Konig, S. (2005, January 5). Comparison of STRIPS, ADL and PDDL. Retrieved from University of Bamberg: http://www.cogsys.wiai.uni-bamberg.de/teaching/ws0405/s_planning/slides/Introduction_AI_Planning_addon.pdf

;;Yale Center for Computational Vision and Control. (1998, October). PDDL - The Planning Domain Definition Language. Retrieved from The University of Edinburgh : http://homepages.inf.ed.ac.uk/mfourman/tools/propplan/pddl.pdf









