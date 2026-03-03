hotas = nil -- Warthog hota

local status, err = pcall(function () 
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
end)

if not status then
    mapper.print('Warthog Throttle not connected!')
else
    mapper.print('Warthog Throttle connected!')
end

local status, err = pcall(function () 
    stecs = mapper.device{
        name = 'STECS',
        type = 'dinput',
        identifier = {name = 'S-TECS MODERN THROTTLE STANDARD STEM '},
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
            {name="button48", modtype="button"},
            {name="button49", modtype="button"},
            {name="button50", modtype="button"},
            {name="button51", modtype="button"},
            {name="button52", modtype="button"},
            {name="button53", modtype="button"},
            {name="button54", modtype="button"},
            {name="button55", modtype="button"},
            {name="button56", modtype="button"},
            {name="button57", modtype="button"},
            {name="button58", modtype="button"},
            {name="button59", modtype="button"},
            {name="button60", modtype="button"},
            {name="button61", modtype="button"},
            {name="button62", modtype="button"},
            {name="button63", modtype="button"},
            {name="button64", modtype="button"},
        }
    }
end)

if not status then
    mapper.print('STECS Throttle not connected!')
else
    mapper.print('STECS Throttle connected!')
end


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

-- rudder = mapper.device{
--     name = 'Rudder',
--     type = 'dinput',
--     identifier = {name = 'VPC ACE-Torq Rudder'},
-- }

joystick = mapper.device{
    name = 'Joystick',
    type = 'dinput',
    identifier = {name = 'R-VPC Stick WarBRD'},
     modifiers = {
        {name="x", modtype="button"},
        {name="y", modtype="button"},
        {name="button12", modtype="button"},
        {name="button14", modtype="button"},
        {name="button15", modtype="button"},
        {name="button16", modtype="button"},
        {name="button17", modtype="button"},
        {name="button18", modtype="button"},
     },   

}

panel_events = panel:get_events()

if hotas then
    hotas_events = hotas:get_events()
end

if stecs then
    stecs_events = stecs:get_events()
end

--rudder_events = rudder:get_events()
joystick_events = joystick:get_events()

--  set-up virtual joystick
vjoy = mapper.virtual_joystick(1)

-- vjoy_mixture_1 = vjoy:get_axis('x')
-- vjoy_mixture_2 = vjoy:get_axis('y') 
-- vjoy_prop_1 = vjoy:get_axis('z')
-- vjoy_prop_2 = vjoy:get_axis('rx')
-- vjoy_throttle_1 = vjoy:get_axis('ry')
-- vjoy_throttle_2 = vjoy:get_axis('rz')
-- vjoy_elevator_trim = vjoy:get_axis('slider1')


vjoy2 = mapper.virtual_joystick(2)

left_brake_axis = vjoy2:get_axis('slider1')
right_brake_axis = vjoy2:get_axis('slider2')


-- common bindings
if hotas_events then
    vr_toggle = hotas_events.button7.change
    vr_center =  hotas_events.button8.change
elseif stecs_events then
    vr_toggle = stecs_events.button29.down
    vr_center =  stecs_events.button30.down
end

function is_beech(name) 
    local beech_prefix = 'Beechcraft D18S'
    return string.sub(name, 1, string.len(beech_prefix)) == beech_prefix
end

function is_wilga(name)
    local wilga_prefix = 'Wilga'
    return string.sub(name, 1, string.len(wilga_prefix)) == wilga_prefix
end

function is_dc3(name)
    local dc3_prefix = 'Douglas DC-3'
    return string.sub(name, 1, string.len(dc3_prefix)) == dc3_prefix
end

function is_aerostar(name)
    local aerostar_prefix = 'A2A Piper Aerostar 600'
    return string.sub(name, 1, string.len(aerostar_prefix)) == aerostar_prefix
end

function is_baron(name)
    local baron_prefix = 'Black Square Baron'
    return string.sub(name, 1, string.len(baron_prefix)) == baron_prefix
end

function is_dirty30(name)
    local d30_prefix = 'C-130J'
    return string.sub(name, 1, string.len(d30_prefix)) == d30_prefix
end

-- aircraft description events
local aircraft_engine_type_event = mapper.register_event('Aircraft Engine Type')
msfs.mfwasm.add_observed_data{
    {
        event = aircraft_engine_type_event,
        rpn='(A:ENGINE TYPE, Enum)',
        epsilon=0
    }
}
local aircraft_engine_type = 0

-- openxr menu
openxr_up = joystick_events.button15.down
openxr_down = joystick_events.button17.down
openxr_left = joystick_events.button18.down
openxr_right = joystick_events.button16.down



mapper.set_primary_mappings({
    -- observe aircraft properties
    {
        event = aircraft_engine_type_event,
        action = function(_, val) 
            aircraft_engine_type = val
            mapper.print('Aircraft engine type: ' .. aircraft_engine_type)
        end
    },

    -- loading aircraft specific ones
    {
        event = mapper.events.change_aircraft,
        action = function(_, at) 
            if at.aircraft then
                if is_beech(at.aircraft) then
                    mapper.print('Beech! Loading dedicated mappings...')
                    require('beech')
                    mapper.set_secondary_mappings(beech_mappings)
                elseif is_wilga(at.aircraft) then
                    mapper.print('Wilga! Loading dedicated mappings...')
                    require('wilga')
                    mapper.set_secondary_mappings(wilga_mappings)
                -- elseif is_dc3(at.aircraft) then
                --     mapper.print('DC-3! Loading dedicated mappings...')
                --     require('dc3')
                --     mapper.set_secondary_mappings(dc3_mappings)
                elseif is_aerostar(at.aircraft) then
                    mapper.print('Aerostar! Loading dedicated mappings...')
                    require('aerostar')
                    mapper.set_secondary_mappings(aerostar_mappings)
                elseif is_baron(at.aircraft) then
                    mapper.print('Baron! Loading dedicated mappings...')
                    require('baron')
                    mapper.set_secondary_mappings(baron_mappings)
                elseif is_dirty30(at.aircraft) then
                    mapper.print('Dirty 30! Loading dedicated mappings...')
                    require('dirty30')
                    mapper.set_secondary_mappings(dirty30_mappings)
                else
                    mapper.print('Other aircraft. Loading generic mappings')
                    require('generic')
                    mapper.set_secondary_mappings(generic_mappings)
                end
            else
                mapper.print('Sim disconnected')
                mapper.set_secondary_mappings({})
            end
        end
    },

    -- openxr
    {
        event = openxr_up,
        action = mapper.keystroke{codes={'VK_F2'}, modifiers={'VK_LCONTROL', 'VK_SHIFT'}}:synthesizer()
    },
    {
        event = openxr_down,
        action = mapper.keystroke{codes={'VK_F2'}, modifiers={'VK_LCONTROL'}}:synthesizer()
    },
    {
        event = openxr_left,
        action = mapper.keystroke{codes={'VK_F1'}, modifiers={'VK_LCONTROL'}}:synthesizer()
    },
    {
        event = openxr_right,
        action = mapper.keystroke{codes={'VK_F3'}, modifiers={'VK_LCONTROL'}}:synthesizer()
    },
})

if vr_toggle and vr_center then
    mapper.print('VR toggle and center buttons found. Adding mappings...')
    mapper.add_primary_mappings({
        -- common mappings - aircraft agnostic
        {
            event = vr_toggle,
            action = vjoy:get_button(1):value_setter()
        },
        {
            event = vr_center,
            action = vjoy:get_button(2):value_setter()
        },
    })
end

