return Def.ActorFrame {
	LoadActor("BGA")..{
		InitCommand=cmd(FullScreen);
		Condition=getenv("advMode") == "Survival"
	};
	Def.ActorFrame{
		Def.Quad{
			OnCommand=cmd(FullScreen;diffuse,color("#000000"));
		};
		Def.ActorMultiVertex{
			OnCommand=function(self)
				local vertices={
					{{-440, math.random(0,40), 0}, Color.Orange},
					{{-430, math.random(0,40), 0}, Color.Purple},
					{{-420, math.random(0,40), 0}, Color.Black},
					{{-410, math.random(0,40), 0}, Color.White},
					{{-400, math.random(0,40), 0}, Color.Red},
					{{-390, math.random(0,40), 0}, Color.Blue},
					{{-380, math.random(0,40), 0}, Color.Green},
					{{-370, math.random(0,40), 0}, Color.Yellow},
					{{-360, math.random(0,40), 0}, Color.Orange},
					{{-350, math.random(0,40), 0}, Color.Purple},
					{{-340, math.random(0,40), 0}, Color.Black},
					{{-330, math.random(0,40), 0}, Color.White},
					{{-320, math.random(0,40), 0}, Color.Red},
					{{-310, math.random(0,40), 0}, Color.Blue},
					{{-300, math.random(0,40), 0}, Color.Green},
					{{-290, math.random(0,40), 0}, Color.Yellow},
					{{-280, math.random(0,40), 0}, Color.Orange},
					{{-270, math.random(0,40), 0}, Color.Purple},
					{{-260, math.random(0,40), 0}, Color.Black},
					{{-250, math.random(0,40), 0}, Color.White},
					{{-240, math.random(0,40), 0}, Color.Red},
					{{-230, math.random(0,40), 0}, Color.Blue},
					{{-220, math.random(0,40), 0}, Color.Green},
					{{-210, math.random(0,40), 0}, Color.Yellow},
					{{-200, math.random(0,40), 0}, Color.Orange},
					{{-190, math.random(0,40), 0}, Color.Purple},
					{{-180, math.random(0,40), 0}, Color.Black},
					{{-170, math.random(0,40), 0}, Color.White},
					{{-160, math.random(0,40), 0}, Color.Red},
					{{-150, math.random(0,40), 0}, Color.Blue},
					{{-140, math.random(0,40), 0}, Color.Green},
					{{-130, math.random(0,40), 0}, Color.Yellow},
					{{-120, math.random(0,40), 0}, Color.Orange},
					{{-110, math.random(0,40), 0}, Color.Purple},
					{{-100, math.random(0,40), 0}, Color.Black},
					{{-90, math.random(0,40), 0}, Color.White},
					{{-80, math.random(0,40), 0}, Color.Red},
					{{-70, math.random(0,40), 0}, Color.Blue},
					{{-60, math.random(0,40), 0}, Color.Green},
					{{-50, math.random(0,40), 0}, Color.Yellow},
					{{-40, math.random(0,40), 0}, Color.Orange},
					{{-30, math.random(0,40), 0}, Color.Purple},
					{{-20, math.random(0,40), 0}, Color.Black},
					{{-10, math.random(0,40), 0}, Color.White},
					{{0, math.random(0,40), 0}, Color.Red},
					{{10, math.random(0,40), 0}, Color.Blue},
					{{20, math.random(0,40), 0}, Color.Green},
					{{30, math.random(0,40), 0}, Color.Yellow},
					{{40, math.random(0,40), 0}, Color.Orange},
					{{50, math.random(0,40), 0}, Color.Purple},
					{{60, math.random(0,40), 0}, Color.Black},
					{{70, math.random(0,40), 0}, Color.White},
					{{80, math.random(0,40), 0}, Color.Red},
					{{90, math.random(0,40), 0}, Color.Blue},
					{{100, math.random(0,40), 0}, Color.Green},
					{{110, math.random(0,40), 0}, Color.Yellow},
					{{120, math.random(0,40), 0}, Color.Orange},
					{{130, math.random(0,40), 0}, Color.Purple},
					{{140, math.random(0,40), 0}, Color.Black},
					{{150, math.random(0,40), 0}, Color.White},
					{{160, math.random(0,40), 0}, Color.Red},
					{{170, math.random(0,40), 0}, Color.Blue},
					{{180, math.random(0,40), 0}, Color.Green},
					{{190, math.random(0,40), 0}, Color.Yellow},
					{{200, math.random(0,40), 0}, Color.Orange},
					{{210, math.random(0,40), 0}, Color.Purple},
					{{220, math.random(0,40), 0}, Color.Black},
					{{230, math.random(0,40), 0}, Color.White},
					{{240, math.random(0,40), 0}, Color.Red},
					{{250, math.random(0,40), 0}, Color.Blue},
					{{260, math.random(0,40), 0}, Color.Green},
					{{270, math.random(0,40), 0}, Color.Yellow},
					{{280, math.random(0,40), 0}, Color.Orange},
					{{290, math.random(0,40), 0}, Color.Purple},
					{{300, math.random(0,40), 0}, Color.Black},
					{{310, math.random(0,40), 0}, Color.White},
					{{320, math.random(0,40), 0}, Color.Red},
					{{330, math.random(0,40), 0}, Color.Red},
					{{340, math.random(0,40), 0}, Color.Blue},
					{{350, math.random(0,40), 0}, Color.Green},
					{{360, math.random(0,40), 0}, Color.Yellow},
					{{370, math.random(0,40), 0}, Color.Orange},
					{{380, math.random(0,40), 0}, Color.Purple},
					{{390, math.random(0,40), 0}, Color.Black},
					{{400, math.random(0,40), 0}, Color.White},
					{{410, math.random(0,40), 0}, Color.Red},
					{{420, math.random(0,40), 0}, Color.Blue},
					{{430, math.random(0,40), 0}, Color.Green},

					-- {{430, 50, 0}, Color.Yellow},
					-- {{-440, 50, 0}, Color.Yellow},
				};

				self:SetDrawState{Mode="DrawMode_LineStrip"}
				self:SetLineWidth(1);
				self:SetVertices(vertices);
				self:Center();
				self:linear(50/(GAMESTATE:GetSongBPS()*100));
				self:y(SCREEN_BOTTOM+41);
				self:queuecommand("Repeat");
			end;
			RepeatCommand=cmd(queuecommand,"On");
		};
		Condition=getenv("advMode") == "Comboch"
	};
}