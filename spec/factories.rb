FactoryGirl.define do

  factory :topic_area do
    title    "Sustainable Growth Patterns"
    subtitle "Are we living within our means?"
    visible   true
    featured  false
  end

  factory :static_page do
    title     "About"
    content   "A static __page__, *perhaps*."
    top        true
    sort_order 1
  end

  factory :user do
    password  "lolZ1293!?"
    password_confirmation "lolZ1293!?"
    email     "user@mapc.org"
    admin     false
  end

  factory :indicator do
    title  "An Indicator to Remember"
    number "20"
    units  "percentage points"
  end

end

