-- factory exports implementation of lib.main
package.path = package.path .. ';' .. arg[0]:gsub('[^\\/]+$', '') .. '?.lua'  -- add current directory to package path

return require('lib.main');

