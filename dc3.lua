-- == Bindings for DC-3 with Duckworks mod ==

parking_brake_on = hotas_events.button24.up
parking_brake_off = hotas_events.button24.down

gear_up = hotas_events.button25.down
gear_down = hotas_events.button25.up

tail_wheel_lock_toggle = hotas_events.button26.down

flaps_up = hotas_events.button22.down
flaps_mid = hotas_events.button22.up
flaps_mid_alt = hotas_events.button23.up
flaps_down = hotas_events.button23.down

ap_master_toggle = hotas_events.button15.down


dc3_mappings = {

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

    -- == Wheels ==
    {
        event = parking_brake_on,
        action =  msfs.mfwasm.rpn_executer('1 (>L:DUCKWORKS_PARKING_BRAKE_SET)')
    },
    {
        event = parking_brake_off,
        action =  msfs.mfwasm.rpn_executer('0 (>L:DUCKWORKS_PARKING_BRAKE_SET)')
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


    -- TODO

}

