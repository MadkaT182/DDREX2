return Def.ActorFrame{
	LoadActor("bg");
	LoadFont("MusicWheelItem Item")..{
		OnCommand=cmd(x,-135;y,-7;horizalign,left;maxwidth,222);
		SetCommand=function(self,param)
			if param.Song then
				self:settext(param.Song:GetDisplayFullTitle());
				self:diffuse(color(GetSongColor(param.Song:GetDisplayFullTitle())))
			else
				self:settext("");
			end
		end;
	};
	LoadFont("MusicWheelItem Item")..{
		OnCommand=cmd(x,-135;y,9;horizalign,left;zoom,.8;maxwidth,268);
		SetCommand=function(self,param)
			if param.Song then
				self:settext(param.Song:GetDisplayArtist());
				self:diffuse(color(GetSongColor(param.Song:GetDisplayFullTitle())))
			else
				self:settext("");
			end
		end;
	};
};