require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  it 'Sends order to kitchen' do
    pickup_time = (Time.now + 30.minutes).strftime("%H:%M")
    customer_email = 'test@test.com'
    cart = [{"product_id"=>"19",
             "product_name"=>"Bibimbap",
             "price"=>129,
             "ingredient_id"=>"25",
             "ingredient_name"=>"Chicken",
             "item_quantity"=>1}]
    email = OrderMailer.kitchen_order_details(customer_email, cart, pickup_time).deliver_now

    expect(email.subject).to eq("Pickup time: #{pickup_time}")
    expect(email.to).to eq([(ENV['gmail_username'])])
    expect(email.from).to eq([(ENV['gmail_username'])])
  end
end
