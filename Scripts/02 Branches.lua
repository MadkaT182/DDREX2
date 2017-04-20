function SMOLogin()
	if IsNetConnected() then
		return "ScreenNetLogin";
	else
		return "ScreenNetConnect";
	end;
end