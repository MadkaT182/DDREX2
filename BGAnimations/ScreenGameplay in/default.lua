return Def.ActorFrame {
	OnCommand=cmd(sleep,2;diffusealpha,0);
	LoadActor("ml")..{
		OnCommand=cmd(Center;x,SCREEN_LEFT-SCREEN_WIDTH*1.4;linear,.634;addx,SCREEN_WIDTH*1.7);
	};
	LoadActor("mr")..{
		OnCommand=cmd(Center;x,SCREEN_RIGHT+(SCREEN_WIDTH);linear,.634;addx,-SCREEN_WIDTH*1.7);
	};
	Def.Quad{
		OnCommand=cmd(ztest,true;FullScreen;diffusecolor,color("#000000"));
	};
	Def.ActorFrame {
		OnCommand=cmd(Center);
		LoadActor("../ScreenStageInformation decorations/00")..{
			OnCommand=cmd(ztest,true;x,-44);
		};
		LoadActor("../ScreenStageInformation decorations/00")..{
			OnCommand=cmd(ztest,true;x,44);
		};
		LoadActor("../ScreenStageInformation decorations/00")..{
			OnCommand=cmd(ztest,true;x,-132);
		};
		LoadActor("../ScreenStageInformation decorations/00")..{
			OnCommand=cmd(ztest,true;x,132);
		};
		LoadActor("../ScreenStageInformation decorations/00")..{
			OnCommand=cmd(ztest,true;x,-220);
		};
		LoadActor("../ScreenStageInformation decorations/00")..{
			OnCommand=cmd(ztest,true;x,220);
		};
	};
	LoadActor("stl")..{
		OnCommand=cmd(Center;x,SCREEN_LEFT;linear,.634;addx,SCREEN_WIDTH*1.7);
	};
	LoadActor("str")..{
		OnCommand=cmd(Center;x,SCREEN_RIGHT;linear,.634;addx,-SCREEN_WIDTH*1.7);
	};
};