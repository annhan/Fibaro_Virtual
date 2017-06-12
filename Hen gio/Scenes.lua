--[[
%% autostart
%% properties
%% events
%% globals
--]]
function gioS()
  fibaro:call(2434, "turnOn")
  fibaro:call(1486, "pressButton", "180") --All Off
  fibaro:sleep(100)
  fibaro:call(1486, "setSlider", "178", "90")-- Volume All
  fibaro:sleep(100)
  fibaro:call(1486, "pressButton", "181") --All S1
  fibaro:sleep(100)
                        --On Vung Phat Nhat--
  fibaro:call(1486, "pressButton", "107") --On Ho Boi
  fibaro:call(1053, "pressButton", "35");
end
function gioSS()
  fibaro:call(2434, "turnOff")
end
function gioT()
  fibaro:call(2434, "turnOn")
                        fibaro:call(1486, "pressButton", "180") --All Off
                        fibaro:sleep(200)
                        fibaro:call(1486, "setSlider", "178", "90")-- Volume All
                        fibaro:sleep(200)
                        fibaro:call(1486, "pressButton", "181") --All S1
                        fibaro:sleep(200)
                        --On Vung Phat Nhat--
                        fibaro:call(2434, "pressButton", "107") --On Ho Boi
                        fibaro:call(1053, "pressButton", "48");
end
function gioST()
  fibaro:call(1636, "turnOff")
end
function gioC()
                        fibaro:call(2434, "turnOn")
                      fibaro:call(1486, "pressButton", "180") --All Off
                      fibaro:sleep(200)
                      fibaro:call(1486, "setSlider", "178", "90")-- Volume All
                      fibaro:sleep(200)
                      fibaro:call(1486, "pressButton", "181") --All S1
                      fibaro:sleep(200)
                      --On Vung Phat Nhat--
                      fibaro:call(1486, "pressButton", "107") --On Ho Boi
                      fibaro:call(1053, "pressButton", "113");
end
function gioSC()
  fibaro:call(2434, "turnOff")
end


----------------------------------------------------------------
----------Hàm Tính th?i Gian Sau------------------------
function tinhgio(giovao,thoigian)
    local H = string.sub(giovao, 1, 2) 
    local M = string.sub(giovao, 4, 5) 
    if tonumber(M) < (59-tonumber(thoigian)) then 
            M = tonumber(M) + tonumber(thoigian)
    else 	M = 00
            H=H+1
    end
    if string.len(M) < 2 then 
    		M = string.format("%s%s", '0', M) 
    end 
    local giora=string.format("%s:%s", H, M)
  	return giora
end
local sourceTrigger = fibaro:getSourceTrigger();
function tempFunc()
  -------------------------------------------
  ---------------Begin Setup Thông S? Virtual Device----------------
  --------------------------------------------
  		local vir_tom=2056
        local statusS="lblTTS"
        local statusT="lblTTT"
        local statusC="lblTTC"
  		local tS="lblBTS"
  		local tT="lblBTT"
  		local tC="lblBTC"
        local thoigianS=3
        local thoigianT=3
        local thoigianC=3
  local labelON="Ðã B?t"
  -------------------------------------
  -----------End SetUp------------------------
        local startSource = fibaro:getSourceTrigger();
        local currentDate = os.date("%H:%M");    
        local status=fibaro:getValue(vir_tom, "ui."..statusS..".value")
        if (status==labelON) then
                local PTomS=fibaro:getValue(vir_tom, "ui."..tS..".value")
                local PTom5S=tinhgio(PTomS,thoigianS)
                fibaro:debug("Sang "..PTom5S)
                if currentDate== PTomS then
      					gioS()
                elseif currentDate== PTom5S then
     					gioSS()                       
                end
        end
        status=fibaro:getValue(vir_tom, "ui."..statusT..".value")
        if (status==labelON) then
                local PTomT=fibaro:getValue(vir_tom, "ui."..tT..".value")
                local PTom5T=tinhgio(PTomT,thoigianT)
                fibaro:debug("trua "..PTom5T)
                if currentDate== PTomT then
                        gioT()
                elseif currentDate== PTom5T then
      					gioST()                        
                end
        end    
        status=fibaro:getValue(vir_tom, "ui."..statusC..".value")
        if (status==labelON) then
              local PTomC=fibaro:getValue(vir_tom, "ui."..tC..".value")  
              local PTom5C=tinhgio(PTomC,thoigianC)
              fibaro:debug("chieu "..PTom5C)
              if currentDate== PTomC then
      					gioC()
    
              elseif currentDate== PTom5C then
      					gioSC()                     
              end
		end
		setTimeout(tempFunc, 60*1000)
end
if (sourceTrigger["type"] == "autostart") then
tempFunc()
else
	local currentDate = os.date("*t");
	local startSource = fibaro:getSourceTrigger();
    if (
    startSource["type"] == "other"
    )
    then
        fibaro:debug("tay")
    end
end






