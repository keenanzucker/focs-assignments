# FOCS Homework 16

```
Student Name: Keenan Zucker
Check one:
[X] I completed this assignment without assistance or external resources.
[ ] I completed this assignment with assistance from ___
   and/or using these external resources: ___
```

## I. (Undirected) Graphs

*G* = ({1, 2, 3}, {{1, 2}, {1, 3}})

### 1. Match the diagrams to the graph structures.

(i) *G* = ({1, 2, 3, 4}, {{1, 2}, {1, 4}, {3, 4}})
##### B

(ii) *G* = ({1, 2, 3, 4}, {{1, 2}, {1, 4}, {2, 3}, {3, 4}})
##### A

(iii) *G* = ({1, 2, 3, 4, 5}, {{1, 2}, {1, 3}, {1, 4}, {1, 5}, {2, 5}})
##### D

(iv) *G* = ({1, 2, 3, 4}, {{1, 2}, {1, 4}, {1, 3}})
##### C

### 2. Cycles

Which of (1a-d) contains a cycle? For those graphs that contain a cycle, what is the cycle?

* A contains a cycle, which is vertices 1 -> 2 -> 3 -> 4 -> 1
* D contains a cycle, which is vertices 1 -> 2 -> 5 -> 1

### 3. Draw a diagram for this graph.

*G* = ({1, 2, 3, 4, 5}, {{1, 2}, {2, 3}, {3, 4}, {4, 5}, {1, 5}})

![](images/graph3.JPG)

### 4. Write the graph (V, E) for this diagram.

*G* =({1,2,3,4,5,6}, {{1,2}, {2,3}, {1,3}, {3,4}, {3,5}, {4,5}, {1,4}})

## II. Directed Graphs

### 5. Match the diagrams to the graphs.

(i) *G* = ({1, 2, 3, 4}, {(1, 2), (1, 4), (3, 2), (3, 4)})
##### A

(ii) *G* = ({1, 2, 3, 4}, {(1, 2), (1, 4), (4, 3)})
##### C

(iii) *G* = ({1, 2, 3, 4}, {(1, 2), (4, 1), (2, 3), (3, 4)})
##### B

### 6. Directed acyclic graphs

Which of (5a-c) are DAGs?

- A **is** a directed acycle graph
- B **isn't** a directed acycle graph because of the cycle 1 -> 2 -> 3 -> 4 -> 1
- C **is** a directed acycle graph

### 7. Draw a diagram for this graph.

*G* = ({1, 2, 3, 4}, {(1, 2), (2, 3), (3, 4), (4, 1), (1, 3)})

![](images/graph7.JPG)

Is this graph a DAG?

This group is **not** a DAG because of the cycle: 1 -> 2 -> 3 -> 4 -> 1

### 6. Write the graph (V, A) for this diagram.

*G* = ({1,2,3,4}, {(1,2), (2,4), (3,4), (3,2), (3,1)})

### 7. Adjacency matrices

Write the adjacency matrix for the graph in (5a).
*G* = ({1, 2, 3, 4}, {(1, 2), (1, 4), (3, 2), (3, 4)})

```
 _ _ _ _ i
|0 0 0 0
|1 0 1 0
|0 0 0 0
|1 0 1 0
j

```

