class LeadsPage

  include PageObject

  page_url "https://www.rdstation.com.br/leads"

  span( :totalizador_grid_leads, :class => "btn-height" ) 

end
