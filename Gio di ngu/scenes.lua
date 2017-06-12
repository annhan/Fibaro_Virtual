--[[
%% autostart
%% properties
%% globals
--]]
local motion={1870,1824,308}
local global="TimeSleep"
--##############################
function dingu()
  		fibaro:call(40, "turnOn");
      	fibaro:call(1880, "pressButton", "6")
end

--End Funtion--------------
--#########################
if (fibaro:countScenes() > 1) then
  fibaro:abort()
end
local sourceTrigger = fibaro:getSourceTrigger();
function tempFunc()
	local bien=fibaro:getGlobal(global)
	fibaro:debug(bien)
	local H = string.sub(bien, 1, 2) 
	local M = string.sub(bien, 4, 5)
 	newora = string.format("%s:%s", H, M) 
	fibaro:debug(newora)
	local currentDate = os.date("*t");
	local startSource = fibaro:getSourceTrigger();
	if (
 	( ((currentDate.wday == 1 or currentDate.wday == 2 or currentDate.wday == 3 or currentDate.wday == 4 or currentDate.wday == 5 or currentDate.wday == 6 or currentDate.wday == 7) and string.format("%02d", currentDate.hour) .. ":" .. string.format("%02d", currentDate.min) == newora) )
	)
	then
    	dem=0
    	for var=1,#motion do
        	if tonumber(fibaro:getValue(motion[var], "value"))>0 then
            	dem=dem+1
       		end
    	end
    	if dem>0 then
      		if tonumber(M) < 55 then 
				M = tonumber(M) + 5 
			else 	
  				M = 0 
  				if tonumber(H) < 23 then 
					H = tonumber(H) + 1 
				else H = 0 
				end 
			end
			if string.len(H) < 2 then 
				H = string.format("%s%s", '0', H) 
			end
			if string.len(M) < 2 then 
  				M = string.format("%s%s", '0', M) 
			end
			newora = string.format("%s:%s", H, M) 
			fibaro:setGlobal(global,newora )
      		fibaro:debug("hien chua co ai ngu")
      		dem=0
   		else
      		fibaro:debug("da den gio di ngu")
      		dingu()
   		end
	end
	setTimeout(tempFunc, 60*1000)
end
if (sourceTrigger["type"] == "autostart") then
	tempFunc()
else
	local currentDate = os.date("*t");
	local startSource = fibaro:getSourceTrigger();
	if (startSource["type"] == "other")then
		dingu()
	end
end