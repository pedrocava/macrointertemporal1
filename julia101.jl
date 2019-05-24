### matriz

A = [[1 0];[0 1]]

abs.(A)

for i = 1:100
    println(i)
end

f(x) = x^2

# ou

function quadrado
    x^2
end

quadrado(2)


using Plots

x = randn(500)

plot(x)
scatter(x)

y = randn(200)
z = cumsum(y)

plot(z)

w = 0.5*x + randn(500)
w = w + cumsum(randn(500))
plot(w)

plot!(x)
savefig("figura1.png")


using Optim

f(x) = 2*x[1]^2 - 5*x[1] + 40

solucao = optimize(f, ones(1), LBFGS())
