class Kalman
  attr_reader :values, :q, :r, :sensor_name

  def initialize(values, sensor_name, q = 1e-5, r = 0.1**2)
    @values = values
    @q = q
    @r = r
    @sensor_name = sensor_name
    @xhatminus = 0.0
    @pminus = 0.0
    @k = 0.0
    @xhat = 0.0
    @p = 1.0
  end

  def calculate_value(value)
    # time update
    @xhatminus = @xhat
    @pminus = @p + q

    # measurement update
    @k = @pminus/(@pminus+r)
    @xhat = @xhatminus+(@k*(value - @xhatminus))
    @p = (1.0 - @k) * @pminus
    return(@xhat)
  end

  def filtered_values
    @values.map do |value|
      value[sensor_name.downcase] = calculate_value(value[sensor_name.downcase].to_i)
      value
    end
  end
end
