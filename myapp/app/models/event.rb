class Event < ApplicationRecord
    belongs_to :admin, class_name: "User"

    has_many :attendances
    has_many :attendants, class_name: "User", through: :attendances

    validates :start_date, presence: true
    validate :start_date_cannot_be_in_the_past
    validates :duration, presence: true, value: {minimum: 3, maximum:500000}
    validates :title, presence: true, length: {minimum: 5, maximum:140}
    validates :description, presence: true, length: {minimum: 20, maximum: 1000}
    validates :price, presence: true, numericality: {greater_than: 0, less_or_equal_to: 1000}
    validates :location, presence: true


    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date > Date.today
            return true
        else 
            return false
        end
      end

    def multiple_of_5
        if duration % 5 == 0
            return true
        else 
            return false
        end 
    end

end
