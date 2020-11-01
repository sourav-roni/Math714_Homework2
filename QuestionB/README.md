# This folder contains code for numerical solutions to Question B in Homework 2

1) In order to just run a single instance of the linear interpolation and compute the error with respect to a very fine grid, run the file "qB.m". Note the value of N, i.e. the number of grid points as described in the question can be changed in this file.

2) For running the first step as desribed in the solution, i.e. compute error with respect to the fine grid for different values of N, run the file "qB_finegrid.m". The starting and ending values of N as well as the search interval can be changed in this file.

3) For running the second step described in the solution, after one has a good estimate of the answer, to refine it one can run the file "qB_refine.m". Note that in this file the start and end values of N are based on the run of the "qB_finegrid.m". This file takes sometime to run, and hence running the previous step is recommended to start with as a good heuristic.
