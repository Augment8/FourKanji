require 'spec_helper'

describe Game do
  let(:game) { Game.new attr }
  let(:attr) { {} }

  describe '#initilaize(attr)' do
    subject { Game.new attr }
    it { should be_kind_of(Game) }
  end

  describe '#answer(answer)' do
    subject { game.answer answer }

    context '正解の時' do
      let(:answer) { '一' }
      it { should be_success }
      its(:point) { should eq(1) }
    end

    context '不正解の時' do
      let(:answer) { '二' }
      it { should_not be_success }
      its(:point) { should eq(0) }
    end
  end

  describe '#finish?' do
    subject { game.finish? }

    before :each do
      (n-1).times do
        game.next_time
      end
    end

    context '1問目の時' do
      let(:n) { 1 }
      it { should be_false }
    end

    context '2問目の時' do
      let(:n) { 2 }
      it { should be_false }
    end

    context '3問目の時' do
      let(:n) { 3 }
      it { should be_true }
    end
  end
end
