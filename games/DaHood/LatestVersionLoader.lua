local inBeta = tonumber(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/inBeta")) == 1 and true or false
local version = game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/stable_verson")

loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/releases/"..((inBeta and "beta") or "v")..version..".lua"))()
