class MqttConnection

  attr_reader :client

  def initialize
    @client = MQTT::Client.new
    @client.host = 'a1j1xrqijbt2kb.iot.us-east-1.amazonaws.com'
    @client.port = 8883
    @client.ssl = true
    @client.ssl_context
    @client.ca_file   = "#{Rails.root.to_s}/lib/certs/rootCA.pem.crt"
    @client.key_file  = "#{Rails.root.to_s}/lib/certs/b2755a44e4-private.pem.key"
    @client.cert_file = "#{Rails.root.to_s}/lib/certs/b2755a44e4-certificate.pem.crt"
  end

  def connect
    client.connect() unless client.connected?
  end

  def publish(ball_name, actuator_name, value)
    message = "{\"state\":{\"reported\":{\"#{actuator_name}\":\"#{value}\"}}}"
    client.publish("$aws/things/#{ball_name}/shadow/update",message, retain=false,qos=0)
    client.publish('switches', message, retain=false,qos=0)
  end

  def close
    client.disconnect()
  end
end
