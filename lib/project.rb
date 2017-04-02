module ProjectHelper
  def projects
    @items.select { |item| item[:kind] == 'project' }
  end

  def sorted_projects
    projects.sort_by { |p| attribute_to_time(p[:created_at]) }.reverse
  end

  def icon(item)
    File.join(item.path, 'Icon.png')
  end

  def project_text(project)
    project.compiled_content || 'Content coming soon'
  end
end

include ProjectHelper
