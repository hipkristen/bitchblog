class Address
  attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code
  
  def to_s(format = 'short')
    address = ''
    case format
      when 'long'
      #"\n" adds a new line
        address += street_1 + "\n"
        address += street_2 + "\n" if !street_2.nil?
        address += "#{city}, #{state} #{postal_code}"
      when 'short'
        address += "#{kind} "
        address += "#{street_1}"
        if !street_2.nil?
          address += " #{street_2}"
        end
        address += ", #{city}, #{state} #{postal_code}"
      end
      address
    end
end


#note- since address.rb is required in contact.rb, if I leave this code in there it will also run whenever I run contact.rb, which is not ideal, hence the greyout
# home = Address.new
# home.kind = "home"
# home.street_1 = "70 Main St"
# home.city = "Geneseo"
# home.state = "NY"
# home.postal_code = "14454"

# puts home.to_s
# puts "\n"
# puts home.to_s('long')