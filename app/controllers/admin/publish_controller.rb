class Admin::PublishController < AdminController

  def create
    begin
      PublishJob.perform_later(user_id: current_user.id)

      redirect_to admin_root_path, notice: "Site has been published"
    rescue => e
      Rails.logger.error("Failed to publish")
      Rails.logger.error(e)

      redirect_to admin_root_path, flash: { error: "There was a problem publishing the site. If it persists, contact the site admin. Error: #{ e.message }" }
    end
  end

end
