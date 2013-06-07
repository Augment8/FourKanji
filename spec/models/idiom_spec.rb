require 'spec_helper'

describe Idiom do
  let(:idiom) { Idiom.new }

  describe '#content' do
    subject { idiom.content }

    content = '用意周到'
    context "content が '#{content}'" do
      before :each do
        idiom.content = '用意周到'
      end

      it { should eq('用意周到') }
    end
  end

  describe '#description' do
    subject { idiom.description }

    desc = '何事にも用意がすみずみま行き届いて万全なこと。'
    context "description が '#{desc}'" do
      before :each do
        idiom.description = desc
      end

      it { should eq(desc) }
    end
  end
end
