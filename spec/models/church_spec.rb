require 'spec_helper'


describe Church do
	context "checking validation" do
	  it "is valid with a name" do 
	  	church = Church.new(name: 'Jesus')
	  	expect(church.name).to eq('Jesus')
	 	end
	  it "is valid with a description" do
	  	church = Church.new(description: 'river')
	  	expect(church.description).to eq('river')
	  end
	  it "is valid with a city" do
	    church = Church.new(city: 'Tampa')
	  	expect(church.city).to eq('Tampa')
	  end
	 end

	context "checking invalidation" do
	  # church = Church.create(name: 'bill')
		it "is invalid without name" do
			expect(Church.create(name: nil)).to have(1).errors_on(:name)
		end

		it "is invalid without a city" do
			expect(Church.create(city: nil)).to have(1).errors_on(:city)
		end

		it "is invalid without a description" do
			expect(Church.create(description: nil)).to have(1).errors_on(:description)
		end

		it 'is invalid with description less 20 characters' do
			# (Church.create(description: 'this is a descriptiojjjjjjjjjjjjjjjjjjjjjjjjjnj')).should have(20).characters
			expect(Church.new(description: 'this is a description')).to_not be_valid
		end
	end 

	context 'Checking if a new church is created' do
		church = Church.new
		church.save
		it 'is able to be saved' do
	    expect{Church.count}.to change{Church.count}.from(0).to(1)
	  end
	end
end
