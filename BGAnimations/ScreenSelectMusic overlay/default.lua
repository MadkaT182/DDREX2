local function Radar()
	local function set(self,player)
		local Selection = GAMESTATE:GetCurrentSteps(player) or GAMESTATE:GetCurrentTrail(player)
		local Song = GAMESTATE:GetCurrentSong();
		if not Selection or not Song then
			self:SetEmpty( player );
			return
		end
		self:SetFromRadarValues( player, Selection:GetRadarValues(player) );
	end

	local t = Def.GrooveRadar {
		OnCommand=cmd();
		OffCommand=cmd();
		CurrentStepsP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
		CurrentTrailP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentTrailP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
	};

	return t;
end

return Def.ActorFrame {
	LoadActor(THEME:GetPathG("","_footer"));
	LoadActor(THEME:GetPathG("Banner","overlay"))..{
		OnCommand=cmd(x,THEME:GetMetric("ScreenSelectMusic", "BannerX");y,THEME:GetMetric("ScreenSelectMusic", "BannerY"));
	};
	LoadActor(THEME:GetPathG("Common","wheel/banner"))..{
		OnCommand=cmd(x,SCREEN_LEFT+200;y,SCREEN_BOTTOM-221);
	};
	Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_LEFT+289;y,SCREEN_BOTTOM-76);
		LoadActor(THEME:GetPathG("Common","wheel/radar_frame"));
		Radar()..{
			BeginCommand=cmd(x,-4;y,5;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
		};
		Def.BPMDisplay {
			File=THEME:GetPathF("BPMDisplay", "bpm");
			Name="BPMDisplay";
			InitCommand=cmd(x,90;y,55;horizalign,right);
			OffCommand=cmd(diffusealpha,0);
			SetCommand=function(self) self:SetFromGameState() end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		};
	};
	LoadActor("SortDisplay")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+1;y,-154);
	};
};