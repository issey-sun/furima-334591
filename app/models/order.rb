class Order < ApplicationRecord
belongs_to :user
belongs_to :item
has_one :purchase_record


end
