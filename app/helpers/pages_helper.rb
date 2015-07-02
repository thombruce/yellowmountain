module PagesHelper
  def contact_form
    @email = Email.new
    render 'shared/contact_form'
  end
end
