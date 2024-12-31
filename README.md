# Orbital Laser

## Installation

For convenience, we have an install script. This will symlink the mod into the default directory that Factorio loads mods from. It requires some python packages to be installed.

```
pip install pyuac
pip install pypiwin32
```

After this, just run the following command and the mod should be placed in the correct directory and will update with any changes you make.

```
python install.py
```

## Testing

### Unit Tests

Unit tests are done using [LuaUnit](https://luaunit.readthedocs.io/en/latest/)

-   [Install Lua](https://luabinaries.sourceforge.net/) (Version 5.2)
-   Extract the executables to some directory, such as `%LOCALAPPDATA%/Programs/Lua/`
-   Copy [`luaunit.lua`](https://github.com/bluebird75/luaunit/blob/master/luaunit.lua) into the directory above, under a `lua` subdirectory. For example `%LOCALAPPDATA%/Programs/Lua/lua/luaunit.lua`
-   Add the Lua directory to your PATH. If you're following along, that's `%LOCALAPPDATA%/Programs/Lua/`
-   Run the tests by calling `lua path/to/test/TESTNAME.lua`
    -   Note that you may need to call `lua52 path/to/test/TESTNAME.lua` instead
    -   Can pass in the flag `-v` to run test with more verbose output
