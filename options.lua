local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

E.Options.args.dtPanels = {
	type = "group",
	name = L["DTBars"],
	order = 600,
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["ElvUI_DTBars"],
		},
		info = {
			order = 2,
			type = "description",
			name = L['DTBars Options'],
		},
		general = {
			order = 3,
			type = "group",
			name = "General",
			guiInline = true,
			args = {
				topDatatext = {
					order = 1,
					type = "group",
					name = "Top DataText Bar",
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = "Enabled",
							get = function(info) return E.db.datatexts.topCenter end,
							set = function(info, value) E.db.datatexts.topCenter = value; DT:CheckTop() end,
						},
						width = {
							type = "range",
							order = 2,
							name = "Width",
							min = 250, max = 550, step = 1,
							get = function(info) return E.db.datatexts.topWidth end,
							set = function(info, value) E.db.datatexts.topWidth = value; DT:ChangePanelSize() end,
						},
					},
				},
				bottomDatatext = {
					order = 2,
					type = "group",
					name = "Bottom DataText Bar",
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = "Enabled",
							get = function(info) return E.db.datatexts.bottomBar end,
							set = function(info, value) E.db.datatexts.bottomBar = value; DT:CheckBottom() end,
						},
						width = {
							type = "range",
							order = 2,
							name = "Width",
							min = 250, max = 550, step = 1,
							get = function(info) return E.db.datatexts.bottomWidth end,
							set = function(info, value) E.db.datatexts.bottomWidth = value; DT:ChangePanelSize() end,
						},
					},
				},
				leftChat = {
					order = 3,
					type = "group",
					name = "Left Chat Datatext",
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = "Enabled",
							get = function(info) return E.db.datatexts.leftChat end,
							set = function(info, value) E.db.datatexts.leftChat = value; DT:CheckLeftChat() end,
						},	
					},
				},
				rightChat = {
					order = 4,
					type = "group",
					name = "Right Chat Datatext",
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = "Enabled",
							get = function(info) return E.db.datatexts.rightChat end,
							set = function(info, value) E.db.datatexts.rightChat = value; DT:CheckRightChat() end,
						},
					},
				},
				xpRep = {
					order = 5,
					type = "group",
					name = "Rep Datatext",
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = "Enabled",
							get = function(info) return E.db.datatexts.xpRep end,
							set = function(info, value) E.db.datatexts.xpRep = value; DT:CheckXP() end,
						},
					},
				},
			},
		},
		backgroundPanels = {
			order = 4,
			type = "group",
			name = "Background Panels",
			guiInline = true,
			args = {
				topPanel = {
					type = "group",
					order = 1,
					name = "Top Panel",
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = "Enabled",
							get = function(info) return E.db.datatexts.enableTop end,
							set = function(info, value) E.db.datatexts.enableTop = value; DT:CheckExtra() end,
						},
						height = {
							type = "range",
							order = 2,
							name = "Height",
							min = 1, max = 30, step = .2,
							get = function(info) return E.db.datatexts.topSize end,
							set = function(info, value) E.db.datatexts.topSize = value; DT:ChangePanelSize() end,
						},
					},
				},
				bottomPanel = {
					type = "group",
					order = 2,
					name = "Bottom Panel",
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = "Enabled",
							get = function(info) return E.db.datatexts.enableBottom end,
							set = function(info, value) E.db.datatexts.enableBottom = value; DT:CheckExtra() end,
						},
						height = {
							type = "range",
							order = 2,
							name = "Height",
							min = 1, max = 30, step = .2,
							get = function(info) return E.db.datatexts.bottomSize end,
							set = function(info, value) E.db.datatexts.bottomSize = value; DT:ChangePanelSize() end,
						
						},
					},
				},
			},
		},
	},
}