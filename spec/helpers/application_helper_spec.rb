require 'spec_helper'

describe ApplicationHelper do
  describe 'question_box(str)' do
    subject { helper.question_box(str) }

    context 'nil のとき' do
      let(:str) { nil }
      it { should eq('□') }
    end

    context '"本" のとき' do
      let(:str) { '本' }
      it { should eq('本') }
    end
  end
end
