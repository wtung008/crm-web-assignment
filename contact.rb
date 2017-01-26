# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!


class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all  #works
    @@contacts.each do |contact|
    puts "#{contact.first_name} #{contact.last_name}"
    end
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(contact_id)   #works
      @@contacts.each do |contact|
        if contact_id == contact.id
          puts "#{contact.first_name} #{contact.last_name}"
          return contact
        #else
        #  puts "Contact id #{contact_id} not found"
        end
      end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attr_name, new_value)
    self.send("#{attr_name.to_s}=", new_value)
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attr_name, attr_value)     #works
    @@contacts.each do |contact|
      if attr_name == "first_name" && contact.first_name == attr_value
        #contact.[attr_name] == attr_value      #not working
        #puts "#{contact.first_name} #{contact.last_name}"
        return contact
      elsif
        attr_name == "last_name" && contact.last_name == attr_value
        #puts "#{contact.first_name} #{contact.last_name}"
        return contact
      elsif
        attr_name == "email" && contact.email == attr_value
        #puts "#{contact.first_name} #{contact.last_name}"
        return contact
      elsif
        attr_name == "note" && contact.note == attr_value
        #puts "#{contact.first_name} #{contact.last_name}"
        return contact
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all   #works
    @@contacts = []
  end

  def full_name
      "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete_if {|contact| contact.id == self.id}
  end

  # Feel free to add other methods here, if you need them.

end


# Test Inputs
#Contact.create("Betty", "B", "EmailB", "NoteB")
#Contact.create("Chuck", "C", "EmailC", "NoteC")
#Contact.create("Don", "D", "EmailD", "NoteD")
