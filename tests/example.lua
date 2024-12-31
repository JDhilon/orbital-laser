lu = require('luaunit') -- needed to get LuaUnit

-- define a function we want to test
function add(v1, v2)
    return v1 + v2
end

-- define a test case. Any function beginning with 'test' is considered a test
function testAdd()
    lu.assertEquals(add(1, 1), 2) -- call assertEquals from luaunit
end

os.exit(lu.LuaUnit.run()) -- runs the tests using LuaUnit
