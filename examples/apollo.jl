using SimpleDrawing, Circles, DataStructures

function apollo(C1::Circle, C2::Circle, C3::Circle, minrad::Real = 1e-2)
    newdraw()
    CC = [C1, C2, C3]
    for C in CC
        draw(C, linewidth = 0.5)
    end

    _apollo(C1, C2, C3, minrad)
    finish()
    plot!(xaxis = [-5, 5], yaxis = [-5, 5])
end

function _apollo(C1::Circle, C2::Circle, C3::Circle, minrad)
    D = soddy(C1, C2, C3)
    r = radius(D)
    if r < minrad
        return
    end
    draw(D, linewidth = 0.5)

    _apollo(C1, C2, D, minrad)
    _apollo(C1, C3, D, minrad)
    _apollo(C2, C3, D, minrad)
end

"""
    apollo()
Draw a picture of an Apollonian circle packing.
"""
function apollo()
    pts = 10 * [exp(2 * π * k * im / 3) for k = 1:3]
    CC = kiss(pts...)
    apollo(CC...)
end
