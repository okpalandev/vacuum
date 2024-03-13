-- namespace vector

local vec2 = {}

function vec2:new(x, y)
    local o = {x = x or 0, y = y or 0}
    setmetatable(o, self)
    self.__index = self
    return o
end

function vec2:__tostring()
    return "(" .. self.x .. ", " .. self.y .. ")"
end

function vec2:__add(other)
    return vec2:new(self.x + other.x, self.y + other.y)
end

function vec2:__sub(other)
    return vec2:new(self.x - other.x, self.y - other.y)
end

function vec2:__mul(other)
    return vec2:new(self.x * other, self.y * other)
end

function vec2:__div(other)
    return vec2:new(self.x / other, self.y / other)
end

-- unary minus
function vec2:__unm()
    return vec2:new(-self.x, -self.y)
end

function vec2:__eq(other)
    return self.x == other.x and self.y == other.y
end

function vec2:__lt(other)
    return self.x < other.x and self.y < other.y
end

function vec2:__le(other)
    return self.x <= other.x and self.y <= other.y
end

function vec2:__len()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function vec2:__call(x, y)
    self.x = x
    self.y = y
end

function vec2:clone()
    return vec2:new(self.x, self.y)
end

function vec2:unpack()
    return self.x, self.y
end

function vec2:rotate(angle)
    local c = math.cos(angle)
    local s = math.sin(angle)
    self.x, self.y = self.x * c - self.y * s, self.x * s + self.y * c
end

function vec2:normalized()
    local len = #self
    return vec2:new(self.x / len, self.y / len)
end

function vec2:normalize_inplace()
    local len = #self
    self.x = self.x / len
    self.y = self.y / len
end

function vec2:perpendicular()
    return vec2:new(-self.y, self.x)
end

function vec2:dot(other)
    return self.x * other.x + self.y * other.y
end

function vec2:cross(other)
    return self.x * other.y - self.y * other.x
end

function vec2:project_on(other)
    local k = self:dot(other) / other:dot(other)
    return vec2:new(other.x * k, other.y * k)
end


local vec3 = {}

function vec3:new(x, y, z)
    local o = {x = x or 0, y = y or 0, z = z or 0}
    setmetatable(o, self)
    self.__index = self
    return o
end

function vec3:__tostring()
    return "(" .. self.x .. ", " .. self.y .. ", " .. self.z .. ")"
end

function vec3:__add(other)
    return vec3:new(self.x + other.x, self.y + other.y, self.z + other.z)
end

function vec3:__sub(other)
    return vec3:new(self.x - other.x, self.y - other.y, self.z - other.z)
end

function vec3:__mul(other)
    return vec3:new(self.x * other, self.y * other, self.z * other)
end

function vec3:__div(other)
    return vec3:new(self.x / other, self.y / other, self.z / other)
end

-- unary minus
function vec3:__unm()
    return vec3:new(-self.x, -self.y, -self.z)
end

function vec3:__eq(other)
    return self.x == other.x and self.y == other.y and self.z == other.z
end

function vec3:__lt(other)
    return self.x < other.x and self.y < other.y and self.z < other.z
end

-- less than or equal
function vec3:__le(other)
    return self.x <= other.x and self.y <= other.y and self.z <= other.z
end

function vec3:__len()
    return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end



function vec3:__call(x, y, z)
    self.x = x
    self.y = y
    self.z = z
end

function vec3:clone()
    return vec3:new(self.x, self.y, self.z)
end

function vec3:unpack()
    return self.x, self.y, self.z
end

function  vec3:rotatex(theta)    
    local c = math.cos(theta)
    local s = math.sin(theta)
    self.y, self.z = self.y * c - self.z * s, self.y * s + self.z * c
end

function  vec3:rotatey(theta)    
    local c = math.cos(theta)
    local s = math.sin(theta)
    self.x, self.z = self.x * c - self.z * s, self.x * s + self.z * c
end

function  vec3:rotatez(theta)    
    local c = math.cos(theta)
    local s = math.sin(theta)
    self.x, self.y = self.x * c - self.y * s, self.x * s + self.y * c
end

function vec3:normalized()
    local len = #self
    return vec3:new(self.x / len, self.y / len, self.z / len)
end

function vec3:normalize_inplace()
    local len = #self
    self.x = self.x / len
    self.y = self.y / len
    self.z = self.z / len
end

local vec4 = {}

function vec4:new(x, y, z, w)
    -- use a vec3 as a base
    local o = vec3:new(x, y, z)
    o.w = w or 0
    setmetatable(o, self)
    self.__index = self
    return o
end



local vector = { vec2 = vec2, vec3 = vec3, vec4 = vec4 }
local mt = {
    -- abstract call method in a metatable
    __call = function(_, ...)
        local n = select("#", ...)
        return vmt[n](...)
    end
}

setmetatable(vector, mt)

return vector

