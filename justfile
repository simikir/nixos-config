default:



rebuild:
    nh os switch -a .

upgrade:
    nh os switch -au .



info:
    nh os info



clean-keep-gens keep_gens="20": && rebuild
    nh clean all -k {{keep_gens}} -a

clean-keep-until keep_until="18d": && rebuild
    nh clean all -K {{keep_until}} -a

