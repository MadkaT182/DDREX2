local t = Def.ActorFrame{};

if GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.ActorFrame {
	    LoadActor("_door_close") .. {
			StartTransitioningCommand=cmd(play);
		};
		LoadActor("door1")..{
			OnCommand=cmd(zoomx,1.34;x,SCREEN_CENTER_X-214;y,SCREEN_CENTER_Y;zoomtoheight,SCREEN_HEIGHT;addx,-320;sleep,0.000;sleep,0;linear,0.1;addx,320;sleep,1.75;sleep,3.4;);
		};
		LoadActor("door2")..{
			OnCommand=cmd(zoomx,1.34;x,SCREEN_CENTER_X+214;y,SCREEN_CENTER_Y;zoomtoheight,SCREEN_HEIGHT;addx,320;sleep,0.000;sleep,0;linear,0.1;addx,-320;sleep,1.75;sleep,3.4;);
		};

	};
else
	t[#t+1] = Def.ActorFrame {
		LoadActor("ml")..{
			OnCommand=cmd(Center;x,SCREEN_LEFT+(SCREEN_WIDTH*.6);linear,.4;addx,SCREEN_WIDTH*1.7);
		};
		LoadActor("mr")..{
			OnCommand=cmd(Center;x,SCREEN_RIGHT-(SCREEN_WIDTH);linear,.4;addx,-SCREEN_WIDTH*1.7);
		};
		LoadActor("bg")..{
			InitCommand=cmd(ztest,true;FullScreen);
		};
		LoadActor("failed")..{
			InitCommand=cmd(ztest,true;Center;diffusealpha,0;zoom,10);
			OnCommand=cmd(sleep,.7;accelerate,.283;diffusealpha,.6;zoom,.8;linear,.134;zoom,1;diffusealpha,.5;sleep,5.272);
		};
		LoadActor("failed")..{
			InitCommand=cmd(ztest,true;Center;diffusealpha,0;zoom,10);
			OnCommand=cmd(sleep,.8;accelerate,.283;diffusealpha,.6;zoom,.8;linear,.134;zoom,1;diffusealpha,.5);
		};
		LoadActor("stl")..{
			OnCommand=cmd(Center;x,SCREEN_LEFT;linear,.4;addx,SCREEN_WIDTH*1.7);
		};
		LoadActor("str")..{
			OnCommand=cmd(Center;x,SCREEN_RIGHT;linear,.4;addx,-SCREEN_WIDTH*1.7);
		};
		Def.Quad{
			OnCommand=cmd(diffuse,color("#000000");FullScreen;diffusealpha,0;sleep,3;linear,.334;diffusealpha,1);
		};
	};
end

return t