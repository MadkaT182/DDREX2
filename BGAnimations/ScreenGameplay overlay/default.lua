local function Update(self)
	if getenv("advMode") == "Survival" then
		self:GetChild("TimeAlive"):settext(SecondsToMMSSMsMs(STATSMAN:GetCurStageStats():GetGameplaySeconds()+STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(GAMESTATE:GetMasterPlayerNumber()):GetSurvivalSeconds()));
	end
end

local t = Def.ActorFrame{
	LoadFont("Survival time")..{
		Name="TimeAlive";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+59);
		Condition=getenv("advMode") == "Survival";
	};
};

t.InitCommand=cmd(SetUpdateFunction,Update);

return t;