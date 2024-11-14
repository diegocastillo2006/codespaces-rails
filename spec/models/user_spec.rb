require 'rails_helper' 	


RSpec.describe User, type: :model do
  it "es válido con un nombre y un email" do
    user = User.new(name: "Juan", email: "juan@ejemplo.com")
    expect(user).to be_valid
  end


  it "no es válido sin un nombre" do
    user = User.new(name: nil, email: "juan@example.com")
    expect(user).not_to be_valid 
  end
 
  it "no es válido sin un email" do
    user = User.new(name: "Juan", email: nil)
    expect(user).not_to be_valid
  end


  it "no es válido con un email duplicado" do
    User.create!(name: "Test", email: "Test@example.com")
    expect(User.count).to eq(1) # Verifica que el registro fue creado
    user = User.new(name: "Pedro", email: "juan@example.com")
    expect(user).not_to be_valid
  end
 
end
