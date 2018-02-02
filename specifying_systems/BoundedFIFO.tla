---------------------------- MODULE BoundedFIFO ----------------------------
EXTENDS Naturals, Sequences
VARIABLES in, out
CONSTANT Message, N
ASSUME (N \in Nat) /\ (N > 0)

Inner(q) == INSTANCE InnerFIFO

BNext(q) == /\ Inner(q)!Next
            /\ Inner(q)!BufRcv => (Len(q) < N)
            
Spec == \E q : Inner(q)!Init /\ [][BNext(q)]_<<in, out, q>>
=============================================================================
\* Modification History
\* Last modified Thu Feb 01 14:40:25 CST 2018 by chris
\* Created Thu Feb 01 14:35:43 CST 2018 by chris
