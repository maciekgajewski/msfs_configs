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
        {name="button31", modtype="button"}
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
        event = panel_events.button32.change,
        action = msfs.mfwasm.rpn_executer('1 (>L:CARVAR_SW_STARTER_LR, Number)')
    },
    {
        event = panel_events.button33.change,
        action = msfs.mfwasm.rpn_executer('2 (>L:CARVAR_SW_STARTER_LR, Number)')
    },
}
-- mapper.raise_event(my_event, 1)