function iscclosure(f)
    return debug.getinfo(f, "S").what == "C"
end

local toCheck = {"writefile","readfile","isfile","makefolder","isfolder","delfolder","printidentity","hookmetamethod","newcclosure","getnamecallmethod","pcall","checkcaller","hookfunction","hookfunc","print","error","warn","appendfile","getgenv","getrenv","getreg","getgc","getinstances","getnilinstances","getscripts","getloadedmodules","getconnections","firesignal","fireclickdetector","fireproximityprompt","firetouchinterest","isnetworkowner","gethiddenproperty","sethiddenproperty","setsimulationradius","getsenv","getcallingscript","getscriptclosure","getscripthash","getrawmetatable","setrawmetatable","setreadonly","isreadonly","iswindowactive","keypress","keyrelease","mouse1click","mouse1press","mouse1release","mouse2click","mouse2press","mouse2release","mousescroll","mousemoverel","mousemoveabs","loadstring","islclosure","decompile","rconsoleprint","rconsoleinfo","rconsolewarn","rconsoleerr","rconsoleclear","rconsolename","rconsoleinput","printconsole","listfiles","delfile","setclipboard","setfflag","setnamecallmethod","getsynasset","getspecialinfo","saveinstance","messagebox","wait","is_synapse_function","getinfo"}

local results = {}
local funcs = {
    "iscclosure","islclosure","is_synapse_function","typeof","type"
}

for i,v in pairs(toCheck)  do
    local fun = loadstring("return "..v)()
    results[v] = {

    }
    for l,j in pairs(funcs) do
        print(j)
        local fun2 = loadstring("return "..j)()
        results[v][j] = fun2(fun)
    end
end

writefile("function_info.txt",game:GetService("HttpService"):JSONEncode(results))
print("done")
