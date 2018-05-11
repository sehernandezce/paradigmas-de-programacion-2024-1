:- module factorial.
:- interface.

:- import_module io.

:- pred main(io::di, io::uo) is det.

:- implementation.

:- import_module int.

:- func factorial(int) = int.

factorial(N) =
    ( if N = 0 then
        1
    else
        N * factorial(N - 1)
    ).

main(!IO) :-
    F = factorial(5),
    write_int(F, !IO),
    nl(!IO).