require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def self.counter
    @counter ||= 0
    @counter += 1
  end

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = self.class.counter
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def rent_book(rental)
    @rentals << rental
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
