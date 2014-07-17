FactoryGirl.define do
  factory :unsaved_user, class: User do
    first_name "Leslie"
    last_name "Knope"
    email "waffles@whipped_cream.yum"
    password "foobar"
  end

  factory :valid_user, class: User do
    first_name "Ron"
    last_name "Swanson"
    email "noneofyour@damn.biz"
    password "foobar"
  end
end
