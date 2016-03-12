# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

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
        content = content.partition('<!-- more -->').first + "<div class='read-more' style='float:right;'><a href='#{post.path}'>Keep reading →</a></div>"
    end
    return content
end

def published_articles
    articles = sorted_articles
    published = articles.select { |x| x[:published].eql?true }
    return published
end

include PostHelper
