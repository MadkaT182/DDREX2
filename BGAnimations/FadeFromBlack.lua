return Def.ActorFrame {
	--Black overlay
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.Black;diffusealpha,1;linear,0.5;diffusealpha,0);
	};
};