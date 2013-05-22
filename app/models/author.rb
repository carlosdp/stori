class Author < ActiveRecord::Base
  attr_accessible :active, :first_name, :last_name, :phone

  has_many :stories
  has_many :sentences

  validates_presence_of :first_name, :last_name
  validates_format_of :phone, with: /^\(?\d{3}\)?[ .-]?\d{3}[ .-]?\d{4}$/

  before_save :format_phone

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def proper_name
    "#{self.last_name}, #{self.first_name}"
  end

  protected

  def format_phone
    self.phone = self.phone.split('').select {|n| n=~/\d/ }.join
  end
end
