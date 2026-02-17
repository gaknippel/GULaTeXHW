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

def courseInList (c : Course) (list : List Course) : Bool := --helper function for main
  match list with
  | [] => false
  | x :: xs =>
      match courseEq c x with --match with head of list and c, if not recusively go thru c and xs (the rest of the list)
      | true => true
      | false => courseInList c xs

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
  | [] => "none"
  | [c] => courseToString c
  | c :: rest => courseToString c ++ ", " ++ coursesToString rest -- ++ is just string.append but easier


def displayPrereqs (c : Course) : String :=
  let courseName := courseToString c
  let prereqs := getPrerequisites c
  "prereqs for: " ++ courseName ++ ":\n" ++
  "  prerequisites: " ++ coursesToString prereqs

  def main : IO Unit := do --do is very useful here. it does these print things one after another
  IO.println "---johnson university CS major prerequisite checker---"
  IO.println ""

  -- change course number to search for a specific prereq chain
  IO.println "change course here to see certain prereqs! \n"
  IO.println (displayPrereqs Course.cpsc492)  --CHANGE THIS LINE TO DISPLAY DESIRED PREREQS

  -- calculate completion
  IO.println "------------------------------------------------------"

  -- my tree
  let myCompleted := [Course.cpsc121, Course.cpsc122, Course.cpsc223,
                      Course.cpsc224,]

  IO.println "my completed courses:"
  IO.println ("  " ++ coursesToString myCompleted)
  IO.println ""

  let percentage := calculateCompletion myCompleted
  IO.println ("major completion: " ++ toString percentage ++ "%")
  IO.println ""

  -- Show which courses are still needed
  IO.println "courses still needed:"
  let allCourses := [Course.cpsc121, Course.cpsc122, Course.cpsc223, Course.cpsc224,
                     Course.cpsc260, Course.cpsc326, Course.cpsc351, Course.cpsc346,
                     Course.cpsc348, Course.cpsc391, Course.cpsc450, Course.cpsc491,
                     Course.cpsc492, Course.cpsc499]
  let rec showMissing (courses : List Course) : IO Unit :=
    match courses with
    | [] => pure () -- have to output nothing or else lean gets mad
    | c :: rest => do
        if courseInList c myCompleted then
          showMissing rest
        else do
          IO.println ("  - " ++ courseToString c)
          showMissing rest
  showMissing allCourses

--#eval main


-- type "lean --run main.lean" in bash terminal to run this program.
-- or just type in "#eval main" to run it as well.
