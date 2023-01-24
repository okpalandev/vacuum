local matrix = {}

function matrix:new(n,m)
    -- Create a new matrix
    local matt = {}
    for i = 1, n do
        matt[i] = {}
        for j = 1, m do
            matt[i][j] = 0
        end
    end
    setmetatable(matt, self)
    self.__index = self
    return matt
end

function matrix:__tostring()
    -- Print a matrix
    local str = ""
    for i = 1, #self do
        for j = 1, #self[i] do
            str = str .. self[i][j] .. " "
        end
        str = str .. "" .. "" .. "" 
    end
    return str
end

function matrix:__add(other)
    -- Add two matrices
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = self[i][j] + other[i][j]
        end
    end
    return matt
end

function matrix:__sub(other)
    -- Subtract two matrices
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = self[i][j] - other[i][j]
        end
    end
    return matt
end

function matrix:__mul(other)
    -- Multiply two matrices
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = self[i][j] * other[i][j]
        end
    end
    return matt
end

function matrix:__div(other)
    -- Divide two matrices
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = self[i][j] / other[i][j]
        end
    end
    return matt
end

function matrix:__unm()
    -- Unary minus
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = -self[i][j]
        end
    end
    return matt
end

function matrix:__eq(other)
    -- Check if two matrices are equal
    for i = 1, #self do
        for j = 1, #self[i] do
            if self[i][j] ~= other[i][j] then
                return false
            end
        end
    end
    return true
end

function matrix:__lt(other)
    -- Check if one matrix is less than another
    for i = 1, #self do
        for j = 1, #self[i] do
            if self[i][j] >= other[i][j] then
                return false
            end
        end
    end
    return true
end

function matrix:__le(other)
    -- Check if one matrix is less than or equal to another
    for i = 1, #self do
        for j = 1, #self[i] do
            if self[i][j] > other[i][j] then
                return false
            end
        end
    end
    return true
end

function matrix:__pow(other)
    -- Raise a matrix to a power
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = self[i][j] ^ other[i][j]
        end
    end
    return matt
end

function matrix:__mod(other)
    -- Modulo a matrix
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = self[i][j] % other[i][j]
        end
    end
    return matt
end

function matrix:__concat(other)
    -- Concatenate two matrices
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = self[i][j] .. other[i][j]
        end
    end
    return matt
end

function matrix:__len()
    -- Get the length of a matrix
    return #self * #self[1]
end

function matrix:__call(...)
    -- Call a matrix
    local matt = matrix:new(#self, #self[1])
    for i = 1, #self do
        for j = 1, #self[i] do
            matt[i][j] = self[i][j](...)
        end
    end
    return matt
end

function matrix:__index(key)
    -- Get a matrix element
    return self[key[1]][key[2]]
end

function matrix:__newindex(key, value)
    -- Set a matrix element
    self[key[1]][key[2]] = value
end

function matrix:__pairs()
    -- Iterate over a matrix
    local i = 0
    local j = 0
    return function()
        i = i + 1
        if i > #self then
            i = 1
            j = j + 1
        end
        if j > #self[1] then
            return nil
        end
        return {i, j}, self[i][j]
    end
end



return matrix