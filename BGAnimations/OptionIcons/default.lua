local player = ...
local p = ToEnumShortString(player)
local ps = GAMESTATE:GetPlayerState(player)
local po = ps:GetCurrentPlayerOptions()

return Def.ActorFrame{
	InitCommand=function(self)
		self:playcommand("Show");
		self:zoomx(.8);
	end;
	Def.Sprite{
		ShowCommand=function(self)
			self:x(-80);
			if po:XMod() and po:XMod() ~= 1 then
				self:Load(THEME:GetPathB("","OptionIcons/icon/non"));
			end
		end;
	};
	Def.BitmapText{
		Font="_arial black";
		ShowCommand=function(self)
			self:x(-80);
			self:zoom(.5);
			self:maxwidth(30);
			if po:XMod() and po:XMod() ~= 1 then
				self:settext("x"..po:XMod());
			end
		end;
	};
	Def.Sprite{
		ShowCommand=function(self)
			self:x(-60);
			if po:Boost() ~= 0  then
				self:Load(THEME:GetPathB("","OptionIcons/icon/boost_on"));
			end
		end;
	};
	Def.Sprite{
		ShowCommand=function(self)
			self:x(-40);
			if po:Hidden() ~= 0 then
				self:Load(THEME:GetPathB("","OptionIcons/icon/appearance_hidden"));
			elseif po:Sudden() ~= 0 then
				self:Load(THEME:GetPathB("","OptionIcons/icon/appearance_sudden"));
			elseif po:Stealth() ~= 0 then
				self:Load(THEME:GetPathB("","OptionIcons/icon/appearance_stealth"));
			end				
		end;
	};
	Def.Sprite{
		ShowCommand=function(self)
			self:x(-20);
			if po:Mirror() then
				self:Load(THEME:GetPathB("","OptionIcons/icon/turn_mirror"));
			elseif po:Left() then
				self:Load(THEME:GetPathB("","OptionIcons/icon/turn_left"));
			elseif po:Right() then
				self:Load(THEME:GetPathB("","OptionIcons/icon/turn_right"));
			elseif po:Shuffle() then
				self:Load(THEME:GetPathB("","OptionIcons/icon/turn_shuffle"));
			end
		end;
	};
	Def.Sprite{
		ShowCommand=function(self)
			self:x(0);
			if po:Little() then
				self:Load(THEME:GetPathB("","OptionIcons/icon/little_on"));
			end
		end;
	};
	Def.Sprite{
		ShowCommand=function(self)
			self:x(20);
			if po:Dark() ~= 0 then
				self:Load(THEME:GetPathB("","OptionIcons/icon/dark_on"));
			end
		end;
	};
	Def.Sprite{
		ShowCommand=function(self)
			self:x(40);
			if po:NoJumps() then
				self:Load(THEME:GetPathB("","OptionIcons/icon/simul_off"));
			end
		end;
	};
	Def.Sprite{
		ShowCommand=function(self)
			self:x(60);
			if po:Reverse() ~= 0 then
				self:Load(THEME:GetPathB("","OptionIcons/icon/scroll_reverse"));
			end
		end;
	};
	Def.Sprite{
		ShowCommand=function(self)
			self:x(80);
			if po:NoHolds() then
				self:Load(THEME:GetPathB("","OptionIcons/icon/freeze_arrow_off"));
			end
		end;
	};
};