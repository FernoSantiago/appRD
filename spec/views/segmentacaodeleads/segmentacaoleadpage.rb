class SegmentacaoLeadPage

  include PageObject

  page_url "https://www.rdstation.com.br/segmentacao-de-leads"

  text_field( :campo_buscar, :css => "input[type=search]" )

  def digitar_campo_buscar nome_seg
    self.campo_buscar = nome_seg
  end

  div( :totalizador_grid_segmentacao_leads, :class => "dataTables_info" )

  link( :bt_criar_segmentacao, :class => "page-action" )

  text_field( :delete_leads, :class => "form-control js-destroy-leads-validation-input" )
  link( :confirm_delete, :text => "Apagar Leads" )
  h4( :apagar_leads, :id => "destroyLeadsModalLabel" )
  button( :fechar_janela_secundaria, :class => "dropdown-toggle" )

  def selecionar_mostrar_leads option
    self.fechar_janela_secundaria
    self.segmentation_list_options_element.link_element( :text => option ).click
  end

  link( :bt_mostrar_leads, :text => "Mostrar Leads" )

  select_list( :regiters_per_page, :name => "table-dynamiclist-index_length" )

  div( :segmentation_list_options, :class => "btn-group pull-right open" )

  text_field( :email, :id => "email" )
  radio_button( :excel, :id => "excel_true" )
  radio_button( :csv, :id => "excel_false" )
  button( :exportar, :text => "Exportar" )

  def exportar_conversoes email, tp_arquivo
    self.email = email
    if tp_arquivo == "excel" then
      self.select_excel
    elsif tp_arquivo == "csv" then
      self.select_csv
    end
    self.exportar
  end

  div( :msg_sucesso, :class => "alert-success" )

  def verificar_msg_sucesso
    self.msg_sucesso
  end

end
