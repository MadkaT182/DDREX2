local t = Def.ActorFrame {
	LoadActor("songbanner")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+48;zoomtowidth,190;zoomtoheight,59;);
	};
	LoadActor("top")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;addy,52);
		OffCommand=cmd();
	};
	--Stats frame
	Def.Quad{
		OnCommand=cmd(Center;diffusecolor,color("#161616");diffusealpha,.5;zoomto,604,222;addy,7);
	};
	LoadActor("hbar")..{
		OnCommand=cmd(Center;addy,-108);
		OffCommand=cmd();
	};
	LoadActor("hbar")..{
		OnCommand=cmd(Center;addy,123);
		OffCommand=cmd();
	};
	LoadActor("JudgeRows")..{
		OnCommand=cmd(Center;addy,-9);
		OffCommand=cmd();
	};
};

--Grade
t[#t+1] = LoadActor("grade")..{
	OnCommand=cmd();
	OffCommand=cmd();
};

--Points Frame
t[#t+1] = Def.ActorFrame {
	Def.Quad{
		OnCommand=cmd(Center;diffusecolor,color("#533457");zoomto,544,42;addy,157);
	};
};

if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	--Statsp1
	t[#t+1] = LoadActor("statsP1")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-64;y,SCREEN_CENTER_Y-80)
	};
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
	--Statsp2
	t[#t+1] = LoadActor("statsP2")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+117;y,SCREEN_CENTER_Y-80)
	};
end;


--New record definition
if (STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPersonalHighScoreIndex() == 0) then
	NewRec1 = 1
end

if (STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetPersonalHighScoreIndex() == 0) then
	NewRec2 = 1
end

if (STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetMachineHighScoreIndex() == 0) then
	NewRec1 = 1
end

if (STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetMachineHighScoreIndex() == 0) then
	NewRec2 = 1
end

--New record Sounds and Graphic
if ((NewRec1 == 1) and (GAMESTATE:IsHumanPlayer(PLAYER_1))) then

t[#t+1] = Def.ActorFrame {

	LoadActor("NewRecord")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-212;y,SCREEN_CENTER_Y+113;diffusealpha,0;zoom,1;draworder,1;sleep,2.416;linear,0.15;diffusealpha,1;zoom,1.15;sleep,0.5;linear,0.15;diffusealpha,1;zoom,1);
		OffCommand=cmd(linear,0.3;zoomy,0);
	};
	-- LoadActor("RecSound")..{
	-- 	OnCommand=cmd(play);
	-- };
}
end

if ((NewRec2 == 1) and (GAMESTATE:IsHumanPlayer(PLAYER_2))) then

t[#t+1] = Def.ActorFrame {

	LoadActor("NewRecord")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+239;y,SCREEN_CENTER_Y+113;diffusealpha,0;zoom,1;draworder,1;sleep,2.416;linear,0.15;diffusealpha,1;zoom,1.15;sleep,0.5;linear,0.15;diffusealpha,1;zoom,1);
		OffCommand=cmd(linear,0.3;zoomy,0);
	};
	-- LoadActor("RecSound")..{
	-- 	OnCommand=cmd(play);
	-- };
}
end

return t;