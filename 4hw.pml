chan message=[0] of {bit}; //update=0 
chan complete=[0] of {bit}; //msg_complete

proctype FS(bit i)

{ do ::  
		message!i;
		printf("ta put msg\n")
		complete?0; //looks for msg_complete
		printf("Msg complete found\n");
  od
}

active proctype SV()
{ 
	do :: 
		message?0; //Looks for msg
		printf("SV Process\n");
		complete!0
  	od
}

active proctype TA()
{
	do :: 
		message?0;
		printf("TA Process\n");
		
	od
}

active proctype outsideProgram()
{
	printf("outside msg incoming\n");
	run FS(0)
}

