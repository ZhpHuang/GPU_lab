V34 :0x24 kernels
8 main.f90 S624 0
12/16/2024  14:09:22
use iso_c_binding public 0 indirect
use nvf_acc_common public 0 indirect
use cudafor_lib_la public 0 indirect
use cudafor_la public 0 direct
use eventqueueitem_m public 0 indirect
use event_queue public 0 direct
enduse
D 58 26 647 8 646 7
D 67 26 650 8 649 7
D 76 26 647 8 646 7
D 97 26 744 8 743 7
D 3317 26 14455 160 14454 7
D 3332 26 14470 160 14469 7
S 624 24 0 0 0 6 1 0 5012 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 kernels
R 646 25 7 iso_c_binding c_ptr
R 647 5 8 iso_c_binding val c_ptr
R 649 25 10 iso_c_binding c_funptr
R 650 5 11 iso_c_binding val c_funptr
R 684 6 45 iso_c_binding c_null_ptr$ac
R 686 6 47 iso_c_binding c_null_funptr$ac
R 687 26 48 iso_c_binding ==
R 689 26 50 iso_c_binding !=
R 743 25 6 nvf_acc_common c_devptr
R 744 5 7 nvf_acc_common cptr c_devptr
R 750 6 13 nvf_acc_common c_null_devptr$ac
R 788 26 51 nvf_acc_common =
R 14454 25 1 event_queue queuearray_i
R 14455 5 2 event_queue data queuearray_i
R 14457 5 4 event_queue data$sd queuearray_i
R 14458 5 5 event_queue data$p queuearray_i
R 14459 5 6 event_queue data$o queuearray_i
R 14461 5 8 event_queue size queuearray_i
R 14462 5 9 event_queue capacity queuearray_i
R 14463 5 10 event_queue update$tbp$0 queuearray_i
R 14464 5 11 event_queue clear$tbp$1 queuearray_i
R 14465 5 12 event_queue sizeof$tbp$2 queuearray_i
R 14466 5 13 event_queue reserve$tbp$3 queuearray_i
R 14469 25 16 event_queue queuearray_info
R 14470 5 17 event_queue size queuearray_info
R 14471 5 18 event_queue capacity queuearray_info
R 14473 5 20 event_queue data queuearray_info
R 14474 5 21 event_queue data$sd queuearray_info
R 14475 5 22 event_queue data$p queuearray_info
R 14476 5 23 event_queue data$o queuearray_info
R 14478 5 25 event_queue update$tbp$4 queuearray_info
R 14479 5 26 event_queue clear$tbp$5 queuearray_info
R 14480 5 27 event_queue sizeof$tbp$6 queuearray_info
R 14481 5 28 event_queue reserve$tbp$7 queuearray_info
S 14532 23 5 0 4 0 14535 624 103521 0 0 A 0 0 0 0 B 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 assign_queue
S 14533 1 3 3 0 3317 1 14532 103534 8004 3000 A 0 0 0 0 B 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 queue_i
S 14534 6 1 1 0 6 1 14532 103542 808004 3000 A 0 0 0 0 B 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 n
S 14535 14 5 0 4 0 1 14532 103521 0 400000 A 0 0 0 0 B 0 8 0 0 0 0 0 5195 2 0 0 0 0 0 0 0 0 0 0 0 0 8 0 624 0 0 0 0 assign_queue assign_queue 
F 14535 2 14533 14536
S 14536 1 3 1 0 6 1 14532 103544 4 7000 A 0 0 0 0 B 0 8 0 0 0 0 14534 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 _V_n
A 68 1 0 0 0 58 684 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 71 1 0 0 0 67 686 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 141 1 0 0 0 97 750 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Z
J 133 1 1
V 68 58 7 0
S 0 58 0 0 0
A 0 6 0 0 1 2 0
J 134 1 1
V 71 67 7 0
S 0 67 0 0 0
A 0 6 0 0 1 2 0
J 36 1 1
V 141 97 7 0
S 0 97 0 0 0
A 0 76 0 0 1 68 0
T 14454 3317 0 3 0 0
A 14461 6 0 0 1 2 1
A 14462 6 0 0 1 2 0
T 14469 3332 0 3 0 0
A 14470 6 0 0 1 2 1
A 14471 6 0 0 1 2 0
Z
