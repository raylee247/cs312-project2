initialize_board :- 
	enter_rooms,
	enter_weapons,
	enter_suspects,
	enter_num_players,
	enter_my_turn.

enter_rooms :- write('Please enter the possible rooms: '), nl,
	read(X),
	(X \= next -> 
		(card(X) -> write('Card already entered'), nl, enter_rooms
		; assert(card(X)),assert(room(X)), enter_rooms)
	; 
	true).

enter_weapons :- write('Please enter the possible weapons: '), nl,
	read(X),
	(X \= next -> 
		(card(X) -> write('Weapon already entered'),nl,
		enter_weapons
		; assert(card(X)),assert(weapon(X)), enter_weapons)
	; true). 
	
enter_suspects :- write('Please enter the possible suspects: '), nl, 
	read(X),
	(X \= next ->
		(card(X) -> write('Suspect already entered'),nl,
		enter_suspects
		; assert(card(X)), assert(suspect(X)), enter_suspects)
	; true).

		
enter_players :- write('Please enter the number of players: '), nl,
	read(X),
	(X \= next ->
		(card(X) -> write('Player already entered'),nl,
		enter_players
		; assert(card(X)), assert(player(X)), enter_players)
	; true).


enter_my_turn :- write('Please enter your turn: '), nl,
	read(X),
	assert(turn(X)).

enter_my_cards :- write('Please enter the cards in your hand: '), nl,
	read(X),
	(X \= done ->
		(card(X)
		
:- dynamic card/1.
:- dynamic room/1.
:- dynamic num_players/1.