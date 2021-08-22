# Circles

## Constructors

* `Circle(x,y,r)` creates a circle with center `(x,y)` and radius `r` (all real numbers).
* `Circle(z,r)` creates a circle with center specificed by the complex number `z` and radius `r`.
* `Circle(a,b,c)` creates a circle that passes through the three points specified by the complex numbers `a`, `b`, and `c`.

## Methods

* `radius(C)` returns the radius of the circle.
* `center(C)` returns the center of the circle as a complex number.
* `circumference(C)` returns the circumference of the circle.
* `area(C)` returns the area of the circle.
* `three_points(C)` returns a list of three points that lie on the circle (as complex numbers).

## Operations

### Mobius Transformation

Given a linear fractional transformation `F`, then `F(C)` is the result of applying that transformation to the points on `C`. See `LinearFractionalTransformations`.

### Set Operations


* **Intersection**: Given circles `C` and `D`, `intersect(C,D)` (or `C ∩ D`) returns the set of points common to the two circles (which may be empty, a singleton, or a two-element set).
* **Membership**: Given a complex number `z` and a circle `C`, `in(z,C)` (or `z ∈ C`) tests of the point `z` is inside (or on the boundary of) `C`.
* **Subset**: Given circles `C` and `D`, then `issubset(C,D)` (or `C ⊆ D`) returns `true` if `C` is contained inside `D`.

## Visualization

`draw(C)` draws `C` (using methods from `SimpleDrawing`). For example:
```julia
julia> newdraw(); draw(C; linecolor=:red); finish()
```
draws `C` as a red circle.


## Roundoff Errors

Note that all arithmetic is done using `Float64` values and so round off errors can occur. For example:
```julia
julia> using Circles, LinearFractionalTransformations

julia> C = Circle(1,2,3)
Circle(1.0, 2.0, 3.0)

julia> F = LFT(1,3,2,2)
LFT( 1.0 + 0.0im , 3.0 + 0.0im , 2.0 + 0.0im , 2.0 + 0.0im )

julia> D = F(C)
Circle(-1.499999999999995, 1.9999999999999953, 2.999999999999993)

julia> CC = inv(F)(D)
Circle(0.9999999999999912, 1.9999999999999916, 2.999999999999988)

julia> C == CC
false
```