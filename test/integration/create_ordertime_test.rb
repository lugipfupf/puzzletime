require 'test_helper'

class CreateOrdertimeTest < ActionDispatch::IntegrationTest

  setup :login

  test 'create ordertime is successfull' do
    selectize_find('ordertime_account_id', 'Site')
    fill_in('ordertime_hours', with: 2)
    click_button 'Speichern'

    assert_equal '/ordertimes', current_path
    time = Worktime.order(:id).last
    assert_equal work_items(:hitobito_demo_site), time.account
  end

  test 'create ordertime with validation error keeps account selection' do
    accounting_posts(:hitobito_demo_site).update!(description_required: true)

    selectize_find('ordertime_account_id', 'Site')
    fill_in('ordertime_hours', with: 2)
    click_button 'Speichern'

    assert page.has_selector?('#error_explanation')
    item = work_items(:hitobito_demo_site)
    assert_equal item.id.to_s, find('#ordertime_account_id', visible: false).value
    element = find('#ordertime_account_id + .selectize-control')
    assert_equal item.label_verbose, element.find('.selectize-input div').text
  end

  def selectize_find(id, value)
    element = find("##{id} + .selectize-control")
    element.find('.selectize-input input').set(value)
    element.find('.selectize-dropdown-content').find('div.selectize-option', text: value).click
  end


  def login
    login_as(:pascal, new_ordertime_path)
  end

end