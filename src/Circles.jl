module Circles
using SimpleDrawing, LinearFractionalTransformations

export Circle

"""
    Circle

Represents a circle in the plane. Constructors:
* `circle(x,y,r)` based on center coordinates and radius 
* `circle(z,r)` based on center given as a complex number and a radius
* `circle(a,b,c)` based on three complex numbers that represent points on the circle
"""
struct Circle
    x::Float64
    y::Float64
    r::Float64
    function Circle(a::Real, b::Real, rad::Real)
        rad >= 0 || error("Radius must be nonnegative")
        new(a, b, rad)
    end
end

Circle(z::Complex, r::Real) = Circle(real(z), imag(z), r)

function Circle(a::Complex, b::Complex, c::Complex)
    z = find_center(a, b, c)
    !isinf(z) || error("Cannot construct a circle through three collinear points")
    r = abs(a - z)
    return Circle(z, r)
end

# standard stuff

export radius, area, circumference, center

"""
    radius(C)
Return the radius of the circle.
"""
radius(C::Circle) = C.r

"""
    area(C)
Return the area of the circle.
"""
area(C::Circle) = π * C.r * C.r

"""
    circumference(C)
Return the circumference of the circle.
"""
circumference(C::Circle) = 2 * π * C.r

"""
    center(C)
Return the center of the circle as a complex number. 
"""
center(C::Circle) = Complex(C.x, C.y)

"""
    three_points(C)
Return a list of three points on the circle as complex numbers.
"""
function three_points(C::Circle)
    z = center(C)
    r = radius(C)
    [z + r * exp(k * (2π * im / 3)) for k = 0:2]
end
export three_points

import SimpleDrawing: draw 
"""
    draw(C::Circle)
Draw the circle `C`.
"""
draw(C::Circle; args...) = draw_circle(center(C), radius(C); args...)


# applying LFT to a Circle

function (F::LFT)(C::Circle)
    pp = three_points(C)
    qq = F.(pp)
    return Circle(qq...)
end



end # module
