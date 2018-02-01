-------------------------- MODULE AsynchInterface --------------------------
EXTENDS Naturals
CONSTANT Data
VARIABLES val, rdy, ack
TypeInvariant == /\ val \in Data
                 /\ rdy \in {0, 1}
                 /\ ack \in {0, 1}
-----------------------------------------------------------------------------
Init == /\ val \in Data
        /\ rdy \in {0, 1}
        /\ ack = rdy
Send == /\ rdy = ack
        /\ val' \in Data
        /\ rdy' = 1 - rdy
        /\ UNCHANGED ack
Rcv  == /\ rdy /= ack
        /\ ack' = 1 - ack
        /\ UNCHANGED <<val, rdy>>
Next == Send \/ Rcv
Spec == Init /\ [][Next]_<<val,rdy,ack>>
-----------------------------------------------------------------------------
THEOREM Spec => []TypeInvariant
=============================================================================
\* Modification History
\* Last modified Wed Jan 31 21:20:35 CST 2018 by chris
\* Created Wed Jan 31 21:12:54 CST 2018 by chris
