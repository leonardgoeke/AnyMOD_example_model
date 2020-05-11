This repository documents an example model created with the [anyMOD](https://github.com/leonardgoeke/anyMOD.jl) framework. Its purpose is to demonstrate how models, their input data, and their results can be made open and accessible with anyMOD. In addition, the repository can serve as an example for version controlled model development using anyMOD.

`asic_data` contains the commented and referenced input data. In addition, it provides the definition of time-steps, regions and technologies used within the model. For energy carriers each of the folders `power_hourly`, `power_and_heat_hourly` and `all_hourly` provides a definition with a different resolution. The code in `run.jl` creates and solves a model with one these resolutions and writes results to the results folder.

So far the repository contains the following branches:
* May2020: Specific model used in the working paper “anyMOD -- A graph-based framework for energy system modelling with high levels of renewables and sector integration” to introduce the graph-based approach and benchmark the model for different temporal resolutions.

