require "./contact"

class AddressBook
  attr_reader :contacts
  
  def initialize
    @contacts = []
  end
  
  def print_results(search, results)
    puts search
    results.each { |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_address
      puts "\n"
    }
  end
  
  def find_by_name(name)
    results = []
    search = name.downcase
    
    contacts.each {|contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact) unless results.include?(contact)
      end
    }
    print_results( "Name search results for (#{name})" , results)
  end 
  
  def find_by_phone_number(number)
    results = []
    search = number.gsub("-","")
    
    contacts.each { |contact|
      contact.phone_numbers.each { |phone_number|
        if phone_number.number.gsub("-","").include?(search)
          results.push(contact)
        end
        }
    }
    print_results("Phone number results for (#{number})" , results)
  end

  
  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each { |contact|
      contact.addresses.each { |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      }    
    }
    print_results("Address search results for (#{query})" , results)  
  end
    
  def print_contact_list
    contacts.each { |contact|
      puts contact.to_s('last_first')
    }
  end
    
end

address_book = AddressBook.new
kristen = Contact.new
kristen.first_name = "Kristen"
kristen.last_name = "Malone"
kristen.middle_name = "Marie"
kristen.add_phone_number("home","123-456-7890")
kristen.add_phone_number("work","456-456-7890")
kristen.add_address("home","70 main","", "Geneseo","NY","14454")

bob = Contact.new
bob.first_name = "Robert"
bob.last_name = "Barker"
bob.add_phone_number("cell","333-232-3333")
bob.add_address("Work", "123 Price Is Right Blvd","","Los Angeles","CA","90210")

address_book.contacts.push(kristen)
address_book.contacts.push(bob)
#address_book.print_contact_list

#address_book.find_by_name("r")
#address_book.find_by_phone_number("2")
address_book.find_by_address("main")