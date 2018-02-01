------------------------------- MODULE Trades -------------------------------
EXTENDS Naturals
People == {"alice", "bob"}
Items == {"ore", "sheep", "brick"}
(* --algorithm trade
variable owner_of \in [Items -> People]

process giveitem \in 1..3 \* up to three possible trades made
variables item \in Items,
          owner = owner_of[item],
          to \in People,
          origin_of_trade \in People
begin Give:
    if origin_of_trade = owner then
        owner_of[item] := to;
    end if;
end process;
end algorithm; *)

=============================================================================
\* Modification History
\* Last modified Thu Feb 01 13:03:07 CST 2018 by chris
\* Created Tue Oct 10 12:18:32 CDT 2017 by chris
