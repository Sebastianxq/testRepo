bit doorisopen[3];

//a 0 measn that messages cant be stored
//When sender sends, receiver has to receive (synchronously)
chan openclosedoor=[0] of {byte,bit}; 

proctype door(byte i)
{ do ::  openclosedoor?eval(i),1;
	doorisopen[i-1]=1;printf("open door:%d\n",i);
	doorisopen[i-1]=0;
	openclosedoor!i,0
  od
}

proctype elevator()
{ show byte floor =1;
  do :: floor !=3 -> floor++;
     :: floor !=1 -> floor--;
     :: openclosedoor!floor,1;
        openclosedoor?eval(floor),0
  od
}

/*proctype init(){
	atomic {run door(1);
		run door(2);
		run door(3);
		run elevator(); }}
*/

init { atomic{run door(1);run door(2); run door(3); run elevator();}}
