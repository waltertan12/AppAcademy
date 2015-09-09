require 'rspec'
# require 'model_manifest'
require 'models/question'
require 'questions_database'

describe Question do
  describe '#find_by_id' do 
    it "should find the correct question" do
      q = Question.find_by_id(2)

      expect(q.id).to eq(2)
    end
  end
end