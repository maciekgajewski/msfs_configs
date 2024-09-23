
-- wilga bindings

parking_brake_on = hotas_events.button24.up
parking_brake_off = hotas_events.button24.down

flaps_up = hotas_events.button22.down
flaps_mid = hotas_events.button22.up
flaps_mid_alt = hotas_events.button23.up
flaps_down = hotas_events.button23.down

landing_light_on = hotas_events.button25.down
landing_light_off = hotas_events.button25.up

fd_toggle = hotas_events.button15.up
fd_heading_pitch = hotas_events.pov1.change

fd_heading_pitch_action = function(val)
    if val == 0 then
        msfs.mfwasm.execute_rpn('(>K:AP_VS_VAR_INC)')
    elseif val == 18000 then
        msfs.mfwasm.execute_rpn('(>K:AP_VS_VAR_DEC)')
    elseif val == 9000 then
        msfs.mfwasm.execute_rpn('(>K:HEADING_BUG_INC)')
    elseif val == 27000 then
        msfs.mfwasm.execute_rpn('(>K:HEADING_BUG_DEC)')
    end
end

heading_bug_inc = panel_events.button39.down
heading_bug_dec = panel_events.button38.down

tablet_hide = hotas_events.button20.up
tablet_show = hotas_events.button20.down

cooling_shutter_axis = panel_events.ry.change

wilga_mappings = {

    -- == Axes ==
    {
        event = panel_events.x.change,
        action = vjoy_mixture_1:value_setter()
    },
    {
        event = hotas_events.rz.change,
        action = filter.lerp(vjoy_prop_1:value_setter(),
        { -- wilga needs reversing the prop axis
            {-50000, 50000},
            {50000, -50000}
        })
    },
    {
        event = hotas_events.z.change,
        action = vjoy_throttle_1:value_setter()
    },

    {
        event = hotas_events.slider1.change,
        action = vjoy_elevator_trim:value_setter()
    },

    -- == Wheels ==
    {
        event = parking_brake_on,
        action =  msfs.mfwasm.rpn_executer('1 (>K:PARKING_BRAKE_SET,Bool)')
    },
    {
        event = parking_brake_off,
        action =  msfs.mfwasm.rpn_executer('0 (>K:PARKING_BRAKE_SET,Bool)')
    },

    -- == Flaps ==
    {
        event = flaps_up,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_UP)')
    },
    {
        event = flaps_mid,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_1)')
    },
    {
        event = flaps_mid_alt,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_1)')
    },
    {
        event = flaps_down,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_DOWN)')
    },

    -- == Landing light ==
    {
        event = landing_light_on,
        action =  msfs.mfwasm.rpn_executer('0 (>K:LANDING_LIGHTS_ON)')
    },
    {
        event = landing_light_off,
        action =  msfs.mfwasm.rpn_executer('0 (>K:LANDING_LIGHTS_OFF)')
    },

    -- == Flight Director ==
    {
        event = fd_toggle,
        action =  msfs.mfwasm.rpn_executer('0 (>K:TOGGLE_RECOGNITION_LIGHTS)')
    },
    {
        event = fd_heading_pitch,
        action = function(_, val) fd_heading_pitch_action(val) end
    },

    -- == Shutters ==
    {
        event = cooling_shutter_axis,
        action = filter.lerp(
            function(_, val) 
                msfs.send_event('SPOILERS_SET', val) -- this works. Why doesnt event sender?
            end,
            {
                {-50000, 0},
                {50000, 16383}
            })
    },

    -- == Tablet visibility ==
    {
        event = tablet_hide,
        action = msfs.mfwasm.rpn_executer('1 (>L:TABLET_HIDDEN)')
    },
    {
        event = tablet_show,
        action = msfs.mfwasm.rpn_executer('0 (>L:TABLET_HIDDEN)')
    },

    -- TODO add all the rest, go crazy :) 
}
