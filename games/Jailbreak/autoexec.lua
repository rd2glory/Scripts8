local lastSafeVersion = tonumber(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/LastSafeVersion"))

if game.PlaceId == 606849621 or game.PlaceId == 9780994092 then
  if game.PlaceVersion > lastSafeVersion then
    warn("Jailbreak+ has not been tested with this version of Jailbreak, please contact the dev in order to test for any possible patches")
  else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Scripts8/main/games/Jailbreak/JailbreakPlus.lua"))()
  end
	task.wait(9e9)
end
