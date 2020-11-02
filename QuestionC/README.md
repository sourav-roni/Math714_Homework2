# This folder contains code for Question C in Homework 2

1) In order to run a single instance and visualize the value in the spatial grid as time varies run the file "qCi.m". One can change the number of grid points using N in the file. Here, is a snapshot of how the visualization looks like for N=100 at a certain instant of time.

![alt text](https://github.com/sourav-roni/Math714_Homework2/blob/main/QuestionC/snap.png)

2) In order to generate the required log-log plot, one can run the file "qC_error_plot.m". Note the number of grid points in the most coarse grid are set according to the results of QuestionB. Note we run the process for 4 different coarse grids. If one wants to run for more number of coarse grids, it will be needed to add those variables accordingly. Below is the error plot which was obtained for when the code was run with the time horizon, T=1. We can see that the log-log plot has a slope nearing 2, indicating that the method is second-order accurate.

![alt text](https://github.com/sourav-roni/Math714_Homework2/blob/main/QuestionC/err_plt.png)

3) 
