-- == Bindinsgs for Beech 18 witd Denarque mod ==

selector_left = panel_events.button31.down
selector_center = panel_events.button32.down
selector_right = panel_events.button33.down

primer_button = panel_events.button6.down

left_fuel_sel_off = panel_events.button14.down
left_fuel_sel_front = panel_events.button15.down
left_fuel_sel_rear = panel_events.button16.down

right_fuel_sel_off = panel_events.button34.down
right_fuel_sel_front = panel_events.button35.down
right_fuel_sel_rear = panel_events.button36.down

left_mh_up = panel_events.button23.down
left_mh_down = panel_events.button24.down

right_mh_up = panel_events.button25.down
right_mh_down = panel_events.button26.down

left_os_up = panel_events.button27.down
left_os_down = panel_events.button28.down

right_os_up = panel_events.button29.down
right_os_down = panel_events.button30.down

left_fuel_pump_on = hotas_events.button16.down
left_fuel_pump_off = hotas_events.button16.up

right_fuel_pump_on = hotas_events.button17.down
right_fuel_pump_off = hotas_events.button17.up

hsi_cdi_inc = panel_events.button39.down
hsi_cdi_dec = panel_events.button38.down

parking_brake_on = hotas_events.button24.up
parking_brake_off = hotas_events.button24.down

gear_up = hotas_events.button25.down
gear_down = hotas_events.button25.up

tail_wheel_lock_toggle = hotas_events.button26.down

landing_light_on = hotas_events.button27.down
 -- middle swith pos can trigger two events, depneding on if its coming from up or down.
 -- You can see how nicer the Virpil control is, compared to Thrustmaster
landing_light_off = hotas_events.button27.up
landing_light_off_alt = hotas_events.button28.up
landing_light_retracted = hotas_events.button28.down

no_smoking_light_toggle = panel_events.button3.down
beacon_light_toggle = panel_events.button4.down
cabin_light_toggle = panel_events.button1.down

nav_lights_steady = panel_events.button22.down
nav_lights_flashing = panel_events.button21.down

-- absolute flaps
flaps_up = hotas_events.button22.down
flaps_mid = hotas_events.button22.up
flaps_mid_alt = hotas_events.button23.up
flaps_down = hotas_events.button23.down

-- incremental flaps
flaps_dec = hotas_events.button22.down
flaps_inc = hotas_events.button23.down

fuel_selector_0 = panel_events.button47.down
fuel_selector_1 = panel_events.button46.down
fuel_selector_2 = panel_events.button45.down
fuel_selector_3 = panel_events.button44.down
fuel_selector_4 = panel_events.button43.down

ap_master_toggle = hotas_events.button15.down
ap_heading_pitch = hotas_events.pov1.change
ap_hold_heading_toggle = hotas_events.button4.down
ap_hold_altitute_toggle = hotas_events.button3.down
ap_hold_pitch_toggle = hotas_events.button5.down

ap_heading_pitch_action = function(val)
    if val == 0 then
        -- msfs.mfwasm.execute_rpn('(>K:AP_VS_VAR_INC)') -- doesnt work
          msfs.mfwasm.execute_rpn('(>K:AP_PITCH_REF_INC_UP)') -- doesnt work
         --msfs.mfwasm.execute_rpn('(>K:AP_VS_VAR_SET_CURRENT)') -- doesnt work

    elseif val == 18000 then
        msfs.mfwasm.execute_rpn('(>K:AP_VS_VAR_DEC)')
    elseif val == 9000 then
        msfs.mfwasm.execute_rpn('(>K:HEADING_BUG_INC)')
    elseif val == 27000 then
        msfs.mfwasm.execute_rpn('(>K:HEADING_BUG_DEC)')
    end
end
ap_heading_pitch_last_value = -1
ap_heading_pitch_repeat_event =  mapper.register_event('AP Heading/Pitch repeat')
ap_heading_pitch_repeat_delay = 250 --ms
ap_heading_pitch_repeat_interval = 50 --ms


cabin_light_pilot_on = panel_events.button17.down
cabin_light_pilot_off = panel_events.button18.down
cabin_light_copilot_on = panel_events.button19.down
cabin_light_copilot_off = panel_events.button20.down

ignition_cover_toggle = panel_events.button6.down
cowl_flap_left_toggle = panel_events.button5.down
cowl_flap_right_toggle = panel_events.button7.down

-- state vars
left_mh_val = 0
right_mh_val = 0
mh_increment = 256

left_os_val = 0
right_os_val = 0
os_increment = 2

-- testing the resolutiuon of the clock: ABSOL?UTYE TIME is in full seconds, SIMULATTIN TIME is in fractions
-- msfs.mfwasm.execute_rpn('7 (>L:MACIEK_LAST_VOR_OBI_TIME, Number)')
-- observed_event1 = mapper.register_event('observed event1')
-- observed_event2 = mapper.register_event('observed event2')
-- local observed_data = {
--      --{rpn="(E:SIMULATION TIME,Seconds)", event=observed_event, epsilon=1.5},
--      --{rpn="(E:SIMULATION TIME,Number) (L:MACIEK_LAST_VOR_OBI_TIME, Number) -", event=observed_event1},
--     --  {rpn="(E:SIMULATION TIME,Number) (>L:MACIEK_LAST_VOR_OBI_TIME)", event=observed_event2},
--     }
-- msfs.mfwasm.add_observed_data(observed_data)

beech_mappings = {

    -- {
    --     event = observed_event,
    --     action = function(e, v)
    --         mapper.print('observed event: ' .. v)
    --     end
    -- },

    -- == axes
    {
        event = panel_events.x.change,
        action = vjoy_mixture_1:value_setter()
    },
    {
        event = panel_events.y.change,
        action = vjoy_mixture_2:value_setter()
    },
    {
        event = panel_events.rx.change,
        action = vjoy_prop_1:value_setter()
    },
    {
        event = panel_events.ry.change,
        action = vjoy_prop_2:value_setter()
    },
    {
        event = hotas_events.rz.change,
        action = vjoy_throttle_1:value_setter()
    },
    {
        event = hotas_events.z.change,
        action = vjoy_throttle_2:value_setter()
    },
    {
        event = hotas_events.slider1.change,
        action = vjoy_elevator_trim:value_setter()
    },

    -- == Engine igniotion/primer ==
    {
        event = selector_left,
        action = msfs.mfwasm.rpn_executer('0 (>L:CARVAR_SW_STARTER_LR, Number) 0 (>L:CARVAR_SW_PRIMER_LR, Number)')
    },
    {
        event = selector_center,
        action = msfs.mfwasm.rpn_executer('1 (>L:CARVAR_SW_STARTER_LR, Number) 1 (>L:CARVAR_SW_PRIMER_LR, Number)')
    },
    {
        event = selector_right,
        action = msfs.mfwasm.rpn_executer('2 (>L:CARVAR_SW_STARTER_LR, Number) 2 (>L:CARVAR_SW_PRIMER_LR, Number)')
    },
    {
        event = ignition_cover_toggle,
        -- action = msfs.mfwasm.rpn_executer('1 (>B:INSTRUMENT_SW_COVER_STARTER)') -- nope
        -- action = msfs.mfwasm.rpn_executer('1 (>L:INSTRUMENT_SW_COVER_STARTER_Set)') -- nope
        -- action = msfs.mfwasm.rpn_executer('1 (>K:INSTRUMENT_SW_COVER_STARTER_SET)') -- nope
        --action = msfs.mfwasm.rpn_executer('1 (>L:INSTRUMENT_SW_COVER_STARTER_Position, Number)')
        -- action = msfs.mfwasm.rpn_executer('1 (>K:INSTRUMENT_SW_COVER_STARTER_Position, Number)')
        -- action = msfs.mfwasm.rpn_executer('1 (>K:INSTRUMENT_SW_COVER_STARTER, Bool)') -- nope
        --action = msfs.mfwasm.rpn_executer('1 (>K:INSTRUMENT_SW_COVER_STARTER_Set, Number)') -- nope
        -- action = function ()
        --     --msfs.send_event('INSTRUMENT_SW_COVER_STARTER_Set', 1)
        --     -- msfs.send_event('INSTRUMENT_SW_COVER_STARTER', 1)
        --     --msfs.send_event('INSTRUMENT_SW_COVER_STARTER_Set', 1.0)
        --     -- msfs.mfwasm.execute_rpn('1 (>K:INSTRUMENT_SW_COVER_STARTER, Enum)') -- I don't know hot do it
        --      msfs.mfwasm.execute_rpn('1 (>L:CARVAR_SW_Cover_Starter, Number)') -- changes var, does not change the state
        -- end
        --action = msfs.mfwasm.rpn_executer('1 (>K:SW_COVER_STARTER, Integer)')
        action = msfs.mfwasm.rpn_executer('1 (>L:CARVAR_SW_Cover_Starter)') -- no idee why this doesnt work
    },

    -- dont know how to operatre primer
    -- {
    --     event = primer_button,
    --     --action =  msfs.mfwasm.rpn_executer('TRUE (>K:FUELSYSTEM_PUMP_ON:1, Bool)')
    --     -- action = function()
    --     --     msfs.send_event('FUELSYSTEM_PUMP_ON:1', 1)
    --     -- end

    -- },


    -- == Cowl flaps ==
    {
        event = cowl_flap_left_toggle,
        action = msfs.mfwasm.rpn_executer('(A:RECIP ENG COWL FLAP POSITION:1,Percent) 0 == if{ 16384 (>K:COWLFLAP1_SET) } els{ 0 (>K:COWLFLAP1_SET)  }')
    }, 
    {
        event = cowl_flap_right_toggle,
        action = msfs.mfwasm.rpn_executer('(A:RECIP ENG COWL FLAP POSITION:2,Percent) 0 == if{ 16384 (>K:COWLFLAP2_SET) } els{ 0 (>K:COWLFLAP2_SET)  }')
    }, 

    -- === Fuel boosters ==
    {
        event = left_fuel_pump_on,
        action = msfs.mfwasm.rpn_executer('1 (>K:FUELSYSTEM_PUMP_ON)')

    },
    {
        event = left_fuel_pump_off,
        action = msfs.mfwasm.rpn_executer('1 (>K:FUELSYSTEM_PUMP_OFF)')
    },
    {
        event = right_fuel_pump_on,
        action = msfs.mfwasm.rpn_executer('2 (>K:FUELSYSTEM_PUMP_ON)')

    },
    {
        event = right_fuel_pump_off,
        action = msfs.mfwasm.rpn_executer('2 (>K:FUELSYSTEM_PUMP_OFF)')
    },


    -- == Fuel selectors ==

    {
        event = left_fuel_sel_off,
        action = msfs.mfwasm.rpn_executer('0 (>L:Denaq_Fuel_Sel1, Number) 3 1 (>K:2:FUELSYSTEM_JUNCTION_SET)'),
    },
    {
        event = left_fuel_sel_front,
        action = msfs.mfwasm.rpn_executer('1 (>L:Denaq_Fuel_Sel1, Number) 1 1 (>K:2:FUELSYSTEM_JUNCTION_SET)'),
    },
    {
        event = left_fuel_sel_rear,
        action = msfs.mfwasm.rpn_executer('2 (>L:Denaq_Fuel_Sel1, Number) 2 1 (>K:2:FUELSYSTEM_JUNCTION_SET)'),
    },

    {
        event = right_fuel_sel_off,
        action = msfs.mfwasm.rpn_executer('0 (>L:Denaq_Fuel_Sel2, Number) 3 2 (>K:2:FUELSYSTEM_JUNCTION_SET)'),
    },
    {
        event = right_fuel_sel_front,
        action = msfs.mfwasm.rpn_executer('1 (>L:Denaq_Fuel_Sel2, Number) 1 2 (>K:2:FUELSYSTEM_JUNCTION_SET)'),
    },
    {
        event = right_fuel_sel_rear,
        action = msfs.mfwasm.rpn_executer('2 (>L:Denaq_Fuel_Sel2, Number) 2 2 (>K:2:FUELSYSTEM_JUNCTION_SET)'),
    },


    -- === De-ice ==

    {
        event = left_mh_up,
        --action = msfs.mfwasm.rpn_executer('5000 (>L:ANTI-ICE-GRADUAL-SET-ENG1, Number)'), doesnt work

        -- this works - sets a value
        -- action = function ()
        --     msfs.send_event('ANTI_ICE_GRADUAL_SET_ENG1', 5000)
        -- end

        -- this works as well - sets a fixed value
        --action = msfs.mfwasm.rpn_executer('5000 (>K:ANTI_ICE_GRADUAL_SET_ENG1)')

        action = function ()
            if left_mh_val > 0 then 
                left_mh_val = left_mh_val - mh_increment
                msfs.send_event('ANTI_ICE_GRADUAL_SET_ENG1', left_mh_val)
            end
        end
    },
    {
        event = left_mh_down,
        action = function ()
            if left_mh_val < 16384 then 
                left_mh_val = left_mh_val + mh_increment
                msfs.send_event('ANTI_ICE_GRADUAL_SET_ENG1', left_mh_val)
            end
        end
    },
    {
        event = right_mh_up,
        action = function ()
            if right_mh_val > 0 then 
                right_mh_val = right_mh_val - mh_increment
                msfs.send_event('ANTI_ICE_GRADUAL_SET_ENG2', right_mh_val)
            end
        end
    },
    {
        event = right_mh_down,
        action = function ()
            if right_mh_val < 16384 then 
                right_mh_val = right_mh_val + mh_increment
                msfs.send_event('ANTI_ICE_GRADUAL_SET_ENG2', right_mh_val)
            end
        end
    },

    -- == Oil Shutters ==
    {
        event = left_os_up,
        action = function ()
            if left_os_val > 0 then 
                left_os_val = left_os_val - os_increment
                -- doesnt work
                -- msfs.send_event('Denarq_OILSHUTTER_SET_1', left_os_val)
                msfs.mfwasm.execute_rpn(left_os_val .. ' (>L:Denarq_OILSHUTTER_SET_1)')
            end
        end
    },
    {
        event = left_os_down,
        action = function ()
            if left_os_val < 100 then 
                left_os_val = left_os_val + os_increment
                msfs.mfwasm.execute_rpn(left_os_val .. ' (>L:Denarq_OILSHUTTER_SET_1)')
            end
        end
    },
    {
        event = right_os_up,
        action = function ()
            if right_os_val > 0 then 
                right_os_val = right_os_val - os_increment
                msfs.mfwasm.execute_rpn(right_os_val .. ' (>L:Denarq_OILSHUTTER_SET_2)')
            end
        end
    },
    {
        event = right_os_down,
        action = function ()
            if right_os_val < 100 then 
                right_os_val = right_os_val + os_increment
                msfs.mfwasm.execute_rpn(right_os_val .. ' (>L:Denarq_OILSHUTTER_SET_2)')
            end
        end
    },

    -- === HSI ===
    -- increment with single click, increase by 4 when clicking fast
    {
        event = hsi_cdi_inc,
        action = msfs.mfwasm.rpn_executer('(E:SIMULATION TIME,Number) (L:MACIEK_LAST_VOR_OBI_TIME, Number) - 0.5 < if{  1 (>K:VOR1_OBI_INC) 1 (>K:VOR1_OBI_INC) 1 (>K:VOR1_OBI_INC) } 1 (>K:VOR1_OBI_INC) (E:SIMULATION TIME,Number) (>L:MACIEK_LAST_VOR_OBI_TIME)') -- HAHA works!
    },
    {
        event = hsi_cdi_dec,
        action = msfs.mfwasm.rpn_executer('(E:SIMULATION TIME,Number) (L:MACIEK_LAST_VOR_OBI_TIME, Number) - 0.5 < if{  1 (>K:VOR1_OBI_DEC) 1 (>K:VOR1_OBI_DEC) 1 (>K:VOR1_OBI_DEC) } 1 (>K:VOR1_OBI_DEC) (E:SIMULATION TIME,Number) (>L:MACIEK_LAST_VOR_OBI_TIME)') -- HAHA works!
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
    {
        event = gear_up,
        action =  msfs.mfwasm.rpn_executer('(>K:GEAR_UP)')
    },
    {
        event = gear_down,
        action =  msfs.mfwasm.rpn_executer('(>K:GEAR_DOWN)')
    },
    {
        event = tail_wheel_lock_toggle,
        action =  msfs.mfwasm.rpn_executer('(>K:TOGGLE_TAILWHEEL_LOCK)')
    },

    -- == Landing Light ==
    {
        event = landing_light_on,
        action =  msfs.mfwasm.rpn_executer('0 (>L:XMLVAR_LANDINGRETRACTSTATE)')
    },
    {
        event = landing_light_off,
        action =  msfs.mfwasm.rpn_executer('1 (>L:XMLVAR_LANDINGRETRACTSTATE)')
    },
    {
        event = landing_light_off_alt,
        action =  msfs.mfwasm.rpn_executer('1 (>L:XMLVAR_LANDINGRETRACTSTATE)')
    },
    {
        event = landing_light_retracted,
        action =  msfs.mfwasm.rpn_executer('2 (>L:XMLVAR_LANDINGRETRACTSTATE)')
    },
    {
        event = beacon_light_toggle,
        action = msfs.mfwasm.rpn_executer('(>K:TOGGLE_BEACON_LIGHTS)') 
    },

    -- == Autopilot ==
-- ap_master_toggle = hotas_events.button15.down
-- ap_heading_pitch = hotas_events.pov1.change
-- ap_hold_heading_toggle = hotas_events.button4.down
-- ap_hold_altitute_toggle = hotas_events.button3.down
-- ap_hold_pitch_toggle = hotas_events.button5.down

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
        event = ap_heading_pitch,
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

    -- == Flaps ==
    -- Absolute - disabled
    -- {
    --     event = flaps_up,
    --     action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_UP)')
    -- },
    -- {
    --     event = flaps_mid,
    --     action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_1)')
    -- },
    -- {
    --     event = flaps_mid_alt,
    --     action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_1)')
    -- },
    -- {
    --     event = flaps_down,
    --     action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_DOWN)')
    -- },
    -- Incremental
    {
        event = flaps_inc,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_INCR)')
    },
    {
        event = flaps_dec,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_DECR)')
    },
    

    -- == Cabin lights ==
    {
        event = cabin_light_pilot_on,
        action =  msfs.mfwasm.rpn_executer('1 1 (>K:2:CABIN_LIGHTS_SET)') -- first param is the light idx: 1- pilot, 2 - copilot, 3 - passenger cabin
    },
    {
        event = cabin_light_pilot_off,
        action =  msfs.mfwasm.rpn_executer('1 0 (>K:2:CABIN_LIGHTS_SET)')
    },
    {
        event = cabin_light_copilot_on,
        action =  msfs.mfwasm.rpn_executer('2 1 (>K:2:CABIN_LIGHTS_SET)') -- first param is the light idx: 1- pilot, 2 - copilot, 3 - passenger cabin
    },
    {
        event = cabin_light_copilot_off,
        action =  msfs.mfwasm.rpn_executer('2 0 (>K:2:CABIN_LIGHTS_SET)')
    },
    {
        event = no_smoking_light_toggle,
        action = msfs.mfwasm.rpn_executer('(L:CARVAR_Seatbealt) 1 == if{ 0 (>L:CARVAR_Seatbealt,Bool) 0 (>K:CABIN_NO_SMOKING_ALERT_SWITCH_TOGGLE) 0 (>K:CABIN_SEATBELTS_ALERT_SWITCH_TOGGLE) } els{ 1 (>L:CARVAR_Seatbealt,Bool) 1 (>K:CABIN_NO_SMOKING_ALERT_SWITCH_TOGGLE) 1 (>K:CABIN_SEATBELTS_ALERT_SWITCH_TOGGLE) }') 
        -- action = msfs.mfwasm.rpn_executer('1 (>L:CARVAR_Seatbealt,Bool)') -- does nuthn
        -- action = msfs.mfwasm.rpn_executer('1 (>K:CABIN_NO_SMOKING_ALERT_SWITCH_TOGGLE)') -- nada
        -- action = msfs.mfwasm.rpn_executer('1 (>K:CABIN_SEATBELTS_ALERT_SWITCH_TOGGLE)')
        -- action = msfs.mfwasm.rpn_executer('1 (>K:INSTRUMENT_SWITCH_Seatbealt)')
        
    },
    {
        event = cabin_light_toggle,
        action = msfs.mfwasm.rpn_executer('3 (A:LIGHT CABIN:3,Bool) ! (>K:2:CABIN_LIGHTS_SET)')
    },

    -- == Fuel gauge selector --
    {
        event = fuel_selector_0 ,
        action =  msfs.mfwasm.rpn_executer('0 (>L:FuelQtyMode)') -- sorta works
    },
    {
        event = fuel_selector_1,
        action =  msfs.mfwasm.rpn_executer('1 (>L:FuelQtyMode)') -- sorta works
    },
    {
        event = fuel_selector_2,
        action =  msfs.mfwasm.rpn_executer('2 (>L:FuelQtyMode)') -- sorta works
    },
    {
        event = fuel_selector_3,
        action =  msfs.mfwasm.rpn_executer('3 (>L:FuelQtyMode)') -- sorta works
    },
    {
        event = fuel_selector_4,
        action =  msfs.mfwasm.rpn_executer('4 (>L:FuelQtyMode)') -- sorta works
    },

    -- == Nav Lights ==
    {
        event = nav_lights_flashing,
        action =  msfs.mfwasm.rpn_executer('0 (>L:XMLVAR_LandingNavFlashing) (A:LIGHT NAV,bool) 0 == if{ (>TOGGLE_NAV_LIGHTS) } (A:CIRCUIT ON:12, bool) 0 != if{ 12 (>K:ELECTRICAL_CIRCUIT_TOGGLE) } (A:CIRCUIT ON:61, bool) 0 == if{ 61 (>K:ELECTRICAL_CIRCUIT_TOGGLE) }')
    },
    {
        event = nav_lights_steady,
        action =  msfs.mfwasm.rpn_executer('2 (>L:XMLVAR_LandingNavFlashing) (A:LIGHT NAV,bool) 0 == if{ (>TOGGLE_NAV_LIGHTS) } (A:CIRCUIT ON:12, bool) 0 == if{ 12 (>K:ELECTRICAL_CIRCUIT_TOGGLE) } (A:CIRCUIT ON:61, bool) 0 != if{ 61 (>K:ELECTRICAL_CIRCUIT_TOGGLE) }')
    },


  }
