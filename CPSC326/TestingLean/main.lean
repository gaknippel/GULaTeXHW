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
-- and if its not zero, (uses nat.succ again) return !even x
-- and that is basically
