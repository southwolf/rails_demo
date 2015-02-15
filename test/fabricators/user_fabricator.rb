Fabricator(:user) do
  email {sequence(:email) { |i| "test#{i}@test.com"} }
  password PASSWD
  password_confirmation PASSWD
end
