module ApplicationHelper
  def paths_for_manifests(manifests = [])
    manifests.map do |manifest|
      Rails.application.assets[manifest].dependencies.map{|d| "#{d.logical_path}"}
    end.flatten
  end

  def build_digested_asset_path(asset, add_body = false)
    environment = Rails.application.assets
    if
      (!Rails.env.production? && (asset == 'application.js' || asset == 'application.css')) ||
      (!Rails.env.production? && add_body)
      "/assets/#{environment.find_asset(asset).digest_path}?body=1" rescue nil
    else
      "/assets/#{environment.find_asset(asset).digest_path}" rescue nil
    end
  end
end
