if GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 then

return Def.ActorFrame {
LoadActor( "Art.png" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X-713;y,SCREEN_CENTER_Y-270);
		OnCommand=cmd();
	};
}


else

return Def.ActorFrame {
LoadActor( "Art2" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X-713;y,SCREEN_CENTER_Y-270);
		OnCommand=cmd();
	};
}

end
