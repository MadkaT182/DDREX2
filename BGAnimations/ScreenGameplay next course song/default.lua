local t = Def.ActorFrame{};

if not GAMESTATE:IsCourseMode() then return t; end;

t[#t+1] = Def.ActorFrame{
	LoadActor("ml")..{
		StartCommand=cmd(Center;x,SCREEN_LEFT+(SCREEN_WIDTH*.6);linear,.366;addx,SCREEN_WIDTH*1.7);
	};
	LoadActor("mr")..{
		StartCommand=cmd(Center;x,SCREEN_RIGHT-(SCREEN_WIDTH);linear,.366;addx,-SCREEN_WIDTH*1.7);
	};
	Def.Quad{
		InitCommand=cmd(ztest,true;diffuse,color("#000000");FullScreen);
		StartCommand=cmd(diffusealpha,1);
		FinishCommand=cmd(diffusealpha,0);
	};
	Def.Banner {
		InitCommand=cmd(ztest,true;Center);
		BeforeLoadingNextCourseSongMessageCommand=function(self) self:LoadFromSong( SCREENMAN:GetTopScreen():GetNextCourseSong() ) end;
		ChangeCourseSongInMessageCommand=cmd(scaletoclipped,512,160);
		StartCommand=cmd(diffusealpha,1;sleep,2.166);
		FinishCommand=cmd(linear,.134;diffusealpha,0);
	};
	LoadActor("stl")..{
		StartCommand=cmd(Center;x,SCREEN_LEFT;linear,.366;addx,SCREEN_WIDTH*1.7);
	};
	LoadActor("str")..{
		StartCommand=cmd(Center;x,SCREEN_RIGHT;linear,.366;addx,-SCREEN_WIDTH*1.7);
	};
	Def.Quad{
		InitCommand=cmd(diffuse,color("#000000");FullScreen);
		StartCommand=cmd(diffusealpha,0);
		FinishCommand=cmd(diffusealpha,1;linear,1.4;diffusealpha,0);
	};
};

return t;