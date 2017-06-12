--[For ]
	local ipslaver={"192.168.99.11","192.168.99.12"}
	for var=1,#ipslaver do
		fibaro:debug(ipslaver[var])
	end
--[Repeat]
		thoigiancho=200
    	repeat 
            fibaro:sleep(1000); 
            thoigiancho=thoigiancho-1;
        until (thoigiancho<1)
--[Funtion]
	function trong(bien1)
		local trave=tonumber(bien1)+11
		return trave
    end
	decodechedo = function(val)
		if val=='0' then
			return "ON"
		else
			return "OFF"
		end
	end
--Json
	local DeviceTable = json.decode(fibaro:getGlobalValue(tenbien))
	for name,thongsos in pairs(DeviceTable) do
	  fibaro:debug("tên: "..name..", "..thongsos.motion..", "..thongsos.ir)
	  camera_motion=thongsos.motion
	  camera_ir=thongsos.ir
	end
--String
	if string.find(sdt, "4")~=nil --Tìm chuỗi trong chuỗi
	end
	--Xóa kí tự cuối
	newora=string.reverse(newora) --  Đảo Ngược Chuỗi
	local sotu=string.len(newora) --Độ Dài Chuỗi
	newora=string.sub(newora, -(sotu-1)) --Bỏ Bớt kí tu chuoi
	--Tách kí tự
	local newora = "05:30"
	local H = string.sub(newora, 1, 2)  --Tách Lấy 05
	local M = string.sub(newora, 4, 5) -- Tách lấy 30
	--Gán Vô
	M = string.format("%s%s", '0', M) --M=3 sau hàm M=03
	H="02"
	newora = string.format("%s:%s", H, M)  --newora=02:03
	--Lấy Kí Tự trong chuỗi
	led0=<led3>25</led3>
	bien=tostring(led0:match("<led3>(.+)</led3>")or " ") --bien=25
	-- Thay the
	str="banana a"
	str = string.gsub (str, " ", "+"); --Thay the khoảng trắng bằng dấu + , str="banana+a"
	string.gsub("Hello banana", "banana", "Lua user")--Hello Lua user  1
	string.gsub("banana", "(an)", "%1-")    --ban-an-a        2
	string.gsub("banana", "a(n)", "a(%1)")  -- ba(n)a(n)a      2
	string.gsub("banana", "(a)(n)", "%2%1") -- reverse any "an"s bnanaa  2
	string.gsub("Hello Lua user", "(%w+)", print)  -- print any words found
	Hello
	Lua
	user
	string.gsub("banana", "(a)", string.upper)     -- bAnAnA  3
    string.gsub("banana", "(a)(n)", function(a,b) return b..a end) -- bnanaa  2


	
	
