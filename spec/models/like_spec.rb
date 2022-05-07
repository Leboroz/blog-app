require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'Leo', post_counter: 0)
    @post = Post.create(author: @user, title: 'title', text: 'text', commentsCounter: 0, likesCounter: 0)
  end

  subject { Like.new(author: @user, post: @post) }

  before { subject.save }

  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should have a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
