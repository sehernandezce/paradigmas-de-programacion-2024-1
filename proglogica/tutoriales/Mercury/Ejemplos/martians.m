/* 
ngtrks es pequeño y verde
pgvdrk es un marciano saltarin
todas la creaturas saltarinas son verdes
todas las criaturas pequeñas saltarinas son marcianos
tadas las criaturas verdes y marcianas son inteligentes.

¿Cual de los dos es inteligente?

*/

:- module martians.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is cc_multi.
:- implementation.
:- type martian ---> ngtrks; pgvdrk.
:- pred small(martian::out) is det.
:- pred green(martian::out) is multi.
:- pred martian(martian::out) is multi.
:- pred jumping(martian::out) is det.
:- pred intelligent(martian::out) is nondet.


small(ngtrks).
green(ngtrks).
martian(pgvdrk).
jumping(pgvdrk).

green(X) :- jumping(X).
martian(X) :- small(X), jumping(X).

intelligent(X) :- green(X), martian(X).

main(!IO) :- 
	io.write_string("Que marciano es inteligente?: ", !IO),
	(
	if intelligent(X)
	then io.write(X, !IO), 
		 io.write_string(" es inteligente\n", !IO)
	else io.write_string(" no se puede determinar\n", !IO)
	).