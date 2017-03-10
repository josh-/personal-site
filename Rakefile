require 'stringex'

task :default => [:new_post]

desc "Create a new post"
task :new_post do
    mkdir_p './content/posts'
    print "Enter title: "
    title = STDIN.gets.chomp

    filename = "./content/posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"
    if File.exist?(filename)
        abort('rake aborted!') if ask("#{filename} already exists. Want to overwrite?", ['y','n']) == 'n'
    end

    print "Enter Published Status (true or false): "
    published = STDIN.gets.chomp

    puts "Creating new post: #{filename}"
    open(filename, 'w') do |post|
        post.puts '---'
        post.puts "title: \"#{title}\""
        post.puts "created_at: #{Time.now}"
        post.puts 'kind: article'
        post.puts "published: #{published}"
        post.puts "---\n\n"
    end
end

desc "Sync local site to server"
task :sync do
    print "Enter your username:"
    username = STDIN.gets.chomp
    sh 'rsync -gpPrtvz --delete-after -e "ssh -p 2683" output/ ' + username + '@joshparnham.com:~/public_html'
end
