require 'spec_helper'

describe ApplicationHelper do
  describe 'question_box(str)' do
    subject { helper.question_box(str) }

    context 'nil のとき' do
      let(:str) { nil }
      it { should eq('&nbsp;') }
    end

    context '"本" のとき' do
      let(:str) { '本' }
      it { should eq('本') }
    end
  end

  describe 'answer_form' do
    subject { helper.answer_form str }
    let(:str) { '一' }

    before :each do
      @doc = Nokogiri::HTML(subject)
    end

    it 'answer の値が "一" である' do
      input_element = @doc.xpath("//input[@name='answer']").first
      value = input_element.attr('value')
      expect(value).to eq('一')
    end

    it '送信先は "/game"' do
      form_element = @doc.css("form").first
      action = form_element.attr('action')
      expect(action).to eq('/game')
    end

    it 'ボタンが  "一" である' do
      input_element = @doc.xpath("//input[@type='submit']").first
      value = input_element.attr('value')
      expect(value).to eq('一')
    end
  end
end
