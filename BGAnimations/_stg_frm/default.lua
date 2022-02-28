return Def.ActorFrame{
	LoadActor("framebg");
	LoadFont("ScreenGameplay StageNumber")..{
		OnCommand=cmd(y,7;playcommand,"Update");
		UpdateCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				local stats = STATSMAN:GetCurStageStats();
				if stats then
					self:settext(stats:GetPlayerStageStats(GAMESTATE:GetMasterPlayerNumber()):GetSongsPassed() + 1);
				end
			else
				self:settext(GAMESTATE:GetCurrentStageIndex()+1);
			end
		end;
		CurrentTraiP1ChangedMessageCommand=cmd(playcommand,"Update");
		CurrentTraiP2ChangedMessageCommand=cmd(playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Update");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Update");
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Update");
	};
};