default:



rebuild:
    nh os switch -a .

upgrade:
    nh os switch -au .



info:
    nh os info



clean-keep keep_gens="20":
    nh clean all -k {{keep_gens}} -a

clean-until keep_until="18d":
    nh clean all -K {{keep_until}} -a

