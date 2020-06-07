mtype = { FS,SV,TA }; /*symbols used*/
mtype turn = FS;  /*shared variable*/
chan ch1 = [1] of {int};
chan ch2 = [2] of {int};
int a;
int b;
active proctype producer(){
	do
	:: (turn == FS) ->   /*Guard*/
		printf("We are in FS\n");
		turn = SV
		if
		:: ch1?a
			printf("first message %d \n", a);
			turn = TA
		fi
		if
		::ch2?b
			printf("second message %d \n", b);
		fi
	od
}
active proctype consumer(){
	again:
		if:: (turn == SV) ->   /*Guard*/
			printf("We are now in SV\n");
			printf("Processing Update global data\n");
			ch1!1
			turn = FS;
			goto again
		fi
}
active proctype consumer2(){
	again2:
		if:: (turn == TA) ->   /*Guard*/
			printf("We are now in TA\n");
			printf("Read global processes\n");
			ch2!2
			turn = FS;
			goto again2
		fi
}