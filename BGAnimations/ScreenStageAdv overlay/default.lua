local function PickDiff()
	local Difficulty = {
		[1] = "Difficulty_Beginner",
		[2] = "Difficulty_Easy",
		[3] = "Difficulty_Medium",
		[4] = "Difficulty_Hard",
		[5] = "Difficulty_Challenge",
		[6] = "Difficulty_Edit",
	};
	return Difficulty[math.random(1,6)] or "Difficulty_Hard";
end

local function PickRndSong()
	local found = false;
	while not found do
		local RSong = SONGMAN:GetRandomSong();

		if RSong then
			local Style = GAMESTATE:GetCurrentStyle();
			local SType = 'StepsType_Dance_Single';
			local TDiff = getenv("advDiff") == "Difficulty_All" and PickDiff() or getenv("advDiff");
			local SStep;
			if Style == 'StyleType_OnePlayerTwoSides' then
				SType = 'StepsType_Dance_Double';
			end
			GAMESTATE:SetPreferredDifficulty(GAMESTATE:GetMasterPlayerNumber(),TDiff);
			local Diff = GAMESTATE:GetPreferredDifficulty(GAMESTATE:GetMasterPlayerNumber());
			if Diff then
				SStep = RSong:GetOneSteps(SType,Diff);
				if SStep then
					GAMESTATE:SetCurrentSong(RSong);
					GAMESTATE:SetPreferredSong(RSong);
					for player in ivalues(GAMESTATE:GetHumanPlayers()) do
						GAMESTATE:AddStageToPlayer(player);
						newStep = RSong:GetOneSteps(SType,GAMESTATE:GetPreferredDifficulty(player));
						GAMESTATE:SetCurrentSteps(player,newStep);
					end
					found = true;
				end
			end
		end
	end
end

-- GAMESTATE:SetTemporaryEventMode(true);

if getenv("advMode") == "Survival" and GAMESTATE:GetCurrentStage() == "Stage_1st" then
	setenv("advLives",4);
	for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
		GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):LifeSetting('LifeType_Battery');
		GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):BatteryLives(getenv("advLives"));
		GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):FailSetting('FailType_Immediate');
	end;
elseif getenv("advMode") == "Comboch" and GAMESTATE:GetCurrentStage() == "Stage_1st" then
	for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
		GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):LifeSetting('LifeType_Battery');
		GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):BatteryLives(1);
		GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):FailSetting('FailType_Immediate');
	end;
elseif getenv("advMode") == "Survival" then
	for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
		GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):BatteryLives(getenv("advLives"));
		-- SCREENMAN:SystemMessage("Life: "..getenv("advLives"));
	end;
end
PickRndSong()

return Def.ActorFrame {};