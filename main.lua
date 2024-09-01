hotas = mapper.device{
    name = 'Hotas',
    type = 'dinput',
    identifier = {name = 'Throttle - HOTAS Warthog'},
    modifiers = {
        {name="button0", modtype="button"},
        {name="button1", modtype="button"},
        {name="button2", modtype="button"},
        {name="button3", modtype="button"},
        {name="button4", modtype="button"},
        {name="button5", modtype="button"},
        {name="button6", modtype="button"},
        -- {name="button7", modtype="button"},
        -- {name="button8", modtype="button"},
        {name="button9", modtype="button"},
        {name="button10", modtype="button"},
        {name="button11", modtype="button"},
        {name="button12", modtype="button"},
        {name="button13", modtype="button"},
        {name="button14", modtype="button"},
        {name="button15", modtype="button"},
        {name="button16", modtype="button"},
        {name="button17", modtype="button"},
        {name="button18", modtype="button"},
        {name="button19", modtype="button"},
        {name="button20", modtype="button"},
        {name="button21", modtype="button"},
        {name="button22", modtype="button"},
        {name="button23", modtype="button"},
        {name="button24", modtype="button"},
        {name="button25", modtype="button"},
        {name="button26", modtype="button"},
        {name="button27", modtype="button"},
        {name="button28", modtype="button"},
        {name="button29", modtype="button"},
        {name="button30", modtype="button"},
        {name="button31", modtype="button"},
        {name="button32", modtype="button"},
    },
}

panel = mapper.device{
    name = 'Panel',
    type = 'dinput',
    identifier = {name = 'VPC Control Panel 3'},
    modifiers = {
        {name="button0", modtype="button"},
        {name="button1", modtype="button"},
        {name="button2", modtype="button"},
        {name="button3", modtype="button"},
        {name="button4", modtype="button"},
        {name="button5", modtype="button"},
        {name="button6", modtype="button"},
        {name="button7", modtype="button"},
        {name="button8", modtype="button"},
        {name="button9", modtype="button"},
        {name="button10", modtype="button"},
        {name="button11", modtype="button"},
        {name="button12", modtype="button"},
        {name="button13", modtype="button"},
        {name="button14", modtype="button"},
        {name="button15", modtype="button"},
        {name="button16", modtype="button"},
        {name="button17", modtype="button"},
        {name="button18", modtype="button"},
        {name="button19", modtype="button"},
        {name="button20", modtype="button"},
        {name="button21", modtype="button"},
        {name="button22", modtype="button"},
        {name="button23", modtype="button", modparam={repeat_interval=100}},
        {name="button24", modtype="button", modparam={repeat_interval=100}},
        {name="button25", modtype="button", modparam={repeat_interval=100}},
        {name="button26", modtype="button", modparam={repeat_interval=100}},
        {name="button27", modtype="button", modparam={repeat_interval=100}},
        {name="button28", modtype="button", modparam={repeat_interval=100}},
        {name="button29", modtype="button", modparam={repeat_interval=100}},
        {name="button30", modtype="button", modparam={repeat_interval=100}},
        {name="button31", modtype="button"},
        {name="button32", modtype="button"},
        {name="button33", modtype="button"},
        {name="button34", modtype="button"},
        {name="button35", modtype="button"},
        {name="button36", modtype="button"},
        {name="button37", modtype="button"},
        {name="button38", modtype="button"},
        {name="button39", modtype="button"},
        {name="button40", modtype="button"},
        {name="button41", modtype="button"},
        {name="button42", modtype="button"},
        {name="button43", modtype="button"},
        {name="button44", modtype="button"},
        {name="button45", modtype="button"},
        {name="button46", modtype="button"},
        {name="button47", modtype="button"},
    },
}

panel_events = panel:get_events()
hotas_events = hotas:get_events()


--  set-up virtual joystick
vjoy = mapper.virtual_joystick(1)

vjoy_mixture_1 = vjoy:get_axis('x')
vjoy_mixture_2 = vjoy:get_axis('y')
vjoy_prop_1 = vjoy:get_axis('z')
vjoy_prop_2 = vjoy:get_axis('rx')
vjoy_throttle_1 = vjoy:get_axis('ry')
vjoy_throttle_2 = vjoy:get_axis('rz')
vjoy_elevator_trim = vjoy:get_axis('slider1')


-- common bindings
vr_toggle = hotas_events.button7.change
vr_center =  hotas_events.button8.change

function is_beech(name) 
    local beech_prefix = 'Beechcraft D18S'
    return string.sub(name, 1, string.len(beech_prefix)) == beech_prefix
end

function is_wilga(name)
    local wilga_prefix = 'Wilga'
    return string.sub(name, 1, string.len(wilga_prefix)) == wilga_prefix
end

mapper.set_primary_mappings({
    -- common mappings - aircraft agnostic
    {
        event = vr_toggle,
        action = vjoy:get_button(1):value_setter()
    },
    {
        event = vr_center,
        action = vjoy:get_button(2):value_setter()
    },

    -- loading aricraft specific ones
    {
        event = mapper.events.change_aircraft,
        action = function(_, at) 
            if is_beech(at.aircraft) then
                mapper.print('Beech!')
                require('beech')
                mapper.set_secondary_mappings(beech_mappings)
            elseif is_wilga(at.aircraft) then
                mapper.print('Wilga!')
                require('wilga')
                mapper.set_secondary_mappings(wilga_mappings)
            else
                mapper.print('Unsupported aircraft')
                mapper.set_secondary_mappings({})
            end
        end
    }
})