package = "vacuum"
version = "0.0.dev-1"
source = {
   url = "git+https://github.com/magicmannna/vacuum.git"
}
description = {
   summary = "### A numerical computation library for building Lua Games.",
   detailed = "### Vacuum is inspired by the concepts of vacuums with physics. It is a numerical computation library for Lua. ",
   homepage = "https://github.com/magicmannna/vacuum",
   license = "*** see LICENSE in README file ***"
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
