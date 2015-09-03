local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor( "../_shared background" )..{
	};
}

if GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.ActorFrame {
	LoadActor( "../_course background" )..{
	};
	}
end

t[#t+1] = Def.ActorFrame {
	LoadActor( "right.png" )..{
		OnCommand=cmd(x,SCREEN_RIGHT-20;y,SCREEN_CENTER_Y);
	};
}

return t