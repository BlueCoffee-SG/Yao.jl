export TagBlock
"""
    TagBlock{N, T} <: AbstractContainer{N, T}

TagBlock is a special kind of Container, it is a size keeper.
"""
abstract type TagBlock{N, T} <: AbstractContainer{N, T} end

==(a::TB, b::TB) where {TB<:TagBlock} = parent(a) == parent(b)
getindex(c::TagBlock, index...) = getindex(parent(c), index...)
setindex!(c::TagBlock, val, index...) = setindex!(parent(c), val, index...)

iterate(c::TagBlock) = iterate(parent(c))
iterate(c::TagBlock, st) = iterate(parent(c), st)

cache_key(tb::TagBlock) = cache_key(parent(tb))
block(tb::TagBlock) = parent(tb)

include("BlockCache.jl")
include("Daggered.jl")
include("Scale.jl")
include("Diff.jl")

########## common interfaces are defined here! ##############
for BLOCKTYPE in (:Daggered, :CachedBlock, :StaticScale, :Scale, :BPDiff, :QDiff)
    @eval parent(dg::$BLOCKTYPE) = dg.block
end

for METHOD in (:usedbits,)
    @eval $METHOD(dg::TagBlock) = $METHOD(parent(dg))
end
