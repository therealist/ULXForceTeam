local ulx_team_table = {  
"Hunters",
"Props", 
"Spectator"
}

function ulx.forceteam( calling_ply, target_plys, team, should_reset )

	if not should_reset then
	
		local teamarg2

		if team == "Hunters" then
			teamarg2 = TEAM_HUNTERS
		elseif team == "Props" then
			teamarg2 = TEAM_PROPS
		elseif team == "Spectator" then
			teamarg2 = TEAM_SPECTATOR
		end
		
		for _, v in ipairs( target_plys ) do
			v:Kill()
			v:SetTeam( teamarg2 )
		end

		ulx.fancyLogAdmin( calling_ply, "#A set the team for #T to #s", target_plys, team )
		
	else
	
		for _, v in ipairs( target_plys ) do 
			v:Kill()
			v:SetTeam( TEAM_SPECTATOR )
		end
		
		ulx.fancyLogAdmin( calling_ply, "#A reset the team for #T", target_plys )
		
	end
	
end
local forceteam = ulx.command( "Prop Hunt", "ulx forceteam", ulx.forceteam, "!forceteam" )
forceteam:addParam{ type=ULib.cmds.PlayersArg }
forceteam:addParam{ type=ULib.cmds.StringArg, hint="Select a Team", completes=ulx_team_table, ULib.cmds.restrictToCompletes }
forceteam:addParam{ type=ULib.cmds.BoolArg, invisible=true }
forceteam:defaultAccess( ULib.ACCESS_ADMIN )
forceteam:help( "Set a player's team." )
forceteam:setOpposite( "ulx resetteam", { _, _, _, true }, "!resetteam" )
