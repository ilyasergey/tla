----------------------------- MODULE HourClock -----------------------------
EXTENDS Naturals
VARIABLE hr
HCini == hr \in (1 .. 12)
HCnxt == hr' = IF hr /= 12 THEN hr + 1 ELSE 1
HCnxt2 == hr' = (hr % 12) + 1
HC == HCini /\ [][HCnxt]_hr
HC2 == HCini /\ [][HCnxt2]_hr
-----------------------------------------------------------------------------
THEOREM HC => []HCini
=============================================================================
\* Modification History
\* Last modified Wed Jan 31 21:07:19 CST 2018 by chris
\* Created Wed Jan 31 20:52:56 CST 2018 by chris
