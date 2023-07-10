module UsersHelper
  def calculate_age(birth_date)
    now = Date.today
    age = now.year - birth_date.year
    age -= 1 if now < birth_date + age.years
    age
  end
end
