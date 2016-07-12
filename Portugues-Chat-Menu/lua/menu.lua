-- SIMPLE MENU
if not SimpleMenu then
    SimpleMenu = class()

    function SimpleMenu:init(title, message, options)
        self.dialog_data = { title = title, text = message, button_list = {},
                             id = tostring(math.random(0,0xFFFFFFFF)) }
        self.visible = false
        for _,opt in ipairs(options) do
            local elem = {}
            elem.text = opt.text
            opt.data = opt.data or nil
            opt.callback = opt.callback or nil
            elem.callback_func = callback(self, self, "_do_callback",
                                          { data = opt.data,
                                            callback = opt.callback})
            elem.cancel_button = opt.is_cancel_button or false
            if opt.is_focused_button then
                self.dialog_data.focus_button = #self.dialog_data.button_list+1
            end
            table.insert(self.dialog_data.button_list, elem)
        end
        return self
    end

    function SimpleMenu:_do_callback(info)
        if info.callback then
            if info.data then
                info:callback(info.data)
            else
                info:callback()
            end
        end
        self.visible = false
    end

    function SimpleMenu:show()
        if self.visible then
            return
        end
        self.visible = true
        managers.system_menu:show(self.dialog_data)
    end

    function SimpleMenu:hide()
        if self.visible then
            managers.system_menu:close(self.dialog_data.id)
            self.visible = false
            return
        end
    end
end


---------------------------------------------------------------------------------------------------------------------------------


--FUNÇÕES GLOBAIS

function isPlaying()
		if not BaseNetworkHandler then return false end
		return BaseNetworkHandler._gamestate_filter.any_ingame_playing[ game_state_machine:last_queued_state_name() ]
	end
	

function inGame()
		if not game_state_machine then return false end
		return string.find(game_state_machine:current_state_name(), "game")
	end
	
local isMultiplayer = isMultiplayer or function()
        if managers.network == nil then
            return false
        end
        return managers.network:session()
    end
	
function inCustody()
		local player = managers.player:local_player()
		local in_custody = false
		if managers and managers.trade and alive( player ) then
			in_custody = managers.trade:is_peer_in_custody(managers.network:session():local_peer():id())
		end
		return in_custody
	end
	
-- OPEN MENU
function openmenu(menu)
        menu:show()
end

callmenu1 = function()
    openmenu(mymenu)
end

callmenu2 = function()
    openmenu(mymenu2)
end

callmenu3 = function()
    openmenu(mymenu3)
end
	
---------------------------------------------------------------------------------------------------------------------------------

--MENSAGENS

Oi = Oi or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Eaee")
end

Blz = Blz or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Beleza!")
managers.player:local_player():sound():say("p01",true,true)
end

Vlw = Vlw or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Valeu!")
managers.player:local_player():sound():say("s05x_sin",true,true)
end

Ajuda = Ajuda or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Ajuda!?")
managers.player:local_player():sound():say("p45",true,true)
end

Yeah = Yeah or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Sim")
managers.player:local_player():sound():say("v46",true,true)
end

Nope = Nope or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Nope")
end

Shit = Shit or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "MERDA!")
managers.player:local_player():sound():say("g60",true,true)
end

Fuck = Fuck or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "PORRA!")
managers.player:local_player():sound():say("g29",true,true)
end

NAmmo = NAmmo or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Preciso de munição")
managers.player:local_player():sound():say("g81x_plu",true,true)
end

NBag = NBag or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Coloca uma medic bag ai")
managers.player:local_player():sound():say("g80x_plu",true,true)
end

NFirst = NFirst or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "First aid kit, por favor")
end

AmmoH = AmmoH or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Tem munição aqui")
managers.player:local_player():sound():say("s01x_plu",true,true)
end

MedicH = MedicH or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Medic bag aqui")
managers.player:local_player():sound():say("s02x_plu",true,true)
end

FirstH = FirstH or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "First aid kit aqui")
managers.player:local_player():sound():say("s12",true,true)
end

Shield = Shield or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Shield!")
managers.player:local_player():sound():say("f31y_any",true,true)
end

Winters = Winters or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Captain Winters!")
managers.player:local_player():sound():say("cpa_a02_01",true,true)
end

Lasier = Lasier or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Taser!")
managers.player:local_player():sound():say("f32y_any",true,true)
end

Wululu = Wululu or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Cloaker!")
managers.player:local_player():sound():say("f33y_any",true,true)
end

Snipa = Snipa or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Sniper!")
managers.player:local_player():sound():say("f34y_any",true,true)
end

Dozer = Dozer or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "BULLDOZER!")
managers.player:local_player():sound():say("f30y_any",true,true)
end

SkullDozer = SkullDozer or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "SKULLDOZER!")
end

--NÃO FOI TESTADO
--[[Refem = Refem or function()  
if inCustody() then
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Faz refém, por favor!")
else
managers.chat:_receive_message(1, "Menu de Mensagem", "Você tem que estar em custódia para usar essa mensagem.", Color.red)
end
end]]--

Mu = Mu or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Muriatic Acid")
end

Hcl = Hcl or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Hydrogen Chloride")
end

Cs = Cs or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Caustic Soda")
end

GrabDrill = GrabDrill or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Alguém pega a drill... por favor!")
end

FixDrill = FixDrill or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Alguém pode consertar essa drill?")
managers.player:local_player():sound():say("d02x_sin",true,true)
end

Crowbar = Crowbar or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Tem uma crowbar aqui")
end

Keycard = Keycard or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Tem um keycard aqui")
end

Shaw = Shaw or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "É Shaw. Casacos de pele.")
end

Downtown = Downtown or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "É Downtown. Tem que achar charutos.")
end

Foggy = Foggy or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "É Foggy Bottom. Vodka.")
end

West = West or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "West End, achar químicos.")
end

Georgetown = Georgetown or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Georgetown, código de barras com mísseis.")
end

Gas = Gas or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Tem gasolina aqui")
end

---------------------------------------------------------------------------------------------------------------------------------
--MENU 1

opts = {}
opts[#opts+1] = { text = "Olá", callback = Oi }
opts[#opts+1] = { text = "Beleza!", callback = Blz }
opts[#opts+1] = { text = "Valeu!", callback = Vlw }
opts[#opts+1] = { text = "Ajuda?!", callback = Ajuda }
opts[#opts+1] = { text = "Sim", callback = Yeah }
opts[#opts+1] = { text = "Nope", callback = Nope }
opts[#opts+1] = { text = "MERDA!", callback = Shit }
opts[#opts+1] = { text = "PORRA!", callback = Fuck }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Preciso de munição!", callback = NAmmo }
opts[#opts+1] = { text = "Preciso de uma medic bag!", callback = NBag }
opts[#opts+1] = { text = "Preciso de first aid kit!", callback = NFirst }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Tem munição aqui", callback = AmmoH }
opts[#opts+1] = { text = "Tem uma medic bag aqui", callback = MedicH }
opts[#opts+1] = { text = "Tem first aid kit aqui", callback = FirstH }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Próximo", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "FECHAR", is_cancel_button = true }
mymenu = SimpleMenu:new("CHAT MENU", "Por Secco2112 \nVersão 2.0", opts)
if isPlaying() and inGame() and isMultiplayer() and managers.hud then
mymenu:show()



--MENU 2

opts = {}
opts[#opts+1] = { text = "Shield", callback = Shield }
opts[#opts+1] = { text = "Taser", callback = Lasier }
opts[#opts+1] = { text = "Cloaker", callback = Wululu }
opts[#opts+1] = { text = "Sniper", callback = Snipa }
opts[#opts+1] = { text = "Bulldozer", callback = Dozer }
opts[#opts+1] = { text = "Skulldozer", callback = SkullDozer }
opts[#opts+1] = { text = "Capitão Winters", callback = Winters }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Keycard aqui", callback = Keycard }
opts[#opts+1] = { text = "Crowbar aqui", callback = Crowbar }
opts[#opts+1] = { text = "Gasolina aqui", callback = Gas }
opts[#opts+1] = { text = "", is_cancel_button = true }
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "Alguém pegue a drill", callback = GrabDrill }
opts[#opts+1] = { text = "Alguém conserte a drill", callback = FixDrill }
else
opts[#opts+1] = { text = "Alguém pegue a drill", callback = GrabDrill }
opts[#opts+1] = { text = "Alguém conserte a drill", callback = FixDrill }
opts[#opts+1] = { text = "", is_cancel_button = true }
end
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Muriatic Acid", callback = Mu }
opts[#opts+1] = { text = "Hydrogen Chloride", callback = Hcl }
opts[#opts+1] = { text = "Caustic Soda", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
end
if managers.job:current_level_id() == 'mia_1' then
opts[#opts+1] = { text = "Próximo", callback = callmenu3, is_focused_button = true, }
end
opts[#opts+1] = { text = "Anterior", callback = callmenu1, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "FECHAR", is_cancel_button = true }
mymenu2 = SimpleMenu:new("CHAT MENU", "Por Secco2112 \nVersão 2.0", opts)
mymenu2:hide()

--MENU 3

opts = {}
opts[#opts+1] = { text = "Shaw - Casacos de pele", callback = Shaw }
opts[#opts+1] = { text = "Downtown - Charutos", callback = Downtown }
opts[#opts+1] = { text = "Foggy Bottom - Vodka", callback = Foggy }
opts[#opts+1] = { text = "West End - Químicos", callback = West }
opts[#opts+1] = { text = "Georgetown - Mísseis", callback = Georgetown }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Muriatic Acid", callback = Mu }
opts[#opts+1] = { text = "Hydrogen Chloride", callback = Hcl }
opts[#opts+1] = { text = "Caustic Soda", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Anterior", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "FECHAR", is_cancel_button = true }
mymenu3 = SimpleMenu:new("CHAT MENU", "Por Secco2112 \nVersão 2.0", opts)
mymenu3:hide()

elseif not managers.hud then
_dialog_data = { 
				title = "MENU DE MENSAGEM",
				text = "Você não pode abrir o Menu de Mensagem se não estiver em alguma missão.",
				button_list = {{ text = "OK", is_cancel_button = true }},
				id = tostring(math.random(0,0xFFFFFFFF))
			}
			end
if managers.system_menu then
	managers.system_menu:show(_dialog_data)
end