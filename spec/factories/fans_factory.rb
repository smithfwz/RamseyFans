FactoryGirl.define do
  factory :fan do
    email 'smith@futureworkz.com'
    password '123123123'
    confirmed_at Time.now
  end

end
