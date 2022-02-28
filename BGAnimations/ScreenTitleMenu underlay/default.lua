local t = Def.ActorFrame {};
ClearEnv()

if GAMESTATE:GetCoinMode() ~= 'CoinMode_Home' then
	t[#t+1] = Def.ActorFrame {
		LoadActor( "../ScreenLogo background/ddrex2_logo" )..{
			OnCommand=cmd(queuecommand,"Logo");
			LogoCommand=cmd(y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X);
		};
	}
end

if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
	t[#t+1] = Def.ActorFrame {
		LoadActor( "left" )..{
			OnCommand=cmd(x,SCREEN_LEFT-120;linear,.184;x,SCREEN_LEFT+120;y,SCREEN_CENTER_Y;zoomtoheight,SCREEN_HEIGHT);
			OffCommand=cmd(linear,.184;x,SCREEN_LEFT-120;);
		};
	}
end

return t