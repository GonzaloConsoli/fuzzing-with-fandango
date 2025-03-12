from faker import Faker
fake = Faker()

<start> ::= <S>

<S> ::= <NP> " " <VP>

<NP> ::= <Det> " " <N>

<VP> ::= <Verb> " " <NP>

<Verb> ::= <Aux> " " <V>

<Det> ::= "the"
         | "a"
         | "my"
         | "our"

<N> ::= "man"
       | "ball"
       | "book"
       | "table"
       | "cat"
       | "dog"
       | "car"
       | <name>

<name> ::= <printable>+ := fake.first_name()

<Aux> ::= "will"
         | "can"
         | "should"

<V> ::= "hit"
       | "see"
       | "catch"
       | "read"
       | "play"
       | "make"
       | "do"
