mtype = {p,c};
mtype turn = p;

active proctype producer()
{
	do
	:: (turn == p) ->
		printf("produce\n");
		turn = c
	od
}

active proctype consumer()
{
	do
	:: (turn == c) ->
		printf("Consume\n");
		turn = p
	od
}
