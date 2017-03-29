local gc = Var("GameCommand");
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","PrevArtGainFocusCommand");
  LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","PrevArtLoseFocusCommand");
	LoadActor(THEME:GetPathG("_Menu",gc:GetName() )) .. {
		DisabledCommand=cmd(diffuse,color("0.0,0.0,0.0,0"));
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		OnCommand=cmd(draworder,-110;vertalign,top;x,SCREEN_CENTER_X-138;y,SCREEN_CENTER_Y-28;zoomy,0;sleep,0.383;zoomy,0.2;decelerate,0.1;zoomy,1.05;accelerate,0.016;zoomy,1);
		OffCommand=cmd();
	};
};

return t