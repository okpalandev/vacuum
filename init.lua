-- factory exports implementation of lib.main
package.path = package.path .. ';' .. arg[0]:gsub('[^\\/]+$', '') .. '.lib?.lua'  -- add current directory to package path

return require('lib.main');
