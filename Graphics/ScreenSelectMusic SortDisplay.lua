local t = Def.ActorFrame {
	Def.Sprite{
		BeginCommand=cmd(playcommand,"SetGraphic");
		SetGraphicCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so ~= nil then
				local sort = ToEnumShortString(so)
				self:Load(THEME:GetPathG("","_sort/_"..sort));
			end;
		end;
		SortOrderChangedMessageCommand=function(self)
			self:linear(0.2)
			self:addx(-SCREEN_CENTER_X)
			self:queuecommand("SetGraphic");
			self:linear(0.2)
			self:addx(SCREEN_CENTER_X)
		end;
	};
};

return t;