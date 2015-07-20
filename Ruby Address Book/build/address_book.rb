require "./contact"
require "yaml"

class AddressBook
  attr_reader :contacts
  
  def initialize
    @contacts = []
#    this "open" will let the contacts list know to follow our method to "open" defined below when it's initialized 
    open()
  end
  
  def open
    if File.exist?("contacts.yml")
#      replaces @contacts array with the contents of the YAML file - this will parse everything in the YAML file back into Ruby objects and replace the current internal contacts array with those contents
      @contacts = YAML.load_file("contacts.yml")
    end
  end
  
  def save
#    the below '.open' takes an arguement of the name of the file + the way that you want to access this file, in this case "w" indicates "write-only" - you can use the YAML)
    File.open("contacts.yml","w") { |file|
      file.write(contacts.to_yaml)
    }
  end
  
  def run
#    this is our main loop we're running to get user input and populate our address book - the add_contact method is used herein to gather user inputs which is called in this main 'run' method
    loop {
      puts "Address Book"
      puts "a: Add Contact"
      puts "p: Print Address Book"
      puts "s: Search"
      puts "e: Exit"
      print "Enter your choice: "
      input = gets.chomp.downcase
      case input
      when 'a'
        add_contact
      when 'p'
        print_contact_list
      when 's'
        print "Search term: "
        search = gets.chomp.downcase
        find_by_name(search)
        find_by_phone_number(search)
        find_by_address(search)
        print "\n"
      when 'e'
        save()
        break
      end
    }
  end
  
  def add_contact
#    when this "add_contact" method breaks in the below, that breaks its own loop and then sends the user back to the above main menu for data entry
    contact = Contact.new
    print "First name: "
    contact.first_name = gets.chomp
    print "Middle name: "
    contact.middle_name = gets.chomp
    print "Last name: "
    contact.last_name = gets.chomp
    
    loop {
      puts "Add phone number or address?"
      puts "p: Add phone number"
      puts "a: Add address"
      puts "(any other key to go back)"
      response = gets.chomp.downcase
      case response
      when 'p'
        phone = PhoneNumber.new
        print "What kind of phone number is it- home, work, etc.?"
        phone.kind = gets.chomp
        print "Number: "
        phone.number = gets.chomp
        contact.phone_numbers.push(phone)
      when 'a'
        address = Address.new
        print "What kind of address- home, work, etc.?"
        address.kind = gets.chomp
        print "Address line 1: "
        address.street_1 = gets.chomp
        print "Address line 2: "
        address.street_2 = gets.chomp
        print "City: "
        address.city = gets.chomp
        print "State: "
        address.state = gets.chomp
        print "Zip Code: "
        address.postal_code = gets.chomp
        contact.addresses.push(address)
      else 
        print "\n"
        break
      end
    }
    contacts.push(contact)
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
    puts "Contact List"
    contacts.each { |contact|
      puts contact.to_s('last_first')
    }
  end
    
end

address_book = AddressBook.new
address_book.run

    
#    other things I can do - remove addresses, search differently, sort, etc.