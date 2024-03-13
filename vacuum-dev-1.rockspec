package = "vacuum"
version = "dev-1"
source = {
   url = "https://github.com/okpalandev/vacuum.git"
}
description = {
   summary = " A numerical computation library for building game development in Lua.",
   detailed = "A numerical computation library for building game development in Lua.",
   homepage = "https://github.com/okpalandev/vacuum",
   license = "*** see license in README file. ***"
}
build = {
   type = "builtin",
   modules = {
      ["vacuum"]="vacuum.lua",

   }
}
