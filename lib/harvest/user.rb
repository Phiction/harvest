require 'harvest/base'

module Harvest
  class User < Harvest::Base
    attr_reader :id, :first_name, :last_name, :email, :telephone, :timezone, :weekly_capacity,
          :has_access_to_all_future_projects, :is_contractor, :is_admin, :is_project_manager, :can_see_rates,
          :can_create_projects, :can_create_invoices, :is_active, :default_hourly_rate, :cost_rate, :roles, :avatar_url

    def initialize(attributes={}, query_options={}, connection=nil)
      @id = attributes[:id]
      @first_name = attributes[:first_name]
      @last_name = attributes[:last_name]
      @email = attributes[:email]
      @telephone = attributes[:telephone]
      @timezone = attributes[:timezone]
      @weekly_capacity = attributes[:weekly_capacity]
      @has_access_to_all_future_projects = attributes[:has_access_to_all_future_projects]
      @is_contractor = attributes[:is_contractor]
      @is_admin = attributes[:is_admin]
      @is_project_manager = attributes[:is_project_manager]
      @can_see_rates = attributes[:can_see_rates]
      @can_create_projects = attributes[:can_create_projects]
      @can_create_invoices = attributes[:can_create_invoices]
      @is_active = attributes[:is_active]
      @default_hourly_rate = attributes[:default_hourly_rate]
      @cost_rate = attributes[:cost_rate]
      @roles = attributes[:roles]
      @avatar_url  = attributes[:avatar_url]
    end

    def full_name
      "#{@first_name} #{@last_name}"
    end

  end
end
