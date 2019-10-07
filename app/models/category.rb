class Category < ApplicationRecord
    validates :name, presence: true, length: {minimum: 4 } 
    #data name harus diisi dan pengisian minimal 4 karakter
    has_many :homeworks
end
