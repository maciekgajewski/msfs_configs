-- hotas = mapper.device{
--     name = 'Hotas',
--     type = 'dinput',
--  --   identifier = {name = 'Throttle - HOTAS Warthog'},
--     identifier = {name = 'Thrustmaster Combined'},
--     modifiers = {},
-- }

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
-- mapper.print("== Events BEGIN ==")
-- for k,v in pairs(panel_events.button32) do
--     mapper.print(k)
-- end
-- mapper.print("== Events END ==")

-- local my_event = mapper.register_event('My Event')

-- beech mappings
selector_left = panel_events.button31
selector_center = panel_events.button32
selector_right = panel_events.button33

primer_button = panel_events.button6

left_fuel_sel_off = panel_events.button14
left_fuel_sel_front = panel_events.button15
left_fuel_sel_rear = panel_events.button16

right_fuel_sel_off = panel_events.button34
right_fuel_sel_front = panel_events.button35
right_fuel_sel_rear = panel_events.button36

left_mh_up = panel_events.button23
left_mh_down = panel_events.button24

right_mh_up = panel_events.button25
right_mh_down = panel_events.button26

left_os_up = panel_events.button27
left_os_down = panel_events.button28

right_os_up = panel_events.button29
right_os_down = panel_events.button30


left_fuel_pump_on = panel_events.button17
left_fuel_pump_off = panel_events.button18

hsi_cdi_inc = panel_events.button39
hsi_cdi_dec = panel_events.button38

-- state vars
left_mh_val = 0
right_mh_val = 0
mh_increment = 256

left_os_val = 0
right_os_val = 0
os_increment = 2

oe = mapper.register_event('observed event')
local observed_data = {
     {rpn="(A:ENG ANTI ICE:0,Number)", event=oe},
}
msfs.mfwasm.add_observed_data(observed_data)

mapper.set_primary_mappings{
    {
        event = selector_left.down,
        action = filter.duplicator(
            msfs.mfwasm.rpn_executer('0 (>L:CARVAR_SW_STARTER_LR, Number)'),
            msfs.mfwasm.rpn_executer('0 (>L:CARVAR_SW_PRIMER_LR, Number)')
        )    
    },
    {
        event = selector_center.down,
        action = filter.duplicator(
            msfs.mfwasm.rpn_executer('1 (>L:CARVAR_SW_STARTER_LR, Number)'),
            msfs.mfwasm.rpn_executer('1 (>L:CARVAR_SW_PRIMER_LR, Number)')
        )    
    },
    {
        event = selector_right.down,
        action = filter.duplicator(
            msfs.mfwasm.rpn_executer('2 (>L:CARVAR_SW_STARTER_LR, Number)'),
            msfs.mfwasm.rpn_executer('3 (>L:CARVAR_SW_PRIMER_LR, Number)')
        )    
    },
    -- dont know how to operatre primer or pumps
    -- {
    --     event = primer_button.down,
    --     --action =  msfs.mfwasm.rpn_executer('TRUE (>K:FUELSYSTEM_PUMP_ON:1, Bool)')
    --     -- action = function()
    --     --     msfs.send_event('FUELSYSTEM_PUMP_ON:1', 1)
    --     -- end

    -- },


    -- {
    --     event = left_fuel_pump_on.down,
        
    --     -- action = msfs.mfwasm.rpn_executer('1 0 (>K:2:FUELSYSTEM_PUMP_SET)'), -- doesnt work
    --      action = msfs.mfwasm.rpn_executer('TRUE (>L:Denarq_FuelPump_1, enum)') -- nope

    -- },
    -- {
    --     event = left_fuel_pump_off.down,
    --     action = msfs.mfwasm.rpn_executer('0 0 (>K:2:FUELSYSTEM_PUMP_SET)'),
    -- },


    -- == Fuel selectors ==

    {
        event = left_fuel_sel_off.down,
        action = msfs.mfwasm.rpn_executer('0 (>L:Denaq_Fuel_Sel1, Number)'),
    },
    {
        event = left_fuel_sel_front.down,
        action = msfs.mfwasm.rpn_executer('1 (>L:Denaq_Fuel_Sel1, Number)'),
    },
    {
        event = left_fuel_sel_rear.down,
        action = msfs.mfwasm.rpn_executer('2 (>L:Denaq_Fuel_Sel1, Number)'),
    },

    {
        event = right_fuel_sel_off.down,
        action = msfs.mfwasm.rpn_executer('0 (>L:Denaq_Fuel_Sel2, Number)'),
    },
    {
        event = right_fuel_sel_front.down,
        action = msfs.mfwasm.rpn_executer('1 (>L:Denaq_Fuel_Sel2, Number)'),
    },
    {
        event = right_fuel_sel_rear.down,
        action = msfs.mfwasm.rpn_executer('2 (>L:Denaq_Fuel_Sel2, Number)'),
    },


    -- === De-ice ==

    {
        event = left_mh_up.down,
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
        event = left_mh_down.down,
        action = function ()
            if left_mh_val < 16384 then 
                left_mh_val = left_mh_val + mh_increment
                msfs.send_event('ANTI_ICE_GRADUAL_SET_ENG1', left_mh_val)
            end
        end
    },
    {
        event = right_mh_up.down,
        action = function ()
            if right_mh_val > 0 then 
                right_mh_val = right_mh_val - mh_increment
                msfs.send_event('ANTI_ICE_GRADUAL_SET_ENG2', right_mh_val)
            end
        end
    },
    {
        event = right_mh_down.down,
        action = function ()
            if right_mh_val < 16384 then 
                right_mh_val = right_mh_val + mh_increment
                msfs.send_event('ANTI_ICE_GRADUAL_SET_ENG2', right_mh_val)
            end
        end
    },

    -- == Oil Shutters ==
    {
        event = left_os_up.down,
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
        event = left_os_down.down,
        action = function ()
            if left_os_val < 100 then 
                left_os_val = left_os_val + os_increment
                msfs.mfwasm.execute_rpn(left_os_val .. ' (>L:Denarq_OILSHUTTER_SET_1)')
            end
        end
    },
    {
        event = right_os_up.down,
        action = function ()
            if right_os_val > 0 then 
                right_os_val = right_os_val - os_increment
                msfs.mfwasm.execute_rpn(right_os_val .. ' (>L:Denarq_OILSHUTTER_SET_2)')
            end
        end
    },
    {
        event = right_os_down.down,
        action = function ()
            if right_os_val < 100 then 
                right_os_val = right_os_val + os_increment
                msfs.mfwasm.execute_rpn(right_os_val .. ' (>L:Denarq_OILSHUTTER_SET_2)')
            end
        end
    },

    -- === HSI ===

    {
        event = hsi_cdi_inc.down,
        action = msfs.event_sender('VOR1_OBI_INC')
    },
    {
        event = hsi_cdi_dec.down,
        action = msfs.event_sender('VOR1_OBI_DEC')
    },

}
-- mapper.raise_event(my_event, 1)