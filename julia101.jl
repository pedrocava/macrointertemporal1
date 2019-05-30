### matriz


A = [[1 0];[0 1]]
abs.(A)

for i = 1:100
    println(i)
end

f(x) = x^2

# ou

function quadrado(x)
    x = x^2
    return x
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
d = zeros(500)
d[1] = 1



w = w + cumsum(randn(500))
vetor = ones(500)
vetor = cumsum(vetor)



y = sin(vetor) + randn(500)
plot(w)


plot!(x)
savefig("figura1.png")

using Optim

f(x) = 2*x[1]^2 - 5*x[1] + 40

solucao = optimize(f, ones(1), LBFGS())
