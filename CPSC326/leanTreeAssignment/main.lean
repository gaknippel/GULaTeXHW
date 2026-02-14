inductive Course where
| cpsc121
| cpsc122
| cpsc223
| cpsc224
| cpsc260
| cpsc326
| cpsc351
| cpsc346
| cpsc348
| cpsc391
| cpsc450
| cpsc491
| cpsc492
| cpsc499


structure PrereqTree where
course : Course
left : Option PrereqTree
middle: Option PrereqTree
right: Option PrereqTree

def t121 : PrereqTree :=
{
course := Course.cpsc121,
left := none,
middle := none,
right := none
}

def t122 : PrereqTree :=
{
course := Course.cpsc122,
left := some t121,
middle := none,
right := none
}

def t223 : PrereqTree :=
{
course := Course.cpsc223,
left := some t122,
middle := none,
right := none
}

def t224 : PrereqTree :=
{
course := Course.cpsc224,
left := some t122,
middle := none,
right := none
}

def t260 : PrereqTree :=
{
course := Course.cpsc260,
left := some t122,
middle := none,
right := none
}

def t326 : PrereqTree :=
{
course := Course.cpsc260,
left := some t122,
middle := none,
right := none
}

def t351 : PrereqTree :=
{
course := Course.cpsc351,
left := some t223,
middle := none,
right := none
}

def t346: PrereqTree :=
{
course := Course.cpsc346,
left := some t260,
middle := none,
right := none
}

def t348 : PrereqTree :=
{
course := Course.cpsc348,
left := some t260,
middle := none,
right := none
}

def t391 : PrereqTree :=
{
course := Course.cpsc391,
left := some t224,
middle := none,
right := none
}

def t450 : PrereqTree :=
{
course := Course.cpsc450,
left := some t223,
middle := none,
right := none
}

def t491 : PrereqTree :=
{
course := Course.cpsc491,
left := some t122,
middle := none,
right := none
}

def t492 : PrereqTree :=
{
course := Course.cpsc492,
left := some t491,
middle := none,
right := none
}

def t499 : PrereqTree :=
{
course := Course.cpsc499,
left := some t391,
middle := none,
right := none
}


def hasLeft (t : PrereqTree) : Bool :=
match t.left with
| none => false
| some _ => true


def getPrereqs (t : PrereqTree) : List Course :=
  match t with
  | PrereqTree.node course left =>
      match left with
      | none => []
      | some subtree =>
          subtree.course :: getPrereqs subtree
