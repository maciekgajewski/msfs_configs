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