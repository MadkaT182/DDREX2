local c;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");
local PulseLabel = THEME:GetMetric("Combo", "PulseLabelCommand");

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local LabelMinZoom = THEME:GetMetric("Combo", "LabelMinZoom");
local LabelMaxZoom = THEME:GetMetric("Combo", "LabelMaxZoom");

local t = Def.ActorFrame {
	InitCommand=cmd(vertalign,bottom);
	LoadFont( "Combo", "numbers" ) .. {
		Name="Number";
		OnCommand=THEME:GetMetric("Combo", "NumberOnCommand");
	};
	LoadActor("_combo") .. {
		Name="Label";
		OnCommand=THEME:GetMetric("Combo", "LabelOnCommand");
	};
	LoadFont("Challenge","Combo")..{
		Name="ChNumber";
		OnCommand=THEME:GetMetric("ChallengeCombo", "NumberOnCommand");	
	};
	LoadActor("_ch_combo")..{
		Name="ChLabel";
		OnCommand=THEME:GetMetric("ChallengeCombo", "LabelOnCommand");	
	};

	InitCommand = function(self)
		c = self:GetChildren();
		c.Number:visible(false);
		c.Label:visible(false);
		c.ChNumber:visible(false);
		c.ChLabel:visible(false);
	end;

	ComboCommand=function(self, param)
		local iCombo = param.Combo;
		if not iCombo or iCombo < ShowComboAt or getenv("advMode") == "Survival" then
			c.Number:visible(false);
			c.Label:visible(false);
			return;
		end

		c.Label:visible(false);

		param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );

		param.LabelZoom = scale( iCombo, 0, NumberMaxZoomAt, LabelMinZoom, LabelMaxZoom );
		param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, LabelMaxZoom );

		if getenv("advMode") == "Comboch" then
			c.ChNumber:visible(true);
			c.ChLabel:visible(true);
			c.ChNumber:settext( string.format("%i", iCombo) );
		else
			c.Number:visible(true);
			c.Label:visible(true);
			c.Number:settext( string.format("%i", iCombo) );
		end
		
		-- Pulse
		Pulse( c.Number, param );
		PulseLabel( c.Label, param );
		Pulse( c.ChNumber, param );
		PulseLabel( c.ChLabel, param );
	end;
};

return t;
