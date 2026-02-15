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


def courseToString (c : Course): String :=
match c with
| Course.cpsc121 => "CPSC 121"
| Course.cpsc122 => "CPSC 122"
| Course.cpsc223 => "CPSC 223"
| Course.cpsc224 => "CPSC 224"
| Course.cpsc260 => "CPSC 260"
| Course.cpsc326 => "CPSC 326"
| Course.cpsc351 => "CPSC 351"
| Course.cpsc346 => "CPSC 346"
| Course.cpsc348 => "CPSC 348"
| Course.cpsc391 => "CPSC 391"
| Course.cpsc450 => "CPSC 450"
| Course.cpsc491 => "CPSC 491"
| Course.cpsc492 => "CPSC 492"
| Course.cpsc499 => "CPSC 499"

def courseEq (c1 c2 : Course) : Bool :=
  match c1, c2 with
  | Course.cpsc121, Course.cpsc121 => true
  | Course.cpsc122, Course.cpsc122 => true
  | Course.cpsc223, Course.cpsc223 => true
  | Course.cpsc224, Course.cpsc224 => true
  | Course.cpsc260, Course.cpsc260 => true
  | Course.cpsc326, Course.cpsc326 => true
  | Course.cpsc351, Course.cpsc351 => true
  | Course.cpsc346, Course.cpsc346 => true
  | Course.cpsc348, Course.cpsc348 => true
  | Course.cpsc391, Course.cpsc391 => true
  | Course.cpsc450, Course.cpsc450 => true
  | Course.cpsc491, Course.cpsc491 => true
  | Course.cpsc492, Course.cpsc492 => true
  | Course.cpsc499, Course.cpsc499 => true
  | _, _ => false

structure PrereqTree where
  course : Course
  left : Option PrereqTree
  middle: Option PrereqTree
  right: Option PrereqTree

def t492 : PrereqTree :=
{
  course := Course.cpsc492,
  left := none,
  middle := none,
  right := none
}

def t499 : PrereqTree :=
{
  course := Course.cpsc499,
  left := none,
  middle := none,
  right := none
}

def t491 : PrereqTree :=
{
  course := Course.cpsc491,
  left := some t492,
  middle := none,
  right := none
}

def t326 : PrereqTree :=
{
  course := Course.cpsc326,
  left := none,
  middle := none,
  right := none
}

def t351 : PrereqTree :=
{
  course := Course.cpsc351,
  left := none,
  middle := none,
  right := none
}

def t450 : PrereqTree :=
{
  course := Course.cpsc450,
  left := none,
  middle := none,
  right := none
}

def t223 : PrereqTree :=
{
  course := Course.cpsc223,
  left := some t326,
  middle := some t351,
  right := some t450
}

def t391 : PrereqTree :=
{
  course := Course.cpsc391,
  left := some t491,
  middle := some t499,
  right := none
}

def t224 : PrereqTree :=
{
  course := Course.cpsc224,
  left := some t391,
  middle := none,
  right := none
}

def t346 : PrereqTree :=
{
  course := Course.cpsc346,
  left := none,
  middle := none,
  right := none
}

def t348 : PrereqTree :=
{
  course := Course.cpsc348,
  left := none,
  middle := none,
  right := none
}

def t260 : PrereqTree :=
{
  course := Course.cpsc260,
  left := some t346,
  middle := some t348,
  right := none
}

def t122 : PrereqTree :=
{
  course := Course.cpsc122,
  left := some t223,
  middle := some t224,
  right := some t260
}

def t121 : PrereqTree :=
{
  course := Course.cpsc121,
  left := some t122,
  middle := none,
  right := none
}

def getPrerequisites (c : Course) : List Course :=
  match c with
  | Course.cpsc121 => []
  | Course.cpsc122 => [Course.cpsc121]
  | Course.cpsc223 => [Course.cpsc122, Course.cpsc121]
  | Course.cpsc224 => [Course.cpsc122, Course.cpsc121]
  | Course.cpsc260 => [Course.cpsc122, Course.cpsc121]
  | Course.cpsc326 => [Course.cpsc223, Course.cpsc122, Course.cpsc121]
  | Course.cpsc351 => [Course.cpsc223, Course.cpsc122, Course.cpsc121]
  | Course.cpsc346 => [Course.cpsc260, Course.cpsc122, Course.cpsc121]
  | Course.cpsc348 => [Course.cpsc260, Course.cpsc122, Course.cpsc121]
  | Course.cpsc391 => [Course.cpsc224, Course.cpsc122, Course.cpsc121]
  | Course.cpsc450 => [Course.cpsc223, Course.cpsc122, Course.cpsc121]
  | Course.cpsc491 => [Course.cpsc391, Course.cpsc224, Course.cpsc122, Course.cpsc121]
  | Course.cpsc492 => [Course.cpsc491, Course.cpsc391, Course.cpsc224, Course.cpsc122, Course.cpsc121]
  | Course.cpsc499 => [Course.cpsc391, Course.cpsc224, Course.cpsc122, Course.cpsc121]


def countCourses (tree : PrereqTree) : Nat :=
  let leftCount :=
    match tree.left with
    | none => 0
    | some _ => 1
    let middleCount :=
    match tree.middle with
    | none => 0
    | some _ => 1
    let rightCount :=
    match tree.right with
    | none => 0
    | some _ => 1
  1 + leftCount + middleCount + rightCount



  def courseInList (c : Course) (list : List Course) : Bool :=
  match list with
  | [] => false
  | x :: xs => if courseEq c x then true else courseInList c xs

def calculateCompletion (completed : List Course) : Nat :=
  let allCourses := [Course.cpsc121, Course.cpsc122, Course.cpsc223, Course.cpsc224,
                     Course.cpsc260, Course.cpsc326, Course.cpsc351, Course.cpsc346,
                     Course.cpsc348, Course.cpsc391, Course.cpsc450, Course.cpsc491,
                     Course.cpsc492, Course.cpsc499]
  let rec countCompleted (courses : List Course) : Nat :=
    match courses with
    | [] => 0
    | c :: rest =>
        let count := countCompleted rest
        if courseInList c completed then count + 1 else count
  let numCompleted := countCompleted allCourses
  let total := 14
  (numCompleted * 100) / total


def coursesToString (courses : List Course) : String :=
  match courses with
  | [] => "None"
  | [c] => courseToString c
  | c :: rest => courseToString c ++ ", " ++ coursesToString rest


def displayPrereqs (c : Course) : String :=
  let courseName := courseToString c
  let prereqs := getPrerequisites c
  courseName ++ ":\n" ++
  "  Prerequisites: " ++ coursesToString prereqs

  def main : IO Unit := do
  IO.println "=== Johnson University CS Major Prerequisite Checker ==="
  IO.println ""

  -- FUNCTIONALITY 1: Show prerequisites
  IO.println "FUNCTIONALITY 1: Prerequisite Lookup"
  IO.println "====================================="
  IO.println (displayPrereqs Course.cpsc492)
  IO.println ""
  IO.println (displayPrereqs Course.cpsc326)
  IO.println ""
  IO.println (displayPrereqs Course.cpsc491)
  IO.println ""
  IO.println (displayPrereqs Course.cpsc121)
  IO.println ""

  -- FUNCTIONALITY 2 & 3: Calculate completion
  IO.println "FUNCTIONALITY 2 & 3: Major Completion"
  IO.println "====================================="

  -- Example: student has completed some courses
  let myCompleted := [Course.cpsc121, Course.cpsc122, Course.cpsc223,
                      Course.cpsc224, Course.cpsc326, Course.cpsc391]

  IO.println "My completed courses:"
  IO.println ("  " ++ coursesToString myCompleted)
  IO.println ""

  let percentage := calculateCompletion myCompleted
  IO.println ("Major completion: " ++ toString percentage ++ "%")
  IO.println ""

  -- Show which courses are still needed
  IO.println "Courses still needed:"
  let allCourses := [Course.cpsc121, Course.cpsc122, Course.cpsc223, Course.cpsc224,
                     Course.cpsc260, Course.cpsc326, Course.cpsc351, Course.cpsc346,
                     Course.cpsc348, Course.cpsc391, Course.cpsc450, Course.cpsc491,
                     Course.cpsc492, Course.cpsc499]
  let rec showMissing (courses : List Course) : IO Unit :=
    match courses with
    | [] => pure ()
    | c :: rest => do
        if courseInList c myCompleted then
          showMissing rest
        else do
          IO.println ("  - " ++ courseToString c)
          showMissing rest
  showMissing allCourses

#eval main
