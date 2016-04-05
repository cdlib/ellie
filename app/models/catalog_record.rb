class CatalogRecord
  attr_accessor :id, :titles, :oclcs, :isbns, :issns, :lccns, :resources, :marc, :holdings, :base_htid
  
  def initialize(record)
    puts record.inspect
    @titles = record['titles']
    @oclcs = record['oclcs']
    @isbns = record['isbns']
    @issns = record['issns']
    @lccns = record['lccns']
    @resources = { catalog: ['recordURL'] }
    @marc = MARC::XMLReader.new(StringIO.new(record['marc-xml'])).map { |record| record }[0]
    @id = @marc['001']
    @base_htid = @marc['HOL']['p']
    @holdings = @marc.fields("974").map { |holding| CatalogHolding.new(holding)}
  end

  def self.find(id, type='sysid')
    response = RestClient.get "http://catalog.hathitrust.org/api/volumes/full/#{type}/#{id}.json", {:accept => :json}
    case response.code
    when 404
      raise RecordNotFound
    when 200
      if response['records'].empty?
        raise RecordNotFound # hack for 404
      elsif !response.to_s.scan(/Fatal\serror/).empty?
        raise BibAPIDownError
      end
    else
      raise StandardError
    end
    # errors caught, process records
    records = JSON.parse(response.body)['records'].map { |row| CatalogRecord.new(row[1]) }
  end
end