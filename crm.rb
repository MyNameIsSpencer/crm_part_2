require_relative 'contact'

class CRM

  def initialize(name)
    @name = name # this is how the variable naming is normally done BTW
    main_menu
  end

  def what_is_the_name_of_this_CRM_again
    "Oh master, how could you forget? It was " + @name
  end

  def main_menu
    while true # repeat indefinitely
        print_main_menu
        user_selected = gets.to_i
        call_option(user_selected)
      end
  end

  def print_main_menu
    puts '[1] Add a new contact'
      puts '[2] Modify an existing contact'
      puts '[3] Delete a contact'
      puts '[4] Display all the contacts'
      puts '[5] Search by attribute'
      puts '[6] Exit'
      print 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit!
      # Finish off the rest for 3 through 6
      # To be clear, the methods add_new_contact and modify_existing_contact
      # haven't been implemented yet
      end
  end

  def add_new_contact
    print 'Enter First Name: '
      first_name = gets.chomp

      print 'Enter Last Name: '
      last_name = gets.chomp

      print 'Enter Email Address: '
      email = gets.chomp

      print 'Enter a Note: '
      note = gets.chomp

      Contact.create(
        first_name: first_name,
        last_name: last_name,
        email: email,
        note: note
      )
  end


  def modify_existing_contact
    puts "Enter id of the guy you wanna change"
    ider = gets.chomp.to_i
    puts "What is wrong with them, what attribute do you want to update?"
    attribute = gets.chomp
    puts "What is the new value you want to change to?"
    new_value = gets.chomp
    person = Contact.find(ider)
    person.update({attribute => new_value})
  end

  def delete_contact
    puts "Who do you want to get rid of (id)?"
    input = gets.chomp.to_i
    person = Contact.find(input)
    person.delete
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    puts "How do you want to stalk the person (input attribute)?"
    attribute = gets.chomp
    puts "What is that person's attribute value?"
    value = gets.chomp
    result = Contact.where({attribute => value})
    result.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} has #{contact.email}"
      puts "note: #{contact.note}"
      puts "-" * 20
    end
  end


end


mine = CRM.new('Mine')
