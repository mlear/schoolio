FactoryGirl.define do
  factory :valid_user, class: User do
    first_name "Ron"
    last_name "Swanson"
    email "noneofyour@damn.biz"
    password "foobar"
  end
end
