module Admin::FieldFormsHelper

  def field_form_list_address(field_form)
    "#{field_form.street}, #{field_form.number}, #{field_form.district}, #{field_form.city}, #{field_form.state} - #{field_form.zipcode}"
  end

  def field_form_list_larvae_status_component(status)
    status ? '<i class="fas fa-exclamation-triangle" style="color: #f53800;"></i> Larva presente'.html_safe : '<i class="fas fa-check-square" style="color: #21bf21;"></i> Sem larva'.html_safe
  end

  def field_form_list_status_component(status)
    status ? '<i class="fas fa-check-square" style="color: #21bf21;"></i> Completa'.html_safe : '<i class="fas fa-exclamation-triangle" style="color: #f53800;"></i> Pendente'.html_safe
  end
end
