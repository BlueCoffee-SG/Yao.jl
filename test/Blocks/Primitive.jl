using Test, Random, LinearAlgebra, SparseArrays


@testset "Constant Gates" begin
    include("ConstantGate.jl")
end

@testset "Phase Gate" begin
    include("PhaseGate.jl")
end

@testset "Shift Gate" begin
    include("ShiftGate.jl")
end

@testset "Rotation Gate" begin
    include("RotationGate.jl")
end

@testset "Time Evolution Gate" begin
    include("TimeEvolution.jl")
end

@testset "Swap Gate" begin
    include("SwapGate.jl")
end

@testset "ReflectBlock" begin
    include("ReflectBlock.jl")
end

@testset "GeneralMatrixGate" begin
    include("GeneralMatrixGate.jl")
end
