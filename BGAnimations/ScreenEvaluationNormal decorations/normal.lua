local t = Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=cmd(y,-101;decelerate,.267;y,0);
		OffCommand=cmd(sleep,.167;accelerate,.167;y,-101);
		LoadActor("songbanner")..{
			OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+48;zoomtowidth,190;zoomtoheight,59;);
		};
		LoadActor("top")..{
			OnCommand=cmd(x,SCREEN_CENTER_X;addy,52);
		};
		LoadActor("grade");
	};
};

--Stats frame
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(y,-136;decelerate,.267;y,0);
	OffCommand=cmd(sleep,.2;accelerate,.166;y,-136);
	Def.Quad{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,258;diffusecolor,color("#000000");zoomto,SCREEN_WIDTH,242;blend,'BlendMode_NoEffect';zwrite,true;sleep,.267;linear,.234;croptop,1);
		OffCommand=cmd(linear,.234;croptop,0);
	};
	Def.Quad{
		OnCommand=cmd(ztest,true;Center;diffusecolor,color("#161616");diffusealpha,.5;zoomto,604,222;addy,7);
	};
	LoadActor("hbar")..{
		OnCommand=cmd(Center;addy,-108);
	};
	LoadActor("JudgeRows")..{
		OnCommand=cmd(ztest,true;Center;addy,-9);
	};
	Def.Quad{
		OnCommand=cmd(ztest,true;Center;diffusecolor,color("#533457");zoomto,544,42;y,SCREEN_CENTER_Y+260;decelerate,.2;y,SCREEN_CENTER_Y+157);
		OffCommand=cmd(sleep,.067;accelerate,.167;y,SCREEN_CENTER_Y+398);
	};
	LoadActor("statsP1")..{
		OnCommand=cmd(ztest,true;player,PLAYER_1;x,SCREEN_CENTER_X-64;y,SCREEN_CENTER_Y-80);
	};
	LoadActor("statsP2")..{
		OnCommand=cmd(ztest,true;player,PLAYER_2;x,SCREEN_CENTER_X+117;y,SCREEN_CENTER_Y-80);
	};
	LoadActor("hbar")..{
		OnCommand=cmd(Center;addy,-108;sleep,.267;linear,.234;y,SCREEN_CENTER_Y+123);
		OffCommand=cmd(linear,.234;y,SCREEN_CENTER_Y-108);
	};
};

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
t[#t+1] = Def.ActorFrame {
	LoadActor("NewRecord")..{
		OnCommand=cmd(player,PLAYER_1;glowshift;effectcolor1,1,1,0,.5;effectcolor2,1,1,0,0;effectperiod,.5;x,SCREEN_LEFT-212;y,SCREEN_CENTER_Y+113;sleep,.868;decelerate,.2;x,SCREEN_CENTER_X-212);
		OffCommand=cmd(visible,false);
		Condition=NewRec1 == 1
	};
	LoadActor("NewRecord")..{
		OnCommand=cmd(player,PLAYER_2;glowshift;effectcolor1,1,1,0,.5;effectcolor2,1,1,0,0;effectperiod,.5;x,SCREEN_RIGHT+212;y,SCREEN_CENTER_Y+113;sleep,.868;decelerate,.2;x,SCREEN_CENTER_X+113);
		OffCommand=cmd(visible,false);
		Condition=NewRec2 == 1
	};
};

--Footer
t[#t+1] = LoadActor("../_footer/resultn")..{
	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM+34;sleep,1.568;decelerate,.134;y,SCREEN_BOTTOM-34);
	OffCommand=cmd(accelerate,.1;y,SCREEN_BOTTOM+34);
};

return t;