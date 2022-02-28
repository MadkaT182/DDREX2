return Def.ActorFrame {
	LoadActor("normal")..{
		Condition=not GAMESTATE:IsCourseMode();
	};
	LoadActor("course")..{
		Condition=GAMESTATE:IsCourseMode();
	};
};