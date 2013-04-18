require 'spec_helper'

describe Entry do

  def create_entry(args={})
    FactoryGirl.create :entry, args
  end

  describe '::random' do
    it 'should select a random entry' do
      Entry.stub count: 100
      Object.stub(:rand).with(100) { 9 }
      Entry.should_receive(:find).with(:first, offset: 9)
      Entry.random
    end
  end

  describe '::draw_winners!' do
    it 'should mark a random record as the winner' do
      random_entry = double('random entry')
      Entry.stub random: random_entry
      random_entry.should_receive(:mark_as_winner!)
      Entry.draw_winners!
    end
  end

  describe '#mark_as_winner!' do
    context 'with a referrer' do
      it 'should flag both entries as winners' do
        bob = create_entry
        bill = create_entry referrer: bob
        bill.mark_as_winner!
        bill.reload
        bob.reload
        expect(bill).to be_a_winner
        expect(bob).to be_a_winner
      end
    end

    context 'without a referrer' do
      it 'should flag the entry as a winner' do
        entry = create_entry
        entry.mark_as_winner!
        entry.reload
        expect(entry).to be_a_winner
      end
    end
  end

end
