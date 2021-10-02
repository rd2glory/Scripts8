local version = tonumber(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/latest_beta"))

loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/releases/".."beta"..version..".lua"))()
