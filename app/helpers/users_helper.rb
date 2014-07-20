module UsersHelper
  def name
    "#{first_name} #{last_name}"
  end

  def profile(things)
    output = ""
    things.each do |thing|
      output << "#{thing.capitalize}, "
    end
    output[0..-2]
  end
end
