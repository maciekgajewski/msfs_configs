-- Blacksquare Baron Pro

parking_brake_on = hotas_events.button24.up
parking_brake_off = hotas_events.button24.down

gear_up = hotas_events.button25.down
gear_down = hotas_events.button25.up

flaps_up = hotas_events.button22.down
flaps_mid = hotas_events.button22.up
flaps_mid_alt = hotas_events.button23.up
flaps_down = hotas_events.button23.down

left_fuel_sel_off = panel_events.button16.down
left_fuel_sel_on = panel_events.button15.down
left_fuel_sel_xfeed = panel_events.button14.down

right_fuel_sel_off = panel_events.button36.down
right_fuel_sel_on = panel_events.button35.down
right_fuel_sel_xfeed = panel_events.button34.down

left_magneto_off =  hotas_events.button18.down
left_magneto_both =  hotas_events.button18.up
left_magneto_both_alt =  hotas_events.button31.up
left_magneto_start =  hotas_events.button31.down

right_magneto_off =  hotas_events.button19.down
right_magneto_both =  hotas_events.button19.up
right_magneto_both_alt =  hotas_events.button32.up
right_magneto_start =  hotas_events.button32.down

left_fuel_booster_on = hotas_events.button16.down
left_fuel_booster_off = hotas_events.button16.up

right_fuel_booster_on = hotas_events.button17.down
right_fuel_booster_off = hotas_events.button17.up

ap_master_toggle = hotas_events.button15.down
ap_heading_pitch = hotas_events.pov1.change
ap_hold_heading_toggle = hotas_events.button4.down
ap_hold_altitute_toggle = hotas_events.button3.down
ap_hold_pitch_toggle = hotas_events.button5.down

ap_heading_pitch_event = hotas_events.pov1.change
ap_heading_pitch_action = function(val)
    if val == 0 then
        -- down
        msfs.mfwasm.execute_rpn('(>K:AP_VS_VAR_INC)')
    elseif val == 18000 then
        -- up
        msfs.mfwasm.execute_rpn('(>K:AP_VS_VAR_DEC)')
    elseif val == 9000 then
        -- right
        msfs.mfwasm.execute_rpn('(>K:HEADING_BUG_INC)')
    elseif val == 27000 then
        -- left
        msfs.mfwasm.execute_rpn('(>K:HEADING_BUG_DEC)')
    end
end
ap_heading_pitch_last_value = -1
ap_heading_pitch_repeat_event =  mapper.register_event('AP Heading/Pitch repeat')
ap_heading_pitch_repeat_delay = 250 --ms
ap_heading_pitch_repeat_interval = 50 --ms

hsi_cdi_inc = panel_events.button39.down
hsi_cdi_dec = panel_events.button38.down

-- lights
landing_light_on_one = hotas_events.button27.up
landing_light_on_one_alt = hotas_events.button28.up
landing_light_on_both = hotas_events.button27.down
landing_light_off = hotas_events.button28.down

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

pilot_map_light_toggle = panel_events.button3.down
copilot_map_light_toggle = panel_events.button4.down


baron_mappings = {

    -- == Wheels ==
    {
        event = parking_brake_on,
        action =  msfs.mfwasm.rpn_executer('1 (>K:PARKING_BRAKE_SET,Bool)')
    },
    {
        event = parking_brake_off,
        action =  msfs.mfwasm.rpn_executer('0 (>K:PARKING_BRAKE_SET,Bool)')
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
        event = left_magneto_off,
        action = msfs.mfwasm.rpn_executer('1 (>L:BKSQ_IgnitionPosition_1)')
    },
    {
        event = left_magneto_both,
        action = msfs.mfwasm.rpn_executer('3 (>L:BKSQ_IgnitionPosition_1)')
    },
    {
        event = left_magneto_both_alt,
        action = msfs.mfwasm.rpn_executer('3 (>L:BKSQ_IgnitionPosition_1)')
    },
    {
        event = left_magneto_start,
        action = msfs.mfwasm.rpn_executer('4 (>L:BKSQ_IgnitionPosition_1) (E:SIMULATION TIME, seconds) 1000 + (>L:starterKnobReturnTime_L, number)')
    },

    {
        event = right_magneto_off,
        action = msfs.mfwasm.rpn_executer('1 (>L:BKSQ_IgnitionPosition_2)')
    },
    {
        event = right_magneto_both,
        action = msfs.mfwasm.rpn_executer('3 (>L:BKSQ_IgnitionPosition_2)')
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
        event = ap_hold_altitute_toggle,
        -- action =  msfs.mfwasm.rpn_executer('(>K:AP_PANEL_ALTITUDE_HOLD)') -- does not reset reference alt to cyrrent
        action =  msfs.mfwasm.rpn_executer('(>K:AP_ALT_HOLD)')
    },
    {
        event = ap_hold_pitch_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:AP_PANEL_VS_HOLD)')
    },
    {
        event = ap_heading_pitch_event,
        action = function(_, val)
            if val ~= -1 then
                ap_heading_pitch_action(val)
                if ap_heading_pitch_last_value == -1 then
                    mapper.delay(ap_heading_pitch_repeat_delay, function ()
                        mapper.raise_event(ap_heading_pitch_repeat_event)
                    end)
                end
            end
            ap_heading_pitch_last_value = val
        end
    },
    {
        event = ap_heading_pitch_repeat_event,
        action = function()
            if ap_heading_pitch_last_value ~= -1 then
                ap_heading_pitch_action(ap_heading_pitch_last_value)
                mapper.delay(ap_heading_pitch_repeat_interval, function ()
                    mapper.raise_event(ap_heading_pitch_repeat_event)
                end)
            end
        end
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
        event = landing_light_on_both,
        action = msfs.mfwasm.rpn_executer('1 1 (>K:2:LANDING_LIGHTS_ON) 1 2 (>K:2:LANDING_LIGHTS_ON)')
    },
    {
        event = landing_light_on_one,
        action = msfs.mfwasm.rpn_executer('1 1 (>K:2:LANDING_LIGHTS_ON) 1 2 (>K:2:LANDING_LIGHTS_OFF)')
    },
    {
        event = landing_light_on_one_alt,
        action = msfs.mfwasm.rpn_executer('1 1 (>K:2:LANDING_LIGHTS_OFF) 1 2 (>K:2:LANDING_LIGHTS_ON)')
    },
    {
        event = landing_light_off,
        action = msfs.mfwasm.rpn_executer('1 1 (>K:2:LANDING_LIGHTS_OFF) 1 2 (>K:2:LANDING_LIGHTS_OFF)')
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
        event = copilot_map_light_toggle,
        action = msfs.mfwasm.rpn_executer('(L:var_OatMapCompassLightButton_2, Bool) ! (>L:var_OatMapCompassLightButton_2, Bool)')
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