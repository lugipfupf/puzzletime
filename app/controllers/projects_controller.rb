# encoding: utf-8

# (c) Puzzle itc, Berne
# Diplomarbeit 2149, Xavier Hayoz

class ProjectsController < CrudController

  include ProjectGroupable

  self.permitted_attrs = [:description, :report_type, :offered_hours, :billable,
                          :freeze_until, :description_required, :ticket_required]

  before_action :authorize, only: [:edit, :update, :destroy]

  after_create :set_project_manager


  private

  def list_entries
    if group
      super.merge(group_filter)
    else
      managed_projects
    end
  end

  def set_project_manager
    Projectmembership.create(project_id: @entry.id,
                             employee_id: @user.id,
                             projectmanagement: true)
  end

  def managed_projects
    @user.managed_projects.page(params[:page])
  end

  def authorized?
    super || managed_project?(entry)
  end

  def group_filter
    if group.is_a?(Project)
      Project.where(parent_id: group.id)
    else
      Project.where(parent_id: nil, group_key => group.id)
    end
  end

  def group_key
    @group_key ||= group.class.model_name.param_key
  end

  def path_args(last)
    [main_group, group, last].compact.uniq
  end

end