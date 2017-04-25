require 'time'

include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Tagging
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo

module PostHelper
  def formatted_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end

  def iso_8601_date(post)
    attribute_to_time(post[:created_at]).dup.utc.iso8601.to_s
  end
end

def post_introduction(post)
  content = post.compiled_content
  if content =~ /\s<!-- more -->\s/
    read_more_text = 'Keep reading →'
    extra = "<div class='read-more'><a href='#{post.path}'>#{read_more_text}</a></div>"
    content = content.partition('<!-- more -->').first + extra
  end
  content
end

def published_articles
  sorted_articles.select { |x| x[:published].eql? true }
end

include PostHelper
