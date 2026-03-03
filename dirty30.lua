
-- wheels
parking_brake_on = hotas_events.button24.up
parking_brake_off = hotas_events.button24.down

gear_up = hotas_events.button25.down
gear_down = hotas_events.button25.up

-- incremental flaps
flaps_dec = hotas_events.button22.down
flaps_inc = hotas_events.button23.down

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

-- Ap knobs
heading_inc = panel_events.button39.down
heading_dec = panel_events.button38.down

course_inc = panel_events.button42.down
course_dec = panel_events.button41.down


dirty30_mappings = {

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

    -- == Flaps == --

    {
        event = flaps_inc,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_INCR)')
    },
    {
        event = flaps_dec,
        action =  msfs.mfwasm.rpn_executer('(>K:FLAPS_DECR)')
    },

    -- == AP == --
    {
        event = heading_inc,
        action = msfs.mfwasm.rpn_executer('(>K:HEADING_BUG_INC)')
    },
    {
        event = heading_dec,
        action = msfs.mfwasm.rpn_executer('(>K:HEADING_BUG_DEC)')
    },
    {
        event = course_inc,
        action = msfs.mfwasm.rpn_executer('(>K:VOR1_OBI_INC)')
    },
    {
        event = course_dec,
        action = msfs.mfwasm.rpn_executer('(>K:VOR1_OBI_DEC)')
    },
  }
