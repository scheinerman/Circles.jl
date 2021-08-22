
function _make_radii(a::Complex, b::Complex, c::Complex)
    dab = abs(a - b)
    dbc = abs(b - c)
    dac = abs(a - c)
    rhs = [dab; dbc; dac]
    A = [1 1 0; 0 1 1; 1 0 1]

    radii = A \ rhs
end


"""
    three_circles(z1,z2,z3)

Given three points (as complex numbers) find three circles 
centered at those points that are mutually tangent.

See: `touch_points`
"""
function three_circles(a::Complex, b::Complex, c::Complex)
    rads = _make_radii(a, b, c)
    ctrs = [a,b,c]

    [Circle(ctrs[k],rads[k]) for k=1:3]
end

export three_circles, touch_points


"""
    touch_points(z1,z2,z3)

Given three points (as complex numbers) determine the points of tangency
of three mutually tangent circles centered at those points. 

See: `three_circles`
"""
function touch_points(a::Complex, b::Complex, c::Complex)
    radii = _make_radii(a,b,c)
    ra,rb,rc = radii

    ab = (b-a) * (ra/(ra+rb)) + a
    ac = (c-a) * (ra/(ra+rc)) + a
    bc = (c-b) * (rb/(rb+rc)) + b
    return [ab; ac; bc]
end
