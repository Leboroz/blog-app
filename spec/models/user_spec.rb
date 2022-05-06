require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Leo', photo: 'photo.com', bio: 'Full-stack software dev', post_counter: 0)  }

  before { subject.save }

  it 'should have a title' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a post_counter:integer greater than or equals to zero' do
    expect(subject.post_counter).to be(0)
  end
end
