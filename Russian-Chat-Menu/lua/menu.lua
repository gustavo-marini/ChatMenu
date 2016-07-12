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
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Привет")
end

Blz = Blz or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Ну что, давайте сделаем это!")
managers.player:local_player():sound():say("p01",true,true)
end

Vlw = Vlw or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Спасибо!")
managers.player:local_player():sound():say("s05x_sin",true,true)
end

Ajuda = Ajuda or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Нужна помощь!?")
managers.player:local_player():sound():say("p45",true,true)
end

Yeah = Yeah or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Да")
managers.player:local_player():sound():say("v46",true,true)
end

Nope = Nope or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Неа")
end

Shit = Shit or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "ДЕРЬМО!")
managers.player:local_player():sound():say("g60",true,true)
end

Fuck = Fuck or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "БЛЯТЬ!")
managers.player:local_player():sound():say("g29",true,true)
end

NAmmo = NAmmo or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Мне нужны патроны!")
managers.player:local_player():sound():say("g81x_plu",true,true)
end

NBag = NBag or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Установите медицинскую сумку, пожалуйста")
managers.player:local_player():sound():say("g80x_plu",true,true)
end

NFirst = NFirst or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Установите маленькую аптечку, пожалуйста")
end

AmmoH = AmmoH or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Установил патроны здесь")
managers.player:local_player():sound():say("s01x_plu",true,true)
end

MedicH = MedicH or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Установил медицинскую сумку здесь")
managers.player:local_player():sound():say("s02x_plu",true,true)
end

FirstH = FirstH or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Установил маленькую аптечку здесь")
managers.player:local_player():sound():say("s12",true,true)
end

Shield = Shield or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Щит!")
managers.player:local_player():sound():say("f31y_any",true,true)
end

Winters = Winters or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Капитан Винтерс!")
managers.player:local_player():sound():say("cpa_a02_01",true,true)
end

Lasier = Lasier or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Тазер!")
managers.player:local_player():sound():say("f32y_any",true,true)
end

Wululu = Wululu or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Клокер!")
managers.player:local_player():sound():say("f33y_any",true,true)
end

Snipa = Snipa or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Снайпер!")
managers.player:local_player():sound():say("f34y_any",true,true)
end

Dozer = Dozer or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "БУЛЬДОЗЕР!")
managers.player:local_player():sound():say("f30y_any",true,true)
end

SkullDozer = SkullDozer or function()   
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "СКУЛДОЗЕР!")
end

--NÃO FOI TESTADO
--[[Refem = Refem or function()  
if inCustody() then
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Свяжите заложника, пожалуйста!")
else
managers.chat:_receive_message(1, "Чат меню", "Вы должны находится под стражей чтобы использовать эту команду.", Color.red)
end
end]]--

Mu = Mu or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Соляная кислота")
end

Hcl = Hcl or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Хлористый водород")
end

Cs = Cs or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Каустическая сода")
end

GrabDrill = GrabDrill or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Возьмите дрель!")
end

FixDrill = FixDrill or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Кто нибудь может починить дрель? Пожалуйста!")
managers.player:local_player():sound():say("d02x_sin",true,true)
end

Crowbar = Crowbar or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Здесь лом")
end

Keycard = Keycard or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Здесь ключ карта")
end

Shaw = Shaw or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Шоу. Мех.")
end

Downtown = Downtown or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Это Даунтаунт. Найдите сигареты.")
end

Foggy = Foggy or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Это Фогги Боттом. Водка.")
end

West = West or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Вест Енд, найдите химикаты.")
end

Georgetown = Georgetown or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Джорджтаун, коды в ракетах.")
end

Gas = Gas or function()
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Здесь канистра")
end

---------------------------------------------------------------------------------------------------------------------------------
--MENU 1

opts = {}
opts[#opts+1] = { text = "Привет", callback = Oi }
opts[#opts+1] = { text = "Ну что, давайте сделаем это!", callback = Blz }
opts[#opts+1] = { text = "Спасибо!", callback = Vlw }
opts[#opts+1] = { text = "Помогите", callback = Ajuda }
opts[#opts+1] = { text = "Да", callback = Yeah }
opts[#opts+1] = { text = "Неа", callback = Nope }
opts[#opts+1] = { text = "'ДЕРЬМО!'", callback = Shit }
opts[#opts+1] = { text = "'БЛЯТЬ!'", callback = Fuck }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Нужны патроны", callback = NAmmo }
opts[#opts+1] = { text = "Нужна медицинская сумка", callback = NBag }
opts[#opts+1] = { text = "Нужна маленькая аптечка", callback = NFirst }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Установил патроны здесь", callback = AmmoH }
opts[#opts+1] = { text = "Установил медицинскую сумку здесь", callback = MedicH }
opts[#opts+1] = { text = "Установил маленькую аптечку здесь", callback = FirstH }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Далее", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Закрыть", is_cancel_button = true }
mymenu = SimpleMenu:new("Чат меню", "Сделал: Secco2112 \nВерсия: 2.0 \nПеревел =ERH$= fallsam", opts)
if isPlaying() and inGame() and isMultiplayer() and managers.hud then
mymenu:show()

--MENU 2

opts = {}
opts[#opts+1] = { text = "Щит", callback = Shield }
opts[#opts+1] = { text = "Тазер", callback = Lasier }
opts[#opts+1] = { text = "Клокер", callback = Wululu }
opts[#opts+1] = { text = "Снайпер", callback = Snipa }
opts[#opts+1] = { text = "Бульдозер", callback = Dozer }
opts[#opts+1] = { text = "Скуллдозер", callback = SkullDozer }
opts[#opts+1] = { text = "Капитан Винтерс", callback = Winters }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Здесь ключ карта", callback = Keycard }
opts[#opts+1] = { text = "Здесь лом", callback = Crowbar }
opts[#opts+1] = { text = "Здесь канистра", callback = Gas }
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "Возьмите дрель", callback = GrabDrill }
opts[#opts+1] = { text = "Почините дрель", callback = FixDrill }
else
opts[#opts+1] = { text = "Возьмите дрель", callback = GrabDrill }
opts[#opts+1] = { text = "Почините дрель", callback = FixDrill }
opts[#opts+1] = { text = "", is_cancel_button = true }
end
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Соляная кислота", callback = Mu }
opts[#opts+1] = { text = "Хлористый водород", callback = Hcl }
opts[#opts+1] = { text = "Каустическая сода", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
end
if managers.job:current_level_id() == 'mia_1' then
opts[#opts+1] = { text = "Далее", callback = callmenu3, is_focused_button = true, }
end
opts[#opts+1] = { text = "Назад", callback = callmenu1 }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "ЗАКРЫТЬ", is_cancel_button = true }
mymenu2 = SimpleMenu:new("Чат меню", "Сделал: Secco2112 \nВерсия: 2.0 \nПеревел =ERH$= fallsam", opts)
mymenu2:hide()

--MENU 3

opts = {}
opts[#opts+1] = { text = "Шоу - Меха", callback = Shaw }
opts[#opts+1] = { text = "Даунтаун - Сигареты", callback = Downtown }
opts[#opts+1] = { text = "Фогги Боттом - Водка", callback = Foggy }
opts[#opts+1] = { text = "Вест Енд - Химикаты", callback = West }
opts[#opts+1] = { text = "Джордж Таун - Ракеты", callback = Georgetown }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Соляная кислота", callback = Mu }
opts[#opts+1] = { text = "Хлористый водород", callback = Hcl }
opts[#opts+1] = { text = "Каустическая сода", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Назад", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "ЗАКРЫТЬ", is_cancel_button = true }
mymenu3 = SimpleMenu:new("Чат меню", "Сделал: Secco2112 \nВерсия: 2.0 \nПеревел =ERH$= fallsam", opts)
mymenu3:hide()


elseif not managers.hud then
_dialog_data = { 
				title = "ЧАТ МЕНЮ",
				text = "Вы не можете открыть чат меню вне ограбления.",
				button_list = {{ text = "Хорошо", is_cancel_button = true }},
				id = tostring(math.random(0,0xFFFFFFFF))
			}
			end
if managers.system_menu then
	managers.system_menu:show(_dialog_data)
end
