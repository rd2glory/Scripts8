## Welcome to Scripts8

Scripts8 is a collection of scripts made by iamtryingtofindname for ROBLOX that bring functionality and usability to a new level. Scripts are made for private use.

<details>
  <summary>### Artemis</summary>
  
  #### Latest Version Loader
  
  ```lua
  local inBeta = tonumber(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/inBeta")) == 1 and true or false
  local version = game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/stable_verson")

  loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/releases/"..((inBeta and "beta") or "")..version..".lua"))()
  ```
  
  #### Version Loader
  
  ```lua
  local inBeta = true
  local version = "1.0"

  loadstring(game:HttpGet("https://raw.githubusercontent.com/iamtryingtofindname/Artemis/main/releases/"..((inBeta and "beta") or "")..version..".lua"))()
  ```
</details>
