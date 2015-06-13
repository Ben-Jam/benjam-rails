module ApplicationHelper
  def paths_for_manifests(manifests = [])
    manifests.map do |manifest|
      Rails.application.assets[manifest].dependencies.map{|d| "/assets/#{d.logical_path}"}
    end.flatten
  end
end
