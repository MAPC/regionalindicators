require 'spec_helper'

describe Tag do
  
  before do
    @tag = Tag.new( color:     '#FFFFFF',
                    css_class: 'education-out',
                    icon:      '&#xf007;', 
                    slug:      'education-outcomes',
                    title:     'Education Outcomes' )
  end

  it { should respond_to :color }
  it { should respond_to :icon }
  it { should respond_to :slug }
  it { should respond_to :title }
  it { should respond_to :css_class }
end
