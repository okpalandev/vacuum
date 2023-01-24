package = "luavacuum"
version = "dev-1"
source = {
   url = "git+https://github.com/magicmannna/vacuum.git"
}
description = {
   summary = "### Vacuum is inspired by the concepts of vacuums with physics.",
   detailed = "### Vacuum is inspired by the concepts of vacuums with physics. It is a numerical computation library for Lua. ",
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
