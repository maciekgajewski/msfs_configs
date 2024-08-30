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

local panel_events = panel:get_events()
local hotas_events = hotas:get_events()
-- mapper.print("== Events BEGIN ==")
-- for k,v in pairs(panel_events.button32) do
--     mapper.print(k)
-- end
-- mapper.print("== Events END ==")

-- local my_event = mapper.register_event('My Event')

-- beech mappings
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

ap_master_toggle = hotas_events.button15.down
ap_heading_pitch = hotas_events.pov1.change
ap_hold_heading_toggle = hotas_events.button4.down
ap_hold_altitute_toggle = hotas_events.button3.down
ap_hold_pitch_toggle = hotas_events.button5.down

ap_heading_pitch_action = function(val)
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
ap_heading_pitch_last_value = -1
ap_heading_pitch_repeat_event =  mapper.register_event('AP Heading/Pitch repeat')
ap_heading_pitch_repeat_delay = 250 --ms
ap_heading_pitch_repeat_interval = 50 --ms

-- state vars
left_mh_val = 0
right_mh_val = 0
mh_increment = 256

left_os_val = 0
right_os_val = 0
os_increment = 2

-- testing the resolutiuon of the clock: ABSOL?UTYE TIME is in full seconds, SIMULATTIN TIME is in fractions
msfs.mfwasm.execute_rpn('7 (>L:MACIEK_LAST_VOR_OBI_TIME, Number)')
observed_event1 = mapper.register_event('observed event1')
observed_event2 = mapper.register_event('observed event2')
local observed_data = {
     --{rpn="(E:SIMULATION TIME,Seconds)", event=observed_event, epsilon=1.5},
     --{rpn="(E:SIMULATION TIME,Number) (L:MACIEK_LAST_VOR_OBI_TIME, Number) -", event=observed_event1},
    --  {rpn="(E:SIMULATION TIME,Number) (>L:MACIEK_LAST_VOR_OBI_TIME)", event=observed_event2},
    }
msfs.mfwasm.add_observed_data(observed_data)

mapper.set_primary_mappings{

    -- {
    --     event = observed_event,
    --     action = function(e, v)
    --         mapper.print('observed event: ' .. v)
    --     end
    -- },

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
    -- dont know how to operatre primer
    -- {
    --     event = primer_button,
    --     --action =  msfs.mfwasm.rpn_executer('TRUE (>K:FUELSYSTEM_PUMP_ON:1, Bool)')
    --     -- action = function()
    --     --     msfs.send_event('FUELSYSTEM_PUMP_ON:1', 1)
    --     -- end

    -- },


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
        action =  msfs.mfwasm.rpn_executer('(>K:AP_PANEL_ALTITUDE_HOLD)')
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
    }

}
