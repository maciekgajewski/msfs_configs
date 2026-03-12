-- Azurpoly Transall C-160

parking_brake_toggle = stecs_events.button41.down

gear_up = stecs_events.button53.down
gear_down = stecs_events.button54.down

flaps_up = stecs_events.button61.down
flaps_mid = stecs_events.button61.up
flaps_mid_alt = stecs_events.button62.up
flaps_down = stecs_events.button62.down

ap_master_toggle = stecs_events.button10.down

ap_heading_pitch_dec = stecs_events.button29.down
ap_heading_pitch_inc = stecs_events.button30.down
ap_heading_pitch_enc_dec = stecs_events.button55.down
ap_heading_pitch_enc_inc = stecs_events.button56.down

ap_vs_inc = stecs_events.button32.down
ap_vs_dec = stecs_events.button31.down

ap_hold_heading_toggle = stecs_events.button38.down
ap_hold_altitute_toggle = stecs_events.button37.down
ap_hold_radio_toggle = stecs_events.button35.down
ap_sel_heading_toggle = stecs_events.button36.down

hsi_cdi_inc = stecs_events.button58.down
hsi_cdi_dec = stecs_events.button57.down

-- lights
landing_lights_off = panel_events.button29.down
landing_lights_on = panel_events.button30.down

taxi_lights_off = panel_events.button27.down
taxi_lights_on = panel_events.button28.down

beacon_lights_off = panel_events.button25.down
beacon_lights_on = panel_events.button26.down

position_lights_off = panel_events.button23.down
position_lights_on = panel_events.button24.down

-- Electrical

battery_1_toggle = stecs_events.button39.down
battery_2_toggle = stecs_events.button40.down

generator_1_toggle = stecs_events.button42.down
generator_2_toggle = stecs_events.button43.down
generator_3_toggle = stecs_events.button44.down
generator_4_toggle = stecs_events.button45.down
generator_5_toggle = stecs_events.button46.down

-- engine

idle_level_left_norm    = stecs_events.button47.down
idle_level_left_start    = stecs_events.button49.down

idle_level_right_norm    = stecs_events.button50.down
idle_level_right_start    = stecs_events.button52.down

transall_mappings = {


    -- == Wheels ==
    {
        event = parking_brake_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:PARKING_BRAKES)')
    },
    {
        event = gear_up,
        action =  msfs.mfwasm.rpn_executer('(>K:GEAR_UP)')
    },
    {
        event = gear_down,
        action =  msfs.mfwasm.rpn_executer('(>K:GEAR_DOWN)')
    },

        -- AP --
    {
        event = ap_master_toggle,
        action =  msfs.mfwasm.rpn_executer('(>H:AZP_C160_AP_TOGGLE)')
    },
    {
        event = ap_hold_heading_toggle,
        action =  msfs.mfwasm.rpn_executer('(>H:AZP_C160_AP_HDG_HOLD_TOGGLE)')
    },
    {
        event = ap_sel_heading_toggle,
        action =  msfs.mfwasm.rpn_executer('(>H:AZP_C160_AP_HDG_SEL_TOGGLE)')
    },
    {
        event = ap_hold_altitute_toggle,
        action =  msfs.mfwasm.rpn_executer('(>H:AZP_C160_AP_ALT_TOGGLE)')
    },
    {
        event = ap_hold_radio_toggle,
        action =  msfs.mfwasm.rpn_executer('(>H:AZP_C160_AP_HDG_RADIO_TOGGLE)')
    },
    {
        event = ap_heading_pitch_dec,
        action =  msfs.mfwasm.rpn_executer('(>K:HEADING_BUG_DEC)')
    },
    {
        event = ap_heading_pitch_inc,
        action =  msfs.mfwasm.rpn_executer('(>K:HEADING_BUG_INC)')
    },
    {
        event = ap_heading_pitch_enc_dec,
        action =  msfs.mfwasm.rpn_executer('(>K:HEADING_BUG_DEC)')
    },
    {
        event = ap_heading_pitch_enc_inc,
        action =  msfs.mfwasm.rpn_executer('(>K:HEADING_BUG_INC)')
    },
    {
        event = ap_vs_inc,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_VS_VAR_INC)')
    },
    {
        event = ap_vs_dec,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_VS_VAR_DEC)')
    },
{
        event = hsi_cdi_inc,
        action = msfs.mfwasm.rpn_executer('1 (>K:VOR1_OBI_INC)')
    },
    {
        event = hsi_cdi_dec,
        action = msfs.mfwasm.rpn_executer('1 (>K:VOR1_OBI_DEC)') 
    },

        -- == Lights == --
    {
        event = landing_lights_off,
        action = msfs.mfwasm.rpn_executer('1 (>K:2:LANDING_LIGHTS_OFF) 2 (>K:2:LANDING_LIGHTS_OFF)')
    },
    {
        event = landing_lights_on,
        action = msfs.mfwasm.rpn_executer('1 (>K:2:LANDING_LIGHTS_ON) 2 (>K:2:LANDING_LIGHTS_ON)')
    },
    {
        event = taxi_lights_off,
        action = msfs.mfwasm.rpn_executer('(>H:AZP_C160_LIGHTING_TAXI_RETRACT)')
    },
    {
        event = taxi_lights_on,
        action = msfs.mfwasm.rpn_executer('(>H:AZP_C160_LIGHTING_TAXI_EXTEND)')
    },
    {
        event = beacon_lights_on,
        action = msfs.mfwasm.rpn_executer('(A:LIGHT BEACON, Bool) ! if{ (>K:TOGGLE_BEACON_LIGHTS) }')
    },
    {
        event = beacon_lights_off,
        action = msfs.mfwasm.rpn_executer('(A:LIGHT BEACON, Bool) if{ (>K:TOGGLE_BEACON_LIGHTS) }')
    },
    {
        event = position_lights_on,
        action = msfs.mfwasm.rpn_executer('(A:LIGHT NAV, Bool) ! if{ (>K:TOGGLE_NAV_LIGHTS) }')
    },
    {
        event = position_lights_off,
        action = msfs.mfwasm.rpn_executer('(A:LIGHT NAV, Bool) if{ (>K:TOGGLE_NAV_LIGHTS) }')
    },

    -- electrical
    {
        event = battery_1_toggle,
        action = msfs.mfwasm.rpn_executer('(L:AZP_C160_BAT1_GPU_SWITCH) 2 == if{ (>H:AZP_C160_SOURCE1_OFF) } els{ (>H:AZP_C160_SOURCE1_BAT1) }')
        
    },
    {
        event = battery_2_toggle,
        action = msfs.mfwasm.rpn_executer('(L:AZP_C160_BAT2_SWITCH) 1 == if{ (>H:AZP_C160_SOURCE2_OFF) } els{ (>H:AZP_C160_SOURCE2_ON) }')
    },
    {
        event = generator_1_toggle,
        action = msfs.mfwasm.rpn_executer('(L:AZP_C160_G1_SWITCH) if{ (>H:AZP_C160_G1_KNOB_OFF) } els{ (>H:AZP_C160_G1_KNOB_ON) }')
    },
    {
        event = generator_2_toggle,
        action = msfs.mfwasm.rpn_executer('(L:AZP_C160_G2_SWITCH) if{ (>H:AZP_C160_G2_KNOB_OFF) } els{ (>H:AZP_C160_G2_KNOB_ON) }')
    },
    {
        event = generator_3_toggle,
        action = msfs.mfwasm.rpn_executer('(L:AZP_C160_G3_SWITCH) if{ (>H:AZP_C160_G3_KNOB_OFF) } els{ (>H:AZP_C160_G3_KNOB_ON) }')
    },
    {
        event = generator_4_toggle,
        action = msfs.mfwasm.rpn_executer('(L:AZP_C160_G4_SWITCH) if{ (>H:AZP_C160_G4_KNOB_OFF) } els{ (>H:AZP_C160_G4_KNOB_ON) }')
    },
    {
        event = generator_5_toggle,
        action = msfs.mfwasm.rpn_executer('(L:AZP_C160_G5_SWITCH) 1 == if{ (>H:AZP_C160_G5_KNOB_ON)  } els{ (>H:AZP_C160_G5_KNOB_OFF) }')
    },

    -- idle levelrs
    {
        event = idle_level_left_norm,
        action = msfs.mfwasm.rpn_executer('0 (>L:AZP_C160_ENGINE_IDLE_LEVER_POSIION:1, percent)')
    },
    {
        event = idle_level_left_start,
        action = msfs.mfwasm.rpn_executer('100 (>L:AZP_C160_ENGINE_IDLE_LEVER_POSIION:1, percent)')
    },
    {
        event = idle_level_right_norm,
        action = msfs.mfwasm.rpn_executer('0 (>L:AZP_C160_ENGINE_IDLE_LEVER_POSIION:2, percent)')
    },
    {
        event = idle_level_right_start,
        action = msfs.mfwasm.rpn_executer('100 (>L:AZP_C160_ENGINE_IDLE_LEVER_POSIION:2, percent)')
    },


}