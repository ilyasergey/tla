-------------------------- MODULE Channel -----------------------------------
EXTENDS Naturals
CONSTANT Data
VARIABLE chan
TypeInvariant == chan \in [val : Data, rdy : {0,1}, ack : {0,1}]
-----------------------------------------------------------------------------
Init == /\ TypeInvariant
        /\ chan.ack = chan.rdy
Send(d) == /\ chan.rdy = chan.ack
           /\ chan' = [chan EXCEPT !.val = d, !.rdy = 1 - @] 
Rcv  == /\ chan.rdy /= chan.ack
        /\ chan' = [chan EXCEPT !.ack = 1 - @]
Next == (\E d \in Data : Send(d)) \/ Rcv
Spec == Init /\ [][Next]_chan
-----------------------------------------------------------------------------
THEOREM Spec => []TypeInvariant
=============================================================================
\* Modification History
\* Last modified Thu Feb 01 13:13:47 CST 2018 by chris
\* Created Wed Jan 31 21:12:54 CST 2018 by chris
