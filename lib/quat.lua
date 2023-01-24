local vector = require("vector")
local Matrix = require("matrix")

-- destructuring assignment for namespace
local vec2, vec3, vec4 = vector.vec2, vector.vec3, vector.vec4
-- Quaternion class
local Quaternion = {};


function Quaternion:new(x, y, z, w)
    -- a Quaternion is a 4D vector
    -- - inherits from vec4
    local o = vec4:new(x, y, z,w)
    setmetatable(o, self)
    self.__index = self
    return o
end

function Quaternion:__tostring()
    return "(" .. self.x .. ", " .. self.y .. ", " .. self.z .. ", " .. self.w .. ")"
end


function Quaternion:__mul(other)
    -- Quaternion multiplication
    -- is not commutative
    -- (a * b) != (b * a)
    return Quaternion:new(
        self.w * other.x + self.x * other.w + self.y * other.z - self.z * other.y,
        self.w * other.y - self.x * other.z + self.y * other.w + self.z * other.x,
        self.w * other.z + self.x * other.y - self.y * other.x + self.z * other.w,
        self.w * other.w - self.x * other.x - self.y * other.y - self.z * other.z
    )
end

function Quaternion:__div(other)
    -- Quaternion division
    -- is not commutative
    -- (a / b) != (b / a)
    return Quaternion:new(
        self.w * other.x - self.x * other.w - self.y * other.z + self.z * other.y,
        self.w * other.y + self.x * other.z - self.y * other.w - self.z * other.x,
        self.w * other.z - self.x * other.y + self.y * other.x - self.z * other.w,
        self.w * other.w + self.x * other.x + self.y * other.y + self.z * other.z
    )
end

function Quaternion:__unm()
    -- Quaternion negation
    return Quaternion:new(-self.x, -self.y, -self.z, -self.w)
end

function Quaternion:__eq(other)
    return self.x == other.x and self.y == other.y and self.z == other.z and self.w == other.w
end

function Quaternion:conjugate()
    -- Quaternion conjugate
    return Quaternion:new(-self.x, -self.y, -self.z, self.w)
end

function Quaternion:inverse()
    -- Quaternion inverse
    return self:conjugate() / self:dot(self)
end

function Quaternion:dot(other)
    -- Quaternion dot product
    return self.x * other.x + self.y * other.y + self.z * other.z + self.w * other.w
end

function Quaternion:normalize()
    -- Quaternion normalization
    local len = self:dot(self)
    self.x = self.x / len
    self.y = self.y / len
    self.z = self.z / len
    self.w = self.w / len
end


function Quaternion:rotate_vector(vector)
    -- Rotate a vector by a quaternion
    -- (q * v * q^-1)
    return (self * Quaternion:new(vector.x, vector.y, vector.z, 0) * self:inverse()).xyz
end

function Quaternion:rotate_point(point)
    -- Rotate a point by a quaternion
    -- (q * p * q^-1)
    return (self * Quaternion:new(point.x, point.y, point.z, 0) * self:inverse()).xyz
end

function Quaternion:rotate_quaternion(quaternion)
    -- Rotate a quaternion by a quaternion
    -- (q * r * q^-1)
    return self * quaternion * self:inverse()
end

function Quaternion:from_axis_angle(axis, angle)
    -- Create a quaternion from an axis and an angle
    local half_angle = angle / 2
    local sin = math.sin(half_angle)
    self.x = axis.x * sin
    self.y = axis.y * sin
    self.z = axis.z * sin
    self.w = math.cos(half_angle)
end

function Quaternion:from_euler_angles(roll, pitch, yaw)
    -- Create a quaternion from euler angles
    local cr = math.cos(roll / 2)
    local cp = math.cos(pitch / 2)
    local cy = math.cos(yaw / 2)
    local sr = math.sin(roll / 2)
    local sp = math.sin(pitch / 2)
    local sy = math.sin(yaw / 2)
    self.x = sr * cp * cy - cr * sp * sy
    self.y = cr * sp * cy + sr * cp * sy
    self.z = cr * cp * sy - sr * sp * cy
    self.w = cr * cp * cy + sr * sp * sy
end

function Quaternion:to_axis_angle()
    -- Convert a quaternion to an axis and an angle
    local axis = vec3:new(self.x, self.y, self.z)
    local angle = 2 * math.acos(self.w)
    axis:normalize()
    return axis, angle
end

function Quaternion:to_euler_angles()
    -- Convert a quaternion to euler angles
    local roll = math.atan2(2 * (self.w * self.x + self.y * self.z), 1 - 2 * (self.x * self.x + self.y * self.y))
    local pitch = math.asin(2 * (self.w * self.y - self.z * self.x))
    local yaw = math.atan2(2 * (self.w * self.z + self.x * self.y), 1 - 2 * (self.y * self.y + self.z * self.z))
    return roll, pitch, yaw
end

function Quaternion:to_matrix()
    -- Convert a quaternion to a matrix
    local matrix = Matrix:new()
    matrix[1][1] = 1 - 2 * (self.y * self.y + self.z * self.z)
    matrix[1][2] = 2 * (self.x * self.y + self.z * self.w)
    matrix[1][3] = 2 * (self.x * self.z - self.y * self.w)
    matrix[2][1] = 2 * (self.x * self.y - self.z * self.w)
    matrix[2][2] = 1 - 2 * (self.x * self.x + self.z * self.z)
    matrix[2][3] = 2 * (self.y * self.z + self.x * self.w)
    matrix[3][1] = 2 * (self.x * self.z + self.y * self.w)
    matrix[3][2] = 2 * (self.y * self.z - self.x * self.w)
    matrix[3][3] = 1 - 2 * (self.x * self.x + self.y * self.y)
    return matrix
end

function Quaternion:to_string()
    -- Convert a quaternion to a string
    return string.format("Quaternion(%f, %f, %f, %f)", self.x, self.y, self.z, self.w)
end

function Quaternion:to_table()
    -- Convert a quaternion to a table
    return {self.x, self.y, self.z, self.w}
end



function Quaternion:to_vec3()
    -- Convert a quaternion to a vec3
    return vec3:new(self.x, self.y, self.z)
end

function Quaternion:to_vec2()
    -- Convert a quaternion to a vec2
    return vec2:new(self.x, self.y)
end

function Quaternion:to_vec4()
    -- Convert a quaternion to a vec4
    return vec4:new(self.x, self.y, self.z, self.w)
end

return Quaternion