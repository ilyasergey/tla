-------------------------------- MODULE FIFO --------------------------------
CONSTANT Message
VARIABLES in, out

Inner(q) == INSTANCE InnerFIFO
Spec == \EE q : Inner(q)!Spec
=============================================================================
\* Modification History
\* Last modified Thu Feb 01 15:01:07 CST 2018 by chris
\* Created Thu Feb 01 13:10:00 CST 2018 by chris
