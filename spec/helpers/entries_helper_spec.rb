require 'spec_helper'

describe EntriesHelper do

  let(:entry) { stub_model Entry, code: 1234 }

  describe '#share_by_email_url' do
    it 'contains the correct details' do
      url = helper.share_by_email_url(entry)
      match = url.match /mailto:\?subject=(.+)&body=(.+)/
      expect(match[1]).to eq 'Win an iPad Mini!'
      expect(match[2]).to eq "Check out this competition: #{root_url(r: 1234)}"
    end
  end

  describe '#share_on_facebook_url' do
    it 'contains the correct details' do
      url = helper.share_on_facebook_url entry
      match = url.match %r{http://www.facebook.com/sharer.php\?s=100&p\[title\]=(.+)&p\[url\]=(.+)&p\[summary\]=(.+)}
      expect(match[1]).to eq "Win an iPad mini with Acme Inc"
      expect(match[2]).to eq root_url(r: '1234')
      expect(match[3]).to eq "Check out this competition"
    end
  end

  describe '#share_on_twitter_url' do
    it 'contains the correct details' do
      url = helper.share_on_twitter_url entry
      match = url.match %r{http://twitter.com/home\?status=(.+)}
      expect(match[1]).to eq "Check out this competition from @acmeinc: #{root_url(r: "1234")}"
    end
  end

end
