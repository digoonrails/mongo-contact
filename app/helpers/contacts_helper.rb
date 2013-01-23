module ContactsHelper
  def filter(name, kind=false)
    if kind
      link_to "#{name} (#{Contact.count_kind(kind)})", 
        contacts_path << "?kind=#{kind}",
        class: class_filter(kind)
    else
      link_to "#{name} (#{Contact.count})", contacts_path, class: class_filter
    end
  end
  
  private
    def class_filter(kind=false)
      "on" if (kind && params.has_key?(:kind) && params[:kind].to_i == kind.to_i) || (kind.blank? && !params.has_key?(:kind))
    end
end
