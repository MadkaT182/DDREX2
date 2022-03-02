-- --check battery indicator
-- -- if GAMESTATE:PlayerIsUsingModifier(pn,'battery') or GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
-- -- end

-- --GAMESTATE:GetPlayerState(Player):GetCurrentPlayerOptions():LifeSetting() == "LifeType_Battery")

local t = Def.ActorFrame {};

local barw = IsUsingWideScreen() and 346 or 236;

for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.ActorFrame {
		InitCommand=function(self)
			self:x(pn == PLAYER_1 and SCREEN_LEFT+(IsUsingWideScreen() and 200 or 146) or SCREEN_RIGHT-(IsUsingWideScreen() and 200 or 146));
			self:y(SCREEN_TOP+28);
			self:horizalign(pn == PLAYER_1 and left or right);
			self:zoomx(pn == PLAYER_1 and 1 or -1);
		end;
		--Normal
		Def.ActorFrame{
			Def.Quad{
				InitCommand=cmd(x,4;diffuse,color("#3C3C3CBB");zoomto,barw,21;skewx,-.1);
			};
			Def.Quad{
				InitCommand=cmd(x,4;blend,Blend.Add;zoomto,barw,21;skewx,-.1;diffuseshift;effectcolor1,1,0,0,.4;effectcolor2,1,0,0,0;effectperiod,1.5;diffusealpha,0);
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == pn then
						if param.HealthState == "HealthState_Danger" then
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
				OffCommand=cmd(visible,false);
			};
			Def.ActorFrame{
				InitCommand=cmd(diffusealpha,0;sleep,2.9;diffusealpha,1);
				LoadActor(THEME:GetPathG("StreamDisplay","normal"))..{
					InitCommand=function(self)
						self:x(3);
						self:texcoordvelocity(.8,0);
						self:skewx(-3.4);
						self:zoomto(barw,21);
						self:cropright(.5);
					end;
					LifeChangedMessageCommand=function(self, param)
						if param.Player == pn then
							self:stoptweening();
							if param.LifeMeter:IsInDanger() then
								self:diffusealpha(0);
							else
								self:diffusealpha(1);
							end
							self:linear(.3);
							self:cropright(1-param.LifeMeter:GetLife()+.025);
							self:linear(.1);
							self:cropright(1-param.LifeMeter:GetLife());
						end;
					end;
					OffCommand=cmd(visible,false);
				};
			};
			LoadActor(THEME:GetPathG("StreamDisplay","normal"))..{
				OnCommand=function(self)
					self:x(3);
					self:texcoordvelocity(.8,0);
					self:skewx(-3.4);
					self:zoomto(barw,21);
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
					self:sleep(0);
					self:diffusealpha(0);
				end;
				OffCommand=cmd(visible,false);
			};
			LoadActor(THEME:GetPathG("StreamDisplay","danger"))..{
				InitCommand=function(self)
					self:diffusealpha(0);
					self:x(3);
					self:texcoordvelocity(1.5,0);
					self:skewx(-1);
					self:zoomto(barw,21);
				end;
				LifeChangedMessageCommand=function(self, param)
					if param.Player == pn then
						self:stoptweening();
						if param.LifeMeter:IsInDanger() then
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end
						self:linear(.3);
						self:cropright(1-param.LifeMeter:GetLife()+.025);
						self:linear(.1);
						self:cropright(1-param.LifeMeter:GetLife());
					end;
				end;
				OffCommand=cmd(visible,false);
			};
			LoadActor(THEME:GetPathG("StreamDisplay","hot"))..{
				InitCommand=function(self)
					self:x(3);
					self:texcoordvelocity(.8,0)
					self:skewx(-3.4);
					self:zoomto(barw+4,21);
					self:glowblink();
					self:effectcolor1(1,1,1,0);
					self:effectcolor2(1,1,1,.5);
					self:effectperiod(.075);
					self:diffusealpha(0);
				end;
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == pn then
						if param.HealthState == "HealthState_Hot" then
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
				OffCommand=cmd(visible,false);
			};
			LoadActor(IsUsingWideScreen() and "_life/grid_w" or "_life/grid_n")..{
				InitCommand=cmd(x,3);
				OffCommand=cmd(visible,false);
			};
			LoadActor(IsUsingWideScreen() and "_life/frame_w" or "_life/frame_n")..{
				OnCommand=cmd(diffusealpha,1);
			};
			LoadActor("_life/dng_lbl")..{
				OnCommand=cmd(diffusealpha,0;x,42;zoomx,pn == PLAYER_1 and 1 or -1;diffuseshift;effectcolor1,color("#FFFF00");effectcolor2,color("#FFFF0000");effectperiod,.8);
				HealthStateChangedMessageCommand=function(self, param)
					if param.PlayerNumber == pn then
						if param.HealthState == "HealthState_Danger" then
							self:diffusealpha(1);
						else
							self:diffusealpha(0);
						end;
					end;
				end;
				OffCommand=cmd(visible,false);
			};
			LoadActor(IsUsingWideScreen() and "_life/highlight_w" or "_life/highlight_n")..{
				InitCommand=cmd(y,3;blend,Blend.Add;cropright,1;diffusealpha,.5;queuecommand,"Anim");
				AnimCommand=cmd(diffusealpha,.5;cropright,1;sleep,.2;linear,200/(GAMESTATE:GetSongBPS()*100);cropright,0;diffusealpha,0;sleep,.2;queuecommand,"Anim");
				OffCommand=cmd(visible,false);
			};
			Def.ActorFrame{
				InitCommand=cmd(x,IsUsingWideScreen() and -181 or -128;zoomx,pn == PLAYER_1 and 1 or -1);
				LoadActor(pn == PLAYER_1 and "_life/p1ring" or "_life/p2ring")..{
					OnCommand=cmd(spin);
				};
				LoadActor(pn == PLAYER_1 and "_life/p1icon" or "_life/p2icon");
			};
			Condition=GAMESTATE:GetPlayerState(pn):GetCurrentPlayerOptions():LifeSetting() ~= "LifeType_Battery";
		};
		--Battery
		Def.ActorFrame{
			-- LoadActor(IsUsingWideScreen() and "_life/frame_w" or "_life/frame_n")..{
			-- 	InitCommand=function(self)
			-- 		self:zoomx(pn == PLAYER_1 and 1 or -1);
			-- 	end;
			-- };
			Condition=GAMESTATE:GetPlayerState(pn):GetCurrentPlayerOptions():LifeSetting() == "LifeType_Battery";
		};
	};
end

return t;