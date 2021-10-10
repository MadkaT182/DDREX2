local sortIdx = 0;
local t = Def.ActorFrame{
	SortOrderChangedMessageCommand=function(self)
		sortIdx = sortIdx + 1;
		self:stoptweening();
		self:linear(.5);
		self:rotationz(-90*sortIdx);
	end;
};

for i = 1,4 do

	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(rotationz,90*i);
		LoadActor(THEME:GetPathG("Common","SortDisplay/arrow"))..{
			BeginCommand=cmd(y,180);
		};
		Def.Sprite{
			BeginCommand=cmd(y,180;x,-20;playcommand,"SetGraphic");
			SetGraphicCommand=function(self)
				local so = GAMESTATE:GetSortOrder();
				if so then
					local sort = ToEnumShortString(so);
					self:Load(THEME:GetPathG("Common","SortDisplay/"..sort));
				end;
			end;
			SortOrderChangedMessageCommand=function(self)
				self:sleep(.25);
				self:queuecommand("SetGraphic");
			end;
		};
	};

end

return t;