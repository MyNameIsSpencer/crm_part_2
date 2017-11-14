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

      Contact.create(first_name, last_name, email, note)
  end


  def modify_existing_contact
    puts "Enter id of the guy you wanna change"
    ider = gets.chomp.to_i
    person = Contact.find(ider)
    Contact.update(person)
  end


   # def self.modify_existing_contact
   #   new_value = nil
   #   puts "Who would you like to change? (id please)"
   #   ider = gets.chomp.to_i
   #   puts "What would you like to change about them? (add '_write')"
   #   attrib = gets.chomp.to_s
   #   puts "What would you like them to be changed to?"
   #   new_value = gets.chomp
   #
   #   puts Contact.changer(ider, attrib, new_value)
   # end

  # def self.modify_existing_contact
  #   puts "Who would you like to change (input id)?"
  #   a = gets.chomp
  #   the_list = Contact.all
  #   the_guy = []
  #   the_list.each do |contacter|
  #     if contacter.id == a
  #       the_guy = contacter
  #     end
  #     return the_guy
  #     puts the_guy.inspect
  #   end
  # end

  def delete_contact
    puts Contact.delete_em
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    puts Contact.find_by.inspect
  end


end


# CRM.delete_contact
# puts CRM.display_all_contacts
mine = CRM.new('Mine')
# new_crm.modify_existing_contact
# CRM.modify_existing_contact



# puts '*^*^*^*^*^*^*^*^*^*^*^*^*^*^*^*'
# puts Contact.update(ronk)
#
# puts betty.email # => 'bettymakes@gmail.com'
# betty.note = 'Loves HTML & CSS'
# puts Contact.all.inspect
#
# Contact.update(contact)
# puts "$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$"
# puts Contact.find_by.inspect
# puts "$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$"
#
# Contact.delete_em(johnny)
# puts Contact.all.inspect
# Contact.delete_all
# puts Contact.all.inspect
