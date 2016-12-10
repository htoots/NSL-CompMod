--This global disables balance changes of the UWE Extensions
gDisableUWEBalance = true


ModLoader.SetupFileHook( "lua/AlienTeam.lua", "lua/DPR/AlienTeam.lua", "replace" )
ModLoader.SetupFileHook( "lua/Cyst.lua", "lua/DPR/Cyst.lua", "replace" )
ModLoader.SetupFileHook( "lua/Egg.lua", "lua/DPR/Egg.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIScoreboard.lua", "lua/DPR/GUIScoreboard.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIUpgradeChamberDisplay.lua", "lua/DPR/GUIUpgradeChamberDisplay.lua", "replace" )
ModLoader.SetupFileHook( "lua/Hud/Commander/AlienGhostModel.lua", "lua/DPR/AlienGhostModel.lua", "replace" )
ModLoader.SetupFileHook( "lua/ResourceTower_Server.lua", "lua/DPR/ResourceTower_Server.lua", "replace" )
ModLoader.SetupFileHook( "lua/TechData.lua", "lua/DPR/TechData.lua", "replace" )
ModLoader.SetupFileHook( "lua/TunnelEntrance.lua", "lua/DPR/TunnelEntrance.lua", "replace" )
ModLoader.SetupFileHook( "lua/Weapons/Alien/Ability.lua", "lua/DPR/Ability.lua", "replace" )

ModLoader.SetupFileHook( "lua/Alien.lua", "lua/DPR/Alien.lua", "post" )
ModLoader.SetupFileHook( "lua/AlienTechMap.lua", "lua/DPR/AlienTechMap.lua", "post" )
ModLoader.SetupFileHook( "lua/Alien_Server.lua", "lua/DPR/Alien_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/Balance.lua", "lua/DPR/Balance.lua", "post" )
ModLoader.SetupFileHook( "lua/BalanceHealth.lua", "lua/DPR/BalanceHealth.lua", "post" )
ModLoader.SetupFileHook( "lua/BalanceMisc.lua", "lua/DPR/BalanceMisc.lua", "post" )
ModLoader.SetupFileHook( "lua/DamageTypes.lua", "lua/DPR/DamageTypes.lua", "post" )
ModLoader.SetupFileHook( "lua/GhostModelUI.lua", "lua/DPR/GhostModelUI.lua", "post" )
ModLoader.SetupFileHook( "lua/Gorge.lua", "lua/DPR/Gorge.lua", "post" )
ModLoader.SetupFileHook( "lua/NS2Utility_Server.lua", "lua/DPR/NS2Utility_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/Player_Client.lua", "lua/DPR/Player_Client.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Marine/Shotgun.lua", "lua/DPR/Shotgun.lua", "post" )
