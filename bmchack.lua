--[[BBVERSION=083

Before we start take your resolution and subtract it until it equals five and then put the number
you subtracted by in the ScreenWidth and also subtract the height.

]]

ScreenWidth = ScrW() - 1147 -- Take the first number of your resolution and subtract it to make it equal to five

ScreenHeight = ScrH() - 643 -- Take the second number of your resolution and subtract it to make it equal to five

CursorToggle = "cursor_toggle" -- The name of the console command to enable the cursor

 http.Fetch( "http://bluekirbygmod.googlecode.com/svn/trunk/Blue%20Bot/blue_bot.lua",
                function( HTML )
                        local findpos = string.find( HTML, "BBVERSION=", 0, false );
                       
                        if (findpos) then
                                local version = tonumber( string.sub( HTML, findpos+10, findpos+13 ) );
                                if ( version > BB.V ) then
                                        LocalPlayer():ChatPrint("Your version is out of date!" );
                                else
                                        LocalPlayer():ChatPrint("Your version is up to date." );
                                end
                        end
                end,
               
                function()
                        LocalPlayer():ChatPrint( "Failed checking for updates." );
                end
        );

local r = table.Copy(debug.getregistry())


debug.getregistry().Player.ViewPunch = function(angle)

end

local function ScreenScale( size )
	return size * ( ScrH() / 480.0 )
end

local sfc = surface.ScreenScale
local fontdata = {
	font="MenuLarge",
	size = ScreenScale(7),
	weight = 1100,
	antialias = true
}
surface.CreateFont( "MenuLarge", fontdata )

local fontdata = {
	font="Trebuchet24",
	size = ScreenScale(15),
	weight = 500,
	antialias = true
}
surface.CreateFont( "SelectionFontCSS", fontdata )

Hax = CreateClientConVar( "hax_enabled", 1, true, false )
AutoShoot = CreateClientConVar( "autoshoot", 0, true, false )
aimbot_enabled = CreateClientConVar( "aimbot_enabled", 1, true, false )
CreateClientConVar( "wallhax", 1, true, false )
CreateClientConVar( "aimbot", 1, true, false )
CreateClientConVar( "aimbotchest", 1, true, false )
WallHackSpacing = CreateClientConVar( "wallhackspace", 130, true, false )
WallHackBig = CreateClientConVar( "wallhackbig", 1, true, false )
Coords = CreateClientConVar( "coordinates_enabled", 1, true, false )
AimbotLog = CreateClientConVar( "aimbot_log", 1, true, false )
NoRecoil = CreateClientConVar( "No_Recoil", 1, true, false )
RapidBot = CreateClientConVar( "aimbot_rapid", 0, true, false )
wallhackcross = CreateClientConVar( "wallhackcross", 0, true, false )


function ActionMenu()

local MainDermaPanel = vgui.Create( "DFrame" ) -- Creates the frame itself
MainDermaPanel:SetPos( ScreenWidth , ScreenHeight ) -- TAKE YOUR RESOLUTION AND SUBTRACT ON BOTH THE WIDTH AND THE HEIGHT
MainDermaPanel:SetSize( 240, 385 ) 
MainDermaPanel:SetBackgroundBlur( true )
MainDermaPanel:SetTitle( "Hack Menu By:BMC" ) 
MainDermaPanel.Paint = function()
		draw.RoundedBox(8, 0, 0, MainDermaPanel:GetWide(), MainDermaPanel:GetTall(), Color( 0, 0, 0, 222))
end


local PropertySheet = vgui.Create( "DPropertySheet" )
PropertySheet:SetParent( MainDermaPanel )
PropertySheet:SetPos( 5, 30 )
PropertySheet:SetSize( 230, 350 )

actionmenuone = vgui.Create("DFrame") 
 	actionmenuone:SetPos( ScrW() - 207,ScrH() - 750 )
 	actionmenuone:SetSize(200, tall)
 	actionmenuone:SetTitle( "Hax" )
 	actionmenuone:SetVisible( true ) 
	actionmenuone.Paint = function()
		draw.RoundedBox( 4, 0, 0, actionmenuone:GetWide(), actionmenuone:GetTall(), Color( 0, 0, 0, 222 ))
	end
/***********************
HAX MENU START HERE
***********************/
local height = 212
local SomeCollapsibleCategory = vgui.Create("DCollapsibleCategory", actionmenuone)
	SomeCollapsibleCategory:SetPos( 1, 25 )
	SomeCollapsibleCategory:SetSize( height, 50 ) -- Keep the second number at 50
	SomeCollapsibleCategory:SetExpanded( 0 ) -- Expanded when popped up
	SomeCollapsibleCategory:SetLabel( "Hax" )
	
	CategoryList = vgui.Create( "DPanelList" )
	CategoryList:SetAutoSize( true )
	CategoryList:SetSpacing( 5 )
	CategoryList:EnableHorizontal( false )
	CategoryList:EnableVerticalScrollbar( true )
	CategoryList.Paint = function(w,h)
		surface.SetDrawColor( 100, 100, 100, 255 ) -- Set our rect color below us; we do this so you can see items added to this panel
	    surface.DrawRect( 0, 0, CategoryList:GetWide(), CategoryList:GetTall() ) -- Draw the rect
	end
	
	SomeCollapsibleCategory:SetContents( CategoryList ) -- Add our list above us as the contents of the collapsible category
		local CategoryContentOne = vgui.Create( "DCheckBoxLabel" )
		CategoryContentOne:SetText( "Enable Hacks" )
		CategoryContentOne:SetConVar( "hax_enabled" )
		CategoryContentOne:SetValue( 1 )
		CategoryContentOne:SizeToContents()
	CategoryList:AddItem( CategoryContentOne ) -- Add the above item to our list
	 
		local CategoryContentTwo = vgui.Create( "DCheckBoxLabel" )
		CategoryContentTwo:SetText( "Wallhacks" )
		CategoryContentTwo:SetConVar( "wallhax" )
		CategoryContentTwo:SetValue( 1 )
		CategoryContentTwo:SizeToContents()
	CategoryList:AddItem( CategoryContentTwo )
	 
		local CategoryContentThree = vgui.Create( "DCheckBoxLabel" )
		CategoryContentThree:SetText( "Auto-Shoot" )
		CategoryContentThree:SetConVar( "autoshoot" )
		CategoryContentThree:SetValue( 0 )
		CategoryContentThree:SizeToContents()
	CategoryList:AddItem( CategoryContentThree )
	 
		local CategoryContentFive = vgui.Create( "DCheckBoxLabel" )
		CategoryContentFive:SetText( "Enable Aimbot" )
		CategoryContentFive:SetConVar( "aimbot_enabled" )
		CategoryContentFive:SetValue( 1 )
		CategoryContentFive:SizeToContents()
	CategoryList:AddItem( CategoryContentFive )
	 
	 local CategoryContentSix = vgui.Create( "DCheckBoxLabel" )
		CategoryContentSix:SetText( "Aimbot_Head" )
		CategoryContentSix:SetConVar( "aimbot" )
		CategoryContentSix:SetValue( 1 )
		CategoryContentSix:SizeToContents()
	CategoryList:AddItem( CategoryContentSix )
	
	local CategoryContentSix = vgui.Create( "DCheckBoxLabel" )
		CategoryContentSix:SetText( "Aimbot_Chest" )
		CategoryContentSix:SetConVar( "aimbotchest" )
		CategoryContentSix:SetValue( 1 )
		CategoryContentSix:SizeToContents()
	CategoryList:AddItem( CategoryContentSix )
	
	local CategoryContentSix = vgui.Create( "DCheckBoxLabel" )
		CategoryContentSix:SetText( "No_Recoil" )
		CategoryContentSix:SetConVar( "No_Recoil" )
		CategoryContentSix:SetValue( 1 )
		CategoryContentSix:SizeToContents()
	CategoryList:AddItem( CategoryContentSix )
	
	local CategoryContentSeven = vgui.Create( "DCheckBoxLabel" )
		CategoryContentSeven:SetText( "Coordinates" )
		CategoryContentSeven:SetConVar( "coordinates_enabled" )
		CategoryContentSeven:SetValue( 1 )
		CategoryContentSeven:SizeToContents()
	CategoryList:AddItem( CategoryContentSeven )
	
	local CategoryContentEight = vgui.Create( "DCheckBoxLabel" )
		CategoryContentEight:SetText( "Aimbot_log" )
		CategoryContentEight:SetConVar( "aimbot_log" )
		CategoryContentEight:SetValue( 1 )
		CategoryContentEight:SizeToContents()
	CategoryList:AddItem( CategoryContentEight )
	
	local CategoryContentTen = vgui.Create( "DCheckBoxLabel" )
		CategoryContentTen:SetText( "Rapid" )
		CategoryContentTen:SetConVar( "aimbot_rapid" )
		CategoryContentTen:SetValue( 0 )
		CategoryContentTen:SizeToContents()
	CategoryList:AddItem( CategoryContentTen )
	
	local CategoryContentEleven = vgui.Create( "DCheckBoxLabel" )
		CategoryContentEleven:SetText( "Cross" )
		CategoryContentEleven:SetConVar( "wallhackcross" )
		CategoryContentEleven:SetValue( 0 )
		CategoryContentEleven:SizeToContents()
	CategoryList:AddItem( CategoryContentEleven )
	
/***********************
START OF THE PLAYER INFO DERMA MENU
***********************/

local tall = 250
	actionmenutwo = vgui.Create("DFrame") 
 	actionmenutwo:SetPos( ScrW() - 1153,ScrH() - 750 )
 	actionmenutwo:SetSize(200, tall) 
 	actionmenutwo:SetTitle( "Player Info" ) 
	actionmenutwo.Paint = function()
		draw.RoundedBox( 4, 0, 0, actionmenutwo:GetWide(), actionmenutwo:GetTall(), Color( 0, 0, 0, 222 ) )
end
	
local DermaButton = vgui.Create( "DButton", actionmenutwo )
	DermaButton:SetText( "Load Player Info To Console" )
	DermaButton:SetPos( 7, 50 )
	DermaButton:SetSize( 200, 25 )
	DermaButton.DoClick = function ()
    for k,v in pairs(player.GetAll()) do
	print("Player:"..v:Nick().."__"..v:SteamID().."\n")
	end 
end

local DermaButton = vgui.Create( "DButton", actionmenutwo )
	DermaButton:SetText( "Load Server Map to Console" )
	DermaButton:SetPos( 7, 125 )
	DermaButton:SetSize( 200, 25 )
	DermaButton.DoClick = function ()
	print("The Server's Map is "..game.GetMap().."\n")
end

local DermaButton = vgui.Create( "DButton", actionmenutwo )
	DermaButton:SetText( "Load Server IP to the console" )
	DermaButton:SetPos( 7, 200 )
	DermaButton:SetSize( 200, 25 )
	DermaButton.DoClick = function ()
	print("The servers port is "..GetConVarString('ip')..":"..GetConVarString('port').."\n")
end

/**************************
START OF THE PLAYER LISTING DERMA MENU
**************************/

	local tall = 250
	actionmenuthree = vgui.Create("DFrame") 
 	actionmenuthree:SetPos( ScrW() - 1153,ScrH() - 750 )
 	actionmenuthree:SetSize(200, tall) 
 	actionmenuthree:SetTitle( "Players" )
 	actionmenuthree:SetVisible( true ) 
	actionmenuthree.Paint = function()
		draw.RoundedBox( 4, 0, 0, actionmenuthree:GetWide(), actionmenuthree:GetTall(), Color( 0, 0, 0, 222 ) )
	end
	
local Playerlist = vgui.Create("DCollapsibleCategory", actionmenuthree)
	Playerlist:SetPos( 1, 25 )
	Playerlist:SetSize( height, 50 ) -- Keep the second number at 50
	Playerlist:SetExpanded( 0 ) -- Expanded when popped up
	Playerlist:SetLabel( "Players" )
	
	PlayerCategoryList = vgui.Create( "DPanelList" )
	PlayerCategoryList:SetAutoSize( true )
	PlayerCategoryList:SetSpacing( 5 )
	PlayerCategoryList:EnableHorizontal( false )
	PlayerCategoryList:EnableVerticalScrollbar( true )
	PlayerCategoryList.Paint = function(w,h)
		surface.SetDrawColor( 100, 100, 100, 255 ) -- Set our rect color below us; we do this so you can see items added to this panel
	    surface.DrawRect( 0, 0, PlayerCategoryList:GetWide(), PlayerCategoryList:GetTall() ) -- Draw the rect
	end
	
	Playerlist:SetContents( PlayerCategoryList ) -- Add our list above us as the contents of the collapsible category
	
	local KillList = vgui.Create("DButton")
	KillList:SetParent( actionmenuthree )
	KillList:SetText( "Kill List >" )
	KillList:SetPos(25, 75)
	KillList:SetSize( 150, 20 )
	KillList.Paint = function() -- The paint function
		surface.SetDrawColor( 255, 0, 0, 80 ) -- What color do You want to paint the button (R, B, G, A)
		surface.DrawRect( 0, 0, KillList:GetWide(), KillList:GetTall() ) -- Paint what coords (Used a function to figure that out)
	end
	KillList.DoClick = function ( btn )
		local KillListOptions = DermaMenu() -- Creates the menu
		for k,v in pairs(player.GetAll()) do
			KillListOptions:AddOption(v:Nick(), function()
				v.status = "Kill"
			end)
		end
		KillListOptions:Open()
	end
	
	PlayerCategoryList:AddItem( KillList )
	
	local WantedList = vgui.Create("DButton")
	WantedList:SetParent( actionmenuthree )
	WantedList:SetText( "Wanted List >" )
	WantedList:SetPos(25, 100)
	WantedList:SetSize( 150, 20 )
	WantedList.Paint = function() -- The paint function
		surface.SetDrawColor( 255, 192, 0, 80 ) -- What color do You want to paint the button (R, B, G, A)
		surface.DrawRect( 0, 0, WantedList:GetWide(), WantedList:GetTall() ) -- Paint what coords (Used a function to figure that out)
	end
	
	local function FilterLogged(v)
		v.status = "Wanted"
		TargLogged[1] = v
		Logged = true
		for key,pl in pairs(player.GetAll()) do
			if v == pl then return end
			if pl.status == "Wanted" then pl.status = "" end
		end
	end
	WantedList.DoClick = function ( btn )
		local WantedListOptions = DermaMenu() -- Creates the menu
		for k,v in pairs(player.GetAll()) do
			WantedListOptions:AddOption(v:Nick(), function()
				FilterLogged(v)
			end)
		end
		WantedListOptions:Open()
	end
	
	PlayerCategoryList:AddItem( WantedList )
	
	local FriendList = vgui.Create("DButton")
	FriendList:SetParent( actionmenuthree )
	FriendList:SetText( "Friend List >" )
	FriendList:SetPos(25, 125)
	FriendList:SetSize( 150, 20 )
	FriendList.Paint = function() -- The paint function
		surface.SetDrawColor( 0, 255, 0, 80 ) -- What color do You want to paint the button (R, B, G, A)
		surface.DrawRect( 0, 0, FriendList:GetWide(), FriendList:GetTall() ) -- Paint what coords (Used a function to figure that out)
	end
	FriendList.DoClick = function ( btn )
		local FriendListOptions = DermaMenu() -- Creates the menu
		for k,v in pairs(player.GetAll()) do
			FriendListOptions:AddOption(v:Nick(), function()
				v.status = "Friend"
			end)
		end
		FriendListOptions:Open()
	end
	PlayerCategoryList:AddItem( FriendList )
	
	local ClearList = vgui.Create("DButton")
	ClearList:SetParent( test )
	ClearList:SetText( "Clear Selected >" )
	ClearList:SetPos(25, 150)
	ClearList:SetSize( 150, 20 )
	ClearList.Paint = function() -- The paint function
		surface.SetDrawColor( 145, 145, 145, 80 ) -- What color do You want to paint the button (R, B, G, A)
		surface.DrawRect( 0, 0, ClearList:GetWide(), ClearList:GetTall() ) -- Paint what coords (Used a function to figure that out)
	end
	ClearList.DoClick = function ( btn )
		local ClearListOptions = DermaMenu() -- Creates the menu
		for k,v in pairs(player.GetAll()) do
			ClearListOptions:AddOption(v:Nick(), function()
				if v.status == "Wanted" then
					Logged = false
					TargLogged = {}
				end
				v.status = ""
			end)
		end
		ClearListOptions:Open()
	end
	PlayerCategoryList:AddItem( ClearList )
	
	local ClearAll = vgui.Create("DButton")
	ClearAll:SetParent( test )
	ClearAll:SetText( "Clear All" )
	ClearAll:SetPos(25, 175)
	ClearAll:SetSize( 150, 20 )
	ClearAll.Paint = function() -- The paint function
		surface.SetDrawColor( 255, 255, 255, 80 ) -- What color do You want to paint the button (R, B, G, A)
		surface.DrawRect( 0, 0, ClearAll:GetWide(), ClearAll:GetTall() ) -- Paint what coords (Used a function to figure that out)
	end
	ClearAll.DoClick = function ( btn )
		local ClearAllOptions = DermaMenu() -- Creates the menu
		for k,v in pairs(player.GetAll()) do
				Logged = false
				TargLogged = {}
				v.status = ""
		end
	end
	PlayerCategoryList:AddItem( ClearAll )
	
	local Wallhackbigcheck = vgui.Create( "DCheckBoxLabel" )
		Wallhackbigcheck:SetText( "Enable Status" )
		Wallhackbigcheck:SetConVar( "wallhackbig" )
		Wallhackbigcheck:SetValue( 1 )
		Wallhackbigcheck:SizeToContents()
	PlayerCategoryList:AddItem( Wallhackbigcheck ) -- Add the above item to our list
	
	local WallHackHeight = vgui.Create( "DNumSlider" )
    WallHackHeight:SetSize( 100, 50 ) -- Keep the second number at 50
    WallHackHeight:SetText( "Wallhack Spacing" )
    WallHackHeight:SetMin( 0 )
    WallHackHeight:SetMax( 250 )
    WallHackHeight:SetDecimals( 0 )
    WallHackHeight:SetConVar( "wallhackspace" )
PlayerCategoryList:AddItem( WallHackHeight )

/*****************************
THIS IS WHERE WE ADD OUR NICE LITTLE TABS TO THE TOP OF THE MENU
*****************************/
PropertySheet:AddSheet( "Hax Menu", actionmenuone, "icon16/information.png", false, false, "Use the main hacks functions!" )
/*
PropertySheet.Paint = function() -- The paint function
		surface.SetDrawColor( 255, 192, 0, 80 ) -- What color do You want to paint the button (R, B, G, A)
		surface.DrawRect( 0, 0, PropertySheet:GetWide(), PropertySheet:GetTall() ) -- Paint what coords (Used a function to figure that out)
	end */
PropertySheet:AddSheet( "Player List", actionmenuthree, "icon16/information.png", false, false, "Add a Player to friends, enemies and kill lists!")
PropertySheet:AddSheet( "More", actionmenutwo, "icon16/information.png", false, false, "Check the Player Info and the Server Info!")
end
concommand.Add("actionmenu", ActionMenu)


//Don't touch anything under here

/**************************************
**************************************
**************************************
**************************************
**************************************
THIS IS WHERE ALL OF THE FUNCTIONS START
**************************************
**************************************
**************************************
**************************************/
local function aimbot() -- Starting the function
	if Hax:GetInt() == 0 then return end
	if aimbot_enabled:GetInt() == 0 then return end
	local ply = LocalPlayer() -- Getting ourselves
	local trace = util.GetPlayerTrace( ply ) -- Player Trace part. 1
	local traceRes = util.TraceLine( trace ) -- Player Trace part. 2
	if traceRes.HitNonWorld then -- If the aimbot aims at something that isn't the map..
		local target = traceRes.Entity -- It's obviously an entity.
		if target:IsPlayer() then -- But it must be a player.
			local bone
			if ConVarExists( "aimbot" ) && GetConVar("aimbot"):GetInt() == 0 then bone = "ValveBiped.Bip01_Spine2" else bone = "ValveBiped.Bip01_Head1" end
			local targethead = target:LookupBone(bone) -- In this aimbot we only aim for the head.
			if !targethead then return end
			local targetheadpos,targetheadang = target:GetBonePosition(targethead) -- Get the position/angle of the head.
			if !targetheadpos || !targetheadang then return end
			if target.status == "Friend" then return end
			
			ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle()) -- And finally, we snap our aim to the head of the target.
		end	
	end
	
end
hook.Add("Think","aimbot",aimbot) -- The hook will spam "aimbot" until it finds a target..



local function aimbotchest() -- Starting the function
	if Hax:GetInt() == 0 then return end
	if aimbot_enabled:GetInt() == 0 then return end
	local ply = LocalPlayer() -- Getting ourselves
	local trace = util.GetPlayerTrace( ply ) -- Player Trace part. 1
	local traceRes = util.TraceLine( trace ) -- Player Trace part. 2
	if traceRes.HitNonWorld then -- If the aimbot aims at something that isn't the map..
		local target = traceRes.Entity -- It's obviously an entity.
		if target:IsPlayer() then -- But it must be a player.
			local bone
			if ConVarExists( "aimbotchest" ) && GetConVar("aimbotchest"):GetInt() == 0 then bone = "ValveBiped.Bip01_Spine4" else bone = "ValveBiped.Bip01_Head1" end
			local targethead = target:LookupBone(bone) -- In this aimbot we only aim for the chest.
			if !targethead then return end
			local targetheadpos,targetheadang = target:GetBonePosition(targethead) -- Get the position/angle of the head.
			if !targetheadpos || !targetheadang then return end
			if target.status == "Friend" then return end
				
			ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle()) -- And finally, we snap our aim to the head of the target.
		end	
	end
	
end
hook.Add("Think","aimbotchest",aimbotchest) -- The hook will spam "aimbotchest" until it finds a target..

function NoRecoil() -- Adds No Recoil
 
if !Recoil and LocalPlayer():GetActiveWeapon() and LocalPlayer():Alive() and LocalPlayer():GetActiveWeapon():IsValid() and LocalPlayer():GetActiveWeapon().Primary then
 
LocalPlayer():GetActiveWeapon().Primary.Recoil = 0
 
else return end
 
end
 
hook.Add("Think", "Norecoil", NoRecoil)

-- ==========================CROSSHAIR HUD===================== --

----------------------------------------------------------------

local update = CurTime()
local function RapidBotInit()
	if Hax:GetInt() == 0 then return end
	local key = IN_ATTACK2
	local ply = LocalPlayer()
	RapidTarget = RapidTarget || false
	nearest = nearest || {}
	local function PickTarg()
		update = CurTime()
		if RapidTarget == false then
			nearest = {}
			for k,v in ipairs(player.GetAll()) do
				if v != LocalPlayer() && IsValid(v) && v:IsPlayer() && v:Alive() && v.status != "Friend" then
					table.insert(nearest, {v, ID = ((ply:GetPos()-v:GetPos()):Length())})	

					table.SortByMember(nearest, "ID", function(a, b) return a > b end)
					RapidTarget = true

				end
			end
		end
	end
	//UPDATE TARG, mostly for cross
	if wallhackcross:GetInt() > 0 then
		if CurTime() >= (update + 0.33) then 
			RapidTarget = false
			PickTarg()
		end
	end
	if aimbot_enabled:GetInt() > 0 && RapidBot:GetInt() > 0 then
		local function printKeyReleased( ply, key )
			if ply != LocalPlayer() then return end
			if key != IN_ATTACK2 then return end
			RapidTarget = false
			PickTarg()
		end
		hook.Add( "KeyRelease", "KeyReleasedHook", printKeyReleased )
		if ply:KeyPressed(key) || ply:KeyReleased(key) then 
			RapidTarget = false
			PickTarg()
		end
		if RapidTarget == false then PickTarg() end
		if ply:KeyDown(key)  then
			if RapidTarget != false then
				if nearest != nil && IsValid(nearest[1][1]) && nearest[1][1]:IsPlayer() && nearest[1][1]:Alive() then
					local CurrentTarget = nearest[1][1]
					local trace = util.GetPlayerTrace( ply ) -- Player Trace part. 1
					local traceRes = util.TraceLine( trace ) -- Player Trace part. 2
					local bone
					if ConVarExists( "aimbot" ) && GetConVar("aimbot"):GetInt() == 0 then bone = "ValveBiped.Bip01_L_Forearm" else bone = "ValveBiped.Bip01_Spine2" end
					local targethead = CurrentTarget:LookupBone(bone) -- In this aimbot we only aim for the head.
					if !targethead then 
						RapidTarget = false
						PickTarg()
						return 
					end
					local targetheadpos,targetheadang = CurrentTarget:GetBonePosition(targethead) -- Get the position/angle of the head.
					if !targetheadpos || !targetheadang then 
						RapidTarget = false
						PickTarg()
						return 
					end
					local comp = targetheadpos + ( CurrentTarget:GetVelocity() / 45 - ply:GetVelocity() / 45 ) 
					ply:SetEyeAngles((comp-ply:GetShootPos()):Angle()) -- And finally, we snap our aim to the head of the target.
				else
					RapidTarget = false
					PickTarg()
				end
			end
		end
	end
end

hook.Add("Think", "rapidbotinit", RapidBotInit)

function Aimbotlogged()
	if Hax:GetInt() == 0 || aimbot_enabled:GetInt() == 0 then return end
	local ply = LocalPlayer()
	local key = IN_USE
	local offkey = IN_ZOOM
	if AimbotLog:GetInt() == 1 then
		TargLogged = TargLogged || {}
		Logged = Logged || false
		if !Logged then
			if (ply:KeyPressed(key) || ply:KeyDown(key)) then
				local trace = util.GetPlayerTrace( ply ) -- Player Trace part. 1
				local traceRes = util.TraceLine( trace ) -- Player Trace part. 2
				if traceRes.HitNonWorld then
					if traceRes.Entity.status == "Friend" then return end
					Logged = true
					TargLogged[1] = traceRes.Entity
					traceRes.Entity.status = "Wanted"
				end
			end
		else
			if ply:KeyDown(key) then
				TargLogged = TargLogged || false
				if TargLogged == false then 
					Logged = false
					TargLogged = {} 
					return
				end
				if TargLogged && #TargLogged > 0 && TargLogged[1]:IsPlayer() && TargLogged[1]:Alive() then
					local bone
					if ConVarExists( "aimbot" ) && GetConVar("aimbot"):GetInt() == 0 then bone = "ValveBiped.Bip01_Spine2" else bone = "ValveBiped.Bip01_Head1" end
					local targethead = TargLogged[1]:LookupBone(bone) -- In this aimbot we only aim for the head.
					if !targethead then 
						RapidTarget = false
						PickTarg()
						return 
					end
					local targetheadpos,targetheadang = TargLogged[1]:GetBonePosition(targethead) -- Get the position/angle of the head.
					if !targetheadpos || !targetheadang then 
						RapidTarget = false
						PickTarg()
						return 
					end
					local comp = targetheadpos + ( TargLogged[1]:GetVelocity() / 45 - ply:GetVelocity() / 45 ) 
					ply:SetEyeAngles((comp-ply:GetShootPos()):Angle()) -- And finally, we snap our aim to the head of the target.
				end
			end
		end
		if ply:KeyPressed(offkey) || ply:KeyDown(offkey) then
			if Logged then
				TargLogged[1].status = ""
				Logged = false
				TargLogged = {}
			end
		end
		
	end
end
hook.Add("Think", "aimbotlogged", Aimbotlogged)

local auto_on = false
hook.Add( "Think", "Hax", function()
	if Hax:GetInt() == 0 then return end
	local ply = LocalPlayer()
    local Target = ply:GetEyeTrace()
	local Weapon = ply:GetActiveWeapon()
	
    if AutoShoot:GetInt() > 0 && ply:Alive() && Weapon:IsValid() then	
		local Victim = Target.Entity
		auto_on = true
		
		if Victim:IsPlayer() && Victim:Alive() && Victim.status != "Friend" then
			RunConsoleCommand( "+attack" )
		elseif Target.HitNonWorld then
			RunConsoleCommand( "-attack" )
		else
			RunConsoleCommand( "-attack" )
		end
	elseif AutoShoot:GetInt() <= 0 && auto_on then
		RunConsoleCommand( "-attack" )
		auto_on = false
	end
	
end )
hook.Add( "HUDPaint", "Wallhack", function()
 
for k,v in pairs ( player.GetAll() ) do
	if Hax:GetInt() == 0 then return end
		if ConVarExists( "wallhax" ) && GetConVar("wallhax"):GetInt() == 1 then
			local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
			local dist = (v:GetPos() + Vector(0,0,105) ):ToScreen()
			local HighPos = ( v:GetPos() + Vector( 0,0,WallHackSpacing:GetInt() ) ):ToScreen()
				local Admin = ""
				if v:IsAdmin() || v:IsSuperAdmin() then Admin = "-A-" end
				if v:Health()>100 then
					red =0
					green = 130
					blue = 255
				elseif v:Health() > 0 && v:Health() <= 100 then
					red = (255 * (1-(v:Health()/100)))
					green = (255 * (v:Health()/100))
					blue = 0
				else
					red, green, blue = 255, 255, 255
				end
					draw.DrawText( Admin..v:Name(), "MenuLarge", Position.x, Position.y, Color( red, green, blue, 255 ), 1 )
				if Coords:GetInt() == 1 then
					draw.DrawText( tostring(math.floor((v:GetPos()-LocalPlayer():GetPos()):Length())), "MenuLarge", dist.x, dist.y, Color( red, green, blue, 255 ), 1 )
				end
			if WallHackBig:GetInt() == 1 then
				v.status = v.status || 1
				if v.status != 1 then 
					local function DoColor(v)
						v.status = v.status || 1
						if v.status == 1 then return Color(255,192,0) end
						
						if v.status == "Kill" then 
							v.color = Color(255,0,0)
						elseif v.status == "Wanted" then
							v.color = Color(255,192,0)
						elseif v.status =="Admin" then
							v.color = Color(255, 255, 100) 
						elseif v.status == "Friend" then
							v.color = Color(0,255,0)
						else
							v.color = Color(0,0,255)
						end
						return v.color
					end	
					draw.DrawText( v.status, "Trebuchet24", HighPos.x, HighPos.y, DoColor(v), 1 )
				end
			end
	end
 
end
 
end )

crosstarg = {}

hook.Add("Think", "CrossT", function()
	local tr = LocalPlayer():GetEyeTrace()
	if tr.HitNonWorld then crosstarg[1] = tr.Entity else crosstarg = {} end
end)

hook.Add("HUDPaint", "Cross", function()

	for k,v in pairs(player.GetAll()) do
		if IsValid(v) && v:Alive() then
			if wallhackcross:GetInt() > 0 then
				nearest = nearest || {}
				RapidTarget = RapidTarget || false
				if crosstarg[1] == v then 
					surface.SetDrawColor(0,255,0)
				elseif RapidTarget && nearest[1][1] == v then
					surface.SetDrawColor(255,255,0)
				else
					surface.SetDrawColor(255,0,0)
				end

				local targethead = v:LookupBone("ValveBiped.Bip01_Head1") -- In this aimbot we only aim for the head.
				if !targethead then return end
				local targetheadpos,targetheadang = v:GetBonePosition(targethead) -- Get the position/angle of the head.
				if !targetheadpos || !targetheadang then end
				local pos = (targetheadpos + ( v:GetVelocity() / 45 - LocalPlayer():GetVelocity() / 45 )):ToScreen()
				local length = (LocalPlayer():GetPos() - v:GetPos()):Length()
				local line = (100 / length) * 100
				surface.DrawLine( pos.x - line, pos.y, pos.x + line, pos.y )
				surface.DrawLine( pos.x, pos.y + line, pos.x, pos.y - line )
			end
		end
	end
end)

local function ToggleClicker()
	GUIToggled = GUIToggled || false
	if GUIToggled == false then
		gui.EnableScreenClicker(true)
		GUIToggled = true
	else
		gui.EnableScreenClicker(false)
		GUIToggled = false
	end
end
concommand.Add(CursorToggle, ToggleClicker)
/***********************************************
HERE IS THE FUNCTION TO PRINT ADMINS TO THE CHAT
***********************************************/
local function GetAdmins()
	local players = 0
	for k,v in pairs(player.GetAll()) do
		if v:IsSuperAdmin() then
			players = players + 1
			LocalPlayer():ChatPrint("S-Admin:"..v:Nick().."__"..v:SteamID().."\n")
		elseif v:IsAdmin() then
			players = players + 1
			LocalPlayer():ChatPrint("Admin:"..v:Nick().."__"..v:SteamID())
		end
	end
	LocalPlayer():ChatPrint("ModsHaxx: "..players.." Admins online")
end

timer.Create("GetAdmins", 60, 0, GetAdmins )
timer.Start(1, function() GetAdmins() end)
timer.Start("GetAdmins")

local SW = {}
 
SW.Enabled = false
SW.ViewOrigin = Vector( 0, 0, 0 )
SW.ViewAngle = Angle( 0, 0, 0 )
SW.Velocity = Vector( 0, 0, 0 )
 
function SW.CalcView( ply, origin, angles, fov )
        if ( !SW.Enabled ) then return end
        if ( SW.SetView ) then
                SW.ViewOrigin = origin
                SW.ViewAngle = angles
               
                SW.SetView = false
        end
        return { origin = SW.ViewOrigin, angles = SW.ViewAngle }
end
hook.Add( "CalcView", "SpiritWalk", SW.CalcView )
 
function SW.CreateMove( cmd )
        if ( !SW.Enabled ) then return end
       
        // Add and reduce the old velocity.
        local time = FrameTime()
        SW.ViewOrigin = SW.ViewOrigin + ( SW.Velocity * time )
        SW.Velocity = SW.Velocity * 0.95
       
        // Rotate the view when the mouse is moved.
        local sensitivity = 0.022
        SW.ViewAngle.p = math.Clamp( SW.ViewAngle.p + ( cmd:GetMouseY() * sensitivity ), -89, 89 )
        SW.ViewAngle.y = SW.ViewAngle.y + ( cmd:GetMouseX() * -1 * sensitivity )
       
        // What direction we're going to move in.
        local add = Vector( 0, 0, 0 )
        local ang = SW.ViewAngle
        if ( cmd:KeyDown( IN_FORWARD ) ) then add = add + ang:Forward() end
        if ( cmd:KeyDown( IN_BACK ) ) then add = add - ang:Forward() end
        if ( cmd:KeyDown( IN_MOVERIGHT ) ) then add = add + ang:Right() end
        if ( cmd:KeyDown( IN_MOVELEFT ) ) then add = add - ang:Right() end
        if ( cmd:KeyDown( IN_JUMP ) ) then add = add + ang:Up() end
        if ( cmd:KeyDown( IN_DUCK ) ) then add = add - ang:Up() end
       
        // Speed.
        add = add:GetNormal() * time * 500
        if ( cmd:KeyDown( IN_SPEED ) ) then add = add * 2 end
       
        SW.Velocity = SW.Velocity + add
       
        // This stops us looking around crazily while spiritwalking.
        if ( SW.LockView == true ) then
                SW.LockView = cmd:GetViewAngles()
        end
        if ( SW.LockView ) then
                cmd:SetViewAngles( SW.LockView )
        end
       
        // This stops us moving while spiritwalking.
        cmd:SetForwardMove( 0 )
        cmd:SetSideMove( 0 )
        cmd:SetUpMove( 0 )
end
hook.Add( "CreateMove", "SpiritWalk", SW.CreateMove )
 
function SW.Toggle()
        SW.Enabled = !SW.Enabled
        SW.LockView = SW.Enabled
        SW.SetView = true
       
        local status = { [ true ] = "ON", [ false ] = "OFF" }
        print( "SpiritWalk " .. status[ SW.Enabled ] )
end
concommand.Add( "sw_toggle", SW.Toggle )
 
concommand.Add( "sw_pos", function() print( SW.ViewOrigin ) end )

