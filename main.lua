mapper.set_primary_mappings({
    {
        event = mapper.events.change_aircraft,
        action = function(_, at) 
            -- for k,v in pairs(at) do
            --     mapper.print(k .. ' - ' .. v)
            -- end
            local name = at.aircraft
            local beech_prefix = 'Beechcraft D18S'
            if string.sub(name, 1, string.len(beech_prefix)) == beech_prefix then
                mapper.print('Beech!')
                require('beech')
                mapper.set_secondary_mappings(beech_mappings)
            else
                mapper.print('No Beech')
            end
        end
    }
})