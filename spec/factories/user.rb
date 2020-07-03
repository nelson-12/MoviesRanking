FactoryBot.define do
    factory :user do
        username { 'teste' }
        firstname { 'teste' }
        lastname { 'wayne' }
        email { 'teste@test.com' }
        password {  'Text123' }
        password_confirmation { 'Text123' }
    end
end