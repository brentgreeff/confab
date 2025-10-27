module TimecopHelpers
  def on(date)
    if block_given?
      ret = nil
      Timecop.freeze(date) { ret = yield }
      Timecop.return
      ret
    else
      Timecop.freeze(date)
    end
  end
end
