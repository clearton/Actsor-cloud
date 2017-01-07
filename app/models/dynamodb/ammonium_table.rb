class Dynamodb::AmmoniumTable

  def self.range(ball_name, from, to)
    dynamodb = Aws::DynamoDB::Client.new
    d = dynamodb.query({table_name: 'AmmoniumTable',
                        key_condition_expression: 'ballName = :ball_name and #st between :start_time and :end_time',
                        expression_attribute_names:{
                          "#st": "readTime"
                        },
                        expression_attribute_values: {
                          ':start_time' => from.to_i.to_s,
                          ':end_time' =>  to.to_i.to_s,
                          ':ball_name' => "#{ball_name}"
                        },
                        scan_index_forward: true})
    d.items
  end
end
