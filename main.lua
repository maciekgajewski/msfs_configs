--  set-up virtual joystick
vjoy = mapper.virtual_joystick(1)

vjoy_mixture_1 = vjoy:get_axis('x')
vjoy_mixture_2 = vjoy:get_axis('y')
vjoy_prop_1 = vjoy:get_axis('z')
vjoy_prop_2 = vjoy:get_axis('rx')
vjoy_throttle_1 = vjoy:get_axis('ry')
vjoy_throttle_2 = vjoy:get_axis('rz')
vjoy_elevator_trim = vjoy:get_axis('slider1')


function is_beech(name) 
    local beech_prefix = 'Beechcraft D18S'
    return string.sub(name, 1, string.len(beech_prefix)) == beech_prefix
end

function is_wilga(name)
    local wilga_prefix = 'Wilga'
    return string.sub(name, 1, string.len(wilga_prefix)) == beech_prefix
end

mapper.set_primary_mappings({
    {
        event = mapper.events.change_aircraft,
        action = function(_, at) 
            if is_beech(at.aircraft) then
                mapper.print('Beech!')
                require('beech')
                mapper.set_secondary_mappings(beech_mappings)
            elseif is_wilga(at.aircraft) then
                mapper.print('Wilga!')
                -- TODO
            else
                mapper.print('Unsupported aircraft')
                mapper.set_secondary_mappings({})
            end
        end
    }
})