return Def.ActorFrame{
	LoadActor("_survdiff/nfo_beg")..{
		OnCommand=cmd(x,SCREEN_LEFT+30;y,SCREEN_CENTER_Y-155;horizalign,left);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_RIGHT+148;y,SCREEN_CENTER_Y-137;diffusealpha,0;decelerate,.3;x,SCREEN_CENTER_X+213;diffusealpha,1);
		Def.ActorFrame{
			LoadActor("_survdiff/itembg");
			LoadActor("_survdiff/beg_off")..{
				OnCommand=cmd(x,-48);
			};
		};
		Def.ActorFrame{
			LoadActor("_survdiff/itembg");
			LoadActor("_survdiff/beg_on")..{
				OnCommand=cmd(x,-48);
			};
			GainFocusCommand=function(self)
				setenv("advDiff","Difficulty_Beginner");
				self:diffusealpha(1);
			end;
			LoseFocusCommand=cmd(diffusealpha,0);
		};
	};
}