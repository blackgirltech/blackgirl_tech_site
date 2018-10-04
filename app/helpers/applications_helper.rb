module ApplicationsHelper

  def longlisted?
    if @application.longlist
      content_tag(:p, "Your application has been longlisted!")
    end
  end

  def shortlisted?
    if @application.shortlist
      content_tag(:p, "Your application has been shortlisted!")
    end
  end

  def finalisted?
    if @application.finalist
      content_tag(:p, "Your application has been longlisted!")
    end
  end

  def awarded?
    if @application.awarded
      content_tag(:p, "Your application has been awarded!")
    end
  end
end
