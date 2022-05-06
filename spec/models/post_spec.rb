require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author: User.new(name:'Ana', photo: 'photo.com', bio: 'Full-stack dev'), title: 'My first post', text: 'Full-stack software dev', commentsCounter: 0, likesCounter: 0)  }

  before { subject.save }

  it 'should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it '.title should not exceed 250 characters' do
    subject.title = 'very looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong text'
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should be greater than or equals to zero' do
    subject.commentsCounter = -8
    expect(subject).to_not be_valid
  end

  it 'likesCounter should be greater than or equals to zero' do
    subject.likesCounter = -8
    expect(subject).to_not be_valid
  end

  describe '#most_recent_comments' do
    it 'should only return 3 comments' do
      user = User.new(name:'Ana', photo: 'photo.com', bio: 'Full-stack dev')
      (1..6).each { |i| Comment.new(post: subject, author: user, text: "comment#{i}").save }

      most_recent = subject.most_recent_comments

      expect(most_recent.length).to be 5
    end
  end
end
