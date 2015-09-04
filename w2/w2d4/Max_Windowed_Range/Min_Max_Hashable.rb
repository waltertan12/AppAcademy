module MinMaxHashable
  def record_min_max(el)
    @max_history.push({ el => @max })
    @min_history.push({ el => @min })
    if @max.nil? || el > @max
      @max = el
    end

    if @min.nil? || el < @min
      @min = el
    end
  end

  def new_max_min(value)
    @max = @max_history.pop[value]
    @min = @min_history.pop[value]
  end
end