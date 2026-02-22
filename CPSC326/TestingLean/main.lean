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
