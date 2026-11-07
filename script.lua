-- Mythios freemium loader
local W=warn or print
local src
local ok,v=pcall(function() return game:HttpGet("https://mythios.online/api/client.php?m=freemium") end)
if ok and type(v)=="string" then src=v end
if not src then for _,get in ipairs({function() return request end,function() return http_request end,function() return syn.request end,function() return http.request end}) do local yes,f=pcall(get) if yes and type(f)=="function" then local good,r=pcall(f,{Url="https://mythios.online/api/client.php?m=freemium",Method="GET"}) if good and type(r)=="table" and (not r.StatusCode or r.StatusCode<400) then src=r.Body or r.body if type(src)=="string" then break end end end end end
if type(src)~="string" then return W("[Mythios] could not reach server") end
local f=(loadstring or load)(src,"=Mythios")
if not f then return W("[Mythios] loader error") end
return f()
