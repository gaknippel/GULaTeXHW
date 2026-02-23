--lets make a distance function where it takes in 2 points, p1 and p2, (structures)
-- that calculate distance and return a float.

structure Point where
x : Float
y : Float

def distance (p1 : Point) (p2 : Point) : Float :=
Float.sqrt (((p1.x - p2.x)^2) + ((p1.y - p2.y)^2))

def point1 : Point :=
{
  x := 5
  y := 2
}

def point2: Point :=
{
  x := 6
  y := 1
}

#eval distance point1 point2


--inductive data types
-- they let you define multiple cases for a datatype, like
--nat or list. they can also be recursive, like list and nat, or non recursive
-- like bool.

-- lets make isZero: it takes in n , nat, and return a bool if its zero.
-- main idea here is to pattern match n and use nat.zero and nat.succ


def isZero (n : Nat): Bool :=
match n with
|Nat.zero => true
|Nat.succ k => false


#eval isZero 5


-- lets make function pred: it returns the predecessor of a nat.
-- main thing you wanna do here is take in a nat, return a nat,
-- and pattern match on n. if its zero, return 0,
-- if its not zero, (uses succ nat inductive datatype constructor)
-- return the pred of n.


def pred (n : Nat) : Nat :=
match n with
|Nat.zero => Nat.zero
|Nat.succ k => k -- one less of n


#eval pred 4



-- polymorphism is datatypes that take in in typrs as arguments


structure Ppoint (α : Type) where
x : α
y : α



--lets make a function even. it takes in n , a nat, and returns a bool
-- you basically want to pattern match n and if its zero return true
-- and if its not zero, (uses nat.succ again) return not (even x)
-- and that is basically goes does a recusive path that does
-- not (even x - 1), until it reaches zero. then it calculates all the "nots"
-- and you get a bool.
def even (n : Nat) : Bool :=
match n with
|Nat.zero => true
|Nat.succ k => not (even k)


#eval even 3



-- lets make listLength function
-- basically, we take in a type parameter (α : Type), and a List (xs : List α)
-- and retrun a Nat. we then pattern match on xs, having an empty list returns 0,
-- and the other case, does a list.cons on xs (y :: ys), returning
-- nat.succ (listLength ys), so re recursively go through this, and end up with our
-- base case which returns a zero, and then we get
-- something like nat.succ(nat.succ...(nat.succ 0)), counting the length.


def listLength (α : Type) (xs : List α): Nat :=
match xs with
|[] => Nat.zero
|_ :: ys => Nat.succ (listLength α ys)


def myList : List Nat :=
[1, 3, 5]


#eval listLength Nat myList


-- inductive list datatype (recursive)
-- it is a type that takes in a type, and the base match case
-- returns the list back (if its nil)



-- inductive option type
-- used for when something either exists or doesnt exist.
-- perfect example is listHead, if you want to return the head of a list
-- it can exist or simply not if its empty


inductive Option (α : Type) where
|none : Option α
|some : α -> Option α


def listHead (xs : List α) : Option α :=
match xs with
|[] => Option.none
|y :: _ => Option.some y

def myList2 : List Nat :=
[6,4,2]

#eval listHead myList2




-- error handling in lean
-- list.head? -> returns an option
-- list.head! -> crash if error
-- list.head D -> when error, return default value.


--product data type
-- this one isnt inductive, because there are no need for case matching.
-- all products are constructed the same way.
-- no recursion, just the first or second item

structure Prod (α : Type) (β : Type) : Type where
fst : α
snd : β


def fives : String × Int :=
{ fst:= "five", snd := 5}

#eval fives



-- sum data type


inductive Sum (α : Type)(β : Type) : Type where
| inl : α -> Sum α β
| inr : β -> Sym α β


def petNames : Type := String ⊕ String

def animals : List petNames :=
[Sum.inl "spot", Sum.inr "rex"]


def howManyDogs (pets: List petNames) : Nat :=
match pets with
|[] => 0
|Sum.inl _ :: morePets => howManyDogs morePets + 1
|Sum.inr _ :: morePets => howManyDogs morePets


-- this would recursively go thru the pets list (list of sum )

-- if the list has a left item, add one and chop off the head, calling howmanydogs
-- on the rest of the list!

-- if the list has a right item, chop off the head, and do it again!

-- base case is when u get an empty list, then u add all the recursive values back up



-- simultanious pattern matching

def sameLength (xs : List α) (ys : List β) : Bool :=
match xs with
|[] =>
  match ys with
  |[] => true
  |_ => false
|x::xs' =>
  match ys with
  |y :: ys' => sameLength xs' ys'
  |_ => false


#eval sameLength myList myList2


-- lets make list tail. it returns an option
-- returns tail of the list if it exists!


def listTail (x : List α) : Option α :=
match x with
|[] => Option.none --if its empty
|[y] => Option.some y --if there is one item in list (base case)
|_ :: ys => listTail ys --peel off head and recurse thru list tail until base case


#eval listTail myList


--the zip function... :3
-- takes in two lists of any type (PAIR OF LISTS)
-- returns a LIST OF PAIRS

--pattern matching simultaneously here
-- keep cutting off the head and storing it, calling zip on the rest.
-- if recursive calls make uneven list comparing, return an empty list to join in
-- on the end.

def zip (xs : List α) (ys : List β): List (α × β) :=
match xs, ys with
|[],_ => []
|_,[] => []
|x :: xs', y :: ys' => (x,y) :: (zip xs' ys')


#eval zip myList myList2


-- lets make lengt :D counts the length of a list

def length (xs : List α) : Nat :=
match xs with
|[] => Nat.zero
|x :: xs' => Nat.succ (length xs')

#eval length myList


--reverse function

-- we can use a local variable to help us here

def reverseList (xs : List α) : List α :=
  let rec helper : List α -> List α -> List α
    |[], soFar => soFar
    |y :: ys, soFar => helper ys (y::soFar)
  helper xs []

#eval reverseList myList2


-- lets try unzip now :D
-- it takes in a list of pairs, and return a pair of lists!


def unzip (xs: List (α × β)) : (List α × List β) :=
match xs with
|[] => ([],[])
|(y,z) :: yzs =>
  let (ys, zs) : List α × List β := unzip yzs
  (y :: ys, z :: zs)
