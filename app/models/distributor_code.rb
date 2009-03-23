class DistributorCode < ActiveRecord::Base

  belongs_to :author

  def self.exists?(distributor_code)
    return false if !self.find_by_code(distributor_code)
    return true
  end

  def used_again!
    self.user_count = self.user_count + 1
    self.save!
  end
end
