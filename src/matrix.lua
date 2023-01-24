local Matrix = {}

function Matrix:new(n,m)
    -- Create a new matrix
    local matrix = {}
    for i = 1, n do
        matrix[i] = {}
        for j = 1, m do
            matrix[i][j] = 0
        end
    end
    setmetatable(matrix, self)
    self.__index = self
    return matrix
end

return Matrix