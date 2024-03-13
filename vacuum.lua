-- factory exports implementation of lib.main
package.path = package.path .. ';' .. arg[0]:gsub('[^\\/]+$', '') .. '?.lua' 
    
return require('lib.main');

