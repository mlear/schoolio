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
    password_confirmation "foobar"
  end

  factory :invalid_user, class: User do
    first_name ""
    last_name ""
    email ""
    password ""
    password_confirmation ""
  end

  factory :course do
    subject 'Music'
    name 'Musicology 101'
  end

end
