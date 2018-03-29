# nodoc: Autogenerated
module ApplicationHelper
  def accession_menu_button
    link_to button_tag(
      'Accession number menu',
      id: 'accession-num-menu',
      class: 'btn btn-md btn-default btn-full'
    ), '/accession_number_updates'
  end

  def batch_menu_button
    link_to button_tag(
      'Batch upload menu',
      id: 'batch-menu-button',
      class: 'btn btn-md btn-default  btn-full'
    ), '/batch_record_updates'
  end

  def digital_bookplates_menu_button
    link_to button_tag(
      'Digital bookplates menu',
      id: 'digital-bookplates-menu',
      class: 'btn btn-md btn-default btn-full'
    ), '/digital_bookplates_batches'
  end

  def main_menu_button
    link_to button_tag(
      'Main menu',
      id: 'main-menu-button',
      class: 'btn btn-md btn-primary btn-full'
    ), root_path
  end

  def conversion_button
    link_to button_tag(
      'Do another conversion',
      class: 'btn btn-md btn-default btn-full'
    ), new_ckey2bibframe_path
  end

  def fiscal_years
    Date.fy_start_month = 9
    Date.use_forward_year!
    financial_year = Time.zone.today.financial_year.to_s
    cyc = ('2000'..financial_year).to_a.reverse
    cyc.push('9899', '9798', '9697')
  end
end
