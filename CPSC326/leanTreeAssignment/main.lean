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
