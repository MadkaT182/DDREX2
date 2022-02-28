return Def.ActorFrame {
	--Black overlay
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.Black;diffusealpha,0;linear,1;diffusealpha,1);
	};
};