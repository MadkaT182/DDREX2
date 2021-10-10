local t = Def.ActorFrame{};

if not GAMESTATE:IsDemonstration() then
	t[#t+1] = Def.ActorFrame {
		LoadActor("ml")..{
			OnCommand=cmd(Center;x,SCREEN_LEFT+(SCREEN_WIDTH*.6);linear,1.2;addx,SCREEN_WIDTH*1.7);
		};
		LoadActor("mr")..{
			OnCommand=cmd(Center;x,SCREEN_RIGHT-(SCREEN_WIDTH);linear,1.2;addx,-SCREEN_WIDTH*1.7);
		};
		LoadActor("bg")..{
			InitCommand=cmd(ztest,true;FullScreen);
		};
		LoadActor("cleared")..{
			InitCommand=cmd(ztest,true;Center;diffusealpha,0;cropbottom,1);
			OnCommand=cmd(sleep,1.1;linear,.4;diffusealpha,1;cropbottom,0);
		};
		LoadActor("stl")..{
			OnCommand=cmd(Center;x,SCREEN_LEFT;linear,1.2;addx,SCREEN_WIDTH*1.7);
		};
		LoadActor("str")..{
			OnCommand=cmd(Center;x,SCREEN_RIGHT;linear,1.2;addx,-SCREEN_WIDTH*1.7);
		};
		Def.Quad{
			OnCommand=cmd(diffuse,color("#000000");FullScreen;diffusealpha,0;sleep,3;linear,.367;diffusealpha,1;sleep,2.8);
		};
	};
end;

return t