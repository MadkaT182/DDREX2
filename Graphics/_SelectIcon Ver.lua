return Def.ActorFrame {
	LoadActor("_style/icon_pad")..{
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		InitCommand=cmd(x,-SCREEN_WIDTH/2;y,-SCREEN_HEIGHT/2);
		OnCommand=cmd(addx,-9;addy,59);
	};
	LoadActor("_style/icon_pad")..{
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		InitCommand=cmd(x,-SCREEN_WIDTH/2;y,-SCREEN_HEIGHT/2);
		OnCommand=cmd(addx,91;addy,59);
	};
};