FactoryGirl.define do

  factory :message do
    text     "イエーイ!!!!!!!"
    image    { File.open("#{Rails.root}/test/fixtures/files/the_inu.jpg") }
    user_id  "2"
    group_id "1"
  end
end
