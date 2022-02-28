local function Radar()
	local t = Def.ActorFrame{};

	local function set(self,player)
		local Selection = GAMESTATE:GetCurrentSteps(player) or GAMESTATE:GetCurrentTrail(player)
		local Song = GAMESTATE:GetCurrentSong();
		if not Selection or not Song then
			self:SetEmpty( player );
			return
		end
		self:diffuse(color(getDifficultyColor(GAMESTATE:GetCurrentSteps(player):GetDifficulty())));
		self:SetFromRadarValues( player, Selection:GetRadarValues(player) );
	end

for player in ivalues(GAMESTATE:GetHumanPlayers()) do

	t[#t+1] = Def.GrooveRadar {
		OnCommand=cmd();
		OffCommand=cmd();
		CurrentStepsP1ChangedMessageCommand=function(self) if player == PLAYER_1 then set(self, PLAYER_1); end end;
		CurrentStepsP2ChangedMessageCommand=function(self) if player == PLAYER_2 then set(self, PLAYER_2); end end;
		CurrentTrailP1ChangedMessageCommand=function(self) if player == PLAYER_1 then set(self, PLAYER_1); end end;
		CurrentTrailP2ChangedMessageCommand=function(self) if player == PLAYER_2 then set(self, PLAYER_2); end end;
	};

end

	return t;
end

local function StepDiff(difficulty)
	local difficultyStates = {
		Difficulty_Beginner	 = 1,
		Difficulty_Easy		 = 2,
		Difficulty_Medium	 = 3,
		Difficulty_Hard		 = 4,
		Difficulty_Challenge = 5,
		Difficulty_Edit		 = 6,
	};
	return difficultyStates[difficulty] or 1
end

local function GetRndSong()
	local found = false;

	while not found do

		local RSong = SONGMAN:GetRandomSong();

		if RSong then
			local Style = GAMESTATE:GetCurrentStyle();
			local SType = 'StepsType_Dance_Single';
			local Diff =  'Difficulty_Easy';
			local SStep;
			local newStep;
			if Style == 'StyleType_OnePlayerTwoSides' then
				SType = 'StepsType_Dance_Double';
			end
			if GAMESTATE:GetNumSidesJoined() == 2 then
				if GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() == GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() then
					Diff = GAMESTATE:GetCurrentSteps(GAMESTATE:GetMasterPlayerNumber()):GetDifficulty();
				else
					if StepDiff(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()) > StepDiff(GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty()) then
						Diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
					else
						Diff = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty();
					end
				end
			else
				Diff = GAMESTATE:GetPreferredDifficulty(GAMESTATE:GetMasterPlayerNumber());
			end
			if Diff then
				SStep = RSong:GetOneSteps(SType,Diff);
				if SStep then
					GAMESTATE:SetCurrentSong(RSong);
					GAMESTATE:SetPreferredSong(RSong);
					for player in ivalues(GAMESTATE:GetHumanPlayers()) do
						newStep = RSong:GetOneSteps(SType,GAMESTATE:GetPreferredDifficulty(player));
						GAMESTATE:SetCurrentSteps(player,newStep);
					end
					found = true;
				end
			end
		end

	end

end

local function inputs(event)
	local musicwheel = SCREENMAN:GetTopScreen():GetChild('MusicWheel');
	local button = event.GameButton;
	local dObject;
	if musicwheel then
		if musicwheel:GetSelectedType() == 'WheelItemDataType_Custom' then
			if button == "Start" then
				local Song = GetRndSong();
				if event.type == "InputEventType_FirstPress" then
					setenv("rsType",1);
				elseif event.type == "InputEventType_Repeat" then
					setenv("rsType",2);
				end
				SCREENMAN:GetTopScreen():queuecommand("NextScreen");
			end
		end
	end
end

return Def.ActorFrame {
	OnCommand=function(self)
		SCREENMAN:GetTopScreen():AddInputCallback(inputs);
	end;
	Def.ActorFrame{
		NextScreenCommand=function(self)
			if getenv("rsType") == 1 and not getenv("fSound") then
				SOUND:PlayAnnouncer("select music comment general")
				SOUND:PlayOnce(THEME:GetPathS("Common","start"));
				setenv("fSound",true);
			elseif getenv("rsType") == 2 and not getenv("sSound") then
				SOUND:PlayOnce(THEME:GetPathS("Common","start"));
				setenv("sSound",true);
			end
			self:sleep(1);
			self:queuecommand("GoNext");
		end;
		GoNextCommand=function(self)
			SCREENMAN:GetTopScreen():SetNextScreenName(getenv("rsType") == 1 and "ScreenStageInformation" or "ScreenPlayerOptions"):StartTransitioningScreen("SM_GoToNextScreen");
		end
	};
	LoadActor(THEME:GetPathG("","_footer"));
	LoadActor(THEME:GetPathG("Banner","overlay"))..{
		OnCommand=cmd(x,THEME:GetMetric("ScreenSelectMusic", "BannerX");y,THEME:GetMetric("ScreenSelectMusic", "BannerY"));
	};
	LoadActor(THEME:GetPathG("Common","wheel/banner"))..{
		OnCommand=cmd(x,SCREEN_LEFT+200;y,SCREEN_BOTTOM-221);
	};
	Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_LEFT+289;y,SCREEN_BOTTOM-76);
		LoadActor(THEME:GetPathG("Common","wheel/radar_frame"));
		Radar()..{
			BeginCommand=cmd(x,-4;y,5;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
		};
		Def.BPMDisplay {
			File=THEME:GetPathF("BPMDisplay", "bpm");
			Name="BPMDisplay";
			InitCommand=cmd(x,90;y,55;horizalign,right);
			OffCommand=cmd(diffusealpha,0);
			SetCommand=function(self) self:SetFromGameState() end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		};
		Def.ActorFrame{
			OnCommand=cmd(x,68;y,-6);
			LoadActor(THEME:GetPathG("MusicWheel","bpmmeter"))..{
				OnCommand=cmd(diffusealpha,.5);
			};
			LoadActor(THEME:GetPathG("MusicWheel","bpmmeter"))..{
				OffCommand=cmd(stoptweening);
				SetCommand=function(self)
					local upper = 210;
					local lower = 90;
					local Song = GAMESTATE:GetCurrentSong();
					self:stoptweening();
					if Song then
						local bpm = Song:GetDisplayBpms();
						if bpm[1] == bpm[2] then
							self:croptop(1-(bpm[1]-lower)/(upper-lower));
						else
							self:croptop(1-(bpm[1]-lower)/(upper-lower));
							self:sleep(1);
							self:linear(1);
							self:croptop(1-(bpm[2]-lower)/(upper-lower));
							self:sleep(1);
							self:linear(1);
							self:croptop(1-(bpm[1]-lower)/(upper-lower));
							self:queuecommand("Repeat");
						end
					else
						self:croptop(1);
					end
				end;
				RepeatCommand=cmd(queuecommand,"Set");
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			};
		};
	};
	LoadActor("SortDisplay")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+1;y,-154);
	};
	LoadActor("diff")..{
		OnCommand=cmd(x,SCREEN_LEFT+153;y,SCREEN_CENTER_Y-3);
	};
};