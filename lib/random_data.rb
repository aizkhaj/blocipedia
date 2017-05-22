module RandomData
  def self.sentence
    Faker::Lorem.sentence
  end

  def self.paragraph
    Faker::Lorem.paragraph
  end

  def self.email
    Faker::Internet.unique.email
  end

  def self.password
    Faker::Internet.password
  end
end
