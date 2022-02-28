function SMOLogin()
	if IsNetConnected() then
		return "ScreenNetLogin";
	else
		return "ScreenNetConnect";
	end;
end

function SMOnlineScreen()
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		if not IsSMOnlineLoggedIn(pn) then
			return "ScreenSMOnlineLogin"
		end
	end
	return "ScreenNetRoom"
end

function SelectMusicOrCourse()
	if IsNetSMOnline() then
		return "ScreenNetSelectMusic"
	elseif GAMESTATE:IsCourseMode() then
		return "ScreenSelectCourse"
	else
		return "ScreenSelectMusic"
	end
end

function GameOverOrContinue()
	if THEME:GetMetric("ScreenContinue", "ContinueEnabled") then
		return "ScreenContinue"
	else
		return "ScreenGameOver"
	end
end

Branch = {
	Init = function() return "ScreenInit" end,
	AfterInit = function()
		if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
			return Branch.TitleMenu()
		else
			return "ScreenLogo"
		end
	end,
	NoiseTrigger = function()
		local hour = Hour()
		return hour > 3 and hour < 6 and "ScreenNoise" or "ScreenHighScores"
	end,
	TitleMenu = function()
		if GAMESTATE:GetCoinMode() == "CoinMode_Home" then
			return "ScreenTitleMenu"
		end
		if GAMESTATE:GetCoinsNeededToJoin() > GAMESTATE:GetCoins() then
			return "ScreenTitleJoin"
		else
			return "ScreenTitleJoin"
		end
	end,
	AfterTitleMenu = function()
		if PREFSMAN:GetPreference("ShowCaution") then
			return "ScreenCaution"
		else
			return Branch.StartGame()
		end
	end,
	StartGame = function()
		if SONGMAN:GetNumSongs() == 0 and SONGMAN:GetNumAdditionalSongs() == 0 then
			return "ScreenHowToInstallSongs"
		end
		if PROFILEMAN:GetNumLocalProfiles() >= 2 then
			return "ScreenSelectProfile"
		else
			if IsNetConnected() then
				return "ScreenSelectStyle"
			else
				if THEME:GetMetric("Common","AutoSetStyle") == false then
					return "ScreenSelectStyle"
				else
					return "ScreenProfileLoad"
				end
			end
		end
	end,
	OptionsEdit = function()
		if SONGMAN:GetNumSongs() == 0 and SONGMAN:GetNumAdditionalSongs() == 0 then
			return "ScreenHowToInstallSongs"
		end
		return "ScreenOptionsEdit"
	end,
	AfterSelectStyle = function()
		if IsNetConnected() then
			ReportStyle()
			GAMESTATE:ApplyGameCommand("playmode,regular")
		end
		if IsNetSMOnline() then
			return SMOnlineScreen()
		end
		if IsNetConnected() then
			return "ScreenNetRoom"
		end
		return "ScreenProfileLoad"
	end,
	AfterSelectProfile = function()
		if ( THEME:GetMetric("Common","AutoSetStyle") == true ) then
			return IsNetConnected() and "ScreenSelectStyle" or "ScreenSelectPlayMode"
		else
			return "ScreenSelectStyle"
		end
	end,
	AfterProfileLoad = function()
		--TODO: enable sel char screen
		return "ScreenSelectMusic"
	end,
	AfterProfileSave = function()
		if GAMESTATE:IsEventMode() then
			return SelectMusicOrCourse()
		elseif STATSMAN:GetCurStageStats():AllFailed() then
			return GameOverOrContinue()
		elseif GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer() == 0 then
			if not GAMESTATE:IsCourseMode() then
				return "ScreenEvaluationSummary"
			else
				return GameOverOrContinue()
			end
		else
			return SelectMusicOrCourse()
		end
	end,
	GetGameInformationScreen = function()
		bTrue = PREFSMAN:GetPreference("ShowInstructions")
		return (bTrue and GoToMusic() or "ScreenGameInformation")
	end,
	AfterSMOLogin = SMOnlineScreen(),
	BackOutOfPlayerOptions = function()
		return SelectMusicOrCourse()
	end,
	BackOutOfStageInformation = function()
		return SelectMusicOrCourse()
	end,
	AfterSelectMusic = function()
		if SCREENMAN:GetTopScreen():GetGoToOptions() then
			return SelectFirstOptionsScreen()
		else
			return "ScreenStageInformation"
		end
	end,
	PlayerOptions = function()
		local pm = GAMESTATE:GetPlayMode()
		local restricted = { PlayMode_Oni= true, PlayMode_Rave= true,
		}
		local optionsScreen = "ScreenPlayerOptions"
		if restricted[pm] then
			optionsScreen = "ScreenPlayerOptionsRestricted"
		end
		if SCREENMAN:GetTopScreen():GetGoToOptions() then
			return optionsScreen
		else
			return "ScreenStageInformation"
		end
	end,
	SongOptions = function()
		if SCREENMAN:GetTopScreen():GetGoToOptions() then
			return "ScreenSongOptions"
		else
			return "ScreenStageInformation"
		end
	end,
	GameplayScreen = function()
		return IsRoutine() and "ScreenGameplayShared" or "ScreenGameplay"
	end,
	EvaluationScreen= function()
		if IsNetSMOnline() then
			return "ScreenNetEvaluation"
		else
			if getenv("advMode") == "Survival" then
				return "ScreenEvaluationSurvival"
			elseif getenv("advMode") == "Comboch" then
				return "ScreenEvaluationComboCh"
			else
				return "ScreenEvaluationNormal"
			end
		end
	end,
	AfterGameplay = function()
		-- pick an evaluation screen based on settings.
		if THEME:GetMetric("ScreenHeartEntry", "HeartEntryEnabled") then
			local go_to_heart= false
			for i, pn in ipairs(GAMESTATE:GetEnabledPlayers()) do
				local profile= PROFILEMAN:GetProfile(pn)
				if profile and profile:GetIgnoreStepCountCalories() then
					go_to_heart= true
				end
			end
			if go_to_heart then
				return "ScreenHeartEntry"
			end
			return Branch.EvaluationScreen()
		else
			--Check if is an advanced mode
			if getenv("advMode") == "Survival" or getenv("advMode") == "Comboch" then
				if STATSMAN:GetCurStageStats():AllFailed() then
					return Branch.EvaluationScreen()
				else
					return "ScreenStageAdv"
				end
			end
			return Branch.EvaluationScreen()
		end
	end,
	AfterHeartEntry= function()
		return Branch.EvaluationScreen()
	end,
	AfterEvaluation = function()
		if GAMESTATE:IsCourseMode() then
			return "ScreenProfileSave"
		else
			local maxStages = PREFSMAN:GetPreference("SongsPerPlay")
			local stagesLeft = GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer()
			local allFailed = STATSMAN:GetCurStageStats():AllFailed()
			local song = GAMESTATE:GetCurrentSong()

			if GAMESTATE:IsEventMode() or stagesLeft >= 1 then
				return "ScreenProfileSave"
			elseif song:IsLong() and maxStages <= 2 and stagesLeft < 1 and allFailed then
				return "ScreenProfileSaveSummary"
			elseif song:IsMarathon() and maxStages <= 3 and stagesLeft < 1 and allFailed then
				return "ScreenProfileSaveSummary"
			elseif maxStages >= 2 and stagesLeft < 1 and allFailed then
				return "ScreenProfileSaveSummary"
			elseif allFailed then
				return "ScreenProfileSaveSummary"
			else
				return "ScreenProfileSave"
			end
		end
	end,
	AfterSummary = function()
		return "ScreenProfileSaveSummary"
	end,
	Network = function()
		return IsNetConnected() and "ScreenTitleMenu" or "ScreenTitleMenu"
	end,
 	AfterSaveSummary = function()
		return GameOverOrContinue()
	end,
	AfterContinue = function()
		if GAMESTATE:GetNumPlayersEnabled() == 0 then
			return "ScreenGameOver"
		end

		if STATSMAN:GetStagesPlayed() == 0 then
			return "ScreenSelectStyle"
		end

		return "ScreenProfileLoad"
	end
}
