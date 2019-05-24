using ExcelReaders
using MultivariateStats
using Plots
using StatsBase


#Leitura dos dados
dados = readxlsheet("WDI01.xlsx","Data", "D1:BK5")

# Criação das variáveis
gbr = dados[:,1];
gmx = dados[:,2];
cbr = gbr.*dados[:,3];
cmx = gmx.*dados[:,4];

# Transformação logarítmica
gbr = log.(gbr);
gmx = log.(gmx);
cbr = log.(cbr);
cmx = log.(cmx);

# Séries para estimação

T=length(gbr);
ano = LinRange(1960,2017,T);
time = LinRange(1,58,58);
time2 = time.^2;
X = [ones(58) time time2];   # tendência quadrática
# X = [ones(58) time];       # tendência linear

# Regressões

y = gbr;
a = llsq(X, y; bias=false);
gbrs = X * a;
gbrc = gbr - gbrs;

y = gmx;
a = llsq(X, y; bias=false);
gmxs = X * a;
gmxc = gmx - gmxs;

y = cbr;
a = llsq(X, y; bias=false);
cbrs = X * a;
cbrc = cbr - cbrs;

y = cmx;
a = llsq(X, y; bias=false);
cmxs = X * a;
cmxc = cmx - cmxs;

# Gráficos

p1 = plot(ano, [gbr gbrs], title="BRA-PIB")

p2 = plot(ano, gbrc, title="BRA-PIB-ciclo")

p3 = plot(ano, [cbr cbrs], title="BRA-Con")

p4 = plot(ano, cbrc, title="BRA-Con-ciclo")

p5 = plot(ano, [gmx gmxs], title="MEX-PIB")

p6 = plot(ano, gmxc,  title="MEX-PIB-ciclo")

p7 = plot(ano, [cmx cmxs], title="MEX-Con")

p8 = plot(ano, cmxc, title="MEX-Con-ciclo")

plot(p1,p2,p3,p4,p5,p6,p7,p8, layout=(4,2), legend=false) 
