-- Bindings for A2A Aerostar


parking_brake_on = hotas_events.button24.up
parking_brake_off = hotas_events.button24.down

gear_up = hotas_events.button25.down
gear_down = hotas_events.button25.up

flaps_up = hotas_events.button22.down
flaps_mid = hotas_events.button22.up
flaps_mid_alt = hotas_events.button23.up
flaps_down = hotas_events.button23.down


left_fuel_sel_off = panel_events.button14.down
left_fuel_sel_on = panel_events.button15.down
left_fuel_sel_xfeed = panel_events.button16.down

right_fuel_sel_off = panel_events.button34.down
right_fuel_sel_on = panel_events.button35.down
right_fuel_sel_xfeed = panel_events.button36.down

left_fuel_booster_on = hotas_events.button16.down
left_fuel_booster_off = hotas_events.button16.up

right_fuel_booster_on = hotas_events.button17.down
right_fuel_booster_off = hotas_events.button17.up



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


}