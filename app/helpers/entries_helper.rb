module EntriesHelper

  def share_by_email_url(entry)
    subject = "Win an iPad Mini!"
    body    = "Check out this competition: #{root_url(r: entry.code)}"
    "mailto:?subject=#{subject}&body=#{body}"
  end

  def share_on_facebook_url(entry)
    title   = 'Win an iPad mini with Acme Inc'
    url     = root_url(r: entry.code)
    summary = 'Check out this competition'
    "http://www.facebook.com/sharer.php?s=100&p[title]=#{title}&p[url]=#{url}&p[summary]=#{summary}"
  end

  def share_on_twitter_url(entry)
    tweet = "Check out this competition from @acmeinc: #{root_url(r: entry.code)}"
    "http://twitter.com/home?status=#{tweet}"
  end

end
