require 'rails_helper' 

describe 'Novo usuário' do 
	it "é inválido caso já exista um e-mail igual" do 
		user = User.create(
					username: 'danimar',
					firstname: 'Danimar', 
					lastname: 'Varisa',
					email: 'danimar@inovadora.com.br' ) 
		user = User.new(
					username: 'bruce',
					firstname: 'Bruce', 
					lastname: 'Dickinson',
					email: 'danimar@inovadora.com.br' )
		user.valid? 
		expect(user.errors[:email]).not_to include('has already been taken') 
	end 
end