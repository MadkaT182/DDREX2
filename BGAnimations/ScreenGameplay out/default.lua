local travelDist = SCREEN_WIDTH*1.5;

local LeftToRight = Def.ActorFrame{
	LoadActor("LeftToRight");
	Def.Quad{
		InitCommand=cmd(halign,1;addx,-64);
	};
};

local RightToLeft = Def.ActorFrame{
	LoadActor("RightToLeft");
	Def.Quad{
		InitCommand=cmd(halign,0;addx,64);
	};
};

local t = Def.ActorFrame{};

if not GAMESTATE:IsDemonstration() then
	t[#t+1] = Def.ActorFrame {
		LoadActor("bg")..{
			InitCommand=cmd(Center;FullScreen;);
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

		-- -- 8 right -> left
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

		LoadActor("cleared")..{
		InitCommand=cmd(Center;diffusealpha,0;cropbottom,1;);
		OnCommand=cmd(sleep,1;linear,0.8;diffusealpha,1;cropbottom,0;sleep,2.0;linear,0.5;diffusealpha,0);
		};
	};
end;
return t