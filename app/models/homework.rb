class Homework < ApplicationRecord
    belongs_to :created_by, class_name: 'User', optional: true 
    #membuat relasi created_by dengan class 'user'
    
    validates :homework_name, presence: true
    validates :category, presence: true
    validates :deadline, presence: true
    validates :description, presence: true, length: {maximum:300}
  
    validate :deadline_cannot_be_in_the_past
    belongs_to :category
  
    #contoh custom validation untuk melakukan validasi
    #bahwa deadline tidak boleh terjadi di masa lampauu
    def deadline_cannot_be_in_the_past
      errors.add(:deadline, "can't be in the past") if
      deadline < Date.today
  end
end
