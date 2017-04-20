local t = Def.ActorFrame{};
local barw = 236;
local barh = 21;

--LUA based lifebars by MadkaT
for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(y,SCREEN_TOP+28);
		--P1
		Def.ActorFrame{
			InitCommand=function(self) if pn == PLAYER_1 then self:diffusealpha(1):x(SCREEN_CENTER_X-281) else self:diffusealpha(0) end end;
			--Life Fill
			LoadActor("_life/normal")..{
				InitCommand=function(self)
					self:x(3);
					self:texcoordvelocity(.8,0);
					self:skewx(-4.5);
					self:zoomto(barw,barh);
					self:cropright(1);
					self:linear(1);
					self:cropright(.5);
				end;
				LifeChangedMessageCommand=function(self, param)
					if param.Player == PLAYER_1 then
						self:stoptweening();
						self:cropright(1-param.LifeMeter:GetLife());
						self:linear(.25);
						self:cropright(1-param.LifeMeter:GetLife()+0.025);
						self:linear(.25);
						self:cropright(1-param.LifeMeter:GetLife()-0.05);
						self:linear(.25);
						self:cropright(1-param.LifeMeter:GetLife()+0.025);
						self:linear(.25);
						self:cropright(1-param.LifeMeter:GetLife());
					end;
				end;
			};
			LoadActor("_life/danger")..{
				InitCommand=function(self)
					self:x(3);
					self:texcoordvelocity(1.5,0);
					self:skewx(-1);
					self:zoomto(barw,barh);
					self:cropright(1);
					self:linear(.5);
					self:cropright(.75);
					self:sleep(0);
					self:linear(.25);
					self:diffusealpha(0);
				end;
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == PLAYER_1 then
						if param.HealthState == "HealthState_Danger" then
							self:linear(1);
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
				LifeChangedMessageCommand=function(self, param)
					if param.Player == PLAYER_1 then
						if param.HealthState == "HealthState_Danger" then
							self:stoptweening();
							self:cropright(1-param.LifeMeter:GetLife());
							self:linear(.25);
							self:cropright(1-param.LifeMeter:GetLife()+0.025);
							self:linear(.25);
							self:cropright(1-param.LifeMeter:GetLife()-0.05);
							self:linear(.25);
							self:cropright(1-param.LifeMeter:GetLife()+0.025);
							self:linear(.25);
							self:cropright(1-param.LifeMeter:GetLife());
						end;
					end;
				end;
			};
			LoadActor("_life/full")..{
				InitCommand=function(self)
					self:x(3);
					self:texcoordvelocity(.8,0)
					self:skewx(-4.5);
					self:zoomto(barw+4,barh);
					self:diffusealpha(0);
				end;
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == PLAYER_1 then
						if param.HealthState == "HealthState_Hot" then
							self:linear(1);
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
			};
			LoadActor("_life/grid")..{
				InitCommand=cmd(x,3);
			};
			LoadActor("_life/frame")..{};
			LoadActor("_life/dng_lbl")..{
				OnCommand=cmd(diffusealpha,0;x,42;diffuseshift;effectcolor1,color("#FFFF00");effectcolor2,color("#FFFF0000"));
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == PLAYER_1 then
						if param.HealthState == "HealthState_Danger" then
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
			};
			--Player Indicator
			Def.ActorFrame{
				InitCommand=cmd(x,-127);
				LoadActor("_life/p1ring")..{
					OnCommand=cmd(spin);
				};
				LoadActor("_life/p1icon")..{};
			};
		};
		--P2
		Def.ActorFrame{
			InitCommand=function(self) if pn == PLAYER_2 then self:diffusealpha(1):x(SCREEN_CENTER_X+281) else self:diffusealpha(0) end end;
			--Life Fill
			LoadActor("_life/normal")..{
				InitCommand=function(self)
					self:x(-3);
					self:texcoordvelocity(-.8,0)
					self:skewx(4.5);
					self:zoomto(barw,barh);
					self:cropleft(1);
					self:linear(1);
					self:cropleft(.5);
				end;
				LifeChangedMessageCommand=function(self, param)
					if param.Player == PLAYER_2 then
						self:cropleft(1-param.LifeMeter:GetLife());
					end;
				end;
			};
			LoadActor("_life/danger")..{
				InitCommand=function(self)
					self:x(-3);
					self:texcoordvelocity(-1.5,0);
					self:skewx(1);
					self:zoomto(barw,barh);
					self:cropleft(1);
					self:linear(.5);
					self:cropleft(.75);
					self:sleep(0);
					self:linear(.25);
					self:diffusealpha(0);
				end;
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == PLAYER_2 then
						if param.HealthState == "HealthState_Danger" then
							self:linear(1);
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
			};
			LoadActor("_life/full")..{
				InitCommand=function(self)
					self:x(-3);
					self:texcoordvelocity(-.8,0)
					self:skewx(4.5);
					self:zoomto(barw,barh);
					self:diffusealpha(0);
				end;
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == PLAYER_2 then
						if param.HealthState == "HealthState_Hot" then
							self:linear(1);
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
			};
			LoadActor("_life/grid")..{
				OnCommand=cmd(zoomx,-1;x,-3);
			};
			LoadActor("_life/frame")..{
				OnCommand=cmd(zoomx,-1);
			};
			--Player Indicator
			Def.ActorFrame{
				InitCommand=cmd(x,127);
				LoadActor("_life/p2ring")..{
					OnCommand=cmd(spin);
				};
				LoadActor("_life/p2icon")..{};
			};
		};
	};
end

return t;