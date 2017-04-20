return Def.ActorFrame {
	Def.Quad{
		OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2;x,SCREEN_CENTER_X;y,SCREEN_TOP-SCREEN_HEIGHT/2;diffusecolor,Color.Black;draworder,1;linear,.35;addy,SCREEN_HEIGHT/4*3);
	};
	Def.Quad{
		OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM+SCREEN_HEIGHT/2;diffusecolor,Color.Black;draworder,1;linear,.35;addy,-SCREEN_HEIGHT/4*3);
	};
};