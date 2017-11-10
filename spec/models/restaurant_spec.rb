require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'DB table' do
    it {is_expected.to have_db_column :name}
    it {is_expected.to have_db_column :address}
    it {is_expected.to have_db_column :phonenumber}
    it {is_expected.to have_db_column :hours}
    it {is_expected.to have_db_column :description}
    it {is_expected.to have_db_column :order_hours}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :address}
    it {is_expected.to validate_presence_of :phonenumber}
    it {is_expected.to validate_presence_of :hours}
    it {is_expected.to validate_presence_of :description}
    it {is_expected.to validate_presence_of :order_hours}
  end
end
