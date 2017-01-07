require "net/https"
require "uri"

class RestfulConnection

  def initialize(ball_name)
    @uri = URI.parse("https://a1j1xrqijbt2kb.iot.us-east-1.amazonaws.com:8443/things/#{ball_name}/shadow")
    @pem = File.read("#{Rails.root.to_s}/lib/certs/b2755a44e4-certificate.pem.crt")
    @key = File.read("#{Rails.root.to_s}/lib/certs/b2755a44e4-private.pem.key")
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
    @http.cert = OpenSSL::X509::Certificate.new(@pem)
    @http.key = OpenSSL::PKey::RSA.new(@key)
    @http.ca_file = "#{Rails.root.to_s}/lib/certs/rootCA.pem.crt"
    @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  end

  def get
    request = Net::HTTP::Get.new(@uri.request_uri)
    response = @http.request(request)
    response.body
  end

  def get_by_actuator_name(actuator_name)
    @rsp ||= JSON.parse(get)
    actuator_list = @rsp['state']['reported']
    @state = actuator_list[actuator_name] if actuator_list
    @state == "ON" ? true : false
  end
end

