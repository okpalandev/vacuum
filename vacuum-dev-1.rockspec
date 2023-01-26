package = "vacuum"
version = "dev-1"
source = {
   url = "git+https://github.com/magicmannna/vacuum.git"
}
description = {
   summary = "### A numerical computation library for building game development in Lua.",
   detailed = "### A numerical computation library for building game development in Lua.",
   homepage = "https://github.com/magicmannna/vacuum",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      main = "lib/main.lua",
      matrix = "lib/matrix.lua",
      quat = "lib/quat.lua",
      vector = "lib/vector.lua"
   }
}
