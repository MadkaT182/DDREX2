local t = Def.ActorFrame{
	Def.Quad{
		OnCommand=cmd(diffusecolor,color("#161616");diffusealpha,.5;zoomto,220,140);
	};
	LoadActor("frame");
};

for idx,diff in pairs(Difficulty) do
	t[#t+1] = Def.ActorFrame {
		LoadActor(THEME:GetPathG("SelectMusic","DiffList/"..diff))..{
			OnCommand=function(self)
				self:x(-32);
				self:y(-70+idx*20);
				self:zoom(.892);
				self:diffuse(color("#808080"));
				self:playcommand("Set");
			end;
			SetCommand=function(self)
				local Song = GAMESTATE:GetCurrentSong();
				if Song then
					local st = GAMESTATE:GetCurrentStyle():GetStepsType();
					if Song:HasStepsTypeAndDifficulty(st,diff) then
						self:diffuse(color("#FFFFFF"));
					else
						self:diffuse(color("#808080"));
					end
				else
					self:diffuse(color("#808080"));
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
		LoadFont("_diff_normal")..{
			OnCommand=function(self)
				self:x(56);
				self:y(-70+idx*20);
				self:diffuse(color("#808080"));
				self:settext(string.rep("0",10));
			end;
		};
		LoadFont("_diff_normal")..{
			OnCommand=function(self)
				self:x(6);
				self:y(-70+idx*20);
				self:horizalign(left);
				self:diffuse(color("#808080"));
				self:playcommand("Set");
			end;
			SetCommand=function(self)
				local Song = GAMESTATE:GetCurrentSong();
				if Song then
					local st = GAMESTATE:GetCurrentStyle():GetStepsType();
					if Song:HasStepsTypeAndDifficulty(st,diff) then
						local steps = Song:GetOneSteps(st,diff);
						if steps then
							local meter = steps:GetMeter();
							local fixmeter = 0;
							if meter > 10 then
								fixmeter = 10;
								self:textglowmode('TextGlowMode_Inner');
								self:diffuseshift();
								self:effectcolor1(color(getDifficultyColor(diff)));
								self:effectcolor2(.7,.7,.7,1);
							else
								fixmeter = meter;
								self:stopeffect();
							end
							self:settext(string.rep("0",fixmeter));
							self:diffuse(color(getDifficultyColor(diff)));
						else
							self:settext("");
						end
					else
						self:settext("");
					end
				else
					self:settext("");
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
		LoadFont("_diff_normal")..{
			OnCommand=function(self)
				self:x(6);
				self:y(-70+idx*20);
				self:horizalign(left);
				self:playcommand("Set");
			end;
			SetCommand=function(self)
				local Song = GAMESTATE:GetCurrentSong();
				if Song then
					local st = GAMESTATE:GetCurrentStyle():GetStepsType();
					if Song:HasStepsTypeAndDifficulty(st,diff) then
						local steps = Song:GetOneSteps(st,diff);
						if steps then
							local meter = steps:GetMeter();
							local fixmeter = 0;
							if meter > 10 then
								meter = meter > 20 and 20 or meter;
								fixmeter = meter - 10;
							else
								fixmeter = 0;
							end
							self:settext(string.rep("0",fixmeter));
							self:diffuse(color("#FF0000"));
						else
							self:settext("");
						end
					else
						self:settext("");
					end
				else
					self:settext("");
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
	};
end

return t;