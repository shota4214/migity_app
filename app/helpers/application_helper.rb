module ApplicationHelper

  def find_name(disease_id)
    disease = Disease.find(disease_id)
    disease.name
  end
end
