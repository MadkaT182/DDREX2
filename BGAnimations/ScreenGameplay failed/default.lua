local t = Def.ActorFrame{};

if GAMESTATE:IsCourseMode() or getenv("advMode") == "Comboch" then
	t[#t+1] = Def.ActorFrame {
	    LoadActor("oni_fail") .. {
			StartTransitioningCommand=cmd(play);
		};
		LoadActor("door1")..{
			OnCommand=cmd(zoomx,IsUsingWideScreen() and 1.34 or 1;x,SCREEN_CENTER_X-214;y,SCREEN_CENTER_Y;zoomtoheight,SCREEN_HEIGHT;addx,-320;linear,.367;addx,IsUsingWideScreen() and 320 or 374;linear,.1;addx,-3;linear,.033;addx,3;linear,.067;addx,-3;linear,.066;addx,3);
		};
		LoadActor("door2")..{
			OnCommand=cmd(zoomx,IsUsingWideScreen() and 1.34 or 1;x,SCREEN_CENTER_X+214;y,SCREEN_CENTER_Y;zoomtoheight,SCREEN_HEIGHT;addx,320;linear,.367;addx,IsUsingWideScreen() and -320 or -374;linear,.1;addx,3;linear,.033;addx,-3;linear,.067;addx,3;linear,.066;addx,-3);
		};
		Def.Quad{
			OnCommand=cmd(diffuse,color("#000000");FullScreen;diffusealpha,0;sleep,3;linear,.367;diffusealpha,1;sleep,2.669);
		};
	};
else
	t[#t+1] = Def.ActorFrame {
	    LoadActor("regular_fail") .. {
			StartTransitioningCommand=cmd(sleep,.236;queuecommand,"Sound");
			SoundCommand=cmd(play);
		};
		LoadActor("ml")..{
			OnCommand=cmd(Center;x,SCREEN_LEFT+(SCREEN_WIDTH*.6);linear,.3;addx,SCREEN_WIDTH*1.7);
		};
		LoadActor("mr")..{
			OnCommand=cmd(Center;x,SCREEN_RIGHT-(SCREEN_WIDTH);linear,.3;addx,-SCREEN_WIDTH*1.7);
		};
		LoadActor("bg")..{
			InitCommand=cmd(ztest,true;FullScreen);
		};
		LoadActor("failed")..{
			InitCommand=cmd(ztest,true;Center;diffusealpha,0;zoom,10);
			OnCommand=cmd(diffusealpha,0;sleep,.667;diffusealpha,.2;zoom,2;accelerate,.233;zoom,.8;linear,.067;zoom,1;diffusealpha,.3);
		};
		LoadActor("failed")..{
			InitCommand=cmd(ztest,true;Center;diffusealpha,0;zoom,10);
			OnCommand=cmd(diffusealpha,0;sleep,.701;diffusealpha,.2;zoom,2;accelerate,.233;zoom,.8;linear,.067;zoom,1;diffusealpha,.3);
		};
		LoadActor("failed")..{
			InitCommand=cmd(ztest,true;Center;diffusealpha,0;zoom,10);
			OnCommand=cmd(diffusealpha,0;sleep,.734;diffusealpha,.2;zoom,2;accelerate,.233;zoom,.8;linear,.067;zoom,1;diffusealpha,.3);
		};
		LoadActor("stl")..{
			OnCommand=cmd(Center;x,SCREEN_LEFT;linear,.3;addx,SCREEN_WIDTH*1.7);
		};
		LoadActor("str")..{
			OnCommand=cmd(Center;x,SCREEN_RIGHT;linear,.3;addx,-SCREEN_WIDTH*1.7);
		};
		Def.Quad{
			OnCommand=cmd(diffuse,color("#000000");FullScreen;diffusealpha,0;sleep,3;linear,.334;diffusealpha,1;sleep,2.102);
		};
	};
end

return t