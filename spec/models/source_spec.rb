require 'spec_helper'

describe Source do

  let(:explanation) { Explanation.create(narrative: 'Sample narrative') }

  before do
    @source = explanation.sources.build(title:  'A New Way of Measuring Debt',
                                        author: 'Boston Architectural College',
                                        date:    Time.now,
                                        url:    'http://the-bac.edu')
  end

  it { should respond_to :title }
  it { should respond_to :author }
  it { should respond_to :date }
  it { should respond_to :url }

  it { should respond_to :explanation }

  describe "accessible attributes" do
    it "should not allow access to explanation_id" do
      expect do
        Source.new(explanation_id: explanation.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
