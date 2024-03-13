package = "vacuum"
version = "dev-1"
source = {
   url = "https://github.com/okpalandev/vacuum.git"
}
description = {
   summary = "A numerical computation library for building Lua games.",
   detailed = "",
   homepage = "https://github.com/okpalandev/vacuum",
   license = "MIT"
}
build = {
   type = "builtin",
   modules = {
      ["vacuum.main"] = "lib/main.lua",
      ["vacuum.matrix"] = "lib/matrix.lua",
      ["vacuum.quat"] = "lib/quat.lua",
      ["vacuum.vector"] = "lib/vector.lua"
   }
}
