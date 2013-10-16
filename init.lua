--[[

Seperated timestamp modification

v: 333328

]]

function format_message( message )
	local raw_time = os.date( '*t' )
	local hours = nil
	local minutes = nil
	if raw_time.hour < 10 then
		hours = '0'..raw_time.hour
	else
		hours = raw_time.hour
	end
	if raw_time.min < 10 then
		minutes = '0'..raw_time.min
	else
		minutes = raw_time.min
	end
	return hours..':'..minutes..'] '..message
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
