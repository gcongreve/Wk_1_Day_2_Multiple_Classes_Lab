class BusStop

  attr_reader :stop_name, :queue

  def initialize(stop_name)
    @stop_name = stop_name
    @queue = []
  end

  def add_person(person)
    @queue << person
  end

  def add_people(people)
    for person in people
      @queue << person
    end
  end 



end
