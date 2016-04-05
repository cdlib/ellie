class ZephirItemRecord
  attr_reader :data, :marc
  
  def initialize(data)
    @data = data
    @marc = MARC::Record.from_hash(JSON.parse(response.body))
  end
  
  def self.find(id)
    puts id
    response = RestClient.get "http://zephir.cdlib.org/api/item/#{id}", {:accept => :json}
    puts response.inspect
    case response.code
    when 404
      raise RecordNotFound
    when !200
      raise StandardError
    else
      MARC::Record.new_from_hash(JSON.parse(response.body))
    end
  end
end
