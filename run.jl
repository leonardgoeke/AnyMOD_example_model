
using anyMOD
using Gurobi # other JuMP compatible solvers should work as well

# enter one of the tree cases provided for the benchmark problem ("power_hourly","power_and_heat_hourly","all_hourly")
case = "power_hourly"

# constructs the anyMOD model object by reading in "basic_data" and the folder corresponding to the respective case, outputs are written to the result folder
# objName sets name of model to written in report and output files, bound is used set an upper limit for the objective value
# supTsLvl externally sets the depth of superordinate dispatch time-steps and shortExp provides the number of years between these time-steps
mod_obj = anyModel(["basic_data",case],"results", objName = case, bound = (capa = NaN, disp = NaN, obj = 1e6), supTsLvl = 2, shortExp = 5)

# creates optimization model and sets cost objective
createOptModel!(mod_obj)
setObjective!(:costs,mod_obj)

# solves optimization model
optimize!(mod_obj.optModel,with_optimizer(Gurobi.Optimizer, Method = 2, BarOrder = 0, Crossover = 1))

# write aggregated results
reportResults(:summary,mod_obj)
reportResults(:exchange,mod_obj)
reportResults(:costs,mod_obj)

# write results for time-series
reportTimeSeries(:electricity, mod_obj)
reportTimeSeries(:hydrogen, mod_obj)
reportTimeSeries(:heat, mod_obj)
reportTimeSeries(:gas, mod_obj)

# create sankey diagramm
plotEnergyFlow(:sankey,mod_obj,rmvNode = ("trade buy; fossil gas","trade buy; coal","final demand; heat"))
