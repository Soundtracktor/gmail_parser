# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :search
  validates :search, presence: true
end
