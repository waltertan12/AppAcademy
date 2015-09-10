require 'rspec'
require 'model_manifest'

describe ModelBase do 
  describe "#method_missing / #find_by_" do 
    it "should find User by fname and lname" do
      ned = User.find_by_fname_and_lname("Ned","Stark")

      expect(ned.length).to eq(1)
      expect(ned.first.id).to eq(1)
    end

    it "should find User by fname" do
      jim = User.find_by_fname("Jim")

      expect(jim.length).to eq(1)
      expect(jim.first.lname).to eq("Halpert")
    end

    it "should find Questions by author_id" do
      questions = Question.find_by_author_id(1)

      expect(questions.length).to eq(2)
    end
  end

  describe "#all" do
    it "should return all Users" do
      all_users = User.all

      expect(all_users.count).to eq(9)
    end
 
    it "should return all Questions" do
      all_questions = Question.all

      expect(all_questions.length).to eq(4)
    end

    it "should return all Replies" do 
      all_replies = Reply.all

      expect(all_replies.length).to eq(3)
    end
  end

end