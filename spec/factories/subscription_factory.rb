FactoryGirl.define do

  factory :subscription do
    factory :free_subscription do
      subscription_type "free"
    end

    factory :membership_subscription do
      subscription_type "membership"
    end

    factory :ally_subscription do
      subscription_type "ally"
    end
  end
end