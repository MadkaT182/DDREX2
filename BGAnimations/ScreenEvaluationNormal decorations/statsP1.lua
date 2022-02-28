function GetSuffix(index)
	local Suffix = {
		["1"] = "st",
		["2"] = "nd",
		["3"] = "rd"
	};
	return Suffix[index] or "th"
end

local t = Def.ActorFrame {};

local Combo = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo());

local Marvelous = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1"));
local Perfect = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W2"));
local Great = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W3"));
local Good = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W4"));
local Almost = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W5"));
local Ok = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_Held"));
local Ng = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_LetGo"));
local Boo = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss"));

local EXScore = (Marvelous * 3) + (Perfect * 2) + Great + (Ok * 3);
local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
local pStats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);
local sPassed = pStats:GetSongsPassed();
local adp = pStats:GetActualDancePoints();
local pdp = pStats:GetCurrentPossibleDancePoints();
local perc = adp * 100 / pdp;

t[#t+1] = Def.ActorFrame{
	--Marvelous--
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-241;horizalign,right);
		OnCommand=function(self)
			self:settext(Marvelous);
		end;
	};
	--Perfect--
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-220;horizalign,right);
		OnCommand=function(self)
			self:settext(Perfect);
		end;
	};
	--Great--
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-199;horizalign,right);
		OnCommand=function(self)
			self:settext(Great);
		end;
	};
	--Good--
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-178;horizalign,right);
		OnCommand=function(self)
			self:settext(Good);
		end;
	};
	--Almost--
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-157;horizalign,right);
		OnCommand=function(self)
			self:settext(Almost);
		end;
	};
	--Boo--
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-136;horizalign,right);
		OnCommand=function(self)
			self:settext(Boo);
		end;
	};
	--Ok--
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-115;horizalign,right);
		OnCommand=function(self)
			self:settext(Ok);
		end;
	};
	--Max Combo--
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-94;horizalign,right);
		OnCommand=function(self)
			self:settext(Combo);
		end;
	};
	--Point Label
	LoadActor("lblpoint")..{
		InitCommand=cmd(x,-90;y,337;decelerate,.2;y,224);
		OffCommand=cmd(accelerate,.167;y,440);
	};
	--EX Score
	LoadFont("ScreenEvaluation points")..{
		InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y+109;x,-94;decelerate,.2;y,SCREEN_CENTER_Y+6;horizalign,right);
		OnCommand=function(self)
			self:settext(EXScore);
		end;
		OffCommand=cmd(accelerate,.167;y,SCREEN_CENTER_Y+325);
	};
	--Black square
	Def.ActorFrame {
		Def.Quad{
			OnCommand=cmd(addx,-149;addy,142;diffusecolor,Color.Black;zoomto,164,94);
			Condition=not GAMESTATE:IsCourseMode()
		};
		Def.Quad{
			OnCommand=cmd(addx,-149;addy,94;diffusecolor,Color.Black;zoomto,164,186);
			Condition=GAMESTATE:IsCourseMode()
		};
	};
	--Player label
	LoadActor("pl1")..{
		InitCommand=cmd(addx,-190;addy,88);
		Condition=not GAMESTATE:IsCourseMode()
	};
	--Course stats
	Def.ActorFrame{
		LoadActor("pl1")..{
			InitCommand=cmd(addx,-190;addy,-7);
		};
		LoadFont("ScreenEvaluation ScoreNumber")..{
			InitCommand=cmd(x,-191;y,12);
			OnCommand=function(self)
				self:settext(string.format("% 4d",sPassed));
			end;
		};
		LoadActor("suffix_"..GetSuffix(sPassed))..{
			InitCommand=cmd(x,-144;y,12);
		};
		LoadFont("ScreenEvaluation ScoreNumber")..{
			InitCommand=cmd(x,-168;y,32);
			OnCommand=function(self)
				self:settext(SecondsToHHMMSS(pStats:GetSurvivalSeconds()));
			end;
		};
		LoadActor("dp_frame")..{
			OnCommand=cmd(x,-149;y,73);
		};
		LoadActor("progress")..{
			InitCommand=cmd(x,-149;y,74);
			OnCommand=function(self)
				self:cropright((100-perc)/100);
			end;
		};
		LoadActor("pointer")..{
			InitCommand=cmd(x,-228;y,74);
			OnCommand=function(self)
				self:addx(157 * (perc/100));
			end;
		};
		LoadFont("ScreenEvaluation ScoreNumber")..{
			InitCommand=cmd(x,-150;y,59;diffuse,color("#00FE2F");zoomy,1.4);
			OnCommand=function(self)
				self:settext(string.format("% 5d",adp));
			end
		};
		LoadFont("ScreenEvaluation ScoreNumber")..{
			InitCommand=cmd(x,-151;y,87;diffuse,color("#008950"));
			OnCommand=function(self)
				self:settext(string.format("% 5d",pdp));
			end
		};
		Condition=GAMESTATE:IsCourseMode()
	};
	--Ring
	LoadActor("ring")..{
		InitCommand=cmd(addx,-186;addy,144;spin;effectmagnitude,0,0,30);
	};
	--Num1
	LoadActor("num1")..{
		InitCommand=cmd(addx,-186;addy,144;);
	};
	--Score Label
	LoadActor("scorelbl")..{
		InitCommand=cmd(addx,-203;addy,156;);
	};
	--Score
	LoadFont("ScreenEvaluation ScoreNumber")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-64;addx,-76;diffusecolor,color("#FDFD00");horizalign,right);
		OnCommand=function(self)
			self:settext(string.format("% 9d",score));
		end;
	};
};

return t;