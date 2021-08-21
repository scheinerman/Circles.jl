# Circles

## Constructors

* `Circle(x,y,r)` creates a circle with center `(x,y)` and radius `r` (all real numbers).
* `Circle(z,r)` creates a circle with center specificed by the complex number `z` and with radius `r`.
* `Circle(a,b,c)` creates a circle that passes through the three points specified by the complex numbers `a`, `b`, and `c`.

## Methods

* `radius(C)` returns the radius of the circle.
* `center(C)` returns the center of the circle as a complex number.
* `circumference(C)` returns the circumference of the circle.
* `area(C)` returns the area of the circle.
* `three_points(C)` returns a list of three points that lie on the circle (as complex numbers).


## Mobius Transformation

Given a linear fractional transformation `F`, then `F(C)` is the result of applying that transformation to the points on `C`. See `LinearFractionalTransformations`.


## Visualization

`draw(C)` draws `C` (using methods from `SimpleDrawing`). For example:
```julia
julia> newdraw(); draw(C; linecolor=:red); finish()
```
draws `C` as a red circle.




## To Do

Implement intersection of circles `∩` to give a set of 0, 1, or 2 points.  