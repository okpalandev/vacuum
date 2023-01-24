local vector = require 'lib.vector'

-- example of using vector
local x0 = vector.vec2:new(1, 2)
local y0 = vector.vec2:new(3, 4)
local z0 = x0 + y0

assert(z0.x == 4,"z0.x should be equal to 4")
assert(z0.y == 6,"z0.y should be equal to 6")

-- example of using vector3d
local x1 = vector.vec3:new(1, 2, 3)
local y1 = vector.vec3:new(4, 5, 6)
local z1 = x1 + y1

assert(z1.x == 5,"z1.x should be equal to 5")
assert(z1.y == 7,"z1.y should be equal to 7")
assert(z1.z == 9,"z1.z should be equal to 9")



