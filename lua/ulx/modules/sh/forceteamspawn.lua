local ulx_team_table = {  
"Hunters",
"Props", 
"Spectator"
}

function ulx.forceteamspawn( calling_ply, target_plys, team, should_reset )

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
			v:Spawn()
		end

		ulx.fancyLogAdmin( calling_ply, "#A set the team for #T to #s and spawned", target_plys, team )
		
	else
	
		for _, v in ipairs( target_plys ) do 
			v:Kill()
			v:SetTeam( TEAM_SPECTATOR )
			v:Spawn()
		end
		
		ulx.fancyLogAdmin( calling_ply, "#A reset the team for #T", target_plys )
		
	end
	
end
local forceteamspawn = ulx.command( "Prop Hunt", "ulx forceteamspawn", ulx.forceteamspawn, "!fts" )
forceteamspawn:addParam{ type=ULib.cmds.PlayersArg }
forceteamspawn:addParam{ type=ULib.cmds.StringArg, hint="Select a Team", completes=ulx_team_table, ULib.cmds.restrictToCompletes }
forceteamspawn:addParam{ type=ULib.cmds.BoolArg, invisible=true }
forceteamspawn:defaultAccess( ULib.ACCESS_ADMIN )
forceteamspawn:help( "Set a player's team." )
forceteamspawn:setOpposite( "ulx resetteamspawn", { _, _, _, true }, "!resetteamspawn" )
