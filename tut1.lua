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
        {name="button25", modtype="button"},
        {name="button26", modtype="button"},
        {name="button27", modtype="button"},
        {name="button28", modtype="button"},
        {name="button29", modtype="button"},
        {name="button30", modtype="button"},
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


-- state vars
left_mh_val = 0
right_mh_val = 0
mh_increment = 256

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
    }

}
-- mapper.raise_event(my_event, 1)