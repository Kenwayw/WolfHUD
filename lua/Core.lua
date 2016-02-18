if not _G.WolfHUD then
	_G.WolfHUD = {}
	WolfHUD.loaded_options = {}
	WolfHUD.mod_path = ModPath
	WolfHUD.save_path = SavePath .. "WolfHUD.txt"
	WolfHUD.menu_name = "WolfHUD_options"
	
	if not WolfHUD.color_table then
		WolfHUD.color_table = {}
		WolfHUD.color_table[1]  = Color(1, 1, 1)		--1:  White
		WolfHUD.color_table[2]  = Color(0.8, 0.8, 0.4)	--2:  Light_Yellow
		WolfHUD.color_table[3]  = Color(0.8, 0.6, 0.4)	--3:  Light_Orange
		WolfHUD.color_table[4]  = Color(0.8, 0.4, 0.4)	--4:  Light_Red
		WolfHUD.color_table[5]  = Color(1, 0.5, 1)		--5:  Light_Purple
		WolfHUD.color_table[6]  = Color(0.6, 0.8, 0.4)	--6:  Light_Green
		WolfHUD.color_table[7]  = Color(0, 0, 0.54) 	--7:  Light_Blue
		WolfHUD.color_table[8]  = Color(0.8, 0.8, 0)	--8:  Yellow
		WolfHUD.color_table[9]  = Color(0.8, 0.4, 0)	--9:  Orange
		WolfHUD.color_table[10] = Color(0.8, 0, 0)		--10: Red
		WolfHUD.color_table[11] = Color(0.5, 0, 0.5)	--11: Purple
		WolfHUD.color_table[12] = Color(0, 0.8, 0)		--12: Green
		WolfHUD.color_table[13] = Color(0, 0, 0.8)		--13: Blue
		WolfHUD.color_table[14] = Color(0, 0, 0)		--14: Black
		WolfHUD.color_table[15] = Color(0, 0, 0)			--15: Rainbow (only available in laser color_table)
	end
	
	WolfHUD.custom_hud = WolfHUD.custom_hud or {													--CustomHUD
		["lib/managers/hudmanagerpd2"] = "CustomHUD.lua",
		["lib/managers/hud/hudteammate"] = "CustomHUD.lua",
		["lib/managers/hud/hudtemp"] = "CustomHUD.lua",
		["lib/managers/hud/hudassaultcorner"] = "CustomHUD.lua",
		["lib/managers/hud/hudobjectives"] = "CustomHUD.lua",
		["lib/managers/hud/hudheisttimer"] = "CustomHUD.lua",
		["lib/managers/hud/hudchat"] = "CustomHUD.lua",
		["lib/managers/trademanager"] = "CustomHUD.lua",
		["lib/units/equipment/doctor_bag/doctorbagbase"] = "CustomHUD.lua",
		["lib/units/beings/player/states/playerbleedout"] = "CustomHUD.lua",
		["lib/units/beings/player/huskplayermovement"] = "CustomHUD.lua",
		["lib/network/handlers/unitnetworkhandler"] = "CustomHUD.lua"
	}
	
	WolfHUD.hud_list = WolfHUD.hud_list or {													--HUD-List
		["lib/managers/hudmanagerpd2"] = "HUDList.lua",
		["lib/units/unitbase"] = "HUDList.lua",
		["lib/units/props/timergui"] = "HUDList.lua",
		["lib/units/props/digitalgui"] = "HUDList.lua",
		["lib/units/props/securitylockgui"] = "HUDList.lua",
		["lib/managers/group_ai_states/groupaistatebase"] = "HUDList.lua",
		["lib/network/handlers/unitnetworkhandler"] = "HUDList.lua",
		["lib/units/enemies/cop/copdamage"] = "HUDList.lua",
		["lib/managers/enemymanager"] = "HUDList.lua",
		["lib/units/equipment/ammo_bag/ammobagbase"] = "HUDList.lua",
		["lib/units/equipment/doctor_bag/doctorbagbase"] = "HUDList.lua",
		["lib/units/equipment/bodybags_bag/bodybagsbagbase"] = "HUDList.lua",
		["lib/units/equipment/grenade_crate/grenadecratebase"] = "HUDList.lua",
		["lib/units/equipment/ecm_jammer/ecmjammerbase"] = "HUDList.lua",
		["lib/units/props/securitycamera"] = "HUDList.lua",
		["lib/units/equipment/sentry_gun/sentrygunbase"] = "HUDList.lua",
		["lib/units/weapons/sentrygunweapon"] = "HUDList.lua",
		["lib/units/equipment/sentry_gun/sentrygundamage"] = "HUDList.lua",
		["lib/units/beings/player/playerdamage"] = "HUDList.lua",
		["lib/units/beings/player/playermovement"] = "HUDList.lua",
		["lib/managers/playermanager"] = "HUDList.lua",
		["lib/units/beings/player/states/playerstandard"] = "HUDList.lua",
		["lib/managers/objectinteractionmanager"] = "HUDList.lua",
		["lib/units/props/missiondoor"] = "HUDList.lua",
		["lib/managers/hud/hudassaultcorner"] = "HUDList.lua",
	}
	
	WolfHUD.kill_counter = WolfHUD.kill_counter or {												-- KillCounter
		["lib/managers/hudmanagerpd2"] = "KillCounter.lua",
		["lib/managers/hud/hudteammate"] = "KillCounter.lua",
		["lib/units/enemies/cop/copdamage"] = "KillCounter.lua",
		["lib/units/equipment/sentry_gun/sentrygunbase"] = "KillCounter.lua"
	}
	
	WolfHUD.scripts = WolfHUD.scripts or {
		["lib/managers/hud/hudstatsscreen"] = "Scripts.lua",				--Stats on TAB-Menu
		["lib/managers/hud/hudsuspicion"] = "Scripts.lua",					--Numeric Suspicion
		["lib/managers/hud/hudteammate"] = "Scripts.lua",					--Mags left
		["lib/states/ingamewaitingforplayers"] = "Scripts.lua",				--Skip Blackscreen
		["lib/managers/menu/stageendscreengui"] = "Scripts.lua",			--Skip EXP Screen
		["lib/managers/menu/lootdropscreengui"] = "Scripts.lua",			--Skip Lootscreen
		["lib/managers/group_ai_states/groupaistatebase"] = "Scripts.lua",	--Pacified Civilian
		["lib/units/weapons/raycastweaponbase"] = "Scripts.lua",			--No Bullet-Bot-Collisions
		["lib/tweak_data/timespeedeffecttweakdata"] = "Scripts.lua",		--No SlowMotion (if Host)
		["lib/managers/enemymanager"] = "Scripts.lua",						-- Corpse limit
		["lib/managers/hudmanager"] = "EnemyHealthbar.lua",					--Healthbar for enemies
		["lib/units/beings/player/states/playerstandard"] = "EnemyHealthbar.lua"
	}
	
	WolfHUD.interaction = WolfHUD.interaction or {							--Press2Hold + Numeric Interaction Timer
		["lib/managers/hudmanagerpd2"] = "Press2Hold.lua",
		["lib/managers/hud/hudinteraction"] = "Press2Hold.lua",
		["lib/units/beings/player/states/playercivilian"] = "Press2Hold.lua",
		["lib/units/beings/player/states/playerstandard"] = "Press2Hold.lua",
	}
	
	WolfHUD.weapon_gadgets = WolfHUD.weapon_gadgets or {
		["lib/units/weapons/weaponlaser"] = "WeaponLasers.lua" ,			--Custom Laser Color
		["lib/units/weapons/raycastweaponbase"] = "WeaponLasers.lua",		--Custom Laser Color
		["lib/units/weapons/newraycastweaponbase"] = "WeaponLasers.lua",	--Remember Gadget State
		["lib/units/beings/player/states/playerstandard"] = "WeaponLasers.lua",
		["lib/units/weapons/akimboweaponbase"] = "WeaponLasers.lua",
		["lib/units/weapons/weaponflashlight"] = "WeaponLasers.lua",
		["lib/managers/hudmanagerpd2"] = "WeaponLasers.lua",
		["lib/managers/hud/hudteammate"] = "WeaponLasers.lua"
	}
	
	
	function WolfHUD:Reset()
		WolfHUD.settings = 
		{
		  --General
			use_customhud 					= true,
			use_killcounter 				= true,
			use_hudlist 					= true,
			use_press2hold 					= true,
			use_weaponlasers 				= true,
		  --CustomHUD
			PLAYER_PANEL_SCALE 				= 0.85,		--Size of local Player HUD Panel
			TEAMMATE_PANEL_SCALE 			= 0.75,		--Size of Teammates/AI's HUD Panels
		  --KillCounter
			SHOW_SPECIAL_KILLS 				= true,		--KillCounter shows special kills
			SHOW_HEADSHOT_KILLS 			= true,		--KillCounter shows headshot kills
			SHOW_AI_KILLS 					= true,		--Show KillCounter for Bots
		  --Enemy Healthbar
			show_enemy_healthbar 			= true,		--Show healthbars
			show_civilian_healthbar 		= false,	--Show Healthbars for Civilians and TeamAI
			show_healthbar_pointer 			= false,	--Show pointer near the Healthbar, pointing at Healthbar owner
		  --Scripts
			skip_blackscreen 				= true,		--Skip the blackscreen on mission start
			stat_screen_delay 				= 5,		--Skip the experience screen after X seconds
			loot_screen_delay 				= 3,		--Skip the loot screen after X seconds
			max_corpses 					= 100,		--Maximum number of laying around corpses
		  --HUDList
			show_timers 					= true,     --Drills, time locks, hacking etc.
			show_equipment 					= true,  	--Deployables (ammo, doc bags, body bags)
			show_sentries 					= true,   	--Deployable sentries
				hide_empty_sentries 		= true, 	--Hide sentries with no ammo if player lacks the skill to refill them
			show_ecms 						= true,		--Active ECMs
			show_ecm_retrigger 				= true,  	--Countdown for players own ECM feedback retrigger delay
			show_minions 					= true,  	--Converted enemies, type and health
			show_pagers 					= true,  	--Show currently active pagers
			show_tape_loop 					= true,  	--Show active tape loop duration
			remove_answered_pager_contour 	= true,  	--Removes the interaction contour on answered pagers

			show_enemies 					= true,		--Currently spawned enemies
				aggregate_enemies 			= false,  	--Don't split enemies on type; use a single entry for all
			show_turrets 					= true,    	--Show active SWAT turrets
			show_civilians 					= true,  	--Currently spawned, untied civs
			show_hostages 					= true,   	--Currently tied civilian and dominated cops
			show_minion_count 				= true,     --Current number of jokered enemies
			show_pager_count 				= true,		--Show number of triggered pagers (only counts pagers triggered while you were present)
			show_loot 						= true,     --Show spawned and active loot bags/piles (may not be shown if certain mission parameters has not been met)
				aggregate_loot 				= false, 	--Don't split loot on type; use a single entry for all
				separate_bagged_loot 		= true,     --Show bagged loot as a separate value
			show_special_pickups 			= true,    	--Show number of special equipment/items

			show_buffs 						= true,     --Active effects (buffs/debuffs). Also see HUDList.BuffItemBase.IGNORED_BUFFS table to ignore specific buffs that you don't want listed, or enable some of those not shown by default
			
			hud_box_color 					= 1,		--Left and Right List font color
			hud_box_bg_color 				= 14,		--Left and Right List BG color
			civilian_color 					= 1, 		--EnemyCounter Civillian and Hostage icon color
			thug_color 						= 1,		--EnemyCounter Thug and Mobster icon color
			enemy_color 					= 1,		--EnemyCounter Cop and Specials icon color
		  --Press2Hold
			LOCK_MODE 						= 2,		--Lock interaction, if MIN_TIMER_DURATION is longer then total interaction time, or current interaction time
			MIN_TIMER_DURATION 				= 5, 		--Min interaction duration (in seconds) for the toggle behavior to activate
			EQUIPMENT_PRESS_INTERRUPT 		= true, 	--Use the equipment key ('G') to toggle off active interactions
			SHOW_TIME_REMAINING 			= true,		--Show remaining Time in the Interaction-Circle
			GRADIENT_COLOR 					= 12,	 	--Color, which the timer reaches on completition
		  --Laser-Colors
		    laser_light 					= 10,		--Multiplier for laser dot
			laser_glow 						= 5,		--Divider for laser beam
			laser_player 					= 7,		--Player laser color id
			laser_player_alpha 				= 0.3,		--Player laser alpha
			laser_teammates 				= 7,		--Teammates laser color id
			laser_teammates_alpha 			= 0.15,		--Teammates laser alpha
			laser_sniper 					= 10,		--Sniper laser color id
			laser_sniper_alpha 				= 0.5,		--Sniper laser alpha
			laser_turret_active 			= 10,		--Active turret laser color id
			laser_turret_reloading 			= 8,		--Reloading turret laser color id
			laser_turret_jammed 			= 12,		--Jammed turret laser color id
			laser_turret_alpha 				= 0.15,		--Turret laser alpha
			flashlight_angle 				= 100,		--Flashlight angle
			flashlight_range 				= 20		--Flashlight range (in m)
		}
	end
	
	function WolfHUD:Load()
		local file = io.open(self.save_path, "r")
		if file then
			for k, v in pairs(json.decode(file:read("*all"))) do
				self.settings[k] = v
			end
			file:close()
		end
	end

	function WolfHUD:Save()
		local file = io.open(self.save_path, "w+")
		if file then
			file:write(json.encode(self.settings))
			file:close()
		end
	end
	
	function WolfHUD:installMod(id, name)
		local menu_options = {
			[1] = {
				text = "Yes",
				callback = function()
					LuaModUpdates:OpenUpdateManagerNode()
					LuaModUpdates.ForceDownloadAndInstallMod(id)
				end,
			},
			[2] = {
				text = "No",
				is_cancel_button = true,
			}
		}
		QuickMenu:new( "Install: " .. name, "Are you sure, you want to install this mod?", menu_options, true )
	end
	
	WolfHUD:Reset()
	WolfHUD:Load()
end

if RequiredScript then
	local requiredScript = RequiredScript:lower()
	if WolfHUD.custom_hud[requiredScript] and WolfHUD.settings.use_customhud then
		dofile( WolfHUD.mod_path .. "lua/" .. WolfHUD.custom_hud[requiredScript] )
	end
	if WolfHUD.hud_list[requiredScript] and WolfHUD.settings.use_hudlist then
		dofile( WolfHUD.mod_path .. "lua/" .. WolfHUD.hud_list[requiredScript] )
	end
	if WolfHUD.kill_counter[requiredScript] and WolfHUD.settings.use_killcounter then
		dofile( WolfHUD.mod_path .. "lua/" .. WolfHUD.kill_counter[requiredScript] )
	end
	if WolfHUD.scripts[requiredScript] then
		dofile( WolfHUD.mod_path .. "lua/" .. WolfHUD.scripts[requiredScript] )
	end
	if WolfHUD.interaction[requiredScript] and WolfHUD.settings.use_press2hold then
		dofile( WolfHUD.mod_path .. "lua/" .. WolfHUD.interaction[requiredScript] )
	end
	if WolfHUD.weapon_gadgets[requiredScript] then
		dofile( WolfHUD.mod_path .. "lua/" .. WolfHUD.weapon_gadgets[requiredScript] )
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_WolfHUD", function(loc)
	for _, filename in pairs(file.GetFiles(WolfHUD.mod_path .. "loc/")) do
		local str = filename:match('^(.*).txt$')
		if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
			loc:load_localization_file(WolfHUD.mod_path .. "loc/" .. filename)
			break
		end
	end
	loc:load_localization_file(WolfHUD.mod_path .. "loc/english.txt", false)
	
	if WolfHUD.settings.skip_blackscreen then
		LocalizationManager:add_localized_strings({
			["hud_skip_blackscreen"] = ""
		})
	end
end)

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_WolfHUD", function(menu_manager)
	
	-- Define Callback methods here
	MenuCallbackHandler.WolfHUD_Save = function(this, item)
		WolfHUD:Save()
	end
	
	MenuCallbackHandler.callback_use_customhud = function(self, item)
		WolfHUD.settings.use_customhud = (item:value() =="on")
	end
	
	MenuCallbackHandler.callback_playerpanel_scale = function(self, item)
		WolfHUD.settings.PLAYER_PANEL_SCALE = item:value()
	end
	
	MenuCallbackHandler.callback_teammatepanel_scale = function(self, item)
		WolfHUD.settings.TEAMMATE_PANEL_SCALE = item:value()
	end
	
	MenuCallbackHandler.callback_use_killcounter = function(self, item)
		WolfHUD.settings.use_killcounter = (item:value() == "on")
		
	end
	
	MenuCallbackHandler.callback_show_special = function(self, item)
		WolfHUD.settings.SHOW_SPECIAL_KILLS = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_head = function(self, item)
		WolfHUD.settings.SHOW_HEADSHOT_KILLS = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_ai = function(self, item)
		WolfHUD.settings.SHOW_AI_KILLS = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_corpse_limit = function(self, item)
		WolfHUD.settings.max_corpses = item:value()
	end
	
	MenuCallbackHandler.callback_show_enemyhealthbar = function(self, item)
		WolfHUD.settings.show_enemy_healthbar = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_civhealthbar = function(self, item)
		WolfHUD.settings.show_civilian_healthbar = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_healthbar_pointer = function(self, item)
		WolfHUD.settings.show_healthbar_pointer = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_skip_blackscreen = function(self, item)
		WolfHUD.settings.skip_blackscreen = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_statscreen_delay = function(self, item)
		WolfHUD.settings.stat_screen_delay = item:value()
	end
	
	MenuCallbackHandler.callback_lootscreen_delay = function(self, item)
		WolfHUD.settings.loot_screen_delay = item:value()
	end
	
	MenuCallbackHandler.callback_use_hudlist = function(self, item)
		WolfHUD.settings.use_hudlist = (item:value() =="on")
	end
	
	MenuCallbackHandler.callback_use_press2hold = function(self, item)
		WolfHUD.settings.use_press2hold = (item:value() =="on")
	end
	
	MenuCallbackHandler.callback_use_weaponlasers = function(self, item)
		WolfHUD.settings.use_weaponlasers = (item:value() =="on")
	end
	
	MenuCallbackHandler.callback_hudlist_boxcolor = function(self, item)
		WolfHUD.settings.hud_box_color = item:value()
	end
	
	MenuCallbackHandler.callback_hudlist_boxbgcolor = function(self, item)
		WolfHUD.settings.hud_box_bg_color = item:value()
	end
	
	MenuCallbackHandler.callback_hudlist_civcolor = function(self, item)
		WolfHUD.settings.civilian_color = item:value()
	end
	
	MenuCallbackHandler.callback_hudlist_thugcolor = function(self, item)
		WolfHUD.settings.thug_color = item:value()
	end
	
	MenuCallbackHandler.callback_hudlist_copcolor = function(self, item)
		WolfHUD.settings.enemy_color = item:value()
	end
	
	MenuCallbackHandler.callback_show_timers = function(self, item)
		WolfHUD.settings.show_timers = (item:value() =="on")
	end

	MenuCallbackHandler.callback_show_equipment = function(self, item)
		WolfHUD.settings.show_equipment = (item:value() =="on")
	end

	MenuCallbackHandler.callback_show_minions = function(self, item)
		WolfHUD.settings.show_minions = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_pagers = function(self, item)
		WolfHUD.settings.show_pagers = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_remove_answered_pager_contour = function(self, item)
		WolfHUD.settings.remove_answered_pager_contour = (item:value() =="on")
	end

	MenuCallbackHandler.callback_show_ecms = function(self, item)
		WolfHUD.settings.show_ecms = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_enemies = function(self, item)
		WolfHUD.settings.show_enemies = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_aggregate_enemies = function(self, item)
		WolfHUD.settings.aggregate_enemies = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_civilians = function(self, item)
		WolfHUD.settings.show_civilians = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_hostages = function(self, item)
		WolfHUD.settings.show_hostages = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_pager_count = function(self, item)
		WolfHUD.settings.show_pager_count = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_loot = function(self, item)
		WolfHUD.settings.show_loot = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_aggregate_loot = function(self, item)
		WolfHUD.settings.aggregate_loot = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_separate_bagged_loot = function(self, item)
		WolfHUD.settings.separate_bagged_loot = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_special_pickups = function(self, item)
		WolfHUD.settings.show_special_pickups = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_buffs = function(self, item)
		WolfHUD.settings.show_buffs = item:value()
	end	

	MenuCallbackHandler.callback_show_special_kills = function(self, item)
		WolfHUD.settings.SHOW_SPECIAL_KILLS = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_headshot_kills = function(self, item)
		WolfHUD.settings.SHOW_HEADSHOT_KILLS = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_ai_kills = function(self, item)
		WolfHUD.settings.SHOW_AI_KILLS = (item:value() =="on")
	end	

	MenuCallbackHandler.callback_show_sentries = function(self, item)
		WolfHUD.settings.show_sentries = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_hide_empty_sentries = function(self, item)
		WolfHUD.settings.hide_empty_sentries = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_turrets = function(self, item)
		WolfHUD.settings.show_turrets = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_minion_count = function(self, item)
		WolfHUD.settings.show_minion_count = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_ecm_retrigger = function(self, item)
		WolfHUD.settings.show_ecm_retrigger = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_tape_loop = function(self, item)
		WolfHUD.settings.show_tape_loop = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_lock_mode = function(self, item)
		WolfHUD.settings.LOCK_MODE = item:value()
	end
	
	MenuCallbackHandler.callback_min_timer_duration = function(self, item)
		WolfHUD.settings.MIN_TIMER_DURATION = item:value()
	end
	
	MenuCallbackHandler.callback_equipment_cancel = function(self, item)
		WolfHUD.settings.EQUIPMENT_PRESS_INTERRUPT = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_show_timer = function(self, item)
		WolfHUD.settings.SHOW_TIME_REMAINING = (item:value() == "on")
	end
	
	MenuCallbackHandler.callback_timer_color = function(self, item)
		WolfHUD.settings.GRADIENT_COLOR = item:value()
	end
	
	MenuCallbackHandler.callback_laser_light = function(self, item)
		WolfHUD.settings.laser_light = item:value()
	end
	
	MenuCallbackHandler.callback_laser_glow = function(self, item)
		WolfHUD.settings.laser_glow = item:value()
	end
	
	MenuCallbackHandler.callback_lasercolor_player = function(self, item)
		WolfHUD.settings.laser_player = item:value()
	end
	
	MenuCallbackHandler.callback_laseralpha_player = function(self, item)
		WolfHUD.settings.laser_player_alpha = item:value()
	end
	
	MenuCallbackHandler.callback_lasercolor_teammates = function(self, item)
		WolfHUD.settings.laser_teammates = item:value()
	end
	
	MenuCallbackHandler.callback_laseralpha_teammates = function(self, item)
		WolfHUD.settings.laser_teammates_alpha = item:value()
	end
	
	MenuCallbackHandler.callback_lasercolor_sniper = function(self, item)
		WolfHUD.settings.laser_sniper = item:value()
	end
	
	MenuCallbackHandler.callback_laseralpha_sniper = function(self, item)
		WolfHUD.settings.laser_sniper_alpha = item:value()
	end
	
	MenuCallbackHandler.callback_lasercolor_turret_active = function(self, item)
		WolfHUD.settings.laser_turret_active = item:value()
	end
	
	MenuCallbackHandler.callback_lasercolor_turret_reloading = function(self, item)
		WolfHUD.settings.laser_turret_reloading = item:value()
	end
	
	MenuCallbackHandler.callback_lasercolor_turret_jammed = function(self, item)
		WolfHUD.settings.laser_turret_jammed = item:value()
	end
	
	MenuCallbackHandler.callback_laseralpha_turret = function(self, item)
		WolfHUD.settings.laser_turret_alpha = item:value()
	end
	
	MenuCallbackHandler.callback_flashlight_angle = function(self, item)
		WolfHUD.settings.flashlight_angle = item:value()
	end
	
	MenuCallbackHandler.callback_flashlight_range = function(self, item)
		WolfHUD.settings.flashlight_range = item:value()
	end
	
	MenuCallbackHandler.callback_recommended_bltmods = function(self, item)
		QuickMenu:new( "BLT Mods", "This a List of BLT Mods I think are very useful.\nTo try them out, just click on the one you want and restart your game.\nTo uninstall, go to your {Payday 2 Directory}/mods and remove the folder, which contains the mod you want to remove.", { text = "OK", is_cancel_button = true }, true )
	end
	
	MenuCallbackHandler.callback_recommended_bagcontour = function(self, item)
		WolfHUD:installMod("BC", "Bag Contour")
	end
	
	MenuCallbackHandler.callback_recommended_builddb = function(self, item)
		WolfHUD:installMod("BDB", "Build DB")
	end
	
	MenuCallbackHandler.callback_recommended_enhanced_hitmarkers = function(self, item)
		WolfHUD:installMod("ENH_HMRK", "Enhanced Hitmarkers")
	end
	
	MenuCallbackHandler.callback_recommended_inventorychatandplayerstates = function(self, item)
		WolfHUD:installMod("ICAPS", "Inventory Chat")
	end
	
	MenuCallbackHandler.callback_recommended_loadingscreeninfo = function(self, item)
		WolfHUD:installMod("loadingscreeninfo", "Loading Screen Info")
		LuaModUpdates.ForceDownloadAndInstallMod("loadingscreeninfo")
	end
	
	MenuCallbackHandler.callback_recommended_lobbyplayerinfo = function(self, item)
		WolfHUD:installMod("LPI", "Lobby Player Info")
	end
	
	MenuCallbackHandler.callback_recommended_pd2stats = function(self, item)
		WolfHUD:installMod("pd2statsp", "Payday 2 Stats Plugin")
	end
	
	MenuCallbackHandler.callback_recommended_pocohud3 = function(self, item)
		WolfHUD:installMod("pocohud3", "PocoHUD 3")
	end
	
	MenuCallbackHandler.callback_recommended_sidejobsinlobby = function(self, item)
		WolfHUD:installMod("SDJBL", "Sidejobs in Lobby")
	end
	
	MenuCallbackHandler.callback_recommended_splsets = function(self, item)
		WolfHUD:installMod("SPLS", "Skill, Perk, Loadout Sets")
	end
	
	MenuCallbackHandler.callback_recommended_overridemods = function(self, item)
		QuickMenu:new( "'mod_override' Mods", "This is a List of Mods, using the mod_override folder.\nTherefor they are mostly texture and sound mods, which make the game look nicer in my opinion.\nIf you want to try some out, click on them, and a site to download will be opened in your Steam Overlay.", { text = "OK", is_cancel_button = true }, true )
	end
	
	MenuCallbackHandler.callback_recommended_fednet_inventory = function(self, item)
		Steam:overlay_activate("url", "http://forums.lastbullet.net/mydownloads.php?action=view_down&did=13916")
	end
	
	MenuCallbackHandler.callback_recommended_bodhi_soundrepair = function(self, item)
		Steam:overlay_activate("url", "http://bodhimods.com/#downloads")
	end
		-- TODO: Add Bodhi, Crime.net/Stealthmeter, Fednet Inventory, PDTH Blood Decals, SentryLaser Upgrade, Smoking_Barrels to recommended mod_overrides.
		
	WolfHUD:Load()
	MenuHelper:LoadFromJsonFile(WolfHUD.mod_path .. "menu/options.txt", WolfHUD, WolfHUD.settings)
	MenuHelper:LoadFromJsonFile(WolfHUD.mod_path .. "menu/hudlist.txt", WolfHUD, WolfHUD.settings)
	MenuHelper:LoadFromJsonFile(WolfHUD.mod_path .. "menu/hudlist2.txt", WolfHUD, WolfHUD.settings)
	MenuHelper:LoadFromJsonFile(WolfHUD.mod_path .. "menu/press2hold.txt", WolfHUD, WolfHUD.settings)
	MenuHelper:LoadFromJsonFile(WolfHUD.mod_path .. "menu/lasers.txt", WolfHUD, WolfHUD.settings)
	MenuHelper:LoadFromJsonFile(WolfHUD.mod_path .. "menu/recommended.txt", WolfHUD, WolfHUD.settings)
end)

