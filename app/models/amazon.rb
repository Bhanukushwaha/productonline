class Amazon < ApplicationRecord
validates_presence_of :name, :email, :date

end
