require 'rspec'
require 'model_manifest'
# require 'questions_database'

describe User do
  describe '#find_by_id' do 
    it "should find the correct user" do
      ned = User.find_by_id(1)

      expect(ned.id).to eq(1)
      expect(ned.fname).to eq("Ned")
      expect(ned.lname).to eq("Stark")
    end
  end

  describe "#all" do
    it "should return all users" do
      all = User.all
      expect(all.length).to eq(9)
    end
  end

  describe "#authored_questions" do 
    it "should find the correct questions" do
      ned = User.find_by_id(1)
      
      questions = ned.authored_questions
      expect(questions.length).to eq(2)
    end
  end

  describe "#authored_replies" do
    it "should return all the replies a user has created" do
      three = User.find_by_id(3)
      replies = three.authored_replies

      expect(replies.length).to eq(1)
      expect(replies.first.body).to eq("There are many different kinds of toads")
    end
  end

  describe "#average_karma" do
    it "should find the avearge karma for a user" do
      ned = User.find_by_id(1)

      karma = ned.average_karma
      expect(karma).to eq(3)
    end
  end
end