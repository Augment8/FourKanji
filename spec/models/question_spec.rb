require 'spec_helper'

describe Question do
  let(:question) { Question.new idiom, answer, choicees }
  let(:choicees) { '一会五A' }
  let(:idiom) do
    i = Idiom.new
    i.content = content
    i.description = description
    i
  end
  let(:content) { '用意周到' }
  let(:description) { '準備に手抜かりがないさま' }
  let(:answer) { 3 }

  describe '#initialize(idiom, answer_number)' do
    subject { question }
    it { should be_kind_of Question }
  end

  describe '#description' do
    subject { question.description }
    it { should eq(description) }
  end

  describe '#first' do
    subject { question.first }
    it { should eq('用') }
  end

  describe '#second' do
    subject { question.second }
    it { should eq('意') }
  end

  describe '#third' do
    subject { question.third }
    it { should eq(nil) }
  end

  describe '#fourth' do
    subject { question.fourth }
    it { should eq('到') }
  end

  describe '#answer' do
    subject { question.answer }
    it { should eq('周') }
  end

  describe '#answers' do
    subject { question.answers }
    it { should eq(%W{一 会 五 周}) }
  end
end
