package.path = package.path .. ';' .. arg[0]:gsub('[^\\/]+$', '') .. '?.lua'  -- add current directory to package path
-- export all the modules in this directory

return {
    matrix = require('.matrix'),
    vector = require('.vector') ,
    quaternion = require('.quat'),
};