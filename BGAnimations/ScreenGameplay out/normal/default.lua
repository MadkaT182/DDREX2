local travelDist = SCREEN_WIDTH*1.5;

local LeftToRight = Def.ActorFrame{
	LoadActor("LeftToRight");
	Def.Quad{
		InitCommand=cmd(halign,1;zoomto,1088,32;diffuse,color("0,0,0,1");addx,-64);
	};
};

local RightToLeft = Def.ActorFrame{
	LoadActor("RightToLeft");
	Def.Quad{
		InitCommand=cmd(halign,0;zoomto,SCREEN_WIDTH*1.9,32;diffuse,color("0,0,0,1");addx,64);
	};
};

local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,1;linear,0.3;diffusealpha,1);
	};

	-- 7 left -> right
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y-192);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y-128);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y-64);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y+64);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y+128);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y+192);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};

	-- 8 right -> left
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+64;y,SCREEN_CENTER_Y-224);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+128;y,SCREEN_CENTER_Y-160);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+192;y,SCREEN_CENTER_Y-96);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+256;y,SCREEN_CENTER_Y-32);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+256;y,SCREEN_CENTER_Y+32);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+192;y,SCREEN_CENTER_Y+96);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+128;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+64;y,SCREEN_CENTER_Y+224);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
};

local clearMessageNormal = LoadActor("cleared")..{
	InitCommand=cmd(Center;diffusealpha,0;cropbottom,1;);
	OnCommand=cmd(sleep,1;linear,0.8;diffusealpha,1;cropbottom,0;sleep,2.0;linear,0.5;diffusealpha,0);
};

if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
	-- rave clear depends on who won (if anyone)
	local resultType = ""
	if GAMESTATE:IsWinner(PLAYER_1) then resultType = "winP1"
	elseif GAMESTATE:IsWinner(PLAYER_2) then resultType = "winP2"
	else resultType = "draw"
	end
	t[#t+1] = LoadActor("_rave "..resultType)..{
		Name="RaveResultMessage";
		InitCommand=cmd(Center;diffusealpha,0;cropbottom,1;);
		OnCommand=cmd(sleep,1;linear,0.8;diffusealpha,1;cropbottom,0;sleep,2.0;linear,0.5;diffusealpha,0);
	};
elseif GAMESTATE:IsCourseMode() then
	t[#t+1] = clearMessageNormal
else
	-- normal mode; hide if extra stage achieved
	t[#t+1] = clearMessageNormal..{
		StartTransitioningCommand=cmd(visible,GAMESTATE:GetEarnedExtraStage() == 'EarnedExtraStage_No');
	}
end

return t