--[1. Gửi Nội Dung]		
		--Send Email
				local chude = "Email tu Fibaro"
				local noidung = "Co email tu fibaro"
				fibaro:call(2, "sendEmail", chude, noidung)
				--2 là ID user admin
		-- Send photo to Email
				fibaro:call(120, "sendPhotoToEmail", "annhandt09@gmail.com")
				--120 là ID Camera
		--Send Push
				fibaro:call(10, 'sendPush', 'Noidung tin nhan.')
				--VOi 10 la ID IOS
--[2. Virtual Device]
		--Get ID Virtual device
				local id=fibaro:getSelfId()
		--Get Label Virtual
				local selfId=fibaro:getSelfId()
				local bien=fibaro:getValue(selfId, "ui.Label1.value") or "1"
		-- Set Label Virtual Device
				local selfId=fibaro:getSelfId()
				fibaro:call(selfId, "setProperty", "ui.Label1.value", "program 1")
				--1170 lad ID của Vertual device
				--"program 1" la ten hien thi
				--Labels là label can thay doi
		--Get Icon Virtual
				local selfId=fibaro:getSelfId()
				local icon = fibaro:getValue(selfId, "deviceIcon") 
		-- Set Icon Virtual
				local selfId=fibaro:getSelfId()
				fibaro:call(selfId, "setProperty", "currentIcon", 1861)
		--Set Slider Virtual Device
				local selfId=fibaro:getSelfId()
				fibaro:call(selfId, "setProperty", "ui.Slider1.value", "45")			
--[3. Truyền Thông Qua mạng]
	--Get
			Foscam = Net.FHttp(thongsos.ip,thongsos.port) 
			Foscam:setBasicAuthentication(thongsos.user, thongsos.password) 
			bien=Foscam:GET('/cgi-bin/CGIProxy.fcgi?usr=admin&pwd=admin&cmd=getDevState')
	--Post
			HC2 = Net.FHttp("192.168.1.10") 
			HC2:setBasicAuthentication("admin", "admin") 
			response, status, errorCode = HC2:POST("/api/settings/reboot", "data=reset") 
	--TCP
			tcpSocket = Net.FTcpSocket("192.168.1.20", 8080) 
			--Send
			bytes, errorCode = tcpSocket:write('CALL');
			--Read
			state = tcpSocket:read()
	--UDP
			magicPacket = string.char(0xff, 0xff, 0xff, 0xff, 0xff, 0xff)
			macAddress = string.char(0x6c, 0xf0, 0x49, 0x1a, 0x61, 0x3a)
			for i=1, 16
			do
			  magicPacket = magicPacket .. macAddress
			end
			socket = Net.FUdpSocket()
			socket:setBroadcast(true)
			bytes, errorCode = socket:write(magicPacket, "255.255.255.255", 9)
			if errorCode == 0
			then
			  -- printing log under virtual device
			  fibaro:log("transfer OK")
			else
			  fibaro:log("transfer failed")
			end
			----------------------------------------
	function postMethod(data)
	payload = "action=create&description="..data
	local http = net.HTTPClient() 
	http:request("http://127.0.0.1:11111/api/settings/backups", { 
      options = { 
        method = 'POST', 
        headers = {}, 
        data = payload, 
        timeout = 70000
      }, 
      success = function(status)
        fibaro:debug(status)
        local result = status.data;
        if result.status ~= 1 then
          print("failed");
          print(status.data);
        end
      end,
      error = function(err) 
        print('[ERROR] ' .. err) 
      end 
    }) 
end
--[Get Fibaro]
	--Get Time
			local currentDate = os.date("%H:%M");
			--format "05:30"
	-- Trigger Variable
			--[[
			%% properties
			%% globals
			glo_tiep_tan
			--]]
			local trigger = fibaro:getSourceTrigger();
			local tenbien=trigger['name']
	-- Trigger Device
			--[[
			%% properties
			291 value
			%% globals
			--]]
			--291 la id của CB motion phat hiện người
			local trigger = fibaro:getSourceTrigger();
			local id = tonumber (trigger['deviceID']);
	Khi kịch bản ta sử dụng trigger thì nhấn start bằng tay sẽ không chạy và báo lỗi  attempt to concatenate local 'deviceId' (a nil value)
	lý do không có thiết bị Trigger trong deviceID.

