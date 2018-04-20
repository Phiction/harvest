require 'harvest/base'

module Harvest
  class ProjectAssignment < Harvest::Base
    attr_reader :id, :is_active, :is_project_manager, :hourly_rate, :budget, :created_at, :updated_at, :project, :client, :task_assignments

    def initialize(attributes={}, query_options={}, connection=nil)
      @id = attributes[:id]
      @is_active = attributes[:is_active]
      @is_project_manager = attributes[:is_project_manager]
      @hourly_rate = attributes[:hourly_rate]
      @budget = attributes[:budget]
      @created_at = attributes[:created_at]
      @updated_at = attributes[:updated_at]
      @project = attributes[:project]
      @client = attributes[:client]
      @task_assignments = attributes[:task_assignments]
    end

  end
end
