class TemperatureChart

  def chart(values, sensor, ball_name )
    @values = values
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "#{sensor.capitalize} Chart #{ball_name}")
      f.xAxis(categories: @values.map{|g| Time.at(g['readTime'].to_i / 1000).strftime("%m/%d/%y %H:%M") }, :labels => {:rotation => -45, :align => 'right'})
      f.series(name: "Sensor 1", yAxis: 0, data: @values.map{|g| g[sensor.downcase].to_i})
      #f.series(name: "Population in Millions", yAxis: 1, data: [310, 127, 1340, 81, 65])
      f.yAxis [
        #{title: {text: "GDP in Billions", margin: 70} },
        {title: {text: sensor}, opposite: true},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "line"})
    end
    @chart
  end

  def chart_globals

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.chart(
        backgroundColor: {
          linearGradient: [0, 0, 500, 500],
          stops: [
            [0, "rgb(255, 255, 255)"],
            [1, "rgb(240, 240, 255)"]
          ]
        },
        borderWidth: 2,
        plotBackgroundColor: "rgba(255, 255, 255, .9)",
        plotShadow: true,
        plotBorderWidth: 1
      )
      f.lang(thousandsSep: ",")
      f.colors(["#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
    end
    @chart_globals
  end
end
