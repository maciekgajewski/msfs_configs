-- Blacksquare Baron Pro

parking_brake_toggle = stecs_events.button41.down

gear_up = stecs_events.button53.down
gear_down = stecs_events.button54.down

flaps_up = stecs_events.button61.down
flaps_mid = stecs_events.button61.up
flaps_mid_alt = stecs_events.button62.up
flaps_down = stecs_events.button62.down

left_fuel_sel_off = panel_events.button16.down
left_fuel_sel_on = panel_events.button15.down
left_fuel_sel_xfeed = panel_events.button14.down

right_fuel_sel_off = panel_events.button36.down
right_fuel_sel_on = panel_events.button35.down
right_fuel_sel_xfeed = panel_events.button34.down

left_magneto_both_alt =  stecs_events.button48.up
left_magneto_start =  stecs_events.button48.down

right_magneto_both_alt =  stecs_events.button51.up
right_magneto_start =  stecs_events.button51.down

left_fuel_booster_on = stecs_events.button47.down
left_fuel_booster_off = stecs_events.button49.down

right_fuel_booster_on = stecs_events.button50.down
right_fuel_booster_off = stecs_events.button52.down

ap_master_toggle = stecs_events.button10.down

ap_heading_pitch_dec = stecs_events.button31.down
ap_heading_pitch_inc = stecs_events.button32.down

ap_vs_inc = stecs_events.button34.down
ap_vs_dec = stecs_events.button33.down

ap_hold_heading_toggle = stecs_events.button38.down
ap_hold_altitute_toggle = stecs_events.button37.down
ap_hold_pitch_toggle = stecs_events.button35.down
ap_hold_nav_toggle = stecs_events.button36.down

hsi_cdi_inc = panel_events.button39.down
hsi_cdi_dec = panel_events.button38.down

-- lights
landing_light_toggle_left = stecs_events.button39.down
landing_light_toggle_right = stecs_events.button40.down

taxi_light_on = panel_events.button29.down
taxi_light_off = panel_events.button30.down
nav_light_on = panel_events.button27.down
nav_light_off = panel_events.button28.down
beacon_light_on = panel_events.button25.down
beacon_light_off = panel_events.button26.down
strobe_light_on = panel_events.button23.down
strobe_light_off = panel_events.button24.down

ice_light_on = panel_events.button17.down
ice_light_off = panel_events.button18.down
flood_light_on = panel_events.button19.down
flood_light_off = panel_events.button20.down
panel_light_on = panel_events.button21.down
panel_light_off = panel_events.button22.down

pilot_map_light_toggle = panel_events.button2.down
pilot_reading_light_toggle = panel_events.button3.down
copilot_reading_light_toggle = panel_events.button4.down

-- pilot yoke
pilot_yoke_timer_sel = joystick_events.button14.down
pilot_yoke_timer_ctl = joystick_events.button12.down



baron_mappings = {

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

        -- == Fuel selectors ==

    {
        event = left_fuel_sel_off,
        action = msfs.mfwasm.rpn_executer('1 (>K:FUEL_SELECTOR_OFF)'),
    },
    {
        event = left_fuel_sel_on,
        action = msfs.mfwasm.rpn_executer('1 (>K:FUEL_SELECTOR_LEFT_MAIN)'),
        
    },
    {
        event = left_fuel_sel_xfeed,
        action = msfs.mfwasm.rpn_executer('1 (>K:FUEL_SELECTOR_RIGHT_MAIN)'),
    },

    {
        event = right_fuel_sel_off,
        action = msfs.mfwasm.rpn_executer('1 (>K:FUEL_SELECTOR_2_OFF)'),
    },
    {
        event = right_fuel_sel_on,
        action = msfs.mfwasm.rpn_executer('1 (>K:FUEL_SELECTOR_2_RIGHT_MAIN)'),
    },
    {
        event = right_fuel_sel_xfeed,
        action = msfs.mfwasm.rpn_executer('1 (>K:FUEL_SELECTOR_2_LEFT_MAIN)'),
    },

        -- == Magnetos == --

    {
        event = left_magneto_both_alt,
        action = msfs.mfwasm.rpn_executer('3 (>L:BKSQ_IgnitionPosition_1)')
    },
    {
        event = left_magneto_start,
        action = msfs.mfwasm.rpn_executer('4 (>L:BKSQ_IgnitionPosition_1) (E:SIMULATION TIME, seconds) 1000 + (>L:starterKnobReturnTime_L, number)')
    },

    {
        event = right_magneto_both_alt,
        action = msfs.mfwasm.rpn_executer('3 (>L:BKSQ_IgnitionPosition_2)')
    },
    {
        event = right_magneto_start,
        action = msfs.mfwasm.rpn_executer('4 (>L:BKSQ_IgnitionPosition_2) (E:SIMULATION TIME, seconds) 1000 + (>L:starterKnobReturnTime_R, number)')
    },

    -- == Fuel Boosters == --

    {
        event = left_fuel_booster_on,
        action = msfs.mfwasm.rpn_executer('2 (>L:var_FUEL_Switch_Pump_1, Number) 1 (>A:CIRCUIT SWITCH ON:4, Bool)')
    },
    {
        event = left_fuel_booster_off,
        action = msfs.mfwasm.rpn_executer('0 (>L:var_FUEL_Switch_Pump_1, Number) 0 (>A:CIRCUIT SWITCH ON:4, Bool)')
    },
    {
        event = right_fuel_booster_on,
        action = msfs.mfwasm.rpn_executer('2 (>L:var_FUEL_Switch_Pump_2, Number) 1 (>A:CIRCUIT SWITCH ON:5, Bool)')
    },
    {
        event = right_fuel_booster_off,
        action = msfs.mfwasm.rpn_executer('0 (>L:var_FUEL_Switch_Pump_2, Number) 0 (>A:CIRCUIT SWITCH ON:5, Bool)')
    },

    -- AP --
    {
        event = ap_master_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_MASTER)')
    },
    {
        event = ap_hold_heading_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_PANEL_HEADING_HOLD)')
    },
    {
        event = ap_hold_nav_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_APR_HOLD)')
    },
    {
        event = ap_hold_altitute_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_ALT_HOLD)')
    },
    {
        event = ap_hold_pitch_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_PANEL_VS_HOLD)')
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
        event = ap_vs_inc,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_VS_VAR_INC)')
    },
    {
        event = ap_vs_dec,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_VS_VAR_DEC)')
    },

    -- == HSI == --

    -- increment with single click, increase by 4 when clicking fast
    {
        event = hsi_cdi_inc,
        action = msfs.mfwasm.rpn_executer('(E:SIMULATION TIME,Number) (L:MACIEK_LAST_VOR_OBI_TIME, Number) - 0.5 < if{  1 (>K:VOR1_OBI_INC) 1 (>K:VOR1_OBI_INC) 1 (>K:VOR1_OBI_INC) } 1 (>K:VOR1_OBI_INC) (E:SIMULATION TIME,Number) (>L:MACIEK_LAST_VOR_OBI_TIME)') -- HAHA works!
    },
    {
        event = hsi_cdi_dec,
        action = msfs.mfwasm.rpn_executer('(E:SIMULATION TIME,Number) (L:MACIEK_LAST_VOR_OBI_TIME, Number) - 0.5 < if{  1 (>K:VOR1_OBI_DEC) 1 (>K:VOR1_OBI_DEC) 1 (>K:VOR1_OBI_DEC) } 1 (>K:VOR1_OBI_DEC) (E:SIMULATION TIME,Number) (>L:MACIEK_LAST_VOR_OBI_TIME)') -- HAHA works!
    },

        -- == Lights == --
    {
        event = landing_light_toggle_left,
        action = msfs.mfwasm.rpn_executer('1 (>K:2:LANDING_LIGHTS_TOGGLE)')
    },
    {
        event = landing_light_toggle_right,
        action = msfs.mfwasm.rpn_executer('2 (>K:2:LANDING_LIGHTS_TOGGLE)')
    },
    {
        event = taxi_light_on,
        action = msfs.mfwasm.rpn_executer('(>K:TAXI_LIGHTS_ON)')
    },
    {
        event = taxi_light_off,
        action = msfs.mfwasm.rpn_executer('(>K:TAXI_LIGHTS_OFF)')
    },
    {
        event = beacon_light_on,
        action = msfs.mfwasm.rpn_executer('(>K:BEACON_LIGHTS_ON)')
    },
    {
        event = beacon_light_off,
        action = msfs.mfwasm.rpn_executer('(>K:BEACON_LIGHTS_OFF)')
    },
    {
        event = strobe_light_on,
        action = msfs.mfwasm.rpn_executer('(>K:STROBES_ON)')
    },
    {
        event = strobe_light_off,
        action = msfs.mfwasm.rpn_executer('(>K:STROBES_OFF)')
    },
    {
        event = nav_light_on,
        action = msfs.mfwasm.rpn_executer('(>K:NAV_LIGHTS_ON)')
    },
    {
        event = nav_light_off,
        action = msfs.mfwasm.rpn_executer('(>K:NAV_LIGHTS_OFF)')
    },

    {
        event = ice_light_on,
        action = msfs.mfwasm.rpn_executer('(>K:WING_LIGHTS_ON)')
    },
    {
        event = ice_light_off,
        action = msfs.mfwasm.rpn_executer('(>K:WING_LIGHTS_OFF)')
    },
    {
        event = flood_light_on,
        action = msfs.mfwasm.rpn_executer('1 (>L:bksq_MasterGlareshieldLights, Bool)')
    },
    {
        event = flood_light_off,
        action = msfs.mfwasm.rpn_executer('0 (>L:bksq_MasterGlareshieldLights, Bool)')
    },
    {
        event = panel_light_on,
        action = msfs.mfwasm.rpn_executer('1 (>L:bksq_MasterPanelLights, Bool)')
    },
    {
        event = panel_light_off,
        action = msfs.mfwasm.rpn_executer('0 (>L:bksq_MasterPanelLights, Bool)')
    },
    {
        event = pilot_map_light_toggle,
        action = msfs.mfwasm.rpn_executer('(L:var_OatMapCompassLightButton_1, Bool) ! (>L:var_OatMapCompassLightButton_1, Bool)')
    },
    {
        event = pilot_reading_light_toggle,
        action = msfs.mfwasm.rpn_executer('(L:var_LIGHTING_Push_Cockpit_1, Bool) ! (>L:var_LIGHTING_Push_Cockpit_1, Bool)')
    },
    {
        event = copilot_reading_light_toggle,
        action = msfs.mfwasm.rpn_executer('(L:var_LIGHTING_Push_Cockpit_2, Bool) ! (>L:var_LIGHTING_Push_Cockpit_2, Bool)')
    },

    -- pilot yoke
    {
        event = pilot_yoke_timer_sel,
        action = msfs.mfwasm.rpn_executer('(L:var_yokeChronoMode_L, number) 1 + 3 % (>L:var_yokeChronoMode_L, number)')
    },
    {
        event = pilot_yoke_timer_ctl,
        action = msfs.mfwasm.rpn_executer('(L:var_yokeTimerMode_L, number) 1 + 3 % (>L:var_yokeTimerMode_L, number)')
    },

    -- debug
    {
        event = panel_events.button8.down,
        action =  msfs.mfwasm.rpn_executer('1 (>L:BKSQ_IgnitionPosition_1)') -- mag0
    },
    {
        event = panel_events.button9.down,
        action =  msfs.mfwasm.rpn_executer('2 (>L:BKSQ_IgnitionPosition_1)') -- mak 1
    },
    {
        event = panel_events.button10.down,
        action =  msfs.mfwasm.rpn_executer('3 (>L:BKSQ_IgnitionPosition_1)')-- mag both
    },
    {
        event = panel_events.button11.down,
        -- attempt at starter
        --action =  msfs.mfwasm.rpn_executer('1 4 (>B:2:BKSQ_MAGNETOCONTROLLER_L) (E:SIMULATION TIME, seconds) 1000 + (>L:starterKnobReturnTime_L, Number)')
        --action =  msfs.mfwasm.rpn_executer('1 4 (>K:2:BKSQ_MAGNETOCONTROLLER_L) (E:SIMULATION TIME, seconds) 1000 + (>L:starterKnobReturnTime_L, Number)')
        --action =  msfs.mfwasm.rpn_executer('1 (>K:TOGGLE_STARTER1)')
        --action =  msfs.mfwasm.rpn_executer('4 (>L:BKSQ_IgnitionPosition_1)')
        -- this workls!!!
        --action =  msfs.mfwasm.rpn_executer('4 (>L:BKSQ_IgnitionPosition_1) 1 (>K:BKSQ B58-ELEC Mag1 START) (E:SIMULATION TIME, seconds) (>L:starterKnobReturnTime_L, number)')

        action =  msfs.mfwasm.rpn_executer('4 (>L:BKSQ_IgnitionPosition_1) (E:SIMULATION TIME, seconds) 1000 + (>L:starterKnobReturnTime_L, number)')
    },
    -- BKSQ_MAGNETOCONTROLLER_L_Inc
}