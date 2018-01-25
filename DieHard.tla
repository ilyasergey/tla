------------------------------ MODULE DieHard ------------------------------
EXTENDS Integers
VARIABLES small, big

TypeOK == /\ small \in 0..3
          /\ big \in 0..5
          
Init == /\ big = 0
        /\ small = 0

FillSmall == /\ small' = 3
             /\ big' = big

FillBig == /\ small' = small
           /\ big' = 5
           
EmptySmall == /\ small' = 0
              /\ big' = big
              
EmptyBig == /\ small' = small
            /\ big' = 0
            
SmallToBig == IF big + small <= 5
               THEN /\ big' = big + small
                    /\ small' = 0
               ELSE /\ big' =  5
                    /\ small' = small - (5 - big)
                     
BigToSmall == IF big + small <= 3
               THEN /\ small' = small + big
                    /\ big' = 0
               ELSE /\ small' = 3
                    /\ big' = big - (3 - small)

Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ SmallToBig
        \/ BigToSmall

=============================================================================
\* Modification History
\* Last modified Thu Oct 19 13:35:01 CDT 2017 by chris
\* Created Wed Oct 18 22:38:08 CDT 2017 by chris
