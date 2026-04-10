
-- == Bindings for Got Firends Wilga ==

parking_brake_toggle = stecs_events.button41.down

flaps_up = stecs_events.button61.down
flaps_mid = stecs_events.button61.up
flaps_mid_alt = stecs_events.button62.up
flaps_down = stecs_events.button62.down

landing_light_on = stecs_events.button53.down
landing_light_off = stecs_events.button54.down

fd_toggle = stecs_events.button10.down

fp_heading_pitch_dec = stecs_events.button29.down
fp_heading_pitch_inc = stecs_events.button30.down
fp_vs_inc = stecs_events.button32.down
fp_vs_dec = stecs_events.button31.down

heading_bug_inc = panel_events.button39.down
heading_bug_dec = panel_events.button38.down

tablet_hide = stecs_events.button49.down
tablet_show = stecs_events.button47.down

cooling_shutter_axis = panel_events.ry.change

-- radio
freq_knob_inc = panel_events.button42.down
freq_knob_dec = panel_events.button41.down
freq_knob_press = panel_events.button40.down
freq_swap = panel_events.button13.down


wilga_mappings = {

    -- == Wheels ==
    {
        event = parking_brake_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:PARKING_BRAKES)')
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
        event = fp_heading_pitch_dec,
        action = msfs.mfwasm.rpn_executer('0 (>K:HEADING_BUG_DEC)')
    },
    {
        event = fp_heading_pitch_inc,
        action = msfs.mfwasm.rpn_executer('0 (>K:HEADING_BUG_INC)')
    },
    {
        event = fp_vs_inc,
        action = msfs.mfwasm.rpn_executer('0 (>K:AP_VS_VAR_INC)')
    },
    {
        event = fp_vs_dec,
        action = msfs.mfwasm.rpn_executer('0 (>K:AP_VS_VAR_DEC)')
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
    -- == Radio ==
    -- {
    --     event = freq_knob_inc,
    --     --action = msfs.mfwasm.rpn_executer('(L:MACIEK_SET_COM_WHOLE, Numeric) 1 == if{ 1 (>L:GTN750_PANEL_KnobLargeInc) } els{ 1 (>L:GTN750_PANEL_KnobSmallInc) }')
    --     action = msfs.mfwasm.rpn_executer('(O:_KnobAnimVar) 10 + dnor (>O:_KnobAnimVar) (>H:GTN750_KnobLargeInc) 1 (>L:TDSGTNXI750U1_RKnobOuterInc)')
    -- },
    -- {
    --     event = freq_knob_dec,
    --     -- action = msfs.mfwasm.rpn_executer('(L:MACIEK_SET_COM_WHOLE, Numeric) 1 == if{ 1 (>L:GTN750_PANEL_KnobLargeDec) } els{ 1 (>L:GTN750_PANEL_KnobSmallDec) }')
    --     action = msfs.mfwasm.rpn_executer('(O:_KnobAnimVar) 10 - dnor (>O:_KnobAnimVar) (>H:GTN750_KnobLargeDec) 1 (>L:TDSGTNXI750U1_RKnobOuterDec)')
    -- },
    -- {
    --     event = freq_knob_press,
    --     action = msfs.mfwasm.rpn_executer('(L:MACIEK_SET_COM_WHOLE, Numeric) 1 == if{ 0 (>L:MACIEK_SET_COM_WHOLE, Numeric) } els{ 1 (>L:MACIEK_SET_COM_WHOLE, Numeric) }')
    -- },
    -- {
    --     event = freq_swap,
    --     --action = msfs.mfwasm.rpn_executer('(>K:COM1_RADIO_SWAP)')
    --     action = msfs.mfwasm.rpn_executer('(>H:GTN_COM_Switch)')
    -- }

    -- TODO add all the rest, go crazy :) 
}
