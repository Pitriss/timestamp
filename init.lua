--[[

Seperated timestamp modification

v: 398864

Latest changes:
included suggestions from pitriss

]]

local format_string = '%H:%M'

function format_message( message )
	local raw_time = os.date( format_string )
	return raw_time..'] '..message
end

minetest.register_on_chat_message( function( name, message )
	-- minetest.chat_send_all( '<'..name..'> '..format_message( message ), false )
	for _, player in pairs( minetest.get_connected_players() ) do
		if name ~= player:get_player_name() then
			minetest.chat_send_player( player:get_player_name(), '<'..name..'> '..format_message( message ), false )
		end
	end
	return true
end )

local tmp_str_frmt = minetest.setting_get( 'time_format' )

if tmp_str_frmt and not tonumber( tmp_str_frmt ) then
	format_string = tmp_str_frmt
end
