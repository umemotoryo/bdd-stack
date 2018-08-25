require 'spec_helper'

RSpec.describe Stack do
  let(:stack) { Stack.new }

  describe '#push' do
    subject { stack.push 1 }

    it { is_expected.to eq stack }
  end

  describe '#length' do
    context '1 を push 済みの stack' do
      before { stack.push 1 }

      describe 'lengthが1' do
        subject { stack }

        it { is_expected.to have_attributes length: 1 }
      end
    end

    context '1 と 5 を push 済みの stack' do
      before { [1, 5].each { |i| stack.push i } }
      subject { stack }

      it { is_expected.to have_attributes length: 2 }
    end
  end

  describe '#pop' do
    subject { stack.pop }

    context '要素が' do
      context '一つだけの時' do
        let(:stack_value) { 1 }
        before { stack.push stack_value }

        it { is_expected.to eq stack_value }
      end

      context '２つ以上の時' do
        let(:stack_values) { (2..10).to_a.shuffle.sample.times.map{|i| (100..200).to_a.shuffle.sample} }
        before { stack_values.each { |i| stack.push i } }

        it { is_expected.to eq stack_values.last }
      end

      context '同じ値が含まれている時' do
        let(:stack_values) { [1, 2, 4, 1] }
        before do
          stack_values.each { |i| stack.push i }
          stack.pop
        end

        it { is_expected.to eq 4 }
      end
    end

    context '要素がない時' do
      it { is_expected.to eq nil }
    end
  end

  describe '#empty?' do
    subject { stack.empty? }

    context '要素があるとき' do
      before { stack.push 1 }

      it { is_expected.to eq false }
    end

    context '要素がないとき' do
      it { is_expected.to eq true }
    end
  end
end
