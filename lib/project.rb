module ProjectHelper

  def projects
    @items.select { |item| item[:kind] == 'project' }
  end

  def sorted_projects
    projects.sort_by { |p| attribute_to_time(p[:created_at]) }.reverse
  end

  def icon(item)
      item.path.to_s + '/Icon.png' || ""
  end
  
  def project_text(project)
      project.compiled_content || "NO CONTENT"
  end
end

include ProjectHelper
