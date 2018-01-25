--------------------------- MODULE SimpleProgram ---------------------------

EXTENDS Integers
VARIABLES i, pc

Init == (pc = "start") /\ (i = 0)

Pick == \/ /\ pc = "start"
           /\ i' \in 0..1000
           /\ pc' = "middle"

Add1 == \/ /\ pc = "middle"
           /\ i' = i + 1
           /\ pc' = "done"

Next == \/ Pick 
        \/ Add1

=============================================================================
\* Modification History
\* Last modified Wed Oct 18 22:26:55 CDT 2017 by chris
\* Created Wed Oct 18 22:11:03 CDT 2017 by chris
