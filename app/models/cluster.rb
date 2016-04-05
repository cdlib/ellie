class Cluster
  attr_reader :id, :catalog_record
  def initialize(id)
    @id = id
    @catalog_record = CatalogRecord.find(id).first
  end
  
  def self.find(id)
    # TODO: Check if exists in Zephir first.
    Cluster.new(id)
  end
end
