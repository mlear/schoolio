module UsersHelper


  def name
    "#{first_name} #{last_name}"
  end

  def profile_behaivor(things)
    output = ""
    things.each do |thing|
      output << "#{thing.behavior_trait.name.capitalize}, value: #{thing.value}'"
    end
    output[0..-2]
  end

    def profile_interests(things)
    output = ""
    things.each do |thing|
      output << "#{thing.name.capitalize}"
    end
    output[0..-2]
  end

end
