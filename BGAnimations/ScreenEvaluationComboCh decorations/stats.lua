function GetSuffix(index)
	local Suffix = {
		[1] = "st",
		[2] = "nd",
		[3] = "rd"
	};
	return Suffix[index] or "th"
end

local t = Def.ActorFrame {};

local Combo = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo());

local Marvelous = string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1"));
local Perfect = string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W2"));
local Great = string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W3"));
local Good = string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W4"));
local Almost = string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W5"));
local Ok = string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_Held"));
local Ng = string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_LetGo"));
local Boo = string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss"));

local EXScore = (Marvelous * 3) + (Perfect * 2) + Great + (Ok * 3);
local pStats = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1);
local sPassed = GAMESTATE:GetCurrentStageIndex();

t[#t+1] = Def.ActorFrame{
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-241;horizalign,right);
		OnCommand=function(self)
			self:settext(Marvelous);
		end;
	};
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-220;horizalign,right);
		OnCommand=function(self)
			self:settext(Perfect);
		end;
	};
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-199;horizalign,right);
		OnCommand=function(self)
			self:settext(Great);
		end;
	};
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-178;horizalign,right);
		OnCommand=function(self)
			self:settext(Good);
		end;
	};
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-157;horizalign,right);
		OnCommand=function(self)
			self:settext(Almost);
		end;
	};
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-136;horizalign,right);
		OnCommand=function(self)
			self:settext(Boo);
		end;
	};
	LoadFont("ScreenEvaluation judge")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-115;horizalign,right);
		OnCommand=function(self)
			self:settext(Ok);
		end;
	};
	LoadActor("lblpoint")..{
		InitCommand=cmd(x,-281;y,337;decelerate,.2;y,224);
		OffCommand=cmd(accelerate,.167;y,440);
	};
	LoadFont("ScreenEvaluation points")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y+109;x,-286;decelerate,.2;y,SCREEN_CENTER_Y+6;horizalign,right);
		OnCommand=function(self)
			self:settext(string.format("% 5d",EXScore));
		end;
		OffCommand=cmd(accelerate,.167;y,SCREEN_CENTER_Y+325);
	};
	Def.ActorFrame {
		OnCommand=cmd(x,-231;y,76);
		Def.Quad{
			OnCommand=cmd(diffuse,color("#497748");zoomto,316,142);
		};
		Def.Quad{
			OnCommand=cmd(diffusecolor,Color.Black;zoomto,310,136);
		};
		LoadFont("ScreenEvaluation ScoreNumber")..{
			InitCommand=cmd(x,1;y,-39);
			OnCommand=function(self)
				self:settext(string.format("% 4d",sPassed));
			end;
		};
		LoadActor("suffix_"..GetSuffix(sPassed))..{
			InitCommand=cmd(x,47;y,-39);
		};
		LoadFont("EvaluationSurvival Time")..{
			InitCommand=cmd(x,0;y,24);
			OnCommand=function(self)
				self:settext(Combo);
			end;
		};
	};
};

return t;