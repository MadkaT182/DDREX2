local CustomDifficultyToColor = {
	Difficulty_Beginner	= "#60BDE2",
	Difficulty_Easy		= "#F8F800",
	Difficulty_Medium		= "#E10687",
	Difficulty_Hard		= "#00FD98",
	Difficulty_Challenge	= "#C566FC",
	Difficulty_Edit		= "#E4E2E5",
};

return Def.ActorFrame {
	Def.ActorFrame{
		LoadActor("../Common advanced/adv_base");
		LoadActor("../Common advanced/"..getenv("advMode"));
		OnCommand=cmd(x,SCREEN_CENTER_X-47;y,27);
	};
	LoadActor("meterlabel")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+132;y,20);
	};
	LoadActor(GAMESTATE:GetPlayMode() == "PlayMode_Oni" and "oni" or "nonstop")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+240;y,20);
	};
	LoadActor("Frame")..{
		OnCommand=cmd(x,SCREEN_LEFT+185;y,SCREEN_BOTTOM-208);
	};
	Def.CourseContentsList{
		MaxSongs=30;
		NumItemsToDraw=8;

		OnCommand=cmd(x,SCREEN_CENTER_X+194;y,SCREEN_CENTER_Y+6);

		SetCommand=function(self)
			self:SetFromGameState();
			self:SetCurrentAndDestinationItem(5);
			self:SetPauseCountdownSeconds(1);
			self:SetSecondsPauseBetweenItems(0);
			self:SetLoop(true);
			self:SetMask(280,0);
		end;
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");

		Display=Def.ActorFrame{
			InitCommand=cmd(x,0;setsize,280,46);
			Def.Sprite{
				InitCommand=cmd(diffusealpha,.4);
				SetSongCommand=function(self, params)
					self:Load(THEME:GetPathG("MusicWheelItem","Course NormalPart"));
					(cmd(finishtweening;sleep,.125*params.Number;linear,0.13))(self);
				end;
			};
			Def.Sprite{
				InitCommand=cmd(x,-136);
				SetSongCommand=function(self, params)
					self:Load(THEME:GetPathG("Course","Index"));
					(cmd(finishtweening;sleep,.125*params.Number;linear,0.13))(self);
				end;
			};
			LoadFont("MusicWheelItem Course")..{
				InitCommand=cmd(horizalign,left;maxwidth,223);
				SetSongCommand=function(self,params)
					if params.Song then
						self:settext(params.Song:GetDisplayFullTitle());
					end;
					self:x(-110);
					self:y(1);
					(cmd(finishtweening;sleep,.125*params.Number;))(self);
				end;
			};
			--Dummy indicators
			LoadFont("course meter")..{
				Text="0000000000";
				InitCommand=cmd(horizalign,left;x,-115;y,14;diffusealpha,.5);
			};
			--Normal
			LoadFont("course meter")..{
				Text="";
				InitCommand=cmd(horizalign,left;x,-115;y,14);
				SetSongCommand=function(self,params)
					local diff = params.Difficulty;
					if math.floor(params.Meter) < 11 then
						self:settext(string.rep("0",params.Meter));
					else
						self:settext(string.rep("0",10));
					end
					self:diffuse(color(CustomDifficultyToColor[diff]));
				end;
			};
			--Hard
			LoadFont("course meter")..{
				Text="";
				InitCommand=cmd(horizalign,left;x,-115;y,14);
				SetSongCommand=function(self,params)
					local diff = params.Difficulty;
					if math.floor(params.Meter) < 21 then
						self:settext(string.rep("0",math.floor(params.Meter)-10));
					else
						self:settext(string.rep("0",10));
					end
					self:diffuse(color("#FF0000"));
				end;
			};
			LoadFont("Courselist index")..{
				InitCommand=cmd(maxwidth,28);
				SetSongCommand=function(self,params)
					if params.Song then
						self:settext(string.format("% 2d",params.Number));
					end
					self:x(-135);
				end
			};
		};

	};
};