class CatalogHolding
  attr_reader :fields
  def initialize(datafield)
    @fields = {
      source: datafield['b'],
      htid: datafield['u'],
      rights_code: datafield['r'],
      last_update: datafield['d'],
      enumcron: datafield['z']
    }
  end
end