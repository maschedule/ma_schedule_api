module MainHelper
  def select_options_for_period
    periods = Period.select(:from, :to, :production, :city, :id)
    periods.map do |period| 
      ["#{period.from} - #{period.to}, 
        #{period.production}, #{period.city}", 
        period.id]
    end
  end
end
