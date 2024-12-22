using PiggyBack
using Test
using Aqua
using JET

@testset "PiggyBack.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(PiggyBack)
    end
    @testset "Code linting (JET.jl)" begin
        JET.test_package(PiggyBack; target_defined_modules=true)
    end
    # Write your tests here.
end
