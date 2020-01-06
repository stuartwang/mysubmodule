local st, gt = setmetatable, getmetatable
local mt = {}
local default = {
    ["name"] = "zblade",
    ["telphone"] = 123456,
    ["id"] = 7,
    ["school"] = "uestc"
}
--复写index
mt.__index = function(tbl, key)
    local val = rawget(tbl, key)
    if val then 
        return val
    else 
        return default[key]
    end
end

local func = function (tbl, key)
    local nk, nv = next(default, key)
    if nk then 
        nv = tbl[nk]
    end
    return nk, nv
end
--复写 pairs
mt.__pairs = function (tbl, key)
    print("sssssssss")
    print(tbl, key)
    print("bbbbbbbbb")

   return func, tbl, nil
end

local test = {
["id"] = 8
}

st(test, mt)
--测试pairs的复写
for k, v in pairs(test) do 
    print("-----------str")
    print(k,v)
    print("-----------end")

end
-- output: 8 , uestc, zblade, 123456

--测试 index的复写
-- print(test.id)
-- print(test.name)
-- print(test.school)
-- print(test.telphone)
-- output: 8 , uestc, zblade, 123456