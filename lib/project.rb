module ProjectHelper
  def projects
    @items.select { |item| item[:kind] == 'project' }
  end

  def sorted_projects
    projects.sort_by { |p| attribute_to_time(p[:created_at]) }.reverse
  end

  def project_root(path)
    return path.split("/")[0..2].join("/")
  end

  def icon(item)
    # puts item.path
    puts File.join(project_root(item.path), 'Icon.png')
    File.join(project_root(item.path), 'Icon.png')
  end

  def highres_icon(item)
    filepath = File.join(project_root(item.path), 'Icon@2x.png')
    
    file_exists = File.exists?(File.join(File.dirname(__FILE__), "../content", filepath))
    file_exists ? filepath : nil
  end

  def project_text(project)
    project.compiled_content || 'Content coming soon'
  end
end

include ProjectHelper
