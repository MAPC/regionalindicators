FactoryGirl.define do

  factory :topic_area do
    title    "Sustainable Growth Patterns"
    subtitle "Are we living within our means?"
    visible   true
    featured  false
  end

  factory :featured_topic_area do
    title    "Prosperity"
    subtitle "What makes a prosperous region?"
    visible   true
    featured  true
  end

end

