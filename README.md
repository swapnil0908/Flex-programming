# Flex-Logical-Calculator
A propositional logic evaluator which reads in-fix logic expressions from standard input and writes the computed result on standard output.

Constants are True and False.
/\ (for conjunction), / (for disjunction), -> (for implication), and not (for negation)
If any character other than those listed above is seen in the input, e.g. #, the calculator responds with an error message: "Invalid character: #". 

# Sample input / output

Enter a expression
True /\ ( not True -> ( False ) -> False \/ True )
Output -: True

Enter a expression
( not True -> ( False ) -> False \/ True )
Output -: True

Enter a expression
True /\ ( not True -> ( False ) -> False \/ False 
Output -: Invalid expression


Enter a expression
True /\ ( not True -> ( False ) -> False \/ False )
Output -: False

Enter a expression
True /\ ( -> )
Output -: Invalid expression


Enter a expression
not True ( )
Output -: False

Enter a expression
not True ( * )
Output -: Invalid Character 


Enter a expression
&
Output -: Invalid Character 


Enter a expression
not False -> False /\ not ( False \/ False )
Output -: False

Enter a expression
Exiting on user request ( Control + D )
