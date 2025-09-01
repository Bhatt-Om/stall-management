class PathConfigurationController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    render json: {
      "rules": [
        {
          "patterns": [
            ".*"
          ],
          "properties": {
            "context": "default",
            "uri": "hotwire://fragment/web",
            "pull_to_refresh_enabled": true
          }
        },
        {
          "patterns": [
            ".*/new$",
            ".*/edit$"
          ],
          "properties": {
            "context": "modal",
            "uri": "hotwire://fragment/web/modal/sheet",
            "pull_to_refresh_enabled": false
          }
        }
      ]
    }, status: :ok, content_type: "application/json"
  end
end
