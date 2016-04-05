class Item
  attr_accessor :marc, :id
  
  def initialize(id)
    @id = id
    @marc = ZephirItemRecord.find(id)
  end
  
  def self.find(id)
    Item.new(id)
  end
end