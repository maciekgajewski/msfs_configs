-- generic bindings for any other plane

parking_brake_toggle = stecs_events.button41.down

gear_up = stecs_events.button53.down
gear_down = stecs_events.button54.down

flaps_up = stecs_events.button61.down
flaps_mid = stecs_events.button61.up
flaps_mid_alt = stecs_events.button62.up
flaps_down = stecs_events.button62.down

-- HDG and CRS knobs
ap_hdg_enc_dec = stecs_events.button55.down
ap_hdg_enc_inc = stecs_events.button56.down
ap_hdg_enc_push = stecs_events.button59.down

ap_crs_enc_dec = stecs_events.button57.down
ap_crs_enc_inc = stecs_events.button58.down
ap_crs_enc_push = stecs_events.button60.down

-- Alt knobs
ap_vs_enc_dec = panel_events.button38.down
ap_vs_enc_inc = panel_events.button39.down
ap_vs_enc_push = panel_events.button37.down

ap_alt_enc_dec = panel_events.button42.down
ap_alt_enc_inc = panel_events.button41.down
ap_alt_enc_push = panel_events.button40.down

ap_mode_alt_hold = stecs_events.button37.down
ap_mode_vs_hold = stecs_events.button35.down
ap_mode_hdg = stecs_events.button38.down
ap_mode_nav = stecs_events.button36.down
ap_mode_apr = stecs_events.button19.down
ap_disengage = stecs_events.button10.down

-- AP switches
ap_on = stecs_events.button50.down
ap_off = stecs_events.button52.down
yaw_damper_on = stecs_events.button47.down
yaw_damper_off = stecs_events.button49.down

-- upper light panel
lights_button_landing = panel_events.button8.down
lights_button_taxi = panel_events.button9.down
light_button_wing = panel_events.button10.down
lights_button_nav = panel_events.button11.down
lights_button_strobe_low = panel_events.button12.down
lights_button_anti_collision = panel_events.button13.down


starship_mappings = {


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

    -- == CHP-850 Course/Heading Panel == --
    {
        event = ap_hdg_enc_dec,
        action =  msfs.mfwasm.rpn_executer('(>H:CHP_HeadingKnob_Left)')
    },
    {
        event = ap_hdg_enc_inc,
        action =  msfs.mfwasm.rpn_executer('(>H:CHP_HeadingKnob_Right)')
    },
    {
        event = ap_hdg_enc_push,
        action =  msfs.mfwasm.rpn_executer('(>H:CHP_HeadingKnobPush)')
    },

    {
        event = ap_crs_enc_dec,
        action =  msfs.mfwasm.rpn_executer('(>H:CHP_CourseKnob_Left_1)')
    },
    {
        event = ap_crs_enc_inc,
        action =  msfs.mfwasm.rpn_executer('(>H:CHP_CourseKnob_Right_1)')
    },
    {
        event = ap_crs_enc_push,
        action =  msfs.mfwasm.rpn_executer('(>H:CHP_CourseKnobPush_1)')
    },

    -- ALI-850A Altitude/Vertical Speed Indicator (ALI) --
    {
        event = ap_vs_enc_dec,
        action =  msfs.mfwasm.rpn_executer('(>H:ALT_VerticalSpeedKnob_Dec_1)')
    },
    {
        event = ap_vs_enc_inc,
        action =  msfs.mfwasm.rpn_executer('(>H:ALT_VerticalSpeedKnob_Inc_1)')
    },
    {
        event = ap_vs_enc_push,
        action =  msfs.mfwasm.rpn_executer('(>H:ALT_VerticalSpeedKnobPush_1)')
    },

    {
        event = ap_alt_enc_dec,
        action =  msfs.mfwasm.rpn_executer('(>H:ALT_AltitudeSelectKnob_Dec_1)')
    },
    {
        event = ap_alt_enc_inc,
        action =  msfs.mfwasm.rpn_executer('(>H:ALT_AltitudeSelectKnob_Inc_1)')
    },
    {
        event = ap_alt_enc_push,
        action =  msfs.mfwasm.rpn_executer('(>H:ALT_AltitudeSelectKnobPush_1)')
    },

    -- ==- AP == --
    {
        event = ap_mode_alt_hold,
        action =  msfs.mfwasm.rpn_executer('(>H:MSP_Altitude_1)')
    },
    {
        event = ap_mode_vs_hold,
        action =  msfs.mfwasm.rpn_executer('(>H:MSP_VerticalSpeed_1)')
    },
    {
        event = ap_mode_hdg,
        action =  msfs.mfwasm.rpn_executer('(>H:MSP_Heading_1)')
    },
    {
        event = ap_mode_nav,
        action =  msfs.mfwasm.rpn_executer('(>H:MSP_Nav_1)')
    },
    {
        event = ap_mode_apr,
        action =  msfs.mfwasm.rpn_executer('(>H:MSP_Approach_1)')
    },
    {
        event = ap_disengage,
        action =  msfs.mfwasm.rpn_executer('(>K:AUTOPILOT_DISENGAGE_TOGGLE)')
    },

    -- AP --
-- ap_on = stecs_events.button50.down
-- ap_off = stecs_events.button42.down
-- yaw_dampener_on = stecs_events.button47.down
-- yaw_dampener_off = stecs_events.button49.down
    {
        event = ap_on,
        action =  msfs.mfwasm.rpn_executer('(A:AUTOPILOT MASTER, Bool) ! if{ (>K:AP_MASTER) }')
    },
    {
        event = ap_off,
        action =  msfs.mfwasm.rpn_executer('(A:AUTOPILOT MASTER, Bool) if{ (>K:AP_MASTER) }')
    },
    {
        event = yaw_damper_on,
        action =  msfs.mfwasm.rpn_executer('(>K:YAW_DAMPER_ON)')
    },
    {
        event = yaw_damper_off,
        action =  msfs.mfwasm.rpn_executer('(>K:YAW_DAMPER_OFF)')
    },


    -- External Lights panel --
-- upper light panel
-- lights_button_landing = panel_events.button8.down
-- lights_button_taxi = panel_events.button9.down
-- light_button_wing = panel_events.button10.down
-- lights_button_nav = panel_events.button11.down
-- lights_button_strobe_low = panel_events.button12.down
-- lights_button_anti_collision = panel_events.button13.down
    {
        event = lights_button_landing,
        -- works funnu: swithces dirst wing, then nose
        --action = msfs.mfwasm.rpn_executer('(A:LIGHT LANDING, Bool) ! if{ 1 1 (>K:2:LANDING_LIGHTS_SET) 1 2 (>K:2:LANDING_LIGHTS_SET) } els{ 0 1 (>K:2:LANDING_LIGHTS_SET) 0 2 (>K:2:LANDING_LIGHTS_SET) }')
        
        -- toggles  only wing
        --action = msfs.mfwasm.rpn_executer('(A:LIGHT LANDING, Bool) ! if{ 1 1 (>K:2:LANDING_LIGHTS_SET) 2 1 (>K:2:LANDING_LIGHTS_SET) } els{ 1 0 (>K:2:LANDING_LIGHTS_SET) 2 0 (>K:2:LANDING_LIGHTS_SET) }')

        action = msfs.mfwasm.rpn_executer('(A:LIGHT LANDING, Bool) ! if{ 1 1 (>K:2:LANDING_LIGHTS_SET) 0 1 (>K:2:LANDING_LIGHTS_SET) } els{ 1 0 (>K:2:LANDING_LIGHTS_SET) 0 0 (>K:2:LANDING_LIGHTS_SET) }')
    },
    {
        event = lights_button_taxi,
        action = msfs.mfwasm.rpn_executer('(>K:TOGGLE_TAXI_LIGHTS)')
    },
    {
        event = light_button_wing,
        action = msfs.mfwasm.rpn_executer('(>K:TOGGLE_WING_LIGHTS)')
    },
    {
        event = lights_button_nav,
        action = msfs.mfwasm.rpn_executer('(>K:TOGGLE_NAV_LIGHTS)')
    },
    {
        event = lights_button_strobe_low,
        action = msfs.mfwasm.rpn_executer('(L:var_StrobeLight_Low, Bool) ! (>L:var_StrobeLight_Low, Bool)')
    },
    {
        event = lights_button_anti_collision,
        action = msfs.mfwasm.rpn_executer('(L:var_StrobeLight_High, Bool) ! (>L:var_StrobeLight_High, Bool)')
    },



}