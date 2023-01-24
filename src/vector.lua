-- namespace vector

local Vec2 = {}

function Vec2:new(x, y)
    local o = {x = x or 0, y = y or 0}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Vec2:__tostring()
    return "(" .. self.x .. ", " .. self.y .. ")"
end

function Vec2:__add(other)
    return Vec2:new(self.x + other.x, self.y + other.y)
end

function Vec2:__sub(other)
    return Vec2:new(self.x - other.x, self.y - other.y)
end

function Vec2:__mul(other)
    return Vec2:new(self.x * other, self.y * other)
end

function Vec2:__div(other)
    return Vec2:new(self.x / other, self.y / other)
end

-- unary minus
function Vec2:__unm()
    return Vec2:new(-self.x, -self.y)
end

function Vec2:__eq(other)
    return self.x == other.x and self.y == other.y
end

function Vec2:__lt(other)
    return self.x < other.x and self.y < other.y
end

function Vec2:__le(other)
    return self.x <= other.x and self.y <= other.y
end

function Vec2:__len()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vec2:__call(x, y)
    self.x = x
    self.y = y
end

function Vec2:clone()
    return Vec2:new(self.x, self.y)
end

function Vec2:unpack()
    return self.x, self.y
end

function Vec2:rotate(angle)
    local c = math.cos(angle)
    local s = math.sin(angle)
    self.x, self.y = self.x * c - self.y * s, self.x * s + self.y * c
end

function Vec2:normalized()
    local len = #self
    return Vec2:new(self.x / len, self.y / len)
end

function Vec2:normalize_inplace()
    local len = #self
    self.x = self.x / len
    self.y = self.y / len
end

function Vec2:perpendicular()
    return Vec2:new(-self.y, self.x)
end

function Vec2:dot(other)
    return self.x * other.x + self.y * other.y
end

function Vec2:cross(other)
    return self.x * other.y - self.y * other.x
end

function Vec2:project_on(other)
    local k = self:dot(other) / other:dot(other)
    return Vec2:new(other.x * k, other.y * k)
end


local Vec3 = {}

function Vec3:new(x, y, z)
    local o = {x = x or 0, y = y or 0, z = z or 0}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Vec3:__tostring()
    return "(" .. self.x .. ", " .. self.y .. ", " .. self.z .. ")"
end

function Vec3:__add(other)
    return Vec3:new(self.x + other.x, self.y + other.y, self.z + other.z)
end

function Vec3:__sub(other)
    return Vec3:new(self.x - other.x, self.y - other.y, self.z - other.z)
end

function Vec3:__mul(other)
    return Vec3:new(self.x * other, self.y * other, self.z * other)
end

function Vec3:__div(other)
    return Vec3:new(self.x / other, self.y / other, self.z / other)
end

-- unary minus
function Vec3:__unm()
    return Vec3:new(-self.x, -self.y, -self.z)
end

function Vec3:__eq(other)
    return self.x == other.x and self.y == other.y and self.z == other.z
end

function Vec3:__lt(other)
    return self.x < other.x and self.y < other.y and self.z < other.z
end

-- less than or equal
function Vec3:__le(other)
    return self.x <= other.x and self.y <= other.y and self.z <= other.z
end

function Vec3:__len()
    return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end



function Vec3:__call(x, y, z)
    self.x = x
    self.y = y
    self.z = z
end

function Vec3:clone()
    return Vec3:new(self.x, self.y, self.z)
end

function Vec3:unpack()
    return self.x, self.y, self.z
end

function  Vec3:rotatex(theta)    
    local c = math.cos(theta)
    local s = math.sin(theta)
    self.y, self.z = self.y * c - self.z * s, self.y * s + self.z * c
end

function  Vec3:rotatey(theta)    
    local c = math.cos(theta)
    local s = math.sin(theta)
    self.x, self.z = self.x * c - self.z * s, self.x * s + self.z * c
end

function  Vec3:rotatez(theta)    
    local c = math.cos(theta)
    local s = math.sin(theta)
    self.x, self.y = self.x * c - self.y * s, self.x * s + self.y * c
end

function Vec3:normalized()
    local len = #self
    return Vec3:new(self.x / len, self.y / len, self.z / len)
end


local Vec4 = {}

function Vec4:new(x, y, z, w)
    -- use a Vec3 as a base
    local o = Vec3:new(x, y, z)
    o.w = w or 0
    setmetatable(o, self)
    self.__index = self
    return o
end



local vector = {}
local mt = {
    __call = function(_, ...)
        local n = select("#", ...)
        return vmt[n](...)
    end
}

setmetatable(vector, mt)

return vector

