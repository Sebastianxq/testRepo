

//a 0 means that messages cant be stored
//When sender sends, receiver has to receive (synchronously)
//This should be used for the internal messages

chan message=[0] of {byte,bit}; //msg,type
bit messageType[2]; //update=0 update_complete=1


proctype FS(byte i)

{ do ::  message!eval(i),0; //maybe just !i,0 as input
		 message?eval(i),1; //looks for msg_complete
  od
}

//can i have a 3rd msg to send to TA after receiving the msg_cmplt from SV??
proctype SV()
{ do :: message?eval(i),0; //Looks for msg
		printf("processing msg%d\n",i);
		message!i,1

  od
}

proctype TA()
{
	do :: message?eval(i),0
		  print("TA Processing")

	od
}

proctype outsideProgram()
{
	message!eval(i),0
}

//Currently might only run once??
//INclude everything in atomic later
//for the byte part of msg: maybe i can do something where I increment the msg to simulate new msgs?
init { run outsideProgram(); atomic{FS();SV();TA();} }

//so two options
//1.)Try to do everything with one channel (although a race condition seems likely considering the updates are the same?)

//2.)Try to do everything using a producer consumer type of queue where there are 2 queues

//Send is update
//Receive is accept
//accept is synch rendez (so using atomic will take care of it?)

//Need to find a way to store the result in a "message" var