--[Switch]
	--Get value
		fibaro:getValue(id, "value")
		fibaro:getValue(id, "userDescription")
	--Set Value
		fibaro:call(id, "turnOn")
		fibaro:call(id, "turnOff")
