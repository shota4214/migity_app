module ApplicationHelper

  def find_name(disease_id)
    disease = Disease.find(disease_id)
    disease.name
  end

  # viewでsvg形式のファイルを読み込む
  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end
end
