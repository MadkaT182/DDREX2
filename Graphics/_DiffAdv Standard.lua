return Def.ActorFrame{
	LoadActor("_survdiff/nfo_std")..{
		OnCommand=cmd(x,SCREEN_LEFT+30;y,SCREEN_CENTER_Y-155;horizalign,left);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_RIGHT+148;y,SCREEN_CENTER_Y-30;diffusealpha,0;sleep,.134;decelerate,.334;x,SCREEN_CENTER_X+187;diffusealpha,1);
		Def.ActorFrame{
			LoadActor("_survdiff/itembg");
			LoadActor("_survdiff/std_off")..{
				OnCommand=cmd(x,-48);
			};
		};
		Def.ActorFrame{
			LoadActor("_survdiff/itembg");
			LoadActor("_survdiff/std_on")..{
				OnCommand=cmd(x,-48);
			};
			GainFocusCommand=function(self)
				setenv("advDiff","Difficulty_Medium");
				self:diffusealpha(1);
			end;
			LoseFocusCommand=cmd(diffusealpha,0);
		};	
	}
}