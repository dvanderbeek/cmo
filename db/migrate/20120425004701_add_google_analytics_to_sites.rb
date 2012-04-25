class AddGoogleAnalyticsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :google_analytics, :text

  end
end
