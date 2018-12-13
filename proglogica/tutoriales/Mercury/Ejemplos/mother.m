:- module mother.

:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- type persona --->  laura; rafael; james.
:- pred mother(persona, persona).
:- mode mother(in, out).
:- mode mother(out, in).

mother(rafael, laura).
mother(james, laura).

main(!IO) :-
	(
	if mother(rafael, X)
	then write_string("La madre de rafael es ", !IO),
	write(X, !IO),
	write_string("\n", !IO)
	else write_string("Rafael no tiene madre", !IO) 
	).