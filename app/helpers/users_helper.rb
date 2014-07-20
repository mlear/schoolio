module UsersHelper


  def name
    "#{first_name} #{last_name}"
  end

  def behavior_profile
    output = ""
    student_behaviors.each do |b|
      output << "#{b.behavior_trait.name.capitalize}, "
    end
    output[0..-2]
  end

  def interest_profile
    output = ""
    interests.each do |i|
      output << "#{i.name.capitalize}, "
    end
    output[0..-2]
  end
end
