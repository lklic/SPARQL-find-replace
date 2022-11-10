# SPARQL-find-replace
a handy bash script to find and replace parts of a URI across all named graphs:
 - configured for blazegraph but can be used for other graph databases
 - specifically made for updating URI patterns, be careful if you have the '$find' text in some literal, it will also replace this.
 - adds some checks on your query before and after the update to make sure it's doing what you want
 - blazegraph mutation count will be twice the count, as it counts insert and delete.
 - use at your own risk!
 
 
sample output:

```
--------------------------------------- NAMED GRAPHS ---------------------------------------
Number of NAMED GRAPHS with find term:
count
12792
************ STARTING UPDATE OF NAMED GRAPHS ************
Mutation Count on UPDATE:
25584
************ END UPDATE OF NAMED GRAPHS ************
NEW Number of NAMED GRAPHS with find term:
count
0
NEW Number of NAMED GRAPHS with replaced term:
count
12792
--------------------------------------- SUBJECTS ---------------------------------------
Number of SUBJECTS with find term:
count
11779
************ STARTING UPDATE OF SUBJECTS ************
Mutation Count on UPDATE:
23558
************ END UPDATE OF SUBJECTS ************
NEW Number of SUBJECTS with find term:
count
0
NEW Number of SUBJECTS with replaced term:
count
11779
--------------------------------------- PREDICATES ---------------------------------------
Number of PREDICATES with find term:
count
201
************ STARTING UPDATE OF PREDICATES ************
Mutation Count on UPDATE:
402
************ END UPDATE OF PREDICATES ************
NEW Number of PREDICATES with find term:
count
0
NEW Number of PREDICATES with replaced term:
count
201
--------------------------------------- OBJECTS ---------------------------------------
Number of OBJECTS with find term:
count
4791
************ STARTING UPDATE OF OBJECTS ************
Mutation Count on UPDATE:
9582
************ END UPDATE OF OBJECTS ************
NEW Number of OBJECTS with find term:
count
0
NEW Number of OBJECTS with replaced term:
count
4791
```
