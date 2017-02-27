class SegmentacaoLeadSectionPage

  include PageObject

  DEFAULT_SEGMENTATION = [
    [
      { :condition_1 => "Dados do Lead", :condition_2 => "Tag", :condition_3 => "Contém a tag", :condition_4 => "tag01" },
    ]
  ]

  page_url "https://www.rdstation.com.br/segmentacao-de-leads/nova"

  text_field( :nome_segmentacao, :id => "segmentation_list_name" )

  select_list( :condition1, :spath => "//*[@id='content']/div[1]/form/div[3]/div/div[1]/div[2]/div/div[1]/div[1]/select" )
  select_list( :condition2, :spath => "//*[@id='content']/div[1]/form/div[3]/div/div[1]/div[2]/div/div[1]/div[2]/select" )
  select_list( :condition3, :spath => "//*[@id='content']/div[1]/form/div[3]/div/div[1]/div[2]/div/div[1]/div[3]/select" )
  text_field( :condition4, :spath => "//*[@id='content']/div[1]/form/div[3]/div/div[1]/div[2]/div/div[1]/div[4]/input" )

  button( :bt_salvar, :id => "save-segmentation" )

  def criar_nova_lista_segmentacao nm_segmentacao
    self.nome_segmentacao = nm_segmentacao
    DEFAULT_SEGMENTATION.each_with_index { | condition_group, index |
      if (index == 0) then
        condition_group.each_with_index { | condition, index |
          if (index == 0) then
            self.condition1 = condition[:condition_1]
            self.condition2 = condition[:condition_2]
            self.condition3 = condition[:condition_3]
            self.condition4 = condition[:condition_4]
          }
      end
    }
    bt_salvar
  end
end
