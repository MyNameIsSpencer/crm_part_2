gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')



class Contact

  @@contacts = []
  @@id = 001

  # This method should initialize the contact's attributes
    def initialize(first_name, last_name, email, note)
      @first_name = first_name
      @last_name = last_name
      @email = email
      @note = note
      @id = @@id
      @@id += 1 # this way the next contact will get a different id
    end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  # remember, we preface the method name with 'self.' if it is a class method
  def self.create(first_name, last_name, email, note = nil)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # a getter (*get* the value of an attribute)
  def email
    @email
  end

  # a setter (*set* the value of an attribute)
  def note=(note)
    @note = note
  end

  def note_reader
    @note
  end

  def id
    @id
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end


#******* WRITERS START
  def email_write(new_value)
    @email = new_value
  end

  def note_write(new_value)
    @note = new_value
  end

  def id_write(new_value)
    @id = new_value
  end

  def first_name_write(new_value)
    @first_name = new_value
  end

  def last_name_write(new_value)
    @last_name = new_value
  end
#******* WRITERS END

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(ider)
    @@contacts.each do |contacter|
      if contacter.id == ider
        return contacter
      end
    end
    return false
  end


  # def self.changer(ider, attrib, new_value)
  #   if attrib == 'first_name'
  #     @@contacts.each do |contacter|
  #       if contacter.id == ider
  #         contacter.first_name = new_value
  #       end
  #     end
  #   elsif attrib == 'last_name'
  #     @@contacts.each do |contacter|
  #       if contacter.id == ider
  #         contacter.last_name = new_value
  #       end
  #     end
  #   elsif attrib == 'email'
  #       @@contacts.each do |contacter|
  #         if contacter.id == ider
  #           contacter.email = new_value
  #         end
  #       end
  #   elsif attrib == 'note'
  #       @@contacts.each do |contacter|
  #         if contacter.id == ider
  #           contacter.note = new_value
  #         end
  #       end
  #
  #   end
  # end



  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def self.update(person)
    puts "Input attribute you'd like to change"
    puts "1 for first name"
    puts "2 for last name"
    puts "3 for email"
    puts "4 for note"
    puts "5 for id"
    attribute = gets.chomp.to_i
    puts "What value would you like to change it to?"
    new_value = gets.chomp
    if attribute == 1
      person.first_name_write(new_value)
      puts person.first_name
    elsif attribute == 2
      person.last_name_write(new_value)
      puts person.last_name
    elsif attribute == 3
      person.email_write(new_value)
      puts person.email
    elsif attribute == 4
      person.note_write(new_value)
      puts person.note_reader
    elsif attribute == 5
      person.id_write(new_value)
      puts person.id
    else
      puts "What chu talkin bout Willis?"
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

    # array_x = [fname, lname, guy_email, guy_id]
    # puts "How would you like to find the guy? First name? Last name? Email? Or id?"
    # input_1 = gets.chomp
    puts "Tell me something about the guy, (first name, email, etc..)"
    input = gets.chomp
    @@contacts.each do |guy|
      fname = guy.first_name
      lname = guy.last_name
      guy_email = guy.email
      guy_id = guy.id
      if guy.first_name == input || guy.last_name == input || guy.email == input || guy.email == input
        return guy
      end

    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    full_name
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete_em
    puts "Who do you want to get rid of? (input id)"
    ider = gets.chomp.to_i
    target = find(ider)


    @@contacts.delete(target).inspect
  end

  # Feel free to add other methods here, if you need them.

end





betty = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
johnny = Contact.create('Johnny', 'Jamstead', 'jjamstead@gmail.com', 'Hates Pokemon')
ronk = Contact.create('Ronk', 'Blaster', 'ronkronk@yahoo.com', 'Is a Pokemon')

# Contact.changer(2, 'first_name', 'Blur')
# puts Contact.all[1]


# How can I get contact's email?
# Then how can I change contact's note to 'Loves HTML & CSS'?

# puts Contact.all.inspect
#
#
# puts '*^*^*^*^*^*^*^*^*^*^*^*^*^*^*^*'
# puts Contact.update(ronk)
# puts ronk.inspect
#
# guy = Contact.find(3)
#
# Contact.update(guy)
# puts ronk.inspect
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
