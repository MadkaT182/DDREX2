local t = Def.ActorFrame {};

local Combo = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):MaxCombo());

local Marvelous = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W1"));
local Perfect = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W2"));
local Great = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W3"));
local Good = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W4"));
local Almost = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W5"));
local Ok = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetHoldNoteScores("HoldNoteScore_Held"));
local Ng = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetHoldNoteScores("HoldNoteScore_LetGo"));
local Boo = string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_Miss"));

local EXScore = (Marvelous * 3) + (Perfect * 2) + Great + (Ok * 3);
local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore();

--Marvelous--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_2;y,SCREEN_CENTER_Y-241;horizalign,right);
	OnCommand=function(self)
		self:settext(Marvelous);
	end;
};
--Perfect--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_2;y,SCREEN_CENTER_Y-220;horizalign,right);
	OnCommand=function(self)
		self:settext(Perfect);
	end;
};
--Great--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_2;y,SCREEN_CENTER_Y-199;horizalign,right);
	OnCommand=function(self)
		self:settext(Great);
	end;
};
--Good--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_2;y,SCREEN_CENTER_Y-178;horizalign,right);
	OnCommand=function(self)
		self:settext(Good);
	end;
};
--Almost--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_2;y,SCREEN_CENTER_Y-157;horizalign,right);
	OnCommand=function(self)
		self:settext(Almost);
	end;
};
--Boo--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_2;y,SCREEN_CENTER_Y-136;horizalign,right);
	OnCommand=function(self)
		self:settext(Boo);
	end;
};
--Ok--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_2;y,SCREEN_CENTER_Y-115;horizalign,right);
	OnCommand=function(self)
		self:settext(Ok);
	end;
};
--Max Combo--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_2;y,SCREEN_CENTER_Y-94;horizalign,right);
	OnCommand=function(self)
		self:settext(Combo);
	end;
};
--Point Label
t[#t+1] = LoadActor("lblpoint")..{
	InitCommand=cmd(addx,120;addy,224;);
};
--EX Score
t[#t+1] = LoadFont("ScreenEvaluation points")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y+6;addx,116;horizalign,right);
	OnCommand=function(self)
		self:settext(EXScore);
	end;
};
--Black square
t[#t+1] = Def.ActorFrame {
	Def.Quad{
		OnCommand=cmd(addx,96;addy,142;diffusecolor,Color.Black;zoomto,164,94);
	};
};
--Player label
t[#t+1] = LoadActor("pl2")..{
	InitCommand=cmd(addx,140;addy,88;);
};
--Ring
t[#t+1] = LoadActor("ring")..{
	InitCommand=cmd(addx,134;addy,144;spin);
};
--Num2
t[#t+1] = LoadActor("num2")..{
	InitCommand=cmd(addx,134;addy,144;);
};
--Score Label
t[#t+1] = LoadActor("scorelbl")..{
	InitCommand=cmd(addx,39;addy,156;);
};
--Score
t[#t+1] = LoadFont("ScreenEvaluation ScoreNumber")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y-64;addx,172;diffusecolor,color("#FDFD00");horizalign,right);
	OnCommand=function(self)
		self:settext(score);
	end;
};
return t;
