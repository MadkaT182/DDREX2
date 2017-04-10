local gc = Var("GameCommand");
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","ArtGainFocusCommand");
	LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","ArtLoseFocusCommand");
	LoadActor(THEME:GetPathG("_SelectArt",gc:GetName() )) .. {
		OnCommand=cmd(x,SCREEN_LEFT+100;y,SCREEN_TOP+40;zoomy,0;decelerate,0.35;zoomy,1);
		OffCommand=cmd(linear,0.15;rotationz,-45;addx,-100;diffusealpha,0);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathG("_SelectInfo",gc:GetName() )) .. {
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathG("_SelectIcon",gc:GetName() )) .. {};
};

return t