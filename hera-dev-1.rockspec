package = "hera"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {
   "luasocket == 3.1.0-1",
   "argparse == 0.7.1-1",
   "bolt == 1.2-1",
   "dkjson == 2.8-1",
   "lua-dotenv == 1.0-2",
   "markdown == 0.33-1"
}
build = {
   type = "builtin",
   modules = {}
}
