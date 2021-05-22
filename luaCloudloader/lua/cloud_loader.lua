local http = require "gamesense/http";
local login_status = false;
local first_call = true
local first_call_after_login = true;
local menu = 
{
	"RAGE","AA","lua","MISC","Config"
}
local http_api = {
["login"] = "",--login.php地址
["get_lua_num"] = "",--getluanum.php地址
["get_lua_info"] = ""--getlualist.php地址
}

local log_color = {
["r"] = 255,
["g"] = 255,
["b"] = 255
}

local lua_num = 1
local lua_load_status = {}

local lua_id = {}
local lua_name = {}
local lua_author = {}
local lua_version = {}
local lua_introduce = {}
local lua_url = {}


--创建界面
local title = ui.new_label(menu[3], "B", "------------ Lua cloud loader ------------");
local user_name_title = ui.new_label(menu[3], "B", "username:");
local user_name = ui.new_textbox(menu[3], "B", "usename:");
local user_password_title = ui.new_label(menu[3], "B", "password:")
local user_password = ui.new_textbox(menu[3], "B", "password:");


local function add_log(r,g,b,msg)

	client.color_log(r, g, b, "[LualoaderV1]"..msg)


end

local function login()

	local httpad = {["username"] = ui.get(user_name),["password"] = ui.get(user_password)} 
	http.get(tostring(http_api["login"]),{params = httpad}, function(success, response)
	add_log(log_color["r"], log_color["g"], log_color["b"],"正在登录中，请耐心等待。")
	if not success or response.status ~= 200 then
			add_log(log_color["r"], log_color["g"], log_color["b"],"HTTP请求错误 请检查服务器或重新登录Steam！")
			return;
	end
	local data = json.parse(response.body);
	if data.login == true then client.color_log(log_color["r"], log_color["g"], log_color["b"], "[LualoaderV1]欢迎回来，", ui.get(user_name),"。")else add_log(log_color["r"], log_color["g"], log_color["b"],"用户名或密码错误！") end;
	if data.banned == true then add_log(log_color["r"], log_color["g"], log_color["b"],"您的账号已被管理员封禁！")end;
		if data.login == true and data.banned==false then login_status = true add_log(log_color["r"], log_color["g"], log_color["b"],"登陆成功。")end
	
	end);

end
local login = ui.new_button(menu[3], "B", "Login", login);


local function get_lua_list()
	http.get(tostring(http_api["get_lua_num"]),function(success, response)
	
		if not success or response.status ~= 200 then
		add_log(log_color["r"], log_color["g"], log_color["b"],"获取LUA数量失败，请检查服务器是否正常。")
		return;
		end
		local data = json.parse(response.body);
		lua_num = data.lua_num
		add_log(log_color["r"], log_color["g"], log_color["b"],"LUA数量："..lua_num)
		for i=lua_num,1,-1 do
			--add_log(log_color["r"], log_color["g"], log_color["b"],"正在获取的LUA id："..i)
			local tmp_id = {["lua_id"] = i}
			http.get(tostring(http_api["get_lua_info"]),{params = tmp_id},function(success, response)
			if not success or response.status ~= 200 then
			add_log(log_color["r"], log_color["g"], log_color["b"],"获取LUA信息失败，请检查服务器是否正常。")
			return end
			local data = json.parse(response.body);
			lua_id[i] = data.lua_id
			lua_name[i] = data.lua_name
			--add_log(log_color["r"], log_color["g"], log_color["b"],"LUA name："..lua_name[i])
			-- print(lua_name[1])
			lua_author[i] = data.lua_author
			lua_version[i] = data.lua_version
			lua_introduce[i] = data.lua_introduce
			lua_url[i] = data.lua_url
			end)
		end
		
		
	
	end)
	

end

local function lua_show_info(id)
	--add_log(log_color["r"], log_color["g"], log_color["b"],lua_author[id])
	add_log(log_color["r"], log_color["g"], log_color["b"],"-----------------")
	add_log(log_color["r"], log_color["g"], log_color["b"],"LUA名称："..lua_name[id])
	add_log(log_color["r"], log_color["g"], log_color["b"],"LUA-作者："..lua_author[id])
	add_log(log_color["r"], log_color["g"], log_color["b"],"LUA-ID："..lua_id[id])
	add_log(log_color["r"], log_color["g"], log_color["b"],"LUA-版本"..lua_version[id])
	add_log(log_color["r"], log_color["g"], log_color["b"],"LUA-介绍："..lua_introduce[id])
	add_log(log_color["r"], log_color["g"], log_color["b"],"-----------------")

end

local function load_lua(id)
	local local_tmp_url = lua_url[id];
	--print(local_tmp_url)
	http.get(tostring(local_tmp_url),function(success, response)
	
		if not success or response.status ~= 200 then
		add_log(log_color["r"], log_color["g"], log_color["b"],"加载失败.")
		end
		Execute = loadstring(response.body)()
		lua_load_status[id] = true;
	end)
end

local function load_lua_list()
	add_log(log_color["r"], log_color["g"], log_color["b"],"-----------------")
		add_log(log_color["r"], log_color["g"], log_color["b"],"已加载的lua：")
	for i = lua_num,1,-1 do
		if(lua_load_status[i] == true) then add_log(log_color["r"], log_color["g"], log_color["b"],lua_name[i])end
	end
	add_log(log_color["r"], log_color["g"], log_color["b"],"-----------------")
end

local function main()
	if first_call == true then
 
		add_log(log_color["r"], log_color["g"], log_color["b"],"lua已加载,请进行登录.");
		first_call = false;
	end
	
	if first_call_after_login == true then
		if login_status == false then return end
		get_lua_list()
		add_log(log_color["r"], log_color["g"], log_color["b"],"正在获取lua列表。")
		
		first_call_after_login = false
		client.delay_call(5, function()
		local lua_list = ui.new_combobox(menu[3], "B", "LUA list", lua_name)
		local lua_info = ui.new_button(menu[3], "B", "Show info", function()
		local name_now = ui.get(lua_list)
		local id;
			for i = lua_num,1,-1 do
				if lua_name[i] == name_now then  id = i  end;
			end
		lua_show_info(id)
		end);
		
		local lua_load = ui.new_button(menu[3], "B", " load lua",function()
			local name_now = ui.get(lua_list)
			local id;
			for i = lua_num,1,-1 do
				if lua_name[i] == name_now then  id = i  end;
			end
			load_lua(id)
		
		end);
		
		local lua_load_list = ui.new_button(menu[3], "B", "load lua list",load_lua_list)
		
		ui.set_visible(user_name_title, false)
		ui.set_visible(user_name, false)
		ui.set_visible(user_password_title, false)
		ui.set_visible(user_password, false)
		ui.set_visible(login, false)
		add_log(log_color["r"], log_color["g"], log_color["b"],"列表初始化完成！")
		end)
		
	end
		
 
 
end
client.set_event_callback("paint_ui", main)

