chan message=[0] of {bit}; //update
chan messageC=[0] of {bit}; //msg_complete

//had bit i and message!i
active proctype FS()

{ do ::  
		message!0;
		printf("FS put msg\n")
		if :: messageC?1; //looks for msg_complete
			printf("FS found msg_complete\n");
		fi
  od
}

active proctype SV()
{ 
	do :: 
		if :: message?0; //Looks for msg
			printf("SV Processing\n");
			messageC!1
		fi
  	od
}

active proctype TA()
{
	do :: 
		if :: message?0;
		  printf("TA Processing\n");
		fi
	od
}

