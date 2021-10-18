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
			Def.Quad{
				InitCommand=cmd(x,4;diffuse,color("#3C3C3CBB");zoomto,barw,barh;skewx,-.1);
			};
			Def.Quad{
				InitCommand=cmd(x,4;blend,Blend.Add;zoomto,barw,barh;skewx,-.1;diffuseshift;effectcolor1,1,0,0,.4;effectcolor2,1,0,0,0;effectperiod,1.5;diffusealpha,0);
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
			LoadActor(THEME:GetPathG("StreamDisplay","normal"))..{
				InitCommand=function(self)
					self:x(3);
					self:texcoordvelocity(.8,0);
					self:skewx(-4.5);
					self:zoomto(barw,barh);
					self:cropright(1);
					self:sleep(.5);
					self:linear(.9);
					self:cropright(.5);
					self:linear(.5);
					self:cropright(.5);
					self:linear(.5);
					self:cropright(.55);
					self:linear(.5);
					self:cropright(.5);
				end;
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == PLAYER_1 then
						if param.HealthState == "HealthState_Danger" then
							self:diffusealpha(0);
						else
							self:diffusealpha(1);
						end;
					end;
				end;
				LifeChangedMessageCommand=function(self, param)
					if param.Player == PLAYER_1 then
						self:stoptweening();
						self:linear(.3);
						self:cropright(1-param.LifeMeter:GetLife()+.025);
						self:linear(.1);
						self:cropright(1-param.LifeMeter:GetLife());
					end;
				end;
			};
			LoadActor(THEME:GetPathG("StreamDisplay","danger"))..{
				InitCommand=function(self)
					self:diffusealpha(0);
					self:x(3);
					self:texcoordvelocity(1.5,0);
					self:skewx(-1);
					self:zoomto(barw,barh);
				end;
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == PLAYER_1 then
						if param.HealthState == "HealthState_Danger" then
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
				LifeChangedMessageCommand=function(self, param)
					if param.Player == PLAYER_1 then
						self:stoptweening();
						self:linear(.3);
						self:cropright(1-param.LifeMeter:GetLife()+.025);
						self:linear(.1);
						self:cropright(1-param.LifeMeter:GetLife());
					end;
				end;
			};
			LoadActor(THEME:GetPathG("StreamDisplay","hot"))..{
				InitCommand=function(self)
					self:x(3);
					self:texcoordvelocity(.8,0)
					self:skewx(-4.5);
					self:zoomto(barw+4,barh);
					self:glowblink();
					self:effectcolor1(1,1,1,0);
					self:effectcolor2(1,1,1,.5);
					self:effectperiod(.075);
					self:diffusealpha(0);
				end;
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == PLAYER_1 then
						if param.HealthState == "HealthState_Hot" then
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
			LoadActor("_life/frame");
			LoadActor("_life/dng_lbl")..{
				OnCommand=cmd(diffusealpha,0;x,42;diffuseshift;effectcolor1,color("#FFFF00");effectcolor2,color("#FFFF0000");effectperiod,.8);
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
			LoadActor("_life/highlight")..{
				InitCommand=cmd(y,3;blend,Blend.Add;cropright,1;diffusealpha,.5;queuecommand,"Anim";player,PLAYER_1);
				AnimCommand=cmd(diffusealpha,.5;cropright,1;sleep,.2;linear,200/(GAMESTATE:GetSongBPS()*100);cropright,0;diffusealpha,0;sleep,.2;queuecommand,"Anim");
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
			LoadActor(THEME:GetPathG("StreamDisplay","normal"))..{
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
			LoadActor(THEME:GetPathG("StreamDisplay","danger"))..{
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
			LoadActor(THEME:GetPathG("StreamDisplay","hot"))..{
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