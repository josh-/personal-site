# All files in the 'lib' directory will be loaded before nanoc starts compiling

include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Tagging
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo

module PostHelper
  def get_pretty_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end
end

def get_post_start(post)
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
