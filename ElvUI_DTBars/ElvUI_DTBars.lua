--------------------------------------------------------
-- Credits --
--------------------------------------------------------
-- Elv
-- the Tuk/Elv community for making this possible!
-- 
--
--------------------------------------------------------
-- System Settable Variables --
--------------------------------------------------------
local E, L, V, DF, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')
local LO = E:GetModule('Layout')

E.Layout = LO;




P['dtPanels'] = {
	--['enable'] = true,
	['enableTop'] = true,
	['enableBottom'] = true,
	['topCenter'] = true,
	['bottomBar'] = true,
	['leftChat'] = true,
	['rightChat'] = true,
	['topSize'] = 22,
	['bottomSize'] = 22,
	['topWidth'] = 350,
	['bottomWidth'] = 400,
	['expMouseover'] = true,
}
--local E, L, DF = unpack(ElvUI); --Engine
--local DT = E:GetModule('DataTexts')

Broker = CreateFrame('Frame', 'Broker', E.UIParent)
Broker.ldb = LibStub:GetLibrary("LibDataBroker-1.1")
pluginObjects = {}

ElvUI_DTbar = CreateFrame('Frame', 'ElvUI_DTbar', E.UIParent)
ElvUI_DTbar.version = '2.2b'

local top_bar, bottom_bar, exp_rep, extra_bar, top_panel
local lchat_tab, rchat_tab, rchat_tab2
local PANEL_HEIGHT = 22 -- taken from Layout.lua

db = db or {} 

-------------
---  LDB  ---
-------------
-- Use 'LDB_name', format here.  if unsure do a /dtbar showldb in game.  CASE SENSITIVE
-------------

DTBar_ldb = {
	
}
-------------
--------------------------------------------------------
-- Language Variables --
--------------------------------------------------------

-- description as shown in /ec -> datatext;  L['panel name'] = 'description';
L['TOP_TESTPANEL'] = 'Top Center Data Panel';
L['Bottom_Datatext_Panel'] = 'Action Bar 1 (Bottom) Data Panel';
L['EXP_REP_TESTPANEL'] = 'EXP/REP Data Panel';
L['LeftChatTab_Datatext_Panel'] = 'Upper Left Chat';
L['RightChatTab_Datatext_Panel'] = 'Upper Right Chat';
L['RightChatTab_Datatext_Panel2'] = 'Upper Right Chat 2';
--------------------------------------------------------


--------------------------------------------------------
-- default values for datatext
--------------------------------------------------------
DF.datatexts.panels.TOP_TESTPANEL = {
		left = 'Friends',
		middle = 'Spec Switch',
		right = 'Guild',
}

--Bottom_Datatext_Panel
DF.datatexts.panels.Bottom_Datatext_Panel = {
	left = 'Currency',
	middle = 'Call to Arms',
	right = 'Bags',
}

--Experience_Datatext_Panel
DF.datatexts.panels.EXP_REP_TESTPANEL = 'DPS'
 
DF.datatexts.panels.LeftChatTab_Datatext_Panel = 'Durability'

DF.datatexts.panels.RightChatTab_Datatext_Panel = 'Gold'

DF.datatexts.panels.RightChatTab_Datatext_Panel2 = 'Bags'

--------------------------------------------------


--------------------------------------------------------
-- Code  --
--------------------------------------------------------


--------------------------------------------------------
-- left chat tabbar
--------------------------------------------------------
local function lchat_tab_setup()
	do
		lchat_tab:Size(LeftChatTab:GetWidth() / 3, PANEL_HEIGHT)
		lchat_tab:Point("TOPRIGHT", LeftChatTab, "TOPRIGHT", 0, -E.mult);
		lchat_tab:SetFrameStrata('LOW')
		LeftChatTab:HookScript("OnHide", function() lchat_tab:Hide() end)
		LeftChatTab:HookScript("OnShow", function() lchat_tab:Show() end)		
	end
end
do
	lchat_tab = CreateFrame('Frame', 'LeftChatTab_Datatext_Panel', E.UIParent)
	lchat_tab.db = {key='LeftChatTab_Datatext_Panel', value = true}
	DT:RegisterPanel(lchat_tab, 1, 'ANCHOR_BOTTOM', 0, -4)
	lchat_tab:Hide()
end
--- 
 
 
--------------------------------------------------------
 -- right chat tabbar
--------------------------------------------------------
local function rchat_tab_setup()
	do
		rchat_tab:Size(RightChatPanel:GetWidth() /3,PANEL_HEIGHT)
		rchat_tab:Point("RIGHT", RightChatTab_Datatext_Panel2, "LEFT")
		rchat_tab:SetFrameStrata('LOW')

		rchat_tab2:Size((RightChatPanel:GetWidth() / 3),PANEL_HEIGHT)
		rchat_tab2:Point("TOPRIGHT", RightChatTab, "TOPRIGHT", 0, 0) -- if you use the skada embed code you might need to adjust the x-offset to allow room for the arrow button
		rchat_tab2:SetFrameStrata('LOW')

		RightChatTab:HookScript("OnHide", function() 
			rchat_tab:Hide() 
			rchat_tab2:Hide() 
		end)
		RightChatTab:HookScript("OnShow", function() 
			rchat_tab:Show() 
			rchat_tab:SetAlpha(RightChatTab:GetAlpha()) 
			rchat_tab2:Show() 
			rchat_tab2:SetAlpha(RightChatTab:GetAlpha()) 
		end)
	end
end

 do
	rchat_tab = CreateFrame('Frame', 'RightChatTab_Datatext_Panel', E.UIParent)
	rchat_tab.db ={key='RightChatTab_Datatext_Panel', value = true}
	DT:RegisterPanel(rchat_tab, 1, 'ANCHOR_BOTTOM', 0, -4)
	rchat_tab:Hide()
end

--------------------------------------------------------
-- right chat tabbar2
--------------------------------------------------------
 do
	rchat_tab2 = CreateFrame('Frame', 'RightChatTab_Datatext_Panel2', E.UIParent)
	rchat_tab2.db = {key='RightChatTab_Datatext_Panel2', value = true}
	DT:RegisterPanel(rchat_tab2, 1, 'ANCHOR_BOTTOM', 0, -4)
	rchat_tab2:Hide()
end

--------------------------------------------------------
-- extra bar					
--------------------------------------------------------

do
	extra_bar = CreateFrame('Frame', 'Extra_Datatext_Panel', E.UIParent)
	extra_bar.db = {key ='Extra_Datatext_Panel', value = true}
	extra_bar:SetTemplate('Transparent', true)
	extra_bar:SetFrameLevel(0)
	extra_bar:SetFrameStrata('BACKGROUND')
	extra_bar:SetPoint("BOTTOMLEFT", E.UIParent, "BOTTOMLEFT", -E.mult, -E.mult)
	extra_bar:SetPoint("BOTTOMRIGHT", E.UIParent, "BOTTOMRIGHT", E.mult, -E.mult) 
		
	top_panel = CreateFrame('Frame', 'Top_Panel', E.UIParent)
	top_panel.db = { key='Top_Panel', value = true }
	top_panel:SetPoint("TOPLEFT", E.UIParent, "TOPLEFT", -E.mult, E.mult)
	top_panel:SetPoint("TOPRIGHT", E.UIParent, "TOPRIGHT", E.mult, E.mult)
	top_panel:SetTemplate('Transparent', true)
	top_panel:SetFrameStrata('BACKGROUND')
	top_panel:SetFrameLevel(0)
end	


function DT:CheckLayout()
	if E.db.datatexts.enableBottom then
		RightChatPanel:SetFrameStrata('BACKGROUND')
		RightChatPanel:SetFrameLevel(3)
	end
	
	if E.db.datatexts.enableBottom then
		LeftChatPanel:SetFrameStrata('BACKGROUND')
		LeftChatPanel:SetFrameLevel(3)
	end
end

function DT:CheckExtra()
	if E.db.datatexts.enableTop then
		top_panel:Show()
	else
		top_panel:Hide()
	end
	
	if E.db.datatexts.enableBottom then
		extra_bar:Show()
	else
		extra_bar:Hide()
	end
end

function DT:ChangePanelSize()
	top_panel:Size(E.UIParent:GetWidth() + (E.mult * 2), E.db.datatexts.topSize)
	extra_bar:Size(E.UIParent:GetWidth() + (E.mult * 2), E.db.datatexts.bottomSize)
	bottom_bar:Size(E.db.datatexts.bottomWidth, PANEL_HEIGHT)
	top_bar:Size(E.db.datatexts.topWidth, PANEL_HEIGHT)
	DT:UpdateAllDimensions()
end

--------------------------------------------------------
-- bottom bar					
--------------------------------------------------------
bottom_bar = CreateFrame('Frame', 'Bottom_Datatext_Panel', E.UIParent)
bottom_bar.db = {key ='Bottom_Datatext_Panel', value = true}
DT:RegisterPanel(bottom_bar, 3, 'ANCHOR_BOTTOM', 0, -4)
function DT:BottomBarDP()
	bottom_bar:SetTemplate('Default', true)
	bottom_bar:SetFrameStrata('LOW')
	bottom_bar:SetFrameLevel(1)
	bottom_bar:Point('BOTTOM', E.UIParent, 'BOTTOM', 0, -E.mult - 3)
	bottom_bar:SetScript('OnShow', function(self) 
		self:Size(E.db.datatexts.bottomWidth, PANEL_HEIGHT); 
		E:CreateMover(self, "BottomBarMover", "Bottom Datatext Frame") 
	end)
	bottom_bar:Hide()
end



--------------------------------------------------------
-- top bar
--------------------------------------------------------
top_bar = CreateFrame('Frame', 'TOP_TESTPANEL', E.UIParent)
top_bar.db = { key='TOP_TESTPANEL', value = true }
DT:RegisterPanel(top_bar, 3, 'ANCHOR_BOTTOM', 0, -4)
function DT:TopBarDP()
	top_bar:Size(E.db.datatexts.topWidth, PANEL_HEIGHT)
	top_bar:Point("TOP", E.UIParent, "TOP", 0, -E.mult)
	top_bar:SetTemplate('Default', true)
	top_bar:SetFrameStrata('LOW')
	E:CreateMover(top_bar, "TopBarMover", "Top Datatext Frame")
	top_bar:Hide()
end



	
--------------------------------------------------------
-- exp/rep bar	
--------------------------------------------------------
local function exp_rep_tab_setup()
	UpperRepExpBarHolder:HookScript('OnUpdate', function() 
		local parent_alpha = UpperRepExpBarHolder:GetAlpha()
		local parent_alpha = UpperRepExpBarHolder:GetAlpha()
		if exp_rep:GetAlpha() ~= parent_alpha then exp_rep:SetAlpha( parent_alpha) end
	end )	
end

--Look at bottom panel for comments
exp_rep = CreateFrame('Frame', 'EXP_REP_TESTPANEL', E.UIParent)
exp_rep.db = {key='EXP_REP_TESTPANEL', value = true}
DT:RegisterPanel(exp_rep, 1, 'ANCHOR_BOTTOM', 0, -4)
function DT:ExpRepBarDP()
	exp_rep:Point("TOPLEFT", UpperRepExpBarHolder, "BOTTOMLEFT", 0, -E.mult)
	exp_rep:SetTemplate('Default', true)
	exp_rep:Point("TOPLEFT", UpperRepExpBarHolder, "BOTTOMLEFT", 0, -E.mult); 
	exp_rep:SetFrameStrata('BACKGROUND')
	exp_rep:Hide()
	exp_rep:SetScript('OnShow', function(self) 
		self:Size(UpperRepExpBarHolder:GetWidth(), PANEL_HEIGHT)
		E:CreateMover(exp_rep, "ExpBarMover", "Exp/Rep Datatext Frame") 
	end)
end

function DT:ExpRepMouseOver()
	if E.db.datatexts.expMouseover then
			exp_rep:SetScript("OnUpdate", function(self,event,...)
				if MouseIsOver(EXP_REP_TESTPANEL) then
					exp_rep:SetAlpha(1)
				else
					exp_rep:SetAlpha(0)
				end
			end)
		
	end
	
	if not E.db.datatexts.expMouseover then
		exp_rep:SetScript("OnUpdate", nil)
		exp_rep:SetAlpha(1)
	end
	
end
--------------------------------------------------------
-- Toggling via ingame config
--------------------------------------------------------

function DT:CheckTop()
	if E.db.datatexts.topCenter then
		top_bar:Show()
	else
		top_bar:Hide()
	end	
end

function DT:CheckBottom()
	if E.db.datatexts.bottomBar then
		bottom_bar:Show()
	else
		bottom_bar:Hide()
	end
end

function DT:CheckXP()
	if E.db.datatexts.xpRep then
		exp_rep:Show()
	else
		exp_rep:Hide()
	end
end

function DT:CheckLeftChat()
	if E.db.datatexts.leftChat then
		lchat_tab:Show()
	else
		lchat_tab:Hide()
	end
end

function DT:CheckRightChat()
	if E.db.datatexts.rightChat then
		rchat_tab:Show()
		rchat_tab2:Show()
	else
		rchat_tab:Hide()
		rchat_tab2:Hide()
	end
end
--
-- Table O' Frame tables! we parse and check for GetName() to toggle show/hide :) saves some very nasty lines of code.
--
ElvUI_DTbar._table = {
	top_bar,
	bottom_bar,
	exp_rep,
	lchat_tab,
	rchat_tab,
	rchat_tab2,
}

 --[[local function SlashHandler(command)
	if command == 'show all' then						-- show all
		for k,v in ipairs(ElvUI_DTbar._table) do v:Show() db[v:GetName()] = true end
	elseif command:match("^show .*") then				-- show <bar> --> this line is pure beauty
		command = command:gsub("^show ","")
		for k,v in ipairs(ElvUI_DTbar._table) do if (v:GetName():lower():match(command:lower())) then v:Show() db[v:GetName()] = true end end
	elseif command == 'hide all' then					-- hide all
		for k,v in ipairs(ElvUI_DTbar._table) do v:Hide() db[v:GetName()] = false end
	elseif command:match("^hide .*") then				-- hide <bar>  --> this line is pure beauty
		command = command:gsub("^hide ","")
		for k,v in ipairs(ElvUI_DTbar._table) do if (v:GetName():lower():match(command:lower())) then v:Hide() db[v:GetName()] = false end end
	elseif command == 'list' then						-- list
		for k,v in ipairs(ElvUI_DTbar._table) do print ('Frame: '..v:GetName()) end 
	elseif command == 'showldb' then
		for name, obj in Broker.ldb:DataObjectIterator() do
			print(name)
		end
	elseif command == 'ver' then
		print (ElvUI_DTbar.version)
	else							-- syntax
		print ('\
			commands are:\
/dtbar show <frameName>\
/dtbar show all\
/dtbar hide <frameName>\
/dtbar hide all\
/dtbar list\
')
	end	
end]]

 -- function ElvUI_DTbar.db_check()

	-- for k,v in ipairs(ElvUI_DTbar._table) do
		-- local _name = v.db.key

		-- if db[_name] == true then
			-- v:Show()
		-- elseif db[_name] == false then
		-- else								--missing entry
			-- db[_name] = v.db.value
			-- v:Show()

		-- end 
	-- end
-- end


function DT:Loading() 
	SlashCmdList["ElvUI_DTbar"] = SlashHandler
	SLASH_ElvUI_DTbar1 = "/dtbar"
	DT:BottomBarDP()
	DT:TopBarDP()
	lchat_tab_setup()
	rchat_tab_setup()
	exp_rep_tab_setup()
	DT:ExpRepBarDP()
	DT:ExpRepMouseOver()
	DT:CheckExtra() 
	DT:CheckTop()
	DT:CheckBottom()
	DT:CheckXP()
	DT:CheckLeftChat()
	DT:CheckRightChat()
	DT:ChangePanelSize()
	DT:CheckLayout()

	for name, obj in Broker.ldb:DataObjectIterator() do
		if obj.OnCreate then obj.OnCreate(obj, Frame) end
		pluginObject[name] = obj
	end
	
	-- this is 'pass #2' here we setup call back functions for whatever ldb's we have listed.
	-- problem is we can't reg the callback's on pass #1 because not all of the ldb's are loaded at that tiem.
	for k,v in ipairs(DTBar_ldb) do
		local textUpdate = function(_, name, _, data)
			if Broker.ldb[v] and Broker.ldb[v].Update then
				pluginObjects[v] = data
				Broker.ldb[v].Update(data)
			end
		end
		
		local ValueUpdate = function(_, name, _, data, obj)
			if Broker.ldb[v] then 
				pluginObjects[v] = data
			end
		end
		
		print ('LDB registered call back: '..v)
		Broker.ldb.RegisterCallback(Broker, "LibDataBroker_AttributeChanged_"..v.."_text", textUpdate)
		Broker.ldb.RegisterCallback(Broker, "LibDataBroker_AttributeChanged_"..v.."_value", ValueUpdate)
	end

	--print(E.db.dtPanels.enable)
	----------
	Castbar = CreateFrame("Frame", "ElvCastFrameHolder", E.UIParent)
	Castbar:Point("TOPLEFT", ElvUF_Player.Castbar, "TOPLEFT")
	Castbar:Point("BOTTOMRIGHT", ElvUF_Player.Castbar, "BOTTOMRIGHT")
	
	--ElvUF_Player.Castbar:SetParent(Castbar)
	
	--Castbar:SetParent(ElvUF_Player)
	
	--E:CreateMover(Castbar, "Player Castbar Mover", "CastMover Frame")	
	----------
	self:UnregisterEvent("PLAYER_ENTERING_WORLD");
end









Broker:SetScript("OnEvent", function(_, event, ...) Broker[event](Broker, ...) end)

local _self = {}  --local table to discover WTF we are.

pluginObject = pluginObject or {}

local Frame = CreateFrame('Frame', 'ldb frame', E.UIParent)
	Frame:EnableMouse(true)
	Frame:SetBackdropColor(0,0,0,0) 
--	Frame:SetFrameStrata('BACKGROUND')
--	Frame:SetFrameLevel(3)
--	Frame:Size(400, PANEL_HEIGHT)
--	Frame:Point("CENTER", E.UIParent, "CENTER", 0, -E.mult);
--	Frame:SetTemplate()
	Frame:Hide()

Broker.ldb.frame = Frame
Broker.ldb.obj = pluginObject

--DT:RegisterEvent("PLAYER_ENTERING_WORLD") --Commented out due conflict with datatexts.lua

--Function for setting right default value for the function when it doesn't exist in ElvUI.lua (e.g. when it has default value)
--The reason we are doing this is cause core is trying to read default values from profile.lua in config folder of ElvUI
--and doesn't find it so it puts the value as nil. Our code is looking for the value not nil and throws an error.
function DT:DefaultsSet() 
	if E.db.datatexts.enableTop == nil then
		E.db.datatexts.enableTop = false
	end
	
	if E.db.datatexts.enableBottom == nil then
		E.db.datatexts.enableBottom = false
	end
	
	if E.db.datatexts.topCenter == nil then
		E.db.datatexts.topCenter = false
	end

	if E.db.datatexts.bottomBar == nil then
		E.db.datatexts.bottomBar = false
	end
	
	if E.db.datatexts.leftChat == nil then
		E.db.datatexts.leftChat = false
	end
	
	if E.db.datatexts.rightChat == nil then
		E.db.datatexts.rightChat = false
	end
	
	if E.db.datatexts.xpRep == nil then
		E.db.datatexts.xpRep = false
	end
	
	if E.db.datatexts.topSize == nil then
		E.db.datatexts.topSize = 22
	end	
	
	if E.db.datatexts.bottomSize == nil then
		E.db.datatexts.bottomSize = 22
	end
	
	if E.db.datatexts.topWidth == nil then
		E.db.datatexts.topWidth = 350
	end
	
	if E.db.datatexts.bottomWidth == nil then
		E.db.datatexts.bottomWidth = 400
	end
	
	if E.db.datatexts.expMouseover == nil then
		E.db.datatexts.expMouseover = false
	end
	
end

--Hooking to DT module initialize function
DT.InitializeBar = DT.Initialize
function DT:Initialize()
	DT.InitializeBar(self)
	DT:DefaultsSet()
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "Loading")
end