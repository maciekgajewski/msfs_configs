hotas = mapper.device{
    name = 'Hotas',
    type = 'dinput',
    identifier = {name = 'Throttle - HOTAS Warthog'},
    modifiers = {},
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
mapper.set_primary_mappings{
    {
        event = panel_events.button31.down,
        action = msfs.mfwasm.rpn_executer('0 (>L:CARVAR_SW_STARTER_LR, Number)')
    },
    {
        event = panel_events.button32.down,
        action = msfs.mfwasm.rpn_executer('1 (>L:CARVAR_SW_STARTER_LR, Number)')
    },
    {
        event = panel_events.button33.down,
        action = msfs.mfwasm.rpn_executer('2 (>L:CARVAR_SW_STARTER_LR, Number)')
    },

    -- test - setting engine mixure levels using btns 8-10
    -- {
    --     event = panel_events.button8.down,
    --     action = msfs.mfwasm.rpn_executer('0 (>A:GENERAL ENG MIXTURE LEVER POSITION:1, Number)')
    -- },
    -- {
    --     event = panel_events.button9.down,
    --     --action = msfs.mfwasm.rpn_executer('0.33 (>A:GENERAL ENG MIXTURE LEVER POSITION:1, Number)')
    --     action = function (evid, value) 
    --         --msfs.execute_input_event('LIGHTING_LANDING_0', 1)
    --         --msfs.send_event('MIXTURE1_DECR') -- this works
    --         --msfs.execute_input_event('MIXTURE1_DECR', 0) -- does not work
    --         msfs.send_event('AXIS_MIXTURE1_SET', 0.5)
    --     end
    -- },
    -- {
    --     event = panel_events.button10.down,
    --     action = msfs.mfwasm.rpn_executer('0.66 (>A:GENERAL ENG MIXTURE LEVER POSITION:1, Number)')
    -- },
    -- {
    --     event = panel_events.button11.down,
    --     action = msfs.mfwasm.rpn_executer('1 (>A:GENERAL ENG MIXTURE LEVER POSITION:1, Number)')
    -- },
    -- mapping axis
    {
        event = panel_events.x.change,
        -- action = function(_, val) 
        --     --scaled = (val + 50000) / 100000.0
        --     scaled = val * 0.6
        --     mapper.print('scaled val: ' .. scaled)
        --     msfs.send_event('AXIS_MIXTURE1_SET', scaled)
        --     -- msfs.send_event('AXIS_MIXTURE1_SET', val*0.6)
        -- end
        action = filter.lerp(
            function(_, val)
                mapper.print('larped val: ' .. val)
                msfs.send_event('AXIS_MIXTURE1_SET', val)
            end,
            --msfs.event_sender('AXIS_MIXTURE1_SET'),
            {
                {-50000, -16384},
                {50000, 16384}
            }
        )
    },

}
-- mapper.raise_event(my_event, 1)