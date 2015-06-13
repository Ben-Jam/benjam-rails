module ApplicationHelper
  def paths_for_manifests(manifests = [])
    manifests.map do |manifest|
      Rails.application.assets[manifest].dependencies.map{|d| "#{d.logical_path}"}
    end.flatten
  end

  def build_digested_asset_path(asset)
    environment = Rails.application.assets
    "/assets/#{environment.find_asset(asset).digest_path}" rescue nil
  end
end
