local Timer = {}

function Timer.new()
  local self, timers = {}, {}

  function self.new(t, fn, iters)
    timers[#timers+1] = timer.performWithDelay(t, fn, iters)
  end

  function self.destroy()
    for i=1, #timers do
      timer.cancel(timers[i])
    end
    self = nil
  end

end

return Timer
