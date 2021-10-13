local t = Def.ActorFrame {};

local Space = '    ';
local Combo = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo(), -4);

local Marvelous = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1"), -4);
local Perfect = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W2"), -4);
local Great = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W3"), -4);
local Good = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W4"), -4);
local Almost = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W5"), -4);
local Ok = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_Held"), -4);
local Ng = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_LetGo"), -4);
local Boo = string.sub(Space..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss"), -4);

local EXScore = (Marvelous * 3) + (Perfect * 2) + Great + (Ok * 3);
local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();

--Marvelous--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-241;horizalign,right);
	OnCommand=function(self)
		self:settextf(Marvelous);
	end;
};
--Perfect--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-220;horizalign,right);
	OnCommand=function(self)
		self:settextf(Perfect);
	end;
};
--Great--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-199;horizalign,right);
	OnCommand=function(self)
		self:settextf(Great);
	end;
};
--Good--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-178;horizalign,right);
	OnCommand=function(self)
		self:settextf(Good);
	end;
};
--Almost--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-157;horizalign,right);
	OnCommand=function(self)
		self:settextf(Almost);
	end;
};
--Boo--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-136;horizalign,right);
	OnCommand=function(self)
		self:settextf(Boo);
	end;
};
--Ok--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-115;horizalign,right);
	OnCommand=function(self)
		self:settextf(Ok);
	end;
};
--Max Combo--
t[#t+1] = LoadFont("ScreenEvaluation judge")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y-94;horizalign,right);
	OnCommand=function(self)
		self:settextf(Combo);
	end;
};
--Point Label
t[#t+1] = LoadActor("lblpoint")..{
	InitCommand=cmd(x,-90;y,337;decelerate,.2;y,224);
	OffCommand=cmd(accelerate,.167;y,440);
};
--EX Score
t[#t+1] = LoadFont("ScreenEvaluation points")..{
	InitCommand=cmd(player,PLAYER_1;y,SCREEN_CENTER_Y+109;x,-94;decelerate,.2;y,SCREEN_CENTER_Y+6;horizalign,right);
	OnCommand=function(self)
		self:settextf(EXScore);
	end;
	OffCommand=cmd(accelerate,.167;y,SCREEN_CENTER_Y+325);
};
--Black square
t[#t+1] = Def.ActorFrame {
	Def.Quad{
		OnCommand=cmd(addx,-149;addy,142;diffusecolor,Color.Black;zoomto,164,94);
	};
};
--Player label
t[#t+1] = LoadActor("pl1")..{
	InitCommand=cmd(addx,-190;addy,88;);
};
--Ring
t[#t+1] = LoadActor("ring")..{
	InitCommand=cmd(addx,-186;addy,144;spin;effectmagnitude,0,0,30);
};
--Num1
t[#t+1] = LoadActor("num1")..{
	InitCommand=cmd(addx,-186;addy,144;);
};
--Score Label
t[#t+1] = LoadActor("scorelbl")..{
	InitCommand=cmd(addx,-203;addy,156;);
};
--Score
t[#t+1] = LoadFont("ScreenEvaluation ScoreNumber")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y-64;addx,-76;diffusecolor,color("#FDFD00");horizalign,right);
	OnCommand=function(self)
		self:settextf(score);
	end;
};
return t;
