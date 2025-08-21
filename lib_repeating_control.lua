-- Repeating control class
RepeatingControl = { engage_event=0,  disengage_event=0, is_engaged=0, action=nil, delay=100 }

function RepeatingControl:new(eng_ev, dis_ev, act)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.engage_event = eng_ev
    o.disengage_event = dis_ev
    o.engage_action = function() o:do_engage() end
    o.disengage_action = function() o:do_disengage() end
    o.action = act
    o.is_engaged = 0
    return o
end

function RepeatingControl:do_engage()
    local f
    f = function()
        if self.is_engaged == 1 then
            self.action()
            mapper.delay(self.delay, f)
        end
    end

    if self.is_engaged == 0 then
        self.is_engaged = 1
        f()
    end
    self.is_engaged = 1
end


function RepeatingControl:do_disengage()
    self.is_engaged = 0
end
