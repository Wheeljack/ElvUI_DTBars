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
			name = L["General"],
			guiInline = true,
			args = {
				topDatatext = {
					order = 1,
					type = "group",
					name = L["Top DataText Bar"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.topCenter end,
							set = function(info, value) E.db.datatexts.topCenter = value; DT:CheckTop() end,
						},
						width = {
							type = "range",
							order = 2,
							name = L["Width"],
							min = 250, max = 550, step = 1,
							get = function(info) return E.db.datatexts.topWidth end,
							set = function(info, value) E.db.datatexts.topWidth = value; DT:ChangePanelSize() end,
						},
					},
				},
				bottomDatatext = {
					order = 2,
					type = "group",
					name = L["Bottom DataText Bar"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.bottomBar end,
							set = function(info, value) E.db.datatexts.bottomBar = value; DT:CheckBottom(); DT:CheckLayout() end,
						},
						width = {
							type = "range",
							order = 2,
							name = L["Width"],
							min = 250, max = 550, step = 1,
							get = function(info) return E.db.datatexts.bottomWidth end,
							set = function(info, value) E.db.datatexts.bottomWidth = value; DT:ChangePanelSize() end,
						},
					},
				},
				leftChat = {
					order = 3,
					type = "group",
					name = L["Left Chat Datatext"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.leftChat end,
							set = function(info, value) E.db.datatexts.leftChat = value; DT:CheckLeftChat() end,
						},	
					},
				},
				rightChat = {
					order = 4,
					type = "group",
					name = L["Right Chat Datatext"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.rightChat end,
							set = function(info, value) E.db.datatexts.rightChat = value; DT:CheckRightChat() end,
						},
					},
				},
				xpRep = {
					order = 5,
					type = "group",
					name = L["Rep Datatext"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.xpRep end,
							set = function(info, value) E.db.datatexts.xpRep = value; DT:CheckXP() end,
						},
						mouseover = {
							type = "toggle",
							order = 2,
							name = L["Mouseover"],
							get = function(info) return E.db.datatexts.expMouseover end,
							set = function(info, value) E.db.datatexts.expMouseover = value; DT:ExpRepMouseOver() end,
						
						},
					},
				},
				ldbOne = {
					order = 6,
					type = "group",
					name = L["Extra One"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.ldbOne end,
							set = function(info, value) E.db.datatexts.ldbOne = value; DT:ChangePanelSize(); DT:CheckAPanels() end,
						},
						width = {
							type = "range",
							order = 2,
							name = L["Width"],
							min = 50, max = 500, step = 1,
							get = function(info) return E.db.datatexts.ldbOneWidth end,
							set = function(info, value) E.db.datatexts.ldbOneWidth = value; DT:ChangePanelSize(); end,
						},
						mouseover = {
							type = "toggle",
							order = 3,
							name = L["Mouseover"],
							get = function(info) return E.db.datatexts.ldbOneMouseover end,
							set = function(info, value) E.db.datatexts.ldbOneMouseover = value; DT:CheckLDBMouseover() end,
						},
					},
				},
				ldbTwo = {
					order = 7,
					type = "group",
					name = L["Extra Two"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.ldbTwo end,
							set = function(info, value) E.db.datatexts.ldbTwo = value; DT:CheckAPanels() end,
						},
						width = {
							type = "range",
							order = 2,
							name = L["Width"],
							min = 50, max = 500, step = 1,
							get = function(info) return E.db.datatexts.ldbTwoWidth end,
							set = function(info, value) E.db.datatexts.ldbTwoWidth = value; DT:ChangePanelSize() end,
						},
						mouseover = {
							type = "toggle",
							order = 3,
							name = L["Mouseover"],
							get = function(info) return E.db.datatexts.ldbTwoMouseover end,
							set = function(info, value) E.db.datatexts.ldbTwoMouseover = value; DT:CheckLDBMouseover() end,
						},
					},
				},
				ldbThree = {
					order = 8,
					type = "group",
					name = L["Extra Three"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.ldbThree end,
							set = function(info, value) E.db.datatexts.ldbThree = value; DT:CheckAPanels() end,
						},
						width = {
							type = "range",
							order = 2,
							name = L["Width"],
							min = 50, max = 500, step = 1,
							get = function(info) return E.db.datatexts.ldbThreeWidth end,
							set = function(info, value) E.db.datatexts.ldbThreeWidth = value; DT:ChangePanelSize() end,
						},
						mouseover = {
							type = "toggle",
							order = 3,
							name = L["Mouseover"],
							get = function(info) return E.db.datatexts.ldbThreeMouseover end,
							set = function(info, value) E.db.datatexts.ldbThreeMouseover = value; DT:CheckLDBMouseover() end,
						},
					},
				},
			},
		},
		backgroundPanels = {
			order = 4,
			type = "group",
			name = L["Background Panels"],
			guiInline = true,
			args = {
				topPanel = {
					type = "group",
					order = 1,
					name = L["Top Panel"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.enableTop end,
							set = function(info, value) E.db.datatexts.enableTop = value; DT:CheckExtra() end,
						},
						height = {
							type = "range",
							order = 2,
							name = L["Height"],
							min = 1, max = 30, step = .2,
							get = function(info) return E.db.datatexts.topSize end,
							set = function(info, value) E.db.datatexts.topSize = value; DT:ChangePanelSize() end,
						},
					},
				},
				bottomPanel = {
					type = "group",
					order = 2,
					name = L["Bottom Panel"],
					guiInline = true,
					args = {
						enable = {
							type = "toggle",
							order = 1,
							name = L["Enabled"],
							get = function(info) return E.db.datatexts.enableBottom end,
							set = function(info, value) E.db.datatexts.enableBottom = value; DT:CheckExtra() end,
						},
						height = {
							type = "range",
							order = 2,
							name = L["Height"],
							min = 1, max = 30, step = .2,
							get = function(info) return E.db.datatexts.bottomSize end,
							set = function(info, value) E.db.datatexts.bottomSize = value; DT:ChangePanelSize() end,
						
						},
					},
				},
			},
		},
		Other = {
			order = 5,
			type = "group",
			name = L["Other"],
			guiInline = true,
			args = {
				enable = {
					type = "toggle",
					order = 1,
					name = L["Enabled"],
					get = function(info) return E.db.datatexts.moveChats end,
					set = function(info, value) E.db.datatexts.moveChats = value; DT:MoveChats() end,
				},
				moveChats = {
					type = "range",
					order = 2,
					name = L["Chat Offset"],
					desc = "Control the Y axis of the chat panels.",
					min = 1, max = 25, step = .5,
					get = function(info) return E.db.datatexts.chatOffset end,
					set = function(info, value) E.db.datatexts.chatOffset = value; DT:MoveChats() end,
				},
			},
		},
	},
}