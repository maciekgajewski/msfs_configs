-- Bindings for A2A Aerostar

require('lib_repeating_control')

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

left_fuel_booster_on = hotas_events.button16.down
left_fuel_booster_off = hotas_events.button16.up

right_fuel_booster_on = hotas_events.button17.down
right_fuel_booster_off = hotas_events.button17.up

left_magneto_off =  hotas_events.button18.down
left_magneto_both =  hotas_events.button18.up
left_magneto_both_alt =  hotas_events.button31.up
left_magneto_start =  hotas_events.button31.down

right_magneto_off =  hotas_events.button19.down
right_magneto_both =  hotas_events.button19.up
right_magneto_both_alt =  hotas_events.button32.up
right_magneto_start =  hotas_events.button32.down

-- AP mode buttons. Both up and down
ap_onoff_down = hotas_events.button15.down
ap_onoff_up = hotas_events.button15.up

ap_hold_heading_down = hotas_events.button4.down
ap_hold_heading_up = hotas_events.button4.up

ap_hold_altitude_down = hotas_events.button3.down
ap_hold_altitude_up = hotas_events.button3.up

ap_hold_att_down = hotas_events.button5.down
ap_hold_att_up = hotas_events.button5.up

ap_heading_pitch_event = hotas_events.pov1.change
ap_heading_pitch_action = function(val)
    if val == 0 then
        -- up
        msfs.mfwasm.execute_rpn('(L:ApPitch, Number) -100 > if{ (L:ApPitch, Number) 10 - (>L:ApPitch, Number) }')
    elseif val == 18000 then
        -- down
        msfs.mfwasm.execute_rpn('(L:ApPitch, Number) 100 < if{ (L:ApPitch, Number) 10 + (>L:ApPitch, Number) }')
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
landing_light_on = hotas_events.button27.down
landing_light_off = hotas_events.button28.down

-- -- Repeating control class
-- RepeatingControl = { engage_event=0,  disengage_event=0, is_engaged=0, action=nil, delay=100 }

-- function RepeatingControl:new(eng_ev, dis_ev, act)
--     local o = {}
--     setmetatable(o, self)
--     self.__index = self
--     o.engage_event = eng_ev
--     o.disengage_event = dis_ev
--     o.action = act
--     o.is_engaged = 0
--     return o
-- end

-- function RepeatingControl:engage_action()
--     return function() self:do_engage() end
-- end

-- function RepeatingControl:disengage_action()
--     return function() self:do_disengage() end
-- end

-- function RepeatingControl:do_engage()
--     mapper.print('engage, self type=')
--     mapper.print(type(self))

--     local f
--     f = function()
--         self.action()
--         mapper.print('inside f, f type=')
--         mapper.print(type(f))
--         if self.is_engaged == 1 then
--             mapper.delay(self.delay, f)
--         end
--     end

--     if self.is_engaged == 0 then
--         mapper.print('first engage')
--         self.is_engaged = 1
--         f()
--     end
--     self.is_engaged = 1
-- end


-- function RepeatingControl:do_disengage()
--     mapper.print('disengage')
--     self.is_engaged = 0
-- end

-- this throw: "attempt to call NAtive Action". Will use lua function instead
--map_light_control = RepeatingControl:new(panel_events.button17.down, panel_events.button17.up, msfs.mfwasm.rpn_executer('(L:LightMapKnob, Number) 5 - 0 max (>L:LightMapKnob, Number)'))
map_light_inc_control = RepeatingControl:new(
    panel_events.button17.down, 
    panel_events.button17.up, 
    function ()
        msfs.mfwasm.execute_rpn('(L:LightMapKnob, Number) 5 + 100 min (>L:LightMapKnob, Number)')
    end
)


map_light_inc           = panel_events.button17.down
map_light_inc_release   = panel_events.button17.up
map_light_inc_engaged   = 0

map_light_dec           = panel_events.button18.down
map_light_dec_release   = panel_events.button18.up
map_light_dec_engaged   = 0

instr_light_outer_inc   = panel_events.button19.down    
instr_light_outer_dec   = panel_events.button20.down
instr_light_inner_inc   = panel_events.button21.down
instr_light_inner_dec   = panel_events.button22.down

aerostar_mappings = {

    -- == Axes --  ( for generic, 2-engine, possibly prop plane)
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
        event = panel_events.rx.change,
        action = vjoy_prop_1:value_setter()
    },
    {
        event = hotas_events.z.change,
        action = vjoy_throttle_1:value_setter()
    },
    {
        event = hotas_events.rz.change,
        action = vjoy_throttle_2:value_setter()
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
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_SET)')
    },
    {
        event = flaps_mid_alt,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_SET)')
    },
    {
        event = flaps_down,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_DOWN)')
    },
    
    -- == Fuel selectors ==

    {
        event = left_fuel_sel_off,
        action = msfs.mfwasm.rpn_executer('0 (>L:Eng1_FuelSelector, Number)'),
    },
    {
        event = left_fuel_sel_on,
        action = msfs.mfwasm.rpn_executer('1 (>L:Eng1_FuelSelector, Number)'),
    },
    {
        event = left_fuel_sel_xfeed,
        action = msfs.mfwasm.rpn_executer('2 (>L:Eng1_FuelSelector, Number)'),
    },

    {
        event = right_fuel_sel_off,
        action = msfs.mfwasm.rpn_executer('0 (>L:Eng2_FuelSelector, Number)'),
    },
    {
        event = right_fuel_sel_on,
        action = msfs.mfwasm.rpn_executer('1 (>L:Eng2_FuelSelector, Number)'),
    },
    {
        event = right_fuel_sel_xfeed,
        action = msfs.mfwasm.rpn_executer('2 (>L:Eng2_FuelSelector, Number)'),
    },

    -- == Fuel Boosters == --

    {
        event = left_fuel_booster_on,
        action = msfs.mfwasm.rpn_executer('(L:Eng1_FuelBoostSwitch, Bool) 0 == if{ 1 (>K:TOGGLE_ELECT_FUEL_PUMP1) }')
    },
    {
        event = left_fuel_booster_off,
        action = msfs.mfwasm.rpn_executer('(L:Eng1_FuelBoostSwitch, Bool) 1 == if{ 1 (>K:TOGGLE_ELECT_FUEL_PUMP1) }')
    },
    {
        event = right_fuel_booster_on,
        action = msfs.mfwasm.rpn_executer('(L:Eng2_FuelBoostSwitch, Bool) 0 == if{ 1 (>K:TOGGLE_ELECT_FUEL_PUMP2) }')
    },
    {
        event = right_fuel_booster_off,
        action = msfs.mfwasm.rpn_executer('(L:Eng2_FuelBoostSwitch, Bool) 1 == if{ 1 (>K:TOGGLE_ELECT_FUEL_PUMP2) }')
    },

    -- == Magnetos == --

    {
        event = left_magneto_off,
        action = msfs.mfwasm.rpn_executer('1 (>K:MAGNETO1_OFF)')
    },
    {
        event = left_magneto_both,
        action = msfs.mfwasm.rpn_executer('1 (>K:MAGNETO1_BOTH)')
    },
    {
        event = left_magneto_both_alt,
        action = msfs.mfwasm.rpn_executer('1 (>K:MAGNETO1_BOTH)')
    },
    {
        event = left_magneto_start,
        action = msfs.mfwasm.rpn_executer('1 (>K:MAGNETO1_START)')
    },

    {
        event = right_magneto_off,
        action = msfs.mfwasm.rpn_executer('1 (>K:MAGNETO2_OFF)')
    },
    {
        event = right_magneto_both,
        action = msfs.mfwasm.rpn_executer('1 (>K:MAGNETO2_BOTH)')
    },
    {
        event = right_magneto_both_alt,
        action = msfs.mfwasm.rpn_executer('1 (>K:MAGNETO2_BOTH)')
    },
    {
        event = right_magneto_start,
        action = msfs.mfwasm.rpn_executer('1 (>K:MAGNETO2_START)')
    },

    -- == Autopilot == --
    {
        event = ap_onoff_down,
        action = msfs.mfwasm.rpn_executer('1 (>L:ApMasterSwitch, Bool)')
    },
    {
        event = ap_onoff_up,
        action = msfs.mfwasm.rpn_executer('0 (>L:ApMasterSwitch, Bool)')
    },
    {
        event = ap_hold_heading_down,
        action = msfs.mfwasm.rpn_executer('1 (>L:ApHdgSwitch, Bool)')
    },
    {
        event = ap_hold_heading_up,
        action = msfs.mfwasm.rpn_executer('0 (>L:ApHdgSwitch, Bool)')
    },
    {
        event = ap_hold_altitude_down,
        action = msfs.mfwasm.rpn_executer('1 (>L:ApAltSwitch, Bool)')
    },
    {
        event = ap_hold_altitude_up,
        action = msfs.mfwasm.rpn_executer('0 (>L:ApAltSwitch, Bool)')
    },
    {
        event = ap_hold_att_down,
        action = msfs.mfwasm.rpn_executer('1 (>L:ApAttSwitch, Bool)')
    },
    {
        event = ap_hold_att_up,
        action = msfs.mfwasm.rpn_executer('0 (>L:ApAttSwitch, Bool)')
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
        event = landing_light_on,
        action = msfs.mfwasm.rpn_executer('(>B:SWITCH_LIGHT_LANDING_L_TOGGLE_Inc) (>B:SWITCH_LIGHT_LANDING_R_TOGGLE_Inc)')
    },
    {
        event = landing_light_off,
        action = msfs.mfwasm.rpn_executer('(>B:SWITCH_LIGHT_LANDING_L_TOGGLE_Dec) (>B:SWITCH_LIGHT_LANDING_R_TOGGLE_Dec)')
    },

    -- {
    --     event = map_light_inc,
    --     action = function()
    --         local f = nil
    --         f = function()
    --             msfs.mfwasm.execute_rpn('(L:LightMapKnob, Number) 5 + 100 min (>L:LightMapKnob, Number)')
    --             if map_light_inc_engaged == 1 then
    --                 mapper.delay(100, f)
    --             end
    --         end
    --         if map_light_inc_engaged == 0 then
    --             map_light_inc_engaged = 1
    --             f()
    --         end
    --     end
    -- },
    -- {
    --     event = map_light_inc_release,
    --     action = function()
    --         mapper.print('released')
    --         map_light_inc_engaged = 0
    --     end
    -- },
    {
        event = map_light_inc_control.engage_event,
        action = map_light_inc_control.engage_action
    },
    {
        event = map_light_inc_control.disengage_event,
        action = map_light_inc_control.disengage_action
    },


    {
        event = map_light_dec,
        action = msfs.mfwasm.rpn_executer('(L:LightMapKnob, Number) 5 - 0 max (>L:LightMapKnob, Number)')
    },
    {
        event = instr_light_outer_inc,
        action = msfs.mfwasm.rpn_executer('(>B:KNOB_LIGHT_INSTRUMENT_OUTER_DRAG_Inc)')
    },
    {
        event = instr_light_outer_dec,
        action = msfs.mfwasm.rpn_executer('1 (>B:KNOB_LIGHT_INSTRUMENT_OUTER_DRAG_Dec)')
    },
    {
        event = instr_light_inner_inc,
        action = msfs.mfwasm.rpn_executer('(>B:KNOB_LIGHT_INSTRUMENT_INNER_DRAG_Inc)')
    },
    {
        event = instr_light_inner_dec,
        action = msfs.mfwasm.rpn_executer('1 (>B:KNOB_LIGHT_INSTRUMENT_INNER_DRAG_Dec)')
    },


-- map_light_inc           = hotas_events.button17.down
-- map_light_dec           = hotas_events.button17.down
-- instr_light_outer_inc   = hotas_events.button19.down    
-- instr_light_outer_dec   = hotas_events.button20.down
-- instr_light_inner_inc   = hotas_events.button21.down
-- instr_light_inner_dec   = hotas_events.button22.down


}