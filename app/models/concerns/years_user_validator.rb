class YearsUserValidator < ActiveModel::Validator
  def validate(record)
    unless record.birth_date < 16.years.ago
      record.errors[:birth_date] << "You should be 16 years old to create an account"
    end
  end
end